/*
# Seed demo data

Creates two demo accounts (admin + user) with known credentials so the app
has realistic data immediately. Then seeds stations and chargers owned by
the demo admin, plus sample reservations for the demo user.

Demo credentials:
- Admin: admin@boss.demo / BossAdmin123!
- User:  user@boss.demo  / BossUser123!

Passwords are hashed by Supabase auth (bcrypt under the hood — far stronger
than the SHA-1 mentioned in the spec; Supabase auth handles secure hashing
and JWT issuance automatically).
*/

DO $$
DECLARE
  admin_uid uuid;
  user_uid uuid;
BEGIN
  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'admin@boss.demo') THEN
    admin_uid := gen_random_uuid();
    INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data)
    VALUES (
      admin_uid,
      '00000000-0000-0000-0000-000000000000',
      'authenticated',
      'authenticated',
      'admin@boss.demo',
      crypt('BossAdmin123!', gen_salt('bf')),
      now(), now(), now(),
      jsonb_build_object('role', 'admin'),
      jsonb_build_object('name', 'GreenGrid Station')
    );
  ELSE
    SELECT id INTO admin_uid FROM auth.users WHERE email = 'admin@boss.demo';
  END IF;

  IF NOT EXISTS (SELECT 1 FROM auth.users WHERE email = 'user@boss.demo') THEN
    user_uid := gen_random_uuid();
    INSERT INTO auth.users (id, instance_id, aud, role, email, encrypted_password, email_confirmed_at, created_at, updated_at, raw_app_meta_data, raw_user_meta_data)
    VALUES (
      user_uid,
      '00000000-0000-0000-0000-000000000000',
      'authenticated',
      'authenticated',
      'user@boss.demo',
      crypt('BossUser123!', gen_salt('bf')),
      now(), now(), now(),
      jsonb_build_object('role', 'user'),
      jsonb_build_object('name', 'Alex Rider')
    );
  ELSE
    SELECT id INTO user_uid FROM auth.users WHERE email = 'user@boss.demo';
  END IF;

  INSERT INTO profiles (id, role, email, name, contact, address,
    station_name, station_address, license_name, license_no, charger_count, transformer_load_capacity_kva)
  VALUES (admin_uid, 'admin', 'admin@boss.demo', 'GreenGrid Station', '+1-555-0100', '100 Eco Avenue',
    'GreenGrid Station', '100 Eco Avenue, Green City', 'GreenGrid Operator License', 'LIC-GG-2024-001', 6, 500)
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO profiles (id, role, email, name, contact, address,
    vehicle_make, vehicle_model, vehicle_year, battery_capacity_kwh, has_ev, usage_area, work_preferred_time)
  VALUES (user_uid, 'user', 'user@boss.demo', 'Alex Rider', '+1-555-0200', '45 Maple Street, Green City',
    'Tesla', 'Model 3', 2023, 75, true, 'City center', '9 AM - 5 PM')
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active)
  VALUES
    ('a0000000-0000-0000-0000-000000000001', admin_uid, 'GreenGrid Central', '100 Eco Avenue, Green City', 40.7128, -74.0060, 'GreenGrid Operator License', 'LIC-GG-2024-001', 500, 380, true),
    ('a0000000-0000-0000-0000-000000000002', admin_uid, 'GreenGrid North', '200 North Blvd, Green City', 40.7200, -74.0100, 'GreenGrid Operator License', 'LIC-GG-2024-001', 400, 180, true),
    ('a0000000-0000-0000-0000-000000000003', admin_uid, 'GreenGrid South', '300 South St, Green City', 40.7000, -74.0000, 'GreenGrid Operator License', 'LIC-GG-2024-001', 350, 300, true)
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type)
  VALUES
    ('c0000000-0000-0000-0000-000000000001', 'a0000000-0000-0000-0000-000000000001', 'Port A1', 50, 'occupied', 45, 'CCS'),
    ('c0000000-0000-0000-0000-000000000002', 'a0000000-0000-0000-0000-000000000001', 'Port A2', 50, 'occupied', 48, 'CCS'),
    ('c0000000-0000-0000-0000-000000000003', 'a0000000-0000-0000-0000-000000000001', 'Port A3', 150, 'available', 0, 'CCS'),
    ('c0000000-0000-0000-0000-000000000004', 'a0000000-0000-0000-0000-000000000001', 'Port A4', 150, 'occupied', 120, 'CHAdeMO'),
    ('c0000000-0000-0000-0000-000000000005', 'a0000000-0000-0000-0000-000000000001', 'Port A5', 22, 'available', 0, 'Type2'),
    ('c0000000-0000-0000-0000-000000000006', 'a0000000-0000-0000-0000-000000000001', 'Port A6', 22, 'fault', 0, 'Type2'),
    ('c0000000-0000-0000-0000-000000000007', 'a0000000-0000-0000-0000-000000000002', 'Port B1', 50, 'available', 0, 'CCS'),
    ('c0000000-0000-0000-0000-000000000008', 'a0000000-0000-0000-0000-000000000002', 'Port B2', 50, 'occupied', 40, 'CCS'),
    ('c0000000-0000-0000-0000-000000000009', 'a0000000-0000-0000-0000-000000000002', 'Port B3', 100, 'available', 0, 'CCS'),
    ('c0000000-0000-0000-0000-000000000010', 'a0000000-0000-0000-0000-000000000002', 'Port B4', 22, 'available', 0, 'Type2'),
    ('c0000000-0000-0000-0000-000000000011', 'a0000000-0000-0000-0000-000000000003', 'Port C1', 50, 'occupied', 46, 'CCS'),
    ('c0000000-0000-0000-0000-000000000012', 'a0000000-0000-0000-0000-000000000003', 'Port C2', 50, 'occupied', 50, 'CCS'),
    ('c0000000-0000-0000-0000-000000000013', 'a0000000-0000-0000-0000-000000000003', 'Port C3', 150, 'occupied', 140, 'CCS'),
    ('c0000000-0000-0000-0000-000000000014', 'a0000000-0000-0000-0000-000000000003', 'Port C4', 22, 'available', 0, 'Type2'),
    ('c0000000-0000-0000-0000-000000000015', 'a0000000-0000-0000-0000-000000000003', 'Port C5', 22, 'available', 0, 'Type2')
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO reservations (id, user_id, station_id, charger_id, scheduled_time, charge_current_a, battery_percent, status, queue_position, booking_code, code_expires_at, is_emergency, price)
  VALUES
    ('e0000000-0000-0000-0000-000000000001', user_uid, 'a0000000-0000-0000-0000-000000000001', 'c0000000-0000-0000-0000-000000000003', now() - interval '2 days', 32, 45, 'completed', 1, 'BOSS-7K2X', now() - interval '2 days' + interval '5 minutes', false, 12.50),
    ('e0000000-0000-0000-0000-000000000002', user_uid, 'a0000000-0000-0000-0000-000000000002', 'c0000000-0000-0000-0000-000000000007', now() - interval '5 days', 16, 60, 'completed', 1, 'BOSS-3M9P', now() - interval '5 days' + interval '5 minutes', false, 8.00)
  ON CONFLICT (id) DO NOTHING;

  INSERT INTO notifications (admin_id, title, body, type, is_read, created_at)
  VALUES
    (admin_uid, 'Transformer load approaching 90%', 'GreenGrid Central transformer at 76% capacity. Monitor closely.', 'warning', false, now() - interval '1 hour'),
    (admin_uid, 'New reservation', 'Alex Rider booked Port A3 at 14:00.', 'info', true, now() - interval '3 hours'),
    (admin_uid, 'Charger fault detected', 'Port A6 reported a fault. Maintenance recommended.', 'error', false, now() - interval '6 hours')
  ON CONFLICT DO NOTHING;

END $$;
