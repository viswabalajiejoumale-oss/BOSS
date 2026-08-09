import json
import uuid
import os

def generate_seeds():
    json_path = "src/data/indiaEvStations.json"
    if not os.path.exists(json_path):
        print(f"Error: {json_path} not found.")
        return

    with open(json_path, 'r', encoding='utf-8') as f:
        stations = json.load(f)

    print(f"Loaded {len(stations)} stations.")

    # Remove the old, large seed file if it exists
    old_file_path = "supabase/migrations/20260802173000_seed_stations.sql"
    if os.path.exists(old_file_path):
        try:
            os.remove(old_file_path)
            print(f"Removed old large seed file: {old_file_path}")
        except Exception as e:
            print(f"Error removing old file: {e}")

    # 1. Create the database RPC setup migration file
    setup_sql_dir = "supabase/migrations"
    os.makedirs(setup_sql_dir, exist_ok=True)
    
    setup_sql_content = """-- Setup Database RPC and pgcrypto extension
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Admin Smart Meter Verification RPC Function
CREATE OR REPLACE FUNCTION verify_smart_meter_code_by_admin(
  p_admin_id uuid,
  p_booking_code text
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_reservation reservations%ROWTYPE;
BEGIN
  -- Find if the admin owns a station that matches the booking code
  SELECT r.* INTO v_reservation
  FROM reservations r
  JOIN stations s ON r.station_id = s.id
  WHERE r.booking_code = UPPER(TRIM(p_booking_code))
    AND s.admin_id = p_admin_id
    AND r.status = 'confirmed';

  IF NOT FOUND THEN
    RETURN jsonb_build_object(
      'success', false,
      'message', 'Invalid booking code or reservation not found for your station.'
    );
  END IF;

  -- Check if 5-minute code timer has expired
  IF v_reservation.code_expires_at IS NOT NULL AND v_reservation.code_expires_at < NOW() THEN
    -- Mark status as expired
    UPDATE reservations
    SET status = 'expired'
    WHERE id = v_reservation.id;

    RETURN jsonb_build_object(
      'success', false,
      'message', 'Code Expired! The user exceeded the 5-minute verification limit. Reservation marked as expired.'
    );
  END IF;

  -- Update reservation to completed
  UPDATE reservations
  SET status = 'completed'
  WHERE id = v_reservation.id;

  RETURN jsonb_build_object(
    'success', true,
    'message', 'Smart Energy Meter verification successful! Dispensing power to client vehicle.',
    'reservation_id', v_reservation.id,
    'output_voltage_v', v_reservation.output_voltage_v,
    'output_power_kw', v_reservation.output_power_kw
  );
END;
$$;
"""
    setup_sql_path = os.path.join(setup_sql_dir, "20260802173000_setup_admin_rpc.sql")
    with open(setup_sql_path, 'w', encoding='utf-8') as setup_f:
        setup_f.write(setup_sql_content)
    print(f"Generated setup SQL file at {setup_sql_path}")

    # Prepare markdown credentials file
    updated_stations = []
    markdown_lines = [
        "# Station Admin Accounts",
        "This file lists all the generated station admin accounts for the 1000 stations in the dataset.",
        "",
        "| Index | Station Name | Admin Email | Password |",
        "| --- | --- | --- | --- |"
    ]

    connector_types = ['CCS', 'Type2', 'CHAdeMO', 'GB/T']
    
    # We will split 1000 stations into 10 partitions of 100 stations each
    chunk_size = 100
    total_stations = len(stations)
    
    for chunk_idx in range(0, total_stations, chunk_size):
        part_num = (chunk_idx // chunk_size) + 1
        sql_lines = [
            f"-- Seed Stations Part {part_num} (Stations {chunk_idx + 1} to {min(chunk_idx + chunk_size, total_stations)})",
            "BEGIN;"
        ]
        
        chunk_stations = stations[chunk_idx : chunk_idx + chunk_size]
        
        for idx_offset, s in enumerate(chunk_stations):
            global_idx = chunk_idx + idx_offset
            
            # Keep stable station UUID from JSON, fallback if none
            station_uuid = s.get('id')
            if not station_uuid:
                station_uuid = str(uuid.uuid5(uuid.NAMESPACE_DNS, f"station_{global_idx}"))
                
            # Create stable admin UUID from station UUID
            admin_uuid = str(uuid.uuid5(uuid.NAMESPACE_DNS, f"admin_{station_uuid}"))
            
            # Simpler email
            email = f"st{global_idx + 1}@boss.com"
            password = "Viswa123#"
            
            name = s.get('name', f"EV Station {global_idx + 1}")
            city = s.get('city') or 'India'
            state = s.get('state') or 'India'
            operator = s.get('operator') or 'India EV Network'
            lat = s.get('latitude', 20.5937)
            lon = s.get('longitude', 78.9629)
            points = int(s.get('charging_points', 4))
            capacity = float(s.get('transformer_load_capacity_kva', 500))
            current_load = float(s.get('current_load_kva', 98))
            address = s.get('address', f"{name}, {city}, {state}, India")
            
            # Update JSON structure
            updated_s = s.copy()
            updated_s['id'] = station_uuid
            updated_s['admin_id'] = admin_uuid
            updated_s['admin_email'] = email
            updated_stations.append(updated_s)
            
            # Append to Markdown
            markdown_lines.append(f"| {global_idx + 1} | {name} | {email} | {password} |")
            
            # SQL auth.users insertion
            raw_user_meta_data = f'{{"email": "{email}", "email_verified": true, "phone_verified": false}}'
            sql_lines.append(f"""
-- Station {global_idx+1}: {name}
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, phone)
VALUES ('{admin_uuid}', '00000000-0000-0000-0000-000000000000', '{email}', crypt('{password}', gen_salt('bf')), now(), now(), '{{"provider":"email","providers":["email"]}}'::jsonb, '{raw_user_meta_data}'::jsonb, 'authenticated', 'authenticated', now(), now(), '')
ON CONFLICT (id) DO NOTHING;""")

            # SQL profiles insertion
            sql_lines.append(f"""
INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('{admin_uuid}', 'admin', '{email}', 'Admin {name.replace("'", "''")}', '{name.replace("'", "''")}', '{address.replace("'", "''")}', {capacity}, {points}, now())
ON CONFLICT (id) DO NOTHING;""")

            # SQL stations insertion
            sql_lines.append(f"""
INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, created_at)
VALUES ('{station_uuid}', '{admin_uuid}', '{name.replace("'", "''")}', '{address.replace("'", "''")}', {lat}, {lon}, 'India EV Network License', 'LIC-IN-ST{global_idx + 1}', {capacity}, {current_load}, true, '{city.replace("'", "''")}', '{state.replace("'", "''")}', {points}, '{operator.replace("'", "''")}', now())
ON CONFLICT (id) DO NOTHING;""")

            # SQL chargers insertion
            char_code = global_idx
            for i in range(1, points + 1):
                char_id = f"c_{station_uuid}_{i}"
                label = f"Port {chr(64 + i)}"
                power = 150 if i % 2 == 0 else (22 if i % 3 == 0 else 50)
                conn = connector_types[(i + char_code) % len(connector_types)]
                sql_lines.append(f"""
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('{char_id}', '{station_uuid}', '{label}', {power}, 'available', 0, '{conn}', now())
ON CONFLICT (id) DO NOTHING;""")

        sql_lines.append("COMMIT;")
        
        # Save partitioned SQL file
        part_sql_path = os.path.join(setup_sql_dir, f"2026080217300{part_num}_seed_stations_part{part_num}.sql" if part_num < 10 else f"20260802173010_seed_stations_part10.sql")
        with open(part_sql_path, 'w', encoding='utf-8') as part_f:
            part_f.write("\n".join(sql_lines))
        print(f"Generated seed file Part {part_num} at {part_sql_path}")

    # Write updated JSON back
    with open(json_path, 'w', encoding='utf-8') as out_f:
        json.dump(updated_stations, out_f, indent=2)
    print(f"Updated {json_path} with simple email fields.")

    # Write updated Markdown list
    md_path = "station_accounts.md"
    with open(md_path, 'w', encoding='utf-8') as out_f:
        out_f.write("\n".join(markdown_lines))
    print(f"Generated credentials list at {md_path}")

if __name__ == "__main__":
    generate_seeds()
