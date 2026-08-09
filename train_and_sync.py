import pandas as pd
import json
import os

def main():
    csv_path = 'EV_Charging_Stations_District_Wise_Enriched.csv'
    json_path = 'src/data/mlChargingModel.json'
    migration_path = 'supabase/migrations/20260803120000_update_stations_load_and_ports.sql'

    print("Loading enriched district-wise EV stations dataset...")
    df = pd.read_csv(csv_path)

    # Clean strings
    df['Station_Name'] = df['Station_Name'].str.strip()
    df['State'] = df['State'].str.strip()
    df['District'] = df['District'].str.strip()
    df['Charger_Type'] = df['Charger_Type'].str.strip()
    df['Availability_Timing'] = df['Availability_Timing'].str.strip()

    # Calculate State Profiles average load for retraining the ML model profiles
    print("Retraining model state load profiles...")
    state_averages = df.groupby('State')['EV_Load_kW'].mean().to_dict()

    with open(json_path, 'r', encoding='utf-8') as f:
        model_data = json.load(f)

    # Standard transformer capacity reference
    REF_CAPACITY_KW = 500.0

    state_profiles = model_data.get('state_profiles', {})
    for state, avg_load in state_averages.items():
        # Calculate new average load percentage
        avg_load_pct = round((avg_load / REF_CAPACITY_KW) * 100, 2)
        
        if state in state_profiles:
            profile = state_profiles[state]
            old_avg = profile.get('avg_load_pct', 50.0)
            print(f"  Updating {state}: avg load pct {old_avg}% -> {avg_load_pct}%")
            profile['avg_load_pct'] = avg_load_pct
            
            # Scale the hourly load percentages proportionally
            scale_factor = avg_load_pct / old_avg if old_avg > 0 else 1.0
            hourly = profile.get('hourly_load_pct', {})
            for h in hourly:
                new_val = round(min(float(hourly[h]) * scale_factor, 100.0), 2)
                profile['hourly_load_pct'][h] = new_val
        else:
            # Create a new state profile using Kerala's hourly pattern as base
            print(f"  Adding new state profile for {state} with avg load pct {avg_load_pct}%")
            base_pattern = state_profiles.get('Kerala', state_profiles.get('Delhi', {}))
            
            new_profile = {
                "avg_load_pct": avg_load_pct,
                "max_load_pct": 100.0,
                "avg_voltage_v": 406.4,
                "hourly_load_pct": {},
                "hourly_voltage_v": base_pattern.get('hourly_voltage_v', {})
            }
            # Scale base hourly pattern
            base_hourly = base_pattern.get('hourly_load_pct', {})
            base_avg = base_pattern.get('avg_load_pct', 50.0)
            scale_factor = avg_load_pct / base_avg if base_avg > 0 else 1.0
            for h in base_hourly:
                new_profile['hourly_load_pct'][h] = round(min(float(base_hourly[h]) * scale_factor, 100.0), 2)
            
            state_profiles[state] = new_profile

    # Update metadata
    model_data['model_metadata']['trained_at'] = '2026-08-03'
    model_data['model_metadata']['total_records_trained'] += len(df)
    model_data['model_metadata']['total_states_modeled'] = len(state_profiles)

    with open(json_path, 'w', encoding='utf-8') as f:
        json.dump(model_data, f, indent=2, ensure_ascii=False)
    print("Saved updated ML load model profiles.")

    # Generate SQL Migration to sync DB
    print("Generating database migration SQL...")
    sql_lines = [
        "-- Migration to update station loads, port counts, availability timings and chargers based on enriched CSV data",
        "BEGIN;",
        "",
        "-- 1. Add availability_timing column to stations if not exists",
        "ALTER TABLE public.stations ADD COLUMN IF NOT EXISTS availability_timing text;",
        ""
    ]

    for idx, row in df.iterrows():
        name = row['Station_Name'].replace("'", "''")
        district = row['District'].replace("'", "''")
        state = row['State'].replace("'", "''")
        ev_load = float(row['EV_Load_kW'])
        ports = int(row['Number_of_Ports'])
        charger_type = row['Charger_Type']
        timing = row['Availability_Timing'].replace("'", "''")

        sql_lines.append(f"-- Station: {row['Station_Name']}")
        sql_lines.append("DO $$")
        sql_lines.append("DECLARE")
        sql_lines.append("  v_station_id uuid;")
        sql_lines.append("BEGIN")
        sql_lines.append(f"  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('{name}')) LIMIT 1;")
        sql_lines.append("  IF v_station_id IS NOT NULL THEN")
        sql_lines.append(f"    UPDATE public.stations SET current_load_kva = {ev_load}, charging_points = {ports}, availability_timing = '{timing}' WHERE id = v_station_id;")
        sql_lines.append(f"    DELETE FROM public.chargers WHERE station_id = v_station_id;")
        
        # Insert chargers to match the ports count
        for i in range(ports):
            label = f"Port {chr(65 + i)}"
            connector = 'CCS' if 'DC' in charger_type else 'Type2'
            power = 150 if connector == 'CCS' else 22
            sql_lines.append(
                f"    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) "
                f"VALUES (gen_random_uuid(), v_station_id, '{label}', {power}, 'available', 0, '{connector}') ON CONFLICT DO NOTHING;"
            )
        sql_lines.append("  END IF;")
        sql_lines.append("END $$;")
        sql_lines.append("")

    sql_lines.append("COMMIT;")

    with open(migration_path, 'w', encoding='utf-8') as f:
        f.write('\n'.join(sql_lines))

    print(f"Generated SQL migration at: {migration_path}")

if __name__ == '__main__':
    main()
