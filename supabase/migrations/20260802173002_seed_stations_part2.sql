-- Seed Stations Part 2 (Stations 101 to 200)
BEGIN;

-- Station 101: Tata Power Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('80e890fc-0496-57bb-a81d-21e34f65438f', '00000000-0000-0000-0000-000000000000', 'st101@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st101@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('80e890fc-0496-57bb-a81d-21e34f65438f', '80e890fc-0496-57bb-a81d-21e34f65438f', '{"sub": "80e890fc-0496-57bb-a81d-21e34f65438f", "email": "st101@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '80e890fc-0496-57bb-a81d-21e34f65438f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('80e890fc-0496-57bb-a81d-21e34f65438f', 'admin', 'st101@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4aa276f4-9576-5d1d-adba-b02e4a8954fc', '80e890fc-0496-57bb-a81d-21e34f65438f', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.9502562, 85.989753, 'India EV Network License', 'LIC-IN-ST101', 500.0, 60.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4aa276f4-9576-5d1d-adba-b02e4a8954fc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('138c41aa-5dd5-5376-8a01-7956054650f7', '4aa276f4-9576-5d1d-adba-b02e4a8954fc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6b107791-de10-50b4-9ed4-fe268d099a53', '4aa276f4-9576-5d1d-adba-b02e4a8954fc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 102: BPCL Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('59942bc8-cb54-5676-b53c-329f38d1a6aa', '00000000-0000-0000-0000-000000000000', 'st102@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st102@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('59942bc8-cb54-5676-b53c-329f38d1a6aa', '59942bc8-cb54-5676-b53c-329f38d1a6aa', '{"sub": "59942bc8-cb54-5676-b53c-329f38d1a6aa", "email": "st102@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '59942bc8-cb54-5676-b53c-329f38d1a6aa')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('59942bc8-cb54-5676-b53c-329f38d1a6aa', 'admin', 'st102@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0b5ba3a5-35d3-5fef-8559-38bccb388cfc', '59942bc8-cb54-5676-b53c-329f38d1a6aa', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.0685308, 82.3617326, 'India EV Network License', 'LIC-IN-ST102', 500.0, 30.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0b5ba3a5-35d3-5fef-8559-38bccb388cfc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('855d4f51-84fc-56f2-afa0-1515cbe43458', '0b5ba3a5-35d3-5fef-8559-38bccb388cfc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a86ba05f-c36c-585a-90eb-c460a6e44a05', '0b5ba3a5-35d3-5fef-8559-38bccb388cfc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 103: EESL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0cf83468-99ee-5597-9202-cfd5ce38486e', '00000000-0000-0000-0000-000000000000', 'st103@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st103@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0cf83468-99ee-5597-9202-cfd5ce38486e', '0cf83468-99ee-5597-9202-cfd5ce38486e', '{"sub": "0cf83468-99ee-5597-9202-cfd5ce38486e", "email": "st103@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0cf83468-99ee-5597-9202-cfd5ce38486e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0cf83468-99ee-5597-9202-cfd5ce38486e', 'admin', 'st103@boss.com', 'Admin EESL Charging Station', 'EESL Charging Station', 'EESL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7fdb3a1a-3a0f-55d3-93a9-eb38b1269b34', '0cf83468-99ee-5597-9202-cfd5ce38486e', 'EESL Charging Station', 'EESL Charging Station, Odisha, India', 21.1636206, 81.788358, 'India EV Network License', 'LIC-IN-ST103', 500.0, 15.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7fdb3a1a-3a0f-55d3-93a9-eb38b1269b34';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2347f164-cea5-5b92-b4eb-f4356947c433', '7fdb3a1a-3a0f-55d3-93a9-eb38b1269b34', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('213b86d3-f170-53bc-a7fd-53e55d408701', '7fdb3a1a-3a0f-55d3-93a9-eb38b1269b34', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 104: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5aa88abb-eadc-5b71-b4af-4a3263727b63', '00000000-0000-0000-0000-000000000000', 'st104@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st104@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5aa88abb-eadc-5b71-b4af-4a3263727b63', '5aa88abb-eadc-5b71-b4af-4a3263727b63', '{"sub": "5aa88abb-eadc-5b71-b4af-4a3263727b63", "email": "st104@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5aa88abb-eadc-5b71-b4af-4a3263727b63')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5aa88abb-eadc-5b71-b4af-4a3263727b63', 'admin', 'st104@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('964c2c6d-9da0-540e-a905-3e1bce08940c', '5aa88abb-eadc-5b71-b4af-4a3263727b63', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.1612821, 81.796672, 'India EV Network License', 'LIC-IN-ST104', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '964c2c6d-9da0-540e-a905-3e1bce08940c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('72804487-7a80-5669-862b-cb5455777b9a', '964c2c6d-9da0-540e-a905-3e1bce08940c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5815ceb7-ec2c-5a00-a481-1dbb08189fa8', '964c2c6d-9da0-540e-a905-3e1bce08940c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 105: EESL Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0d59f429-3ea0-5cf9-bf66-896249908f13', '00000000-0000-0000-0000-000000000000', 'st105@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st105@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0d59f429-3ea0-5cf9-bf66-896249908f13', '0d59f429-3ea0-5cf9-bf66-896249908f13', '{"sub": "0d59f429-3ea0-5cf9-bf66-896249908f13", "email": "st105@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0d59f429-3ea0-5cf9-bf66-896249908f13')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0d59f429-3ea0-5cf9-bf66-896249908f13', 'admin', 'st105@boss.com', 'Admin EESL Charging Station', 'EESL Charging Station', 'EESL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6853f5e7-c7f4-56db-9cd4-0ae77abe6383', '0d59f429-3ea0-5cf9-bf66-896249908f13', 'EESL Charging Station', 'EESL Charging Station, Odisha, India', 21.1613368, 81.7964476, 'India EV Network License', 'LIC-IN-ST105', 500.0, 15.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6853f5e7-c7f4-56db-9cd4-0ae77abe6383';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('68cdfb81-bf81-5a14-8540-05ac88366aab', '6853f5e7-c7f4-56db-9cd4-0ae77abe6383', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cab0d6dc-497f-5f97-a8c7-e72edea6d3ce', '6853f5e7-c7f4-56db-9cd4-0ae77abe6383', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 106: BPCL Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('25d8f192-2b04-5785-8505-857262f6edcb', '00000000-0000-0000-0000-000000000000', 'st106@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st106@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('25d8f192-2b04-5785-8505-857262f6edcb', '25d8f192-2b04-5785-8505-857262f6edcb', '{"sub": "25d8f192-2b04-5785-8505-857262f6edcb", "email": "st106@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '25d8f192-2b04-5785-8505-857262f6edcb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('25d8f192-2b04-5785-8505-857262f6edcb', 'admin', 'st106@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fda98a0c-075a-5b38-8a56-d327a5af2ace', '25d8f192-2b04-5785-8505-857262f6edcb', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.0784588, 81.7518659, 'India EV Network License', 'LIC-IN-ST106', 500.0, 30.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fda98a0c-075a-5b38-8a56-d327a5af2ace';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('54985c74-dc01-59c9-9d4e-7cfe1df7c410', 'fda98a0c-075a-5b38-8a56-d327a5af2ace', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('df586768-3ae6-5959-ba06-dca0d505efd7', 'fda98a0c-075a-5b38-8a56-d327a5af2ace', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 107: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('477a5e70-05ac-5061-8460-a176cfaded31', '00000000-0000-0000-0000-000000000000', 'st107@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st107@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('477a5e70-05ac-5061-8460-a176cfaded31', '477a5e70-05ac-5061-8460-a176cfaded31', '{"sub": "477a5e70-05ac-5061-8460-a176cfaded31", "email": "st107@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '477a5e70-05ac-5061-8460-a176cfaded31')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('477a5e70-05ac-5061-8460-a176cfaded31', 'admin', 'st107@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3d6bee25-69dc-5137-b4a4-6dbd29bc95f2', '477a5e70-05ac-5061-8460-a176cfaded31', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.1340895, 81.7723539, 'India EV Network License', 'LIC-IN-ST107', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3d6bee25-69dc-5137-b4a4-6dbd29bc95f2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('328e3d57-b41e-554e-b438-c826e3987fd8', '3d6bee25-69dc-5137-b4a4-6dbd29bc95f2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f50af483-4c1b-5d69-becb-b0bc47d88e35', '3d6bee25-69dc-5137-b4a4-6dbd29bc95f2', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 108: BPCL Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9bbeef36-bf89-5e74-8c7d-b71082f7e571', '00000000-0000-0000-0000-000000000000', 'st108@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st108@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9bbeef36-bf89-5e74-8c7d-b71082f7e571', '9bbeef36-bf89-5e74-8c7d-b71082f7e571', '{"sub": "9bbeef36-bf89-5e74-8c7d-b71082f7e571", "email": "st108@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9bbeef36-bf89-5e74-8c7d-b71082f7e571')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9bbeef36-bf89-5e74-8c7d-b71082f7e571', 'admin', 'st108@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('aafa3971-ab9f-5f9a-99b1-25550e9cb3a7', '9bbeef36-bf89-5e74-8c7d-b71082f7e571', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.0435101, 81.7320747, 'India EV Network License', 'LIC-IN-ST108', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'aafa3971-ab9f-5f9a-99b1-25550e9cb3a7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a5f65070-f398-5926-95ea-8bbbe1ec3bb3', 'aafa3971-ab9f-5f9a-99b1-25550e9cb3a7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('05644efa-9caa-5e51-ba3f-ee975585bbcb', 'aafa3971-ab9f-5f9a-99b1-25550e9cb3a7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 109: Om sai corporation e rickshaw (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1fb4a001-ecc8-53ef-bdd9-f2f7e091d7af', '00000000-0000-0000-0000-000000000000', 'st109@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st109@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1fb4a001-ecc8-53ef-bdd9-f2f7e091d7af', '1fb4a001-ecc8-53ef-bdd9-f2f7e091d7af', '{"sub": "1fb4a001-ecc8-53ef-bdd9-f2f7e091d7af", "email": "st109@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1fb4a001-ecc8-53ef-bdd9-f2f7e091d7af')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1fb4a001-ecc8-53ef-bdd9-f2f7e091d7af', 'admin', 'st109@boss.com', 'Admin Om sai corporation e rickshaw', 'Om sai corporation e rickshaw', 'Om sai corporation e rickshaw, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a632c076-f039-5dc4-82ae-af87128858c9', '1fb4a001-ecc8-53ef-bdd9-f2f7e091d7af', 'Om sai corporation e rickshaw', 'Om sai corporation e rickshaw, Odisha, India', 21.0478294, 81.5331778, 'India EV Network License', 'LIC-IN-ST109', 500.0, 3.3, true, 'Balasore', 'Odisha', 1, 'Unknown', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a632c076-f039-5dc4-82ae-af87128858c9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('80522279-e294-5ca8-b9cf-c28bb098d36a', 'a632c076-f039-5dc4-82ae-af87128858c9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 110: Electric Vehicle Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('13960795-3c7e-5403-a9d2-2726a9004cb9', '00000000-0000-0000-0000-000000000000', 'st110@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st110@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('13960795-3c7e-5403-a9d2-2726a9004cb9', '13960795-3c7e-5403-a9d2-2726a9004cb9', '{"sub": "13960795-3c7e-5403-a9d2-2726a9004cb9", "email": "st110@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '13960795-3c7e-5403-a9d2-2726a9004cb9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('13960795-3c7e-5403-a9d2-2726a9004cb9', 'admin', 'st110@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('752279b4-a915-5444-83cf-a3f3ee78e1a3', '13960795-3c7e-5403-a9d2-2726a9004cb9', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.035982, 81.5461322, 'India EV Network License', 'LIC-IN-ST110', 500.0, 25.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '752279b4-a915-5444-83cf-a3f3ee78e1a3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b020af4-df6b-58a0-97d2-1818849ccdf9', '752279b4-a915-5444-83cf-a3f3ee78e1a3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8eb0a0a2-3b29-5dc6-a927-945be94a2e1b', '752279b4-a915-5444-83cf-a3f3ee78e1a3', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 111: Electric Vehicle Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c99c8a40-2b69-5a19-8665-ff8bf66faef8', '00000000-0000-0000-0000-000000000000', 'st111@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st111@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c99c8a40-2b69-5a19-8665-ff8bf66faef8', 'c99c8a40-2b69-5a19-8665-ff8bf66faef8', '{"sub": "c99c8a40-2b69-5a19-8665-ff8bf66faef8", "email": "st111@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c99c8a40-2b69-5a19-8665-ff8bf66faef8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c99c8a40-2b69-5a19-8665-ff8bf66faef8', 'admin', 'st111@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 600, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a20208ff-f33c-55b0-82f1-b3bd5a6f6537', 'c99c8a40-2b69-5a19-8665-ff8bf66faef8', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.0161093, 81.7029005, 'India EV Network License', 'LIC-IN-ST111', 500.0, 25.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a20208ff-f33c-55b0-82f1-b3bd5a6f6537';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6b35f060-c727-55d4-bec3-12e0214db5e2', 'a20208ff-f33c-55b0-82f1-b3bd5a6f6537', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cf4bdfa6-894c-5934-a201-a3c870b9b7b9', 'a20208ff-f33c-55b0-82f1-b3bd5a6f6537', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 112: Hindustan Petroleum Corporation Limited (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8ad2881f-46aa-59a5-b7dd-264ff757b284', '00000000-0000-0000-0000-000000000000', 'st112@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st112@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8ad2881f-46aa-59a5-b7dd-264ff757b284', '8ad2881f-46aa-59a5-b7dd-264ff757b284', '{"sub": "8ad2881f-46aa-59a5-b7dd-264ff757b284", "email": "st112@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8ad2881f-46aa-59a5-b7dd-264ff757b284')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8ad2881f-46aa-59a5-b7dd-264ff757b284', 'admin', 'st112@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2af3402c-677c-52ff-b2a2-0319b30662b9', '8ad2881f-46aa-59a5-b7dd-264ff757b284', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 20.838154, 86.308423, 'India EV Network License', 'LIC-IN-ST112', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2af3402c-677c-52ff-b2a2-0319b30662b9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('567a34ec-99a2-5637-bb71-17d1a03a1617', '2af3402c-677c-52ff-b2a2-0319b30662b9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a296dbf6-1ba1-55bc-aa64-ce4de017be2c', '2af3402c-677c-52ff-b2a2-0319b30662b9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 113: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5f6ab693-391f-5bf9-8f2d-3a0524f4c2fc', '00000000-0000-0000-0000-000000000000', 'st113@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st113@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5f6ab693-391f-5bf9-8f2d-3a0524f4c2fc', '5f6ab693-391f-5bf9-8f2d-3a0524f4c2fc', '{"sub": "5f6ab693-391f-5bf9-8f2d-3a0524f4c2fc", "email": "st113@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5f6ab693-391f-5bf9-8f2d-3a0524f4c2fc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5f6ab693-391f-5bf9-8f2d-3a0524f4c2fc', 'admin', 'st113@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7da2d3a7-0b1e-5bbc-804e-cd0c26be449e', '5f6ab693-391f-5bf9-8f2d-3a0524f4c2fc', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.7039371, 86.1341964, 'India EV Network License', 'LIC-IN-ST113', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7da2d3a7-0b1e-5bbc-804e-cd0c26be449e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5e6951e4-f41c-56ea-b890-ac7a842b42a5', '7da2d3a7-0b1e-5bbc-804e-cd0c26be449e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('51c27cd0-3343-5fb3-a29a-5e493c25b030', '7da2d3a7-0b1e-5bbc-804e-cd0c26be449e', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 114: Jio-bp pulse Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('444586a6-a95e-5cf3-b2c1-769030b37364', '00000000-0000-0000-0000-000000000000', 'st114@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st114@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('444586a6-a95e-5cf3-b2c1-769030b37364', '444586a6-a95e-5cf3-b2c1-769030b37364', '{"sub": "444586a6-a95e-5cf3-b2c1-769030b37364", "email": "st114@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '444586a6-a95e-5cf3-b2c1-769030b37364')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('444586a6-a95e-5cf3-b2c1-769030b37364', 'admin', 'st114@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cf0af117-a0ec-5197-b77e-4d2120250def', '444586a6-a95e-5cf3-b2c1-769030b37364', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 20.752399, 86.150857, 'India EV Network License', 'LIC-IN-ST114', 500.0, 60.0, true, 'Ganjam', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cf0af117-a0ec-5197-b77e-4d2120250def';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6b7de755-ad18-5c38-a6a4-0cb1a5cb273b', 'cf0af117-a0ec-5197-b77e-4d2120250def', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bdd2a472-1bae-5bd0-b4a2-a1981823101f', 'cf0af117-a0ec-5197-b77e-4d2120250def', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('86b86ce7-dbe3-52af-aa84-7b5d7955c1ed', 'cf0af117-a0ec-5197-b77e-4d2120250def', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 115: Electric Vehicle Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5940ea4e-eddd-5894-85cb-3de3f01da8bb', '00000000-0000-0000-0000-000000000000', 'st115@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st115@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5940ea4e-eddd-5894-85cb-3de3f01da8bb', '5940ea4e-eddd-5894-85cb-3de3f01da8bb', '{"sub": "5940ea4e-eddd-5894-85cb-3de3f01da8bb", "email": "st115@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5940ea4e-eddd-5894-85cb-3de3f01da8bb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5940ea4e-eddd-5894-85cb-3de3f01da8bb', 'admin', 'st115@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('506bf78e-a561-5d35-84b6-003d5c65cd2f', '5940ea4e-eddd-5894-85cb-3de3f01da8bb', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.6581671, 86.1173138, 'India EV Network License', 'LIC-IN-ST115', 500.0, 25.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '506bf78e-a561-5d35-84b6-003d5c65cd2f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eea797aa-1b85-5e6a-882f-e5138857f0d5', '506bf78e-a561-5d35-84b6-003d5c65cd2f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('07e8bdc5-561a-5bfc-a5cc-05e9a7da7f43', '506bf78e-a561-5d35-84b6-003d5c65cd2f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 116: Ampere EV by Greaves - Green Wheels (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c03c9e5d-0974-5cfe-b2a9-4043f1b0e713', '00000000-0000-0000-0000-000000000000', 'st116@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st116@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c03c9e5d-0974-5cfe-b2a9-4043f1b0e713', 'c03c9e5d-0974-5cfe-b2a9-4043f1b0e713', '{"sub": "c03c9e5d-0974-5cfe-b2a9-4043f1b0e713", "email": "st116@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c03c9e5d-0974-5cfe-b2a9-4043f1b0e713')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c03c9e5d-0974-5cfe-b2a9-4043f1b0e713', 'admin', 'st116@boss.com', 'Admin Ampere EV by Greaves - Green Wheels', 'Ampere EV by Greaves - Green Wheels', 'Ampere EV by Greaves - Green Wheels, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('904d9c1d-fc17-55a9-bdf9-fc6b2ab7d730', 'c03c9e5d-0974-5cfe-b2a9-4043f1b0e713', 'Ampere EV by Greaves - Green Wheels', 'Ampere EV by Greaves - Green Wheels, Odisha, India', 20.6942379, 86.1328793, 'India EV Network License', 'LIC-IN-ST116', 500.0, 7.4, true, 'Sundargarh', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '904d9c1d-fc17-55a9-bdf9-fc6b2ab7d730';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2c1a6afb-eaf2-516b-98cd-7accd691a31f', '904d9c1d-fc17-55a9-bdf9-fc6b2ab7d730', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 117: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9b59280d-aa4a-5bed-a282-ba7ed049f779', '00000000-0000-0000-0000-000000000000', 'st117@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st117@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9b59280d-aa4a-5bed-a282-ba7ed049f779', '9b59280d-aa4a-5bed-a282-ba7ed049f779', '{"sub": "9b59280d-aa4a-5bed-a282-ba7ed049f779", "email": "st117@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9b59280d-aa4a-5bed-a282-ba7ed049f779')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9b59280d-aa4a-5bed-a282-ba7ed049f779', 'admin', 'st117@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5c60027f-9ab5-50da-970a-699a3c1ed79c', '9b59280d-aa4a-5bed-a282-ba7ed049f779', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 20.656229, 86.112809, 'India EV Network License', 'LIC-IN-ST117', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5c60027f-9ab5-50da-970a-699a3c1ed79c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ececdf24-240e-533f-b30a-80d7fc8d92c7', '5c60027f-9ab5-50da-970a-699a3c1ed79c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4044f70f-3284-5de1-8fea-651570f87f9c', '5c60027f-9ab5-50da-970a-699a3c1ed79c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 118: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a3c0b2f3-bc39-5ba9-967f-12fa8c9efef8', '00000000-0000-0000-0000-000000000000', 'st118@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st118@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a3c0b2f3-bc39-5ba9-967f-12fa8c9efef8', 'a3c0b2f3-bc39-5ba9-967f-12fa8c9efef8', '{"sub": "a3c0b2f3-bc39-5ba9-967f-12fa8c9efef8", "email": "st118@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a3c0b2f3-bc39-5ba9-967f-12fa8c9efef8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a3c0b2f3-bc39-5ba9-967f-12fa8c9efef8', 'admin', 'st118@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f4fc315c-cef8-5414-b00e-1ef85d6040eb', 'a3c0b2f3-bc39-5ba9-967f-12fa8c9efef8', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.6695199, 85.5922933, 'India EV Network License', 'LIC-IN-ST118', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f4fc315c-cef8-5414-b00e-1ef85d6040eb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('57fb9aad-2a49-54b6-9489-ba6001bb1623', 'f4fc315c-cef8-5414-b00e-1ef85d6040eb', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0a22e754-d781-5eff-b831-0083c4f94775', 'f4fc315c-cef8-5414-b00e-1ef85d6040eb', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 119: Jio-bp (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('25323c1c-0354-5383-a03d-e8d828b69274', '00000000-0000-0000-0000-000000000000', 'st119@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st119@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('25323c1c-0354-5383-a03d-e8d828b69274', '25323c1c-0354-5383-a03d-e8d828b69274', '{"sub": "25323c1c-0354-5383-a03d-e8d828b69274", "email": "st119@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '25323c1c-0354-5383-a03d-e8d828b69274')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('25323c1c-0354-5383-a03d-e8d828b69274', 'admin', 'st119@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3273127a-4c43-5439-af5e-d341b4af309d', '25323c1c-0354-5383-a03d-e8d828b69274', 'Jio-bp', 'Jio-bp, Odisha, India', 20.8014756, 85.5434702, 'India EV Network License', 'LIC-IN-ST119', 500.0, 50.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3273127a-4c43-5439-af5e-d341b4af309d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('abacecd5-0618-5f9f-867b-db5551c407b2', '3273127a-4c43-5439-af5e-d341b4af309d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5b35175b-73ad-577d-a87a-05585007458d', '3273127a-4c43-5439-af5e-d341b4af309d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 120: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5b8fa604-6686-5d39-8a40-843247d69cc5', '00000000-0000-0000-0000-000000000000', 'st120@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st120@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5b8fa604-6686-5d39-8a40-843247d69cc5', '5b8fa604-6686-5d39-8a40-843247d69cc5', '{"sub": "5b8fa604-6686-5d39-8a40-843247d69cc5", "email": "st120@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5b8fa604-6686-5d39-8a40-843247d69cc5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5b8fa604-6686-5d39-8a40-843247d69cc5', 'admin', 'st120@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('62c18509-e011-5321-b3f8-bdb98822faf2', '5b8fa604-6686-5d39-8a40-843247d69cc5', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.8317557, 85.2416603, 'India EV Network License', 'LIC-IN-ST120', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '62c18509-e011-5321-b3f8-bdb98822faf2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c9dd4c9d-210f-5b0d-bb04-fe94da763db0', '62c18509-e011-5321-b3f8-bdb98822faf2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('98285fe4-96b0-579f-a484-6f3dc8695989', '62c18509-e011-5321-b3f8-bdb98822faf2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 121: Thunder Plus Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d472be2a-0bad-5c72-8950-250a14f975e6', '00000000-0000-0000-0000-000000000000', 'st121@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st121@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d472be2a-0bad-5c72-8950-250a14f975e6', 'd472be2a-0bad-5c72-8950-250a14f975e6', '{"sub": "d472be2a-0bad-5c72-8950-250a14f975e6", "email": "st121@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd472be2a-0bad-5c72-8950-250a14f975e6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d472be2a-0bad-5c72-8950-250a14f975e6', 'admin', 'st121@boss.com', 'Admin Thunder Plus Charging Station', 'Thunder Plus Charging Station', 'Thunder Plus Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('778734e1-31c1-5b66-bb5d-5f70f5cde743', 'd472be2a-0bad-5c72-8950-250a14f975e6', 'Thunder Plus Charging Station', 'Thunder Plus Charging Station, Odisha, India', 20.8317352, 85.2416586, 'India EV Network License', 'LIC-IN-ST121', 500.0, 7.4, true, 'Sundargarh', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '778734e1-31c1-5b66-bb5d-5f70f5cde743';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7a5f8f2d-f6ea-5542-8844-a62e44ceaa3b', '778734e1-31c1-5b66-bb5d-5f70f5cde743', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 122: Tata Power Ez Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('160a42fc-5988-5515-b857-fed2e34f2ba0', '00000000-0000-0000-0000-000000000000', 'st122@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st122@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('160a42fc-5988-5515-b857-fed2e34f2ba0', '160a42fc-5988-5515-b857-fed2e34f2ba0', '{"sub": "160a42fc-5988-5515-b857-fed2e34f2ba0", "email": "st122@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '160a42fc-5988-5515-b857-fed2e34f2ba0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('160a42fc-5988-5515-b857-fed2e34f2ba0', 'admin', 'st122@boss.com', 'Admin Tata Power Ez Charging Station', 'Tata Power Ez Charging Station', 'Tata Power Ez Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9839508d-a212-5106-8753-4684b72d7fd4', '160a42fc-5988-5515-b857-fed2e34f2ba0', 'Tata Power Ez Charging Station', 'Tata Power Ez Charging Station, Odisha, India', 20.8327932, 85.2382886, 'India EV Network License', 'LIC-IN-ST122', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9839508d-a212-5106-8753-4684b72d7fd4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b6bd0c2a-fdd1-51fa-82b3-4920fe40a8a0', '9839508d-a212-5106-8753-4684b72d7fd4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6cd27c20-daa3-5269-a0fc-06c340e43d04', '9839508d-a212-5106-8753-4684b72d7fd4', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 123: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('69b1f11d-53be-5e5f-9e93-7af7ed189df0', '00000000-0000-0000-0000-000000000000', 'st123@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st123@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('69b1f11d-53be-5e5f-9e93-7af7ed189df0', '69b1f11d-53be-5e5f-9e93-7af7ed189df0', '{"sub": "69b1f11d-53be-5e5f-9e93-7af7ed189df0", "email": "st123@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '69b1f11d-53be-5e5f-9e93-7af7ed189df0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('69b1f11d-53be-5e5f-9e93-7af7ed189df0', 'admin', 'st123@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b531a97d-6625-57d5-8372-4b40d48afedc', '69b1f11d-53be-5e5f-9e93-7af7ed189df0', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.832794, 85.085236, 'India EV Network License', 'LIC-IN-ST123', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b531a97d-6625-57d5-8372-4b40d48afedc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('00c38bc2-5836-50b3-bbee-9cc1eacdb5a1', 'b531a97d-6625-57d5-8372-4b40d48afedc', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0a1f5d4d-9c56-5f3d-a1db-e170bc68df0d', 'b531a97d-6625-57d5-8372-4b40d48afedc', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 124: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('35270a6d-d4bf-5946-a46d-58be772b70d3', '00000000-0000-0000-0000-000000000000', 'st124@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st124@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('35270a6d-d4bf-5946-a46d-58be772b70d3', '35270a6d-d4bf-5946-a46d-58be772b70d3', '{"sub": "35270a6d-d4bf-5946-a46d-58be772b70d3", "email": "st124@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '35270a6d-d4bf-5946-a46d-58be772b70d3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('35270a6d-d4bf-5946-a46d-58be772b70d3', 'admin', 'st124@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cb01a66a-b750-50f8-94c1-7e95437f1fee', '35270a6d-d4bf-5946-a46d-58be772b70d3', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.8450685, 85.1162026, 'India EV Network License', 'LIC-IN-ST124', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cb01a66a-b750-50f8-94c1-7e95437f1fee';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('54dc063a-53e8-53bc-8a6a-e9fcccaee4c1', 'cb01a66a-b750-50f8-94c1-7e95437f1fee', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6d197523-f4cf-533a-accd-5e8c13c65aae', 'cb01a66a-b750-50f8-94c1-7e95437f1fee', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 125: Hindustan Petroleum Corporation Limited Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('23ab39ce-a2c7-503b-ba7b-03aa110da62c', '00000000-0000-0000-0000-000000000000', 'st125@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st125@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('23ab39ce-a2c7-503b-ba7b-03aa110da62c', '23ab39ce-a2c7-503b-ba7b-03aa110da62c', '{"sub": "23ab39ce-a2c7-503b-ba7b-03aa110da62c", "email": "st125@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '23ab39ce-a2c7-503b-ba7b-03aa110da62c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('23ab39ce-a2c7-503b-ba7b-03aa110da62c', 'admin', 'st125@boss.com', 'Admin Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1c0342d7-2a59-5c1c-9e76-fdddafc407af', '23ab39ce-a2c7-503b-ba7b-03aa110da62c', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 20.8235109, 85.0620926, 'India EV Network License', 'LIC-IN-ST125', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1c0342d7-2a59-5c1c-9e76-fdddafc407af';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8845ae1b-32c8-566b-adfc-a273a34ab01f', '1c0342d7-2a59-5c1c-9e76-fdddafc407af', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9453319a-c0b9-52dc-9e65-299d0fb26a6b', '1c0342d7-2a59-5c1c-9e76-fdddafc407af', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 126: Hindustan Petroleum Corporation Limited (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0243d7bc-ed6a-5475-bbda-40f4c0972925', '00000000-0000-0000-0000-000000000000', 'st126@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st126@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0243d7bc-ed6a-5475-bbda-40f4c0972925', '0243d7bc-ed6a-5475-bbda-40f4c0972925', '{"sub": "0243d7bc-ed6a-5475-bbda-40f4c0972925", "email": "st126@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0243d7bc-ed6a-5475-bbda-40f4c0972925')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0243d7bc-ed6a-5475-bbda-40f4c0972925', 'admin', 'st126@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('224ff26e-4d3b-5088-9685-3992606eba87', '0243d7bc-ed6a-5475-bbda-40f4c0972925', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 20.8234079, 85.0620499, 'India EV Network License', 'LIC-IN-ST126', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '224ff26e-4d3b-5088-9685-3992606eba87';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('63f5947d-9153-50d7-9e34-12baaf9e789d', '224ff26e-4d3b-5088-9685-3992606eba87', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('92aa098c-ecf6-5889-b9bb-6a7fa3f9bbf3', '224ff26e-4d3b-5088-9685-3992606eba87', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 127: Jio-bp (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e48307b3-1f34-565c-9e37-bd5fc474fd79', '00000000-0000-0000-0000-000000000000', 'st127@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st127@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e48307b3-1f34-565c-9e37-bd5fc474fd79', 'e48307b3-1f34-565c-9e37-bd5fc474fd79', '{"sub": "e48307b3-1f34-565c-9e37-bd5fc474fd79", "email": "st127@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e48307b3-1f34-565c-9e37-bd5fc474fd79')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e48307b3-1f34-565c-9e37-bd5fc474fd79', 'admin', 'st127@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1bf842c4-6f56-534b-8266-2749bc140c44', 'e48307b3-1f34-565c-9e37-bd5fc474fd79', 'Jio-bp', 'Jio-bp, Odisha, India', 20.80489, 84.03399, 'India EV Network License', 'LIC-IN-ST127', 500.0, 50.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1bf842c4-6f56-534b-8266-2749bc140c44';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('623fa388-74a6-5fee-9d0d-3151df9d3340', '1bf842c4-6f56-534b-8266-2749bc140c44', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('010f0cd6-c332-57d7-9664-5c7598dafdc4', '1bf842c4-6f56-534b-8266-2749bc140c44', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 128: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4c14bcec-cc59-55cf-ae2e-ae7de5f0fff6', '00000000-0000-0000-0000-000000000000', 'st128@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st128@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4c14bcec-cc59-55cf-ae2e-ae7de5f0fff6', '4c14bcec-cc59-55cf-ae2e-ae7de5f0fff6', '{"sub": "4c14bcec-cc59-55cf-ae2e-ae7de5f0fff6", "email": "st128@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4c14bcec-cc59-55cf-ae2e-ae7de5f0fff6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4c14bcec-cc59-55cf-ae2e-ae7de5f0fff6', 'admin', 'st128@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('302a1f3d-bb4d-5641-9253-2397fea2bf64', '4c14bcec-cc59-55cf-ae2e-ae7de5f0fff6', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.8577541, 83.9441821, 'India EV Network License', 'LIC-IN-ST128', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '302a1f3d-bb4d-5641-9253-2397fea2bf64';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('84a0c1fe-6b09-5d9d-a1c4-01d3d82bdb4f', '302a1f3d-bb4d-5641-9253-2397fea2bf64', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('697623f2-1234-5d79-8394-91d6587bed14', '302a1f3d-bb4d-5641-9253-2397fea2bf64', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 129: Electric Vehicle Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9f51081c-92da-5bee-95ac-52d8d12ee231', '00000000-0000-0000-0000-000000000000', 'st129@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st129@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9f51081c-92da-5bee-95ac-52d8d12ee231', '9f51081c-92da-5bee-95ac-52d8d12ee231', '{"sub": "9f51081c-92da-5bee-95ac-52d8d12ee231", "email": "st129@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9f51081c-92da-5bee-95ac-52d8d12ee231')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9f51081c-92da-5bee-95ac-52d8d12ee231', 'admin', 'st129@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7d3d64ff-f87f-5f46-9c3d-e4938f7d46e5', '9f51081c-92da-5bee-95ac-52d8d12ee231', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.8471861, 83.894135, 'India EV Network License', 'LIC-IN-ST129', 500.0, 25.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7d3d64ff-f87f-5f46-9c3d-e4938f7d46e5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('40983bcd-5f61-5242-9bb9-f83b763998b2', '7d3d64ff-f87f-5f46-9c3d-e4938f7d46e5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7022e688-ad9d-5b80-92c2-7ca284407eed', '7d3d64ff-f87f-5f46-9c3d-e4938f7d46e5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 130: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d8de7c32-3b37-505e-b702-df6165179ec4', '00000000-0000-0000-0000-000000000000', 'st130@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st130@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d8de7c32-3b37-505e-b702-df6165179ec4', 'd8de7c32-3b37-505e-b702-df6165179ec4', '{"sub": "d8de7c32-3b37-505e-b702-df6165179ec4", "email": "st130@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd8de7c32-3b37-505e-b702-df6165179ec4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d8de7c32-3b37-505e-b702-df6165179ec4', 'admin', 'st130@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d088522e-3803-58ab-ac60-308f13d9a94e', 'd8de7c32-3b37-505e-b702-df6165179ec4', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.7425344, 81.5791428, 'India EV Network License', 'LIC-IN-ST130', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd088522e-3803-58ab-ac60-308f13d9a94e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9fe90201-d9fa-5be3-8e95-55c02b714985', 'd088522e-3803-58ab-ac60-308f13d9a94e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a5baf99f-6feb-5a82-a965-2dae9c6d1ac0', 'd088522e-3803-58ab-ac60-308f13d9a94e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 131: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e005b996-e2ab-537c-9883-f34219dfb175', '00000000-0000-0000-0000-000000000000', 'st131@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st131@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e005b996-e2ab-537c-9883-f34219dfb175', 'e005b996-e2ab-537c-9883-f34219dfb175', '{"sub": "e005b996-e2ab-537c-9883-f34219dfb175", "email": "st131@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e005b996-e2ab-537c-9883-f34219dfb175')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e005b996-e2ab-537c-9883-f34219dfb175', 'admin', 'st131@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('48e1a2e4-9301-5aee-8be6-f15eff49a860', 'e005b996-e2ab-537c-9883-f34219dfb175', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 20.817085, 81.6828102, 'India EV Network License', 'LIC-IN-ST131', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '48e1a2e4-9301-5aee-8be6-f15eff49a860';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4eac4fa1-a4ab-5f4d-9820-28ed81d62520', '48e1a2e4-9301-5aee-8be6-f15eff49a860', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c3a3fa97-1188-5b5a-996d-07e563892d2c', '48e1a2e4-9301-5aee-8be6-f15eff49a860', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 132: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('135bd232-3b81-5aa7-9db1-1940affc3d97', '00000000-0000-0000-0000-000000000000', 'st132@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st132@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('135bd232-3b81-5aa7-9db1-1940affc3d97', '135bd232-3b81-5aa7-9db1-1940affc3d97', '{"sub": "135bd232-3b81-5aa7-9db1-1940affc3d97", "email": "st132@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '135bd232-3b81-5aa7-9db1-1940affc3d97')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('135bd232-3b81-5aa7-9db1-1940affc3d97', 'admin', 'st132@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('74507b04-ca19-537f-a469-5043746b1fef', '135bd232-3b81-5aa7-9db1-1940affc3d97', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.5307153, 86.3579333, 'India EV Network License', 'LIC-IN-ST132', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '74507b04-ca19-537f-a469-5043746b1fef';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9e479f2e-0299-5e77-82ba-12d52c9aaf8b', '74507b04-ca19-537f-a469-5043746b1fef', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('679a5016-9918-5262-8d73-f96556897c0d', '74507b04-ca19-537f-a469-5043746b1fef', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 133: kesannager electric office (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2d6fada1-7278-5ff3-9bfe-d31ace801321', '00000000-0000-0000-0000-000000000000', 'st133@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st133@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2d6fada1-7278-5ff3-9bfe-d31ace801321', '2d6fada1-7278-5ff3-9bfe-d31ace801321', '{"sub": "2d6fada1-7278-5ff3-9bfe-d31ace801321", "email": "st133@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2d6fada1-7278-5ff3-9bfe-d31ace801321')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2d6fada1-7278-5ff3-9bfe-d31ace801321', 'admin', 'st133@boss.com', 'Admin kesannager electric office', 'kesannager electric office', 'kesannager electric office, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d6bad292-44fc-5234-bda4-906d30ca6ebb', '2d6fada1-7278-5ff3-9bfe-d31ace801321', 'kesannager electric office', 'kesannager electric office, Odisha, India', 20.4209459, 86.0903038, 'India EV Network License', 'LIC-IN-ST133', 500.0, 7.4, true, 'Sundargarh', 'Odisha', 1, 'Unknown', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd6bad292-44fc-5234-bda4-906d30ca6ebb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('04a322c7-045e-5044-87a9-fb235229ffd7', 'd6bad292-44fc-5234-bda4-906d30ca6ebb', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 134: Adani Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a883a7f8-4ffb-5553-b34c-16424816262d', '00000000-0000-0000-0000-000000000000', 'st134@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st134@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a883a7f8-4ffb-5553-b34c-16424816262d', 'a883a7f8-4ffb-5553-b34c-16424816262d', '{"sub": "a883a7f8-4ffb-5553-b34c-16424816262d", "email": "st134@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a883a7f8-4ffb-5553-b34c-16424816262d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a883a7f8-4ffb-5553-b34c-16424816262d', 'admin', 'st134@boss.com', 'Admin Adani Charging Station', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8b60ea34-3cd2-5018-a7a4-7d8e5ec91066', 'a883a7f8-4ffb-5553-b34c-16424816262d', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 20.4823589, 86.0581588, 'India EV Network License', 'LIC-IN-ST134', 500.0, 60.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8b60ea34-3cd2-5018-a7a4-7d8e5ec91066';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('258cfa17-cd10-5263-8bc1-a955ccc6647e', '8b60ea34-3cd2-5018-a7a4-7d8e5ec91066', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b1cd065-9b68-5813-be05-6191d80e4098', '8b60ea34-3cd2-5018-a7a4-7d8e5ec91066', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 135: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bd936def-d30d-52ed-90e9-969c4f58f271', '00000000-0000-0000-0000-000000000000', 'st135@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st135@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bd936def-d30d-52ed-90e9-969c4f58f271', 'bd936def-d30d-52ed-90e9-969c4f58f271', '{"sub": "bd936def-d30d-52ed-90e9-969c4f58f271", "email": "st135@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bd936def-d30d-52ed-90e9-969c4f58f271')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bd936def-d30d-52ed-90e9-969c4f58f271', 'admin', 'st135@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('66319bd5-fcd3-5934-a1db-0454442c9ee6', 'bd936def-d30d-52ed-90e9-969c4f58f271', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.3702497, 85.8909745, 'India EV Network License', 'LIC-IN-ST135', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '66319bd5-fcd3-5934-a1db-0454442c9ee6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8fc2703f-6b87-5fe7-95d2-1b8ce7e52c3f', '66319bd5-fcd3-5934-a1db-0454442c9ee6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d082a21b-f95a-58fd-9fd2-e8f19f74076d', '66319bd5-fcd3-5934-a1db-0454442c9ee6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 136: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('05e8ef63-6835-57ca-9147-302a03ad594e', '00000000-0000-0000-0000-000000000000', 'st136@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st136@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('05e8ef63-6835-57ca-9147-302a03ad594e', '05e8ef63-6835-57ca-9147-302a03ad594e', '{"sub": "05e8ef63-6835-57ca-9147-302a03ad594e", "email": "st136@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '05e8ef63-6835-57ca-9147-302a03ad594e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('05e8ef63-6835-57ca-9147-302a03ad594e', 'admin', 'st136@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('89661b52-d638-549f-83e2-020256f44cf2', '05e8ef63-6835-57ca-9147-302a03ad594e', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.491886, 85.93527, 'India EV Network License', 'LIC-IN-ST136', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '89661b52-d638-549f-83e2-020256f44cf2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b27b105e-f43c-55b5-b8e7-edce92dbc39f', '89661b52-d638-549f-83e2-020256f44cf2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7138b19f-8c1e-5a7c-b9d9-653aa3d7056c', '89661b52-d638-549f-83e2-020256f44cf2', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 137: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('82d65b6f-8fb6-528f-a03f-71aa262dcbd9', '00000000-0000-0000-0000-000000000000', 'st137@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st137@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('82d65b6f-8fb6-528f-a03f-71aa262dcbd9', '82d65b6f-8fb6-528f-a03f-71aa262dcbd9', '{"sub": "82d65b6f-8fb6-528f-a03f-71aa262dcbd9", "email": "st137@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '82d65b6f-8fb6-528f-a03f-71aa262dcbd9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('82d65b6f-8fb6-528f-a03f-71aa262dcbd9', 'admin', 'st137@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('db4d973d-6473-59df-8f65-2c2bf1641c8e', '82d65b6f-8fb6-528f-a03f-71aa262dcbd9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.4791192, 85.8398223, 'India EV Network License', 'LIC-IN-ST137', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'db4d973d-6473-59df-8f65-2c2bf1641c8e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('553f401a-1b73-5a9d-8619-003fbcd38420', 'db4d973d-6473-59df-8f65-2c2bf1641c8e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('407c09dd-eb6a-5b69-97e4-6e2d7f401d9a', 'db4d973d-6473-59df-8f65-2c2bf1641c8e', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 138: Tata Power Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('94f24d31-1e52-53b2-aeb3-d559ff5ce6d1', '00000000-0000-0000-0000-000000000000', 'st138@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st138@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('94f24d31-1e52-53b2-aeb3-d559ff5ce6d1', '94f24d31-1e52-53b2-aeb3-d559ff5ce6d1', '{"sub": "94f24d31-1e52-53b2-aeb3-d559ff5ce6d1", "email": "st138@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '94f24d31-1e52-53b2-aeb3-d559ff5ce6d1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('94f24d31-1e52-53b2-aeb3-d559ff5ce6d1', 'admin', 'st138@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fbdfa03a-0d7b-5549-acfb-7e5c27d5a435', '94f24d31-1e52-53b2-aeb3-d559ff5ce6d1', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.529316, 85.949237, 'India EV Network License', 'LIC-IN-ST138', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fbdfa03a-0d7b-5549-acfb-7e5c27d5a435';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6275b3ff-3b70-5373-bd41-419d868d82ba', 'fbdfa03a-0d7b-5549-acfb-7e5c27d5a435', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7b519064-7444-5486-9f30-bd380bf73c58', 'fbdfa03a-0d7b-5549-acfb-7e5c27d5a435', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 139: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e044ca2e-6b96-5ec3-8b56-893a677712b9', '00000000-0000-0000-0000-000000000000', 'st139@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st139@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e044ca2e-6b96-5ec3-8b56-893a677712b9', 'e044ca2e-6b96-5ec3-8b56-893a677712b9', '{"sub": "e044ca2e-6b96-5ec3-8b56-893a677712b9", "email": "st139@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e044ca2e-6b96-5ec3-8b56-893a677712b9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e044ca2e-6b96-5ec3-8b56-893a677712b9', 'admin', 'st139@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1e814d31-a118-561c-8739-b5ddad38f9f3', 'e044ca2e-6b96-5ec3-8b56-893a677712b9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.453737, 85.88849, 'India EV Network License', 'LIC-IN-ST139', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1e814d31-a118-561c-8739-b5ddad38f9f3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7d5b3c31-824e-5dc3-b581-93f4a4cf8bf4', '1e814d31-a118-561c-8739-b5ddad38f9f3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('412a80eb-d741-5e73-b85a-b26a4e3e301c', '1e814d31-a118-561c-8739-b5ddad38f9f3', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 140: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('625e5028-7f2d-5992-962e-1243bab05e9f', '00000000-0000-0000-0000-000000000000', 'st140@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st140@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('625e5028-7f2d-5992-962e-1243bab05e9f', '625e5028-7f2d-5992-962e-1243bab05e9f', '{"sub": "625e5028-7f2d-5992-962e-1243bab05e9f", "email": "st140@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '625e5028-7f2d-5992-962e-1243bab05e9f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('625e5028-7f2d-5992-962e-1243bab05e9f', 'admin', 'st140@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0f2f0027-26f3-5b25-a30e-13c1c36832f0', '625e5028-7f2d-5992-962e-1243bab05e9f', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.4116317, 85.8794133, 'India EV Network License', 'LIC-IN-ST140', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0f2f0027-26f3-5b25-a30e-13c1c36832f0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d64a166d-eccc-507f-a69d-0b4de2b7dd04', '0f2f0027-26f3-5b25-a30e-13c1c36832f0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c4a3038c-0da4-5bde-8def-35f95327ea4f', '0f2f0027-26f3-5b25-a30e-13c1c36832f0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 141: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cbe39c3c-e1aa-5245-8b30-048db7c0d4e1', '00000000-0000-0000-0000-000000000000', 'st141@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st141@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cbe39c3c-e1aa-5245-8b30-048db7c0d4e1', 'cbe39c3c-e1aa-5245-8b30-048db7c0d4e1', '{"sub": "cbe39c3c-e1aa-5245-8b30-048db7c0d4e1", "email": "st141@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cbe39c3c-e1aa-5245-8b30-048db7c0d4e1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cbe39c3c-e1aa-5245-8b30-048db7c0d4e1', 'admin', 'st141@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2645b485-998f-55d7-908a-c919cdc6095a', 'cbe39c3c-e1aa-5245-8b30-048db7c0d4e1', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.481787, 85.817213, 'India EV Network License', 'LIC-IN-ST141', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2645b485-998f-55d7-908a-c919cdc6095a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('19df4bb7-10c7-5153-82ad-50cd2233c0b0', '2645b485-998f-55d7-908a-c919cdc6095a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ad513d0e-6e95-5c43-9feb-5526c9511882', '2645b485-998f-55d7-908a-c919cdc6095a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 142: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('112ef1df-0724-508a-8e66-4b69df6787b0', '00000000-0000-0000-0000-000000000000', 'st142@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st142@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('112ef1df-0724-508a-8e66-4b69df6787b0', '112ef1df-0724-508a-8e66-4b69df6787b0', '{"sub": "112ef1df-0724-508a-8e66-4b69df6787b0", "email": "st142@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '112ef1df-0724-508a-8e66-4b69df6787b0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('112ef1df-0724-508a-8e66-4b69df6787b0', 'admin', 'st142@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('66c7ef91-937f-5414-ada6-3406635867d7', '112ef1df-0724-508a-8e66-4b69df6787b0', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.4497938, 85.8982001, 'India EV Network License', 'LIC-IN-ST142', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '66c7ef91-937f-5414-ada6-3406635867d7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5cb76425-99da-58f3-aeaa-32c8dedd1642', '66c7ef91-937f-5414-ada6-3406635867d7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b3b02e83-bb57-5b8a-babe-9b20549cefd9', '66c7ef91-937f-5414-ada6-3406635867d7', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 143: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5a19c8e9-124e-5f26-9f4b-aeae58ffb178', '00000000-0000-0000-0000-000000000000', 'st143@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st143@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5a19c8e9-124e-5f26-9f4b-aeae58ffb178', '5a19c8e9-124e-5f26-9f4b-aeae58ffb178', '{"sub": "5a19c8e9-124e-5f26-9f4b-aeae58ffb178", "email": "st143@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5a19c8e9-124e-5f26-9f4b-aeae58ffb178')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5a19c8e9-124e-5f26-9f4b-aeae58ffb178', 'admin', 'st143@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3b3808f0-0bf2-5c8f-aaad-216e1356cb38', '5a19c8e9-124e-5f26-9f4b-aeae58ffb178', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.469631, 85.85469, 'India EV Network License', 'LIC-IN-ST143', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3b3808f0-0bf2-5c8f-aaad-216e1356cb38';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6681504c-8f40-5e47-97d3-d84dea2b96bf', '3b3808f0-0bf2-5c8f-aaad-216e1356cb38', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a9051440-3bda-5ff4-8003-e4ba8c7b06fd', '3b3808f0-0bf2-5c8f-aaad-216e1356cb38', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 144: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c9060904-0565-5070-ba08-cf7d287f9ccb', '00000000-0000-0000-0000-000000000000', 'st144@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st144@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c9060904-0565-5070-ba08-cf7d287f9ccb', 'c9060904-0565-5070-ba08-cf7d287f9ccb', '{"sub": "c9060904-0565-5070-ba08-cf7d287f9ccb", "email": "st144@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c9060904-0565-5070-ba08-cf7d287f9ccb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c9060904-0565-5070-ba08-cf7d287f9ccb', 'admin', 'st144@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('76bde488-9138-5d44-9c3b-888966193a78', 'c9060904-0565-5070-ba08-cf7d287f9ccb', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.460117, 85.88938, 'India EV Network License', 'LIC-IN-ST144', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '76bde488-9138-5d44-9c3b-888966193a78';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('947ece90-b566-56fb-99db-85dbbb3a0ff5', '76bde488-9138-5d44-9c3b-888966193a78', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3011dd6d-703d-513a-bcd3-03b9740a5224', '76bde488-9138-5d44-9c3b-888966193a78', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 145: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bbd40ae9-ee8c-5e1c-a1c4-737c4afc3e5e', '00000000-0000-0000-0000-000000000000', 'st145@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st145@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bbd40ae9-ee8c-5e1c-a1c4-737c4afc3e5e', 'bbd40ae9-ee8c-5e1c-a1c4-737c4afc3e5e', '{"sub": "bbd40ae9-ee8c-5e1c-a1c4-737c4afc3e5e", "email": "st145@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bbd40ae9-ee8c-5e1c-a1c4-737c4afc3e5e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bbd40ae9-ee8c-5e1c-a1c4-737c4afc3e5e', 'admin', 'st145@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a0edbe14-3bab-588f-8859-4831e98ae067', 'bbd40ae9-ee8c-5e1c-a1c4-737c4afc3e5e', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.44235, 85.90481, 'India EV Network License', 'LIC-IN-ST145', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a0edbe14-3bab-588f-8859-4831e98ae067';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1e47ef0f-c2f0-5c7c-9e19-5bd71a1c5289', 'a0edbe14-3bab-588f-8859-4831e98ae067', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd9bf923-7aa9-5943-bc46-7779d2484e38', 'a0edbe14-3bab-588f-8859-4831e98ae067', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 146: Bal Gopal Motors (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ca3b9d27-9ea7-536d-819b-f5aaf69c6c48', '00000000-0000-0000-0000-000000000000', 'st146@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st146@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ca3b9d27-9ea7-536d-819b-f5aaf69c6c48', 'ca3b9d27-9ea7-536d-819b-f5aaf69c6c48', '{"sub": "ca3b9d27-9ea7-536d-819b-f5aaf69c6c48", "email": "st146@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ca3b9d27-9ea7-536d-819b-f5aaf69c6c48')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ca3b9d27-9ea7-536d-819b-f5aaf69c6c48', 'admin', 'st146@boss.com', 'Admin Bal Gopal Motors', 'Bal Gopal Motors', 'Bal Gopal Motors, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2876998f-2fc4-57f6-80cf-16e5f9227478', 'ca3b9d27-9ea7-536d-819b-f5aaf69c6c48', 'Bal Gopal Motors', 'Bal Gopal Motors, Odisha, India', 20.4551603, 85.8866555, 'India EV Network License', 'LIC-IN-ST146', 500.0, 7.4, true, 'Balasore', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2876998f-2fc4-57f6-80cf-16e5f9227478';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b6a858bf-5891-5ba7-b304-d9f5402668fc', '2876998f-2fc4-57f6-80cf-16e5f9227478', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 147: Ather Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0ac5f144-8638-5247-a404-d1c8c3a63cb2', '00000000-0000-0000-0000-000000000000', 'st147@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st147@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0ac5f144-8638-5247-a404-d1c8c3a63cb2', '0ac5f144-8638-5247-a404-d1c8c3a63cb2', '{"sub": "0ac5f144-8638-5247-a404-d1c8c3a63cb2", "email": "st147@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0ac5f144-8638-5247-a404-d1c8c3a63cb2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0ac5f144-8638-5247-a404-d1c8c3a63cb2', 'admin', 'st147@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1a36083b-e294-56b9-b733-81905a41415b', '0ac5f144-8638-5247-a404-d1c8c3a63cb2', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 20.446043, 85.9069427, 'India EV Network License', 'LIC-IN-ST147', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1a36083b-e294-56b9-b733-81905a41415b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('990fb0f8-0434-5331-a5ae-4809f1fa924c', '1a36083b-e294-56b9-b733-81905a41415b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ff98be3c-33d0-51aa-ad1e-15b1f2c3967a', '1a36083b-e294-56b9-b733-81905a41415b', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 148: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('34b4c48e-a2ac-5852-b85b-993ec17d3bdf', '00000000-0000-0000-0000-000000000000', 'st148@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st148@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('34b4c48e-a2ac-5852-b85b-993ec17d3bdf', '34b4c48e-a2ac-5852-b85b-993ec17d3bdf', '{"sub": "34b4c48e-a2ac-5852-b85b-993ec17d3bdf", "email": "st148@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '34b4c48e-a2ac-5852-b85b-993ec17d3bdf')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('34b4c48e-a2ac-5852-b85b-993ec17d3bdf', 'admin', 'st148@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a91f46a3-df61-5f8a-b8d3-c35528b550b2', '34b4c48e-a2ac-5852-b85b-993ec17d3bdf', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.4660615, 85.9053606, 'India EV Network License', 'LIC-IN-ST148', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a91f46a3-df61-5f8a-b8d3-c35528b550b2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a0bf4c93-d73d-5765-94fa-f865c8e61ab9', 'a91f46a3-df61-5f8a-b8d3-c35528b550b2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('56eb8139-6ed8-5be4-ad30-9cd41d5cae6b', 'a91f46a3-df61-5f8a-b8d3-c35528b550b2', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 149: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5a393937-dfd7-5ad2-9436-7124304e6d41', '00000000-0000-0000-0000-000000000000', 'st149@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st149@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5a393937-dfd7-5ad2-9436-7124304e6d41', '5a393937-dfd7-5ad2-9436-7124304e6d41', '{"sub": "5a393937-dfd7-5ad2-9436-7124304e6d41", "email": "st149@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5a393937-dfd7-5ad2-9436-7124304e6d41')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5a393937-dfd7-5ad2-9436-7124304e6d41', 'admin', 'st149@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c7c967f7-6573-5fee-a470-a4c10fbae2b5', '5a393937-dfd7-5ad2-9436-7124304e6d41', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.474403, 85.8447998, 'India EV Network License', 'LIC-IN-ST149', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c7c967f7-6573-5fee-a470-a4c10fbae2b5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e6148b5f-eeff-5d74-a3ce-694567756128', 'c7c967f7-6573-5fee-a470-a4c10fbae2b5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3625ad19-5490-5c60-ad93-d7702646972c', 'c7c967f7-6573-5fee-a470-a4c10fbae2b5', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 150: Tata Power Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c840dc75-fe1c-5370-9e4e-503e4ab5291a', '00000000-0000-0000-0000-000000000000', 'st150@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st150@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c840dc75-fe1c-5370-9e4e-503e4ab5291a', 'c840dc75-fe1c-5370-9e4e-503e4ab5291a', '{"sub": "c840dc75-fe1c-5370-9e4e-503e4ab5291a", "email": "st150@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c840dc75-fe1c-5370-9e4e-503e4ab5291a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c840dc75-fe1c-5370-9e4e-503e4ab5291a', 'admin', 'st150@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ab116bd6-f4a5-5eaa-ba22-590f4e9b8708', 'c840dc75-fe1c-5370-9e4e-503e4ab5291a', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.4051611, 85.8798077, 'India EV Network License', 'LIC-IN-ST150', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ab116bd6-f4a5-5eaa-ba22-590f4e9b8708';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9aec80bb-03aa-5a7d-8b60-c796f1f82347', 'ab116bd6-f4a5-5eaa-ba22-590f4e9b8708', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fc5cd5f3-3eb2-5682-924e-422247f9abe1', 'ab116bd6-f4a5-5eaa-ba22-590f4e9b8708', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 151: Jio-bp pulse Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fb38fab8-2d39-56e5-bd96-d81f26a6998a', '00000000-0000-0000-0000-000000000000', 'st151@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st151@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fb38fab8-2d39-56e5-bd96-d81f26a6998a', 'fb38fab8-2d39-56e5-bd96-d81f26a6998a', '{"sub": "fb38fab8-2d39-56e5-bd96-d81f26a6998a", "email": "st151@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fb38fab8-2d39-56e5-bd96-d81f26a6998a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fb38fab8-2d39-56e5-bd96-d81f26a6998a', 'admin', 'st151@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('73c25736-40d2-5329-8423-bd27ea745913', 'fb38fab8-2d39-56e5-bd96-d81f26a6998a', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 20.5506603, 85.774418, 'India EV Network License', 'LIC-IN-ST151', 500.0, 60.0, true, 'Ganjam', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '73c25736-40d2-5329-8423-bd27ea745913';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c5a7b1d1-df0a-59ed-b20d-722d224ddea1', '73c25736-40d2-5329-8423-bd27ea745913', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2f3760d5-32a1-5151-97e8-82592ed7af69', '73c25736-40d2-5329-8423-bd27ea745913', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2494857f-86ea-52f2-af66-09675039343d', '73c25736-40d2-5329-8423-bd27ea745913', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 152: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('280cf606-f0e3-5202-a576-ba96465cd422', '00000000-0000-0000-0000-000000000000', 'st152@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st152@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('280cf606-f0e3-5202-a576-ba96465cd422', '280cf606-f0e3-5202-a576-ba96465cd422', '{"sub": "280cf606-f0e3-5202-a576-ba96465cd422", "email": "st152@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '280cf606-f0e3-5202-a576-ba96465cd422')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('280cf606-f0e3-5202-a576-ba96465cd422', 'admin', 'st152@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4483e37e-4e33-5b90-a466-fb9c61e43904', '280cf606-f0e3-5202-a576-ba96465cd422', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.4621758, 85.8837439, 'India EV Network License', 'LIC-IN-ST152', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4483e37e-4e33-5b90-a466-fb9c61e43904';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5a2a1e7d-f3a3-5d15-b5f0-7b308c64691f', '4483e37e-4e33-5b90-a466-fb9c61e43904', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c43d4218-444f-50c6-be59-94811edcf5d2', '4483e37e-4e33-5b90-a466-fb9c61e43904', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 153: Jio-bp pulse EV Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('93a4c116-f37e-5f70-a945-04401435c234', '00000000-0000-0000-0000-000000000000', 'st153@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st153@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('93a4c116-f37e-5f70-a945-04401435c234', '93a4c116-f37e-5f70-a945-04401435c234', '{"sub": "93a4c116-f37e-5f70-a945-04401435c234", "email": "st153@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '93a4c116-f37e-5f70-a945-04401435c234')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('93a4c116-f37e-5f70-a945-04401435c234', 'admin', 'st153@boss.com', 'Admin Jio-bp pulse EV Charging Station', 'Jio-bp pulse EV Charging Station', 'Jio-bp pulse EV Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5236b3b7-261e-5275-890b-ee8e3691042b', '93a4c116-f37e-5f70-a945-04401435c234', 'Jio-bp pulse EV Charging Station', 'Jio-bp pulse EV Charging Station, Odisha, India', 20.3770148, 85.8893793, 'India EV Network License', 'LIC-IN-ST153', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5236b3b7-261e-5275-890b-ee8e3691042b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ce510639-c900-563b-9081-21c11608ddcd', '5236b3b7-261e-5275-890b-ee8e3691042b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('058a3c5e-fbdc-59a3-8b9d-94d684823c55', '5236b3b7-261e-5275-890b-ee8e3691042b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5e732c1f-6683-573f-b61e-354079dd5b8c', '5236b3b7-261e-5275-890b-ee8e3691042b', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 154: Hindustan Petroleum Corporation Limited (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('64d361f3-9a4e-59cf-a9fb-a7799ce98e53', '00000000-0000-0000-0000-000000000000', 'st154@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st154@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('64d361f3-9a4e-59cf-a9fb-a7799ce98e53', '64d361f3-9a4e-59cf-a9fb-a7799ce98e53', '{"sub": "64d361f3-9a4e-59cf-a9fb-a7799ce98e53", "email": "st154@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '64d361f3-9a4e-59cf-a9fb-a7799ce98e53')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('64d361f3-9a4e-59cf-a9fb-a7799ce98e53', 'admin', 'st154@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('126bf34c-cb10-592a-96e8-a320f748066e', '64d361f3-9a4e-59cf-a9fb-a7799ce98e53', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 20.5512697, 85.9854959, 'India EV Network License', 'LIC-IN-ST154', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '126bf34c-cb10-592a-96e8-a320f748066e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('248c82a9-5e51-53bc-850d-6d8f3577bcd9', '126bf34c-cb10-592a-96e8-a320f748066e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('83284581-6878-5950-a432-c74957187d1f', '126bf34c-cb10-592a-96e8-a320f748066e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 155: Hindustan Petroleum Corporation Limited (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3c83cb3b-a93f-5ef7-8d7f-a6cdfa9a1bf5', '00000000-0000-0000-0000-000000000000', 'st155@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st155@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3c83cb3b-a93f-5ef7-8d7f-a6cdfa9a1bf5', '3c83cb3b-a93f-5ef7-8d7f-a6cdfa9a1bf5', '{"sub": "3c83cb3b-a93f-5ef7-8d7f-a6cdfa9a1bf5", "email": "st155@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3c83cb3b-a93f-5ef7-8d7f-a6cdfa9a1bf5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3c83cb3b-a93f-5ef7-8d7f-a6cdfa9a1bf5', 'admin', 'st155@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('06247792-922d-5ef7-9b5b-a06c245ab75c', '3c83cb3b-a93f-5ef7-8d7f-a6cdfa9a1bf5', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 20.2895101, 86.6453834, 'India EV Network License', 'LIC-IN-ST155', 500.0, 30.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '06247792-922d-5ef7-9b5b-a06c245ab75c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e0473b4b-877d-5fc2-9e17-ecceaf78b0af', '06247792-922d-5ef7-9b5b-a06c245ab75c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('251a63b2-6ba1-5ce9-8e8b-1d5d3842cdf6', '06247792-922d-5ef7-9b5b-a06c245ab75c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 156: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d4cf0a9a-9a60-5b99-a055-c88d8c37bda7', '00000000-0000-0000-0000-000000000000', 'st156@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st156@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d4cf0a9a-9a60-5b99-a055-c88d8c37bda7', 'd4cf0a9a-9a60-5b99-a055-c88d8c37bda7', '{"sub": "d4cf0a9a-9a60-5b99-a055-c88d8c37bda7", "email": "st156@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd4cf0a9a-9a60-5b99-a055-c88d8c37bda7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d4cf0a9a-9a60-5b99-a055-c88d8c37bda7', 'admin', 'st156@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e6707161-da1e-5781-ad9b-6c5441c691fd', 'd4cf0a9a-9a60-5b99-a055-c88d8c37bda7', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.307243, 86.320751, 'India EV Network License', 'LIC-IN-ST156', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e6707161-da1e-5781-ad9b-6c5441c691fd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17a4823d-c34f-57fc-aa79-53404bf5b41c', 'e6707161-da1e-5781-ad9b-6c5441c691fd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6eaa1396-9c17-5f7e-9406-fe08ff0de9e2', 'e6707161-da1e-5781-ad9b-6c5441c691fd', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 157: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bedd2d79-9b3e-5176-a037-bc65f9d1a8ce', '00000000-0000-0000-0000-000000000000', 'st157@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st157@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bedd2d79-9b3e-5176-a037-bc65f9d1a8ce', 'bedd2d79-9b3e-5176-a037-bc65f9d1a8ce', '{"sub": "bedd2d79-9b3e-5176-a037-bc65f9d1a8ce", "email": "st157@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bedd2d79-9b3e-5176-a037-bc65f9d1a8ce')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bedd2d79-9b3e-5176-a037-bc65f9d1a8ce', 'admin', 'st157@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('03312c32-4f74-5b53-a44b-5a21f7dae8cd', 'bedd2d79-9b3e-5176-a037-bc65f9d1a8ce', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.2606974, 86.2016437, 'India EV Network License', 'LIC-IN-ST157', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '03312c32-4f74-5b53-a44b-5a21f7dae8cd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d0929e34-1eea-5ee2-ad00-3595090c2735', '03312c32-4f74-5b53-a44b-5a21f7dae8cd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('537a54d1-36b8-530c-a98a-7501bda527ef', '03312c32-4f74-5b53-a44b-5a21f7dae8cd', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 158: BPCL Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('412ec62d-85f1-54e0-b13c-888feb32c3d2', '00000000-0000-0000-0000-000000000000', 'st158@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st158@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('412ec62d-85f1-54e0-b13c-888feb32c3d2', '412ec62d-85f1-54e0-b13c-888feb32c3d2', '{"sub": "412ec62d-85f1-54e0-b13c-888feb32c3d2", "email": "st158@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '412ec62d-85f1-54e0-b13c-888feb32c3d2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('412ec62d-85f1-54e0-b13c-888feb32c3d2', 'admin', 'st158@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('046f0ab1-12f9-577e-a8f9-20b0d78ce150', '412ec62d-85f1-54e0-b13c-888feb32c3d2', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 20.193901, 85.859992, 'India EV Network License', 'LIC-IN-ST158', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '046f0ab1-12f9-577e-a8f9-20b0d78ce150';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7f64d558-8bc8-5ac3-bc3a-e132c55ec0da', '046f0ab1-12f9-577e-a8f9-20b0d78ce150', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a0ece6bd-2fa9-5d80-8931-05e5f9517da1', '046f0ab1-12f9-577e-a8f9-20b0d78ce150', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 159: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9cf47f22-1ae9-56dd-bd0a-1cfd2328cc8d', '00000000-0000-0000-0000-000000000000', 'st159@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st159@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9cf47f22-1ae9-56dd-bd0a-1cfd2328cc8d', '9cf47f22-1ae9-56dd-bd0a-1cfd2328cc8d', '{"sub": "9cf47f22-1ae9-56dd-bd0a-1cfd2328cc8d", "email": "st159@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9cf47f22-1ae9-56dd-bd0a-1cfd2328cc8d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9cf47f22-1ae9-56dd-bd0a-1cfd2328cc8d', 'admin', 'st159@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c5202712-240d-55ec-919e-20e70070d6e3', '9cf47f22-1ae9-56dd-bd0a-1cfd2328cc8d', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.289135, 85.8152489, 'India EV Network License', 'LIC-IN-ST159', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c5202712-240d-55ec-919e-20e70070d6e3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a2308971-72ae-557e-aabb-2314281579c8', 'c5202712-240d-55ec-919e-20e70070d6e3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e10b5970-382d-5fa8-8770-400abadadef7', 'c5202712-240d-55ec-919e-20e70070d6e3', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 160: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('88bd51ab-97fb-5945-867f-691d2436ae28', '00000000-0000-0000-0000-000000000000', 'st160@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st160@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('88bd51ab-97fb-5945-867f-691d2436ae28', '88bd51ab-97fb-5945-867f-691d2436ae28', '{"sub": "88bd51ab-97fb-5945-867f-691d2436ae28", "email": "st160@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '88bd51ab-97fb-5945-867f-691d2436ae28')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('88bd51ab-97fb-5945-867f-691d2436ae28', 'admin', 'st160@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4aa8cc4c-462c-5ac2-9b06-f1c90dd42574', '88bd51ab-97fb-5945-867f-691d2436ae28', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.315432, 85.82054, 'India EV Network License', 'LIC-IN-ST160', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4aa8cc4c-462c-5ac2-9b06-f1c90dd42574';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eb99b702-ca00-563b-8502-2d84ae752565', '4aa8cc4c-462c-5ac2-9b06-f1c90dd42574', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b1560d3a-af89-5ba9-9f21-6dc6d748c78d', '4aa8cc4c-462c-5ac2-9b06-f1c90dd42574', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 161: Adani Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cba2be04-d85f-5b08-9c96-7882ed08fc0a', '00000000-0000-0000-0000-000000000000', 'st161@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st161@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cba2be04-d85f-5b08-9c96-7882ed08fc0a', 'cba2be04-d85f-5b08-9c96-7882ed08fc0a', '{"sub": "cba2be04-d85f-5b08-9c96-7882ed08fc0a", "email": "st161@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cba2be04-d85f-5b08-9c96-7882ed08fc0a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cba2be04-d85f-5b08-9c96-7882ed08fc0a', 'admin', 'st161@boss.com', 'Admin Adani Charging Station', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('39fcfe1c-bb08-58cf-82ca-29978a005b1f', 'cba2be04-d85f-5b08-9c96-7882ed08fc0a', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 20.3570179, 85.8888203, 'India EV Network License', 'LIC-IN-ST161', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '39fcfe1c-bb08-58cf-82ca-29978a005b1f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4eb0714c-4657-5b8a-9634-37846bad6322', '39fcfe1c-bb08-58cf-82ca-29978a005b1f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('063d39e5-30df-5de8-835c-94377c83a30a', '39fcfe1c-bb08-58cf-82ca-29978a005b1f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 162: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fb852013-4d7e-5c72-b743-3e7f91e130c5', '00000000-0000-0000-0000-000000000000', 'st162@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st162@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fb852013-4d7e-5c72-b743-3e7f91e130c5', 'fb852013-4d7e-5c72-b743-3e7f91e130c5', '{"sub": "fb852013-4d7e-5c72-b743-3e7f91e130c5", "email": "st162@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fb852013-4d7e-5c72-b743-3e7f91e130c5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fb852013-4d7e-5c72-b743-3e7f91e130c5', 'admin', 'st162@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('44bef819-a852-5f9d-a5d4-7f4dd42fe302', 'fb852013-4d7e-5c72-b743-3e7f91e130c5', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.256187, 85.7868375, 'India EV Network License', 'LIC-IN-ST162', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '44bef819-a852-5f9d-a5d4-7f4dd42fe302';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('42f3c9ad-8a23-5942-a636-7700dec662ec', '44bef819-a852-5f9d-a5d4-7f4dd42fe302', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6e8ca629-6620-5897-9bc2-9a0ed6b7504f', '44bef819-a852-5f9d-a5d4-7f4dd42fe302', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 163: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bfbac0e7-88e3-56b2-8dcc-8bd0ba6aad16', '00000000-0000-0000-0000-000000000000', 'st163@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st163@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bfbac0e7-88e3-56b2-8dcc-8bd0ba6aad16', 'bfbac0e7-88e3-56b2-8dcc-8bd0ba6aad16', '{"sub": "bfbac0e7-88e3-56b2-8dcc-8bd0ba6aad16", "email": "st163@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bfbac0e7-88e3-56b2-8dcc-8bd0ba6aad16')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bfbac0e7-88e3-56b2-8dcc-8bd0ba6aad16', 'admin', 'st163@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5ca565fe-5da8-5e10-b746-d3863cc78cc6', 'bfbac0e7-88e3-56b2-8dcc-8bd0ba6aad16', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.2614172, 85.8438993, 'India EV Network License', 'LIC-IN-ST163', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5ca565fe-5da8-5e10-b746-d3863cc78cc6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('80d0fe96-167a-5952-ba28-d8e14fe27213', '5ca565fe-5da8-5e10-b746-d3863cc78cc6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b13eca43-df5f-521b-b226-2416703c813f', '5ca565fe-5da8-5e10-b746-d3863cc78cc6', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 164: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('54713e79-a61d-50ea-9ceb-aec2234e70d4', '00000000-0000-0000-0000-000000000000', 'st164@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st164@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('54713e79-a61d-50ea-9ceb-aec2234e70d4', '54713e79-a61d-50ea-9ceb-aec2234e70d4', '{"sub": "54713e79-a61d-50ea-9ceb-aec2234e70d4", "email": "st164@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '54713e79-a61d-50ea-9ceb-aec2234e70d4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('54713e79-a61d-50ea-9ceb-aec2234e70d4', 'admin', 'st164@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('31ead85d-4620-5ad8-8df3-dfe2ed6b3ff6', '54713e79-a61d-50ea-9ceb-aec2234e70d4', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.2995501, 85.8309735, 'India EV Network License', 'LIC-IN-ST164', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '31ead85d-4620-5ad8-8df3-dfe2ed6b3ff6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd2a47e3-dce1-5a7e-accf-772316455210', '31ead85d-4620-5ad8-8df3-dfe2ed6b3ff6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('65d9a652-449c-5cc0-bbe5-97175c1cc7b8', '31ead85d-4620-5ad8-8df3-dfe2ed6b3ff6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 165: Statiq Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6f5f0415-ee0e-5c39-b3b3-13423daa75b7', '00000000-0000-0000-0000-000000000000', 'st165@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st165@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6f5f0415-ee0e-5c39-b3b3-13423daa75b7', '6f5f0415-ee0e-5c39-b3b3-13423daa75b7', '{"sub": "6f5f0415-ee0e-5c39-b3b3-13423daa75b7", "email": "st165@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6f5f0415-ee0e-5c39-b3b3-13423daa75b7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6f5f0415-ee0e-5c39-b3b3-13423daa75b7', 'admin', 'st165@boss.com', 'Admin Statiq Charging Station', 'Statiq Charging Station', 'Statiq Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('41a599c3-6b2f-5fd4-89c7-6d9406e311e7', '6f5f0415-ee0e-5c39-b3b3-13423daa75b7', 'Statiq Charging Station', 'Statiq Charging Station, Odisha, India', 20.2914763, 85.8560122, 'India EV Network License', 'LIC-IN-ST165', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '41a599c3-6b2f-5fd4-89c7-6d9406e311e7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9618917d-00cf-5b4b-bd07-542ce3a80d4c', '41a599c3-6b2f-5fd4-89c7-6d9406e311e7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c54f3dd3-ed3a-5873-be0b-8bb8ad711795', '41a599c3-6b2f-5fd4-89c7-6d9406e311e7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 166: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('766a88c8-12a4-5f72-989e-f8f95bd5ccd1', '00000000-0000-0000-0000-000000000000', 'st166@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st166@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('766a88c8-12a4-5f72-989e-f8f95bd5ccd1', '766a88c8-12a4-5f72-989e-f8f95bd5ccd1', '{"sub": "766a88c8-12a4-5f72-989e-f8f95bd5ccd1", "email": "st166@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '766a88c8-12a4-5f72-989e-f8f95bd5ccd1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('766a88c8-12a4-5f72-989e-f8f95bd5ccd1', 'admin', 'st166@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('76d006a7-1e40-5e7f-8b3c-035d506c6c0f', '766a88c8-12a4-5f72-989e-f8f95bd5ccd1', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.2669537, 85.8694239, 'India EV Network License', 'LIC-IN-ST166', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '76d006a7-1e40-5e7f-8b3c-035d506c6c0f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('771c514c-8a7b-5294-919d-96d69d99ca70', '76d006a7-1e40-5e7f-8b3c-035d506c6c0f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2d40d711-9e06-5ce6-8404-3b6d2acda573', '76d006a7-1e40-5e7f-8b3c-035d506c6c0f', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 167: Ather Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c198f5b1-a74f-5b71-89e3-93c30700f972', '00000000-0000-0000-0000-000000000000', 'st167@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st167@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c198f5b1-a74f-5b71-89e3-93c30700f972', 'c198f5b1-a74f-5b71-89e3-93c30700f972', '{"sub": "c198f5b1-a74f-5b71-89e3-93c30700f972", "email": "st167@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c198f5b1-a74f-5b71-89e3-93c30700f972')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c198f5b1-a74f-5b71-89e3-93c30700f972', 'admin', 'st167@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('db025889-9eef-5b15-90ac-50f94e843219', 'c198f5b1-a74f-5b71-89e3-93c30700f972', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 20.2640837, 85.8457679, 'India EV Network License', 'LIC-IN-ST167', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'db025889-9eef-5b15-90ac-50f94e843219';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e7b2420d-ba0c-5967-840b-024bf76cbc1b', 'db025889-9eef-5b15-90ac-50f94e843219', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('36c5edd3-4661-58aa-b1d8-91efc97cabc7', 'db025889-9eef-5b15-90ac-50f94e843219', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 168: Statiq Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1559d23e-90c6-5f72-a9c4-15d89307460a', '00000000-0000-0000-0000-000000000000', 'st168@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st168@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1559d23e-90c6-5f72-a9c4-15d89307460a', '1559d23e-90c6-5f72-a9c4-15d89307460a', '{"sub": "1559d23e-90c6-5f72-a9c4-15d89307460a", "email": "st168@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1559d23e-90c6-5f72-a9c4-15d89307460a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1559d23e-90c6-5f72-a9c4-15d89307460a', 'admin', 'st168@boss.com', 'Admin Statiq Charging Station', 'Statiq Charging Station', 'Statiq Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8a08a824-15ec-5f0e-ad1d-cd73cbbef541', '1559d23e-90c6-5f72-a9c4-15d89307460a', 'Statiq Charging Station', 'Statiq Charging Station, Odisha, India', 20.245772, 85.783043, 'India EV Network License', 'LIC-IN-ST168', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8a08a824-15ec-5f0e-ad1d-cd73cbbef541';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('960ad669-4281-548a-8551-297d5719f886', '8a08a824-15ec-5f0e-ad1d-cd73cbbef541', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('594a3afc-b06d-5812-bd5c-190d95da1ed0', '8a08a824-15ec-5f0e-ad1d-cd73cbbef541', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 169: Tata Power Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('62601f1b-dc91-5cd4-a245-a8e1893f9b90', '00000000-0000-0000-0000-000000000000', 'st169@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st169@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('62601f1b-dc91-5cd4-a245-a8e1893f9b90', '62601f1b-dc91-5cd4-a245-a8e1893f9b90', '{"sub": "62601f1b-dc91-5cd4-a245-a8e1893f9b90", "email": "st169@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '62601f1b-dc91-5cd4-a245-a8e1893f9b90')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('62601f1b-dc91-5cd4-a245-a8e1893f9b90', 'admin', 'st169@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('225615e9-c1a4-5840-b003-e9df9d572234', '62601f1b-dc91-5cd4-a245-a8e1893f9b90', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.259014, 85.8397059, 'India EV Network License', 'LIC-IN-ST169', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '225615e9-c1a4-5840-b003-e9df9d572234';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8af29bc9-686c-53d1-924d-5a4b0436d379', '225615e9-c1a4-5840-b003-e9df9d572234', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5cbd3c5a-c5b5-5a23-9b30-74aff1d14eb3', '225615e9-c1a4-5840-b003-e9df9d572234', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 170: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e766b650-5418-530c-87f7-2b57f3c8aa37', '00000000-0000-0000-0000-000000000000', 'st170@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st170@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e766b650-5418-530c-87f7-2b57f3c8aa37', 'e766b650-5418-530c-87f7-2b57f3c8aa37', '{"sub": "e766b650-5418-530c-87f7-2b57f3c8aa37", "email": "st170@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e766b650-5418-530c-87f7-2b57f3c8aa37')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e766b650-5418-530c-87f7-2b57f3c8aa37', 'admin', 'st170@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('90fd3542-edfb-5839-add5-40d2a0bde034', 'e766b650-5418-530c-87f7-2b57f3c8aa37', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.2710386, 85.7838293, 'India EV Network License', 'LIC-IN-ST170', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '90fd3542-edfb-5839-add5-40d2a0bde034';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1b6a5ecb-00e2-5bf6-9ef2-191308c5bf4e', '90fd3542-edfb-5839-add5-40d2a0bde034', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f2f4f71f-abb5-5e60-a8e9-a8b785b686c1', '90fd3542-edfb-5839-add5-40d2a0bde034', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 171: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b6a9cb70-29e4-54b1-b168-7dd5837fa9b9', '00000000-0000-0000-0000-000000000000', 'st171@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st171@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b6a9cb70-29e4-54b1-b168-7dd5837fa9b9', 'b6a9cb70-29e4-54b1-b168-7dd5837fa9b9', '{"sub": "b6a9cb70-29e4-54b1-b168-7dd5837fa9b9", "email": "st171@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b6a9cb70-29e4-54b1-b168-7dd5837fa9b9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b6a9cb70-29e4-54b1-b168-7dd5837fa9b9', 'admin', 'st171@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('13282a4c-2df6-50b8-8ab3-21daf5d0e5c6', 'b6a9cb70-29e4-54b1-b168-7dd5837fa9b9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.2986351, 85.8227086, 'India EV Network License', 'LIC-IN-ST171', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '13282a4c-2df6-50b8-8ab3-21daf5d0e5c6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f6cc722f-138d-5e06-a90c-fdfd21632faa', '13282a4c-2df6-50b8-8ab3-21daf5d0e5c6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('747bc906-3760-54da-bf90-3ad09f467270', '13282a4c-2df6-50b8-8ab3-21daf5d0e5c6', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 172: Adani Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7b83c045-4f8a-536f-b6d2-3da9beff0324', '00000000-0000-0000-0000-000000000000', 'st172@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st172@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7b83c045-4f8a-536f-b6d2-3da9beff0324', '7b83c045-4f8a-536f-b6d2-3da9beff0324', '{"sub": "7b83c045-4f8a-536f-b6d2-3da9beff0324", "email": "st172@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7b83c045-4f8a-536f-b6d2-3da9beff0324')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7b83c045-4f8a-536f-b6d2-3da9beff0324', 'admin', 'st172@boss.com', 'Admin Adani Charging Station', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('23f2a54d-8f90-5778-9b62-858fc6305c5a', '7b83c045-4f8a-536f-b6d2-3da9beff0324', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 20.2529878, 85.818779, 'India EV Network License', 'LIC-IN-ST172', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '23f2a54d-8f90-5778-9b62-858fc6305c5a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a18ede12-978c-527e-9ac4-2636e48a1320', '23f2a54d-8f90-5778-9b62-858fc6305c5a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('028a3dfb-849a-5eda-93a9-0da617ab2538', '23f2a54d-8f90-5778-9b62-858fc6305c5a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 173: Ather Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1fe184bb-760a-5f08-84bc-049b60e4eeb1', '00000000-0000-0000-0000-000000000000', 'st173@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st173@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1fe184bb-760a-5f08-84bc-049b60e4eeb1', '1fe184bb-760a-5f08-84bc-049b60e4eeb1', '{"sub": "1fe184bb-760a-5f08-84bc-049b60e4eeb1", "email": "st173@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1fe184bb-760a-5f08-84bc-049b60e4eeb1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1fe184bb-760a-5f08-84bc-049b60e4eeb1', 'admin', 'st173@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('adff5aa6-53a6-54f8-a291-588e73405e86', '1fe184bb-760a-5f08-84bc-049b60e4eeb1', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 20.2476107, 85.8409846, 'India EV Network License', 'LIC-IN-ST173', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'adff5aa6-53a6-54f8-a291-588e73405e86';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5c93241d-afa4-560d-8317-f4cd87dffc90', 'adff5aa6-53a6-54f8-a291-588e73405e86', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('66a4fae2-ccf5-5100-9967-0f37009728e4', 'adff5aa6-53a6-54f8-a291-588e73405e86', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 174: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('35e56986-4217-5034-ab8a-79a7a19372f5', '00000000-0000-0000-0000-000000000000', 'st174@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st174@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('35e56986-4217-5034-ab8a-79a7a19372f5', '35e56986-4217-5034-ab8a-79a7a19372f5', '{"sub": "35e56986-4217-5034-ab8a-79a7a19372f5", "email": "st174@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '35e56986-4217-5034-ab8a-79a7a19372f5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('35e56986-4217-5034-ab8a-79a7a19372f5', 'admin', 'st174@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('860782d9-e031-5c3d-afee-d92e492eb533', '35e56986-4217-5034-ab8a-79a7a19372f5', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.283109, 85.8060111, 'India EV Network License', 'LIC-IN-ST174', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '860782d9-e031-5c3d-afee-d92e492eb533';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7fb81b77-55da-5c37-a243-12d9d8553ab0', '860782d9-e031-5c3d-afee-d92e492eb533', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('406f23f0-d24d-540a-8327-9e6f89694b0b', '860782d9-e031-5c3d-afee-d92e492eb533', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 175: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7fdf5661-f904-56d0-ab46-2fd65806fd2f', '00000000-0000-0000-0000-000000000000', 'st175@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st175@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7fdf5661-f904-56d0-ab46-2fd65806fd2f', '7fdf5661-f904-56d0-ab46-2fd65806fd2f', '{"sub": "7fdf5661-f904-56d0-ab46-2fd65806fd2f", "email": "st175@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7fdf5661-f904-56d0-ab46-2fd65806fd2f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7fdf5661-f904-56d0-ab46-2fd65806fd2f', 'admin', 'st175@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4d10cc40-a734-5e6b-81db-5a632a438091', '7fdf5661-f904-56d0-ab46-2fd65806fd2f', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 20.25473, 85.787241, 'India EV Network License', 'LIC-IN-ST175', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4d10cc40-a734-5e6b-81db-5a632a438091';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('68462d91-a918-5f70-b363-2177ac4656b3', '4d10cc40-a734-5e6b-81db-5a632a438091', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('44b750e1-cf86-5478-a455-87dbbb9c7813', '4d10cc40-a734-5e6b-81db-5a632a438091', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 176: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ab5faca8-5ab7-5337-83b2-92c53023a869', '00000000-0000-0000-0000-000000000000', 'st176@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st176@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ab5faca8-5ab7-5337-83b2-92c53023a869', 'ab5faca8-5ab7-5337-83b2-92c53023a869', '{"sub": "ab5faca8-5ab7-5337-83b2-92c53023a869", "email": "st176@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ab5faca8-5ab7-5337-83b2-92c53023a869')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ab5faca8-5ab7-5337-83b2-92c53023a869', 'admin', 'st176@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a18e9e1d-5311-566a-90df-bc0380fa1103', 'ab5faca8-5ab7-5337-83b2-92c53023a869', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.2269974, 85.841081, 'India EV Network License', 'LIC-IN-ST176', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a18e9e1d-5311-566a-90df-bc0380fa1103';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('217940c0-e5f5-56e1-a945-5a68cdc450ff', 'a18e9e1d-5311-566a-90df-bc0380fa1103', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd96da39-8264-5b1f-ad77-d6b4a5064bd2', 'a18e9e1d-5311-566a-90df-bc0380fa1103', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 177: Ola Electric Mobility Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5c832eda-3872-5d16-876e-b0f498ff66f0', '00000000-0000-0000-0000-000000000000', 'st177@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st177@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5c832eda-3872-5d16-876e-b0f498ff66f0', '5c832eda-3872-5d16-876e-b0f498ff66f0', '{"sub": "5c832eda-3872-5d16-876e-b0f498ff66f0", "email": "st177@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5c832eda-3872-5d16-876e-b0f498ff66f0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5c832eda-3872-5d16-876e-b0f498ff66f0', 'admin', 'st177@boss.com', 'Admin Ola Electric Mobility Charging Station', 'Ola Electric Mobility Charging Station', 'Ola Electric Mobility Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('070f13c6-0d09-54ce-8e1b-ef4115156765', '5c832eda-3872-5d16-876e-b0f498ff66f0', 'Ola Electric Mobility Charging Station', 'Ola Electric Mobility Charging Station, Odisha, India', 20.2573761, 85.840973, 'India EV Network License', 'LIC-IN-ST177', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '070f13c6-0d09-54ce-8e1b-ef4115156765';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ce0fe279-2971-5f96-a317-ded79a4a1196', '070f13c6-0d09-54ce-8e1b-ef4115156765', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 178: DiodeEV Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7ce64776-8754-5096-89ea-2cada668d4a3', '00000000-0000-0000-0000-000000000000', 'st178@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st178@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7ce64776-8754-5096-89ea-2cada668d4a3', '7ce64776-8754-5096-89ea-2cada668d4a3', '{"sub": "7ce64776-8754-5096-89ea-2cada668d4a3", "email": "st178@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7ce64776-8754-5096-89ea-2cada668d4a3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7ce64776-8754-5096-89ea-2cada668d4a3', 'admin', 'st178@boss.com', 'Admin DiodeEV Charging Station', 'DiodeEV Charging Station', 'DiodeEV Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('69863f91-0599-569f-8412-af7fa380554b', '7ce64776-8754-5096-89ea-2cada668d4a3', 'DiodeEV Charging Station', 'DiodeEV Charging Station, Odisha, India', 20.2277148, 85.7356304, 'India EV Network License', 'LIC-IN-ST178', 500.0, 7.4, true, 'Khordha', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '69863f91-0599-569f-8412-af7fa380554b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4473f5d3-a5ea-5023-ba41-63fd1ab2d492', '69863f91-0599-569f-8412-af7fa380554b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 179: Statiq Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('db47f748-1fdb-59c4-adf1-65c7f9949655', '00000000-0000-0000-0000-000000000000', 'st179@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st179@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('db47f748-1fdb-59c4-adf1-65c7f9949655', 'db47f748-1fdb-59c4-adf1-65c7f9949655', '{"sub": "db47f748-1fdb-59c4-adf1-65c7f9949655", "email": "st179@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'db47f748-1fdb-59c4-adf1-65c7f9949655')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('db47f748-1fdb-59c4-adf1-65c7f9949655', 'admin', 'st179@boss.com', 'Admin Statiq Charging Station', 'Statiq Charging Station', 'Statiq Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e9f6ea68-3fb5-5b48-ba71-9ca26d20834b', 'db47f748-1fdb-59c4-adf1-65c7f9949655', 'Statiq Charging Station', 'Statiq Charging Station, Odisha, India', 20.205643, 85.644066, 'India EV Network License', 'LIC-IN-ST179', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e9f6ea68-3fb5-5b48-ba71-9ca26d20834b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2cdaecc3-d312-5fd8-b8e0-c9424f105cc9', 'e9f6ea68-3fb5-5b48-ba71-9ca26d20834b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f8eb4d53-1dc7-5f6c-9b14-095be8746770', 'e9f6ea68-3fb5-5b48-ba71-9ca26d20834b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 180: Tata Power Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7544daa3-1d7f-5442-a60a-c61ec6b86684', '00000000-0000-0000-0000-000000000000', 'st180@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st180@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7544daa3-1d7f-5442-a60a-c61ec6b86684', '7544daa3-1d7f-5442-a60a-c61ec6b86684', '{"sub": "7544daa3-1d7f-5442-a60a-c61ec6b86684", "email": "st180@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7544daa3-1d7f-5442-a60a-c61ec6b86684')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7544daa3-1d7f-5442-a60a-c61ec6b86684', 'admin', 'st180@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2e768ff8-7703-527e-b4c5-561a3af33195', '7544daa3-1d7f-5442-a60a-c61ec6b86684', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.2411801, 85.7591555, 'India EV Network License', 'LIC-IN-ST180', 500.0, 60.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2e768ff8-7703-527e-b4c5-561a3af33195';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('24c0bf56-b36b-586b-97fb-a69b001dbe24', '2e768ff8-7703-527e-b4c5-561a3af33195', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ab73eff3-b02f-5c3f-8c43-ddc825b864fb', '2e768ff8-7703-527e-b4c5-561a3af33195', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 181: Tata Power Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2e3cbd10-220b-5fd5-98ad-16d840c2316e', '00000000-0000-0000-0000-000000000000', 'st181@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st181@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2e3cbd10-220b-5fd5-98ad-16d840c2316e', '2e3cbd10-220b-5fd5-98ad-16d840c2316e', '{"sub": "2e3cbd10-220b-5fd5-98ad-16d840c2316e", "email": "st181@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2e3cbd10-220b-5fd5-98ad-16d840c2316e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2e3cbd10-220b-5fd5-98ad-16d840c2316e', 'admin', 'st181@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2c7fc921-0252-550e-9824-df8efb9c22ff', '2e3cbd10-220b-5fd5-98ad-16d840c2316e', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.238165, 85.756643, 'India EV Network License', 'LIC-IN-ST181', 500.0, 60.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2c7fc921-0252-550e-9824-df8efb9c22ff';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f711ec45-392e-5070-b6f6-70578000ab57', '2c7fc921-0252-550e-9824-df8efb9c22ff', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1822b692-8158-51b2-a605-e85afccd1411', '2c7fc921-0252-550e-9824-df8efb9c22ff', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 182: Kazam Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a4361916-de29-5069-8b23-efd2bb4276d2', '00000000-0000-0000-0000-000000000000', 'st182@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st182@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a4361916-de29-5069-8b23-efd2bb4276d2', 'a4361916-de29-5069-8b23-efd2bb4276d2', '{"sub": "a4361916-de29-5069-8b23-efd2bb4276d2", "email": "st182@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a4361916-de29-5069-8b23-efd2bb4276d2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a4361916-de29-5069-8b23-efd2bb4276d2', 'admin', 'st182@boss.com', 'Admin Kazam Charging Station', 'Kazam Charging Station', 'Kazam Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1115e1f9-23b3-5798-9643-0f6e3094ece5', 'a4361916-de29-5069-8b23-efd2bb4276d2', 'Kazam Charging Station', 'Kazam Charging Station, Odisha, India', 20.2555141, 85.6866637, 'India EV Network License', 'LIC-IN-ST182', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1115e1f9-23b3-5798-9643-0f6e3094ece5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('da65ffc7-7f43-5a0b-b03a-1411c0c7e937', '1115e1f9-23b3-5798-9643-0f6e3094ece5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e40c40cd-a248-58b1-98b9-a1e49f9ef473', '1115e1f9-23b3-5798-9643-0f6e3094ece5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 183: Thunder Plus Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('774d2a45-f6b2-50ac-813d-329f18ae80c1', '00000000-0000-0000-0000-000000000000', 'st183@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st183@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('774d2a45-f6b2-50ac-813d-329f18ae80c1', '774d2a45-f6b2-50ac-813d-329f18ae80c1', '{"sub": "774d2a45-f6b2-50ac-813d-329f18ae80c1", "email": "st183@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '774d2a45-f6b2-50ac-813d-329f18ae80c1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('774d2a45-f6b2-50ac-813d-329f18ae80c1', 'admin', 'st183@boss.com', 'Admin Thunder Plus Charging Station', 'Thunder Plus Charging Station', 'Thunder Plus Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1d93e4a8-b29f-5e53-bd9b-dca8fa9481ea', '774d2a45-f6b2-50ac-813d-329f18ae80c1', 'Thunder Plus Charging Station', 'Thunder Plus Charging Station, Odisha, India', 20.242778, 85.756117, 'India EV Network License', 'LIC-IN-ST183', 500.0, 7.4, true, 'Cuttack', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1d93e4a8-b29f-5e53-bd9b-dca8fa9481ea';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6ab8f1b3-1371-5399-a15c-7281dad83588', '1d93e4a8-b29f-5e53-bd9b-dca8fa9481ea', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 184: Kazam Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4b47b2e1-6b0d-561f-8232-57f9b7606e47', '00000000-0000-0000-0000-000000000000', 'st184@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st184@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4b47b2e1-6b0d-561f-8232-57f9b7606e47', '4b47b2e1-6b0d-561f-8232-57f9b7606e47', '{"sub": "4b47b2e1-6b0d-561f-8232-57f9b7606e47", "email": "st184@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4b47b2e1-6b0d-561f-8232-57f9b7606e47')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4b47b2e1-6b0d-561f-8232-57f9b7606e47', 'admin', 'st184@boss.com', 'Admin Kazam Charging Station', 'Kazam Charging Station', 'Kazam Charging Station, Odisha, India', 500.0, 7, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('768d4c06-7e64-5328-96e0-95857e9c057a', '4b47b2e1-6b0d-561f-8232-57f9b7606e47', 'Kazam Charging Station', 'Kazam Charging Station, Odisha, India', 20.2530223, 85.6869698, 'India EV Network License', 'LIC-IN-ST184', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '768d4c06-7e64-5328-96e0-95857e9c057a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c747bef5-457f-55ce-a5c1-68f8bfc8a39f', '768d4c06-7e64-5328-96e0-95857e9c057a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7c42ee61-7d50-51fe-8d90-6d28dc42cf6c', '768d4c06-7e64-5328-96e0-95857e9c057a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 185: Kazam Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8a0084b5-fba8-5ed8-ab40-fe3cbb75e9ef', '00000000-0000-0000-0000-000000000000', 'st185@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st185@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8a0084b5-fba8-5ed8-ab40-fe3cbb75e9ef', '8a0084b5-fba8-5ed8-ab40-fe3cbb75e9ef', '{"sub": "8a0084b5-fba8-5ed8-ab40-fe3cbb75e9ef", "email": "st185@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8a0084b5-fba8-5ed8-ab40-fe3cbb75e9ef')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8a0084b5-fba8-5ed8-ab40-fe3cbb75e9ef', 'admin', 'st185@boss.com', 'Admin Kazam Charging Station', 'Kazam Charging Station', 'Kazam Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('efa60b82-7e0e-5804-b97a-653dcfe50173', '8a0084b5-fba8-5ed8-ab40-fe3cbb75e9ef', 'Kazam Charging Station', 'Kazam Charging Station, Odisha, India', 20.2546992, 85.6867814, 'India EV Network License', 'LIC-IN-ST185', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'efa60b82-7e0e-5804-b97a-653dcfe50173';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e52bd77b-7044-5dd3-9c82-a767c43e127a', 'efa60b82-7e0e-5804-b97a-653dcfe50173', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f4505132-48f0-5e7b-bb9f-fb83adcf76f3', 'efa60b82-7e0e-5804-b97a-653dcfe50173', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 186: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c15deb4f-2689-56c0-bcac-e2b28968db5d', '00000000-0000-0000-0000-000000000000', 'st186@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st186@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c15deb4f-2689-56c0-bcac-e2b28968db5d', 'c15deb4f-2689-56c0-bcac-e2b28968db5d', '{"sub": "c15deb4f-2689-56c0-bcac-e2b28968db5d", "email": "st186@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c15deb4f-2689-56c0-bcac-e2b28968db5d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c15deb4f-2689-56c0-bcac-e2b28968db5d', 'admin', 'st186@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('84c879b5-7c0f-59a6-98ab-3d8334c5386b', 'c15deb4f-2689-56c0-bcac-e2b28968db5d', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.2306078, 85.7376707, 'India EV Network License', 'LIC-IN-ST186', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '84c879b5-7c0f-59a6-98ab-3d8334c5386b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9225c8ae-adf1-5669-9e23-61b30aafb080', '84c879b5-7c0f-59a6-98ab-3d8334c5386b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bc7a9971-cb97-5e81-831c-c58c6764e823', '84c879b5-7c0f-59a6-98ab-3d8334c5386b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 187: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3b3d7591-43c6-58a9-9ac8-46dda12937c6', '00000000-0000-0000-0000-000000000000', 'st187@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st187@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3b3d7591-43c6-58a9-9ac8-46dda12937c6', '3b3d7591-43c6-58a9-9ac8-46dda12937c6', '{"sub": "3b3d7591-43c6-58a9-9ac8-46dda12937c6", "email": "st187@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3b3d7591-43c6-58a9-9ac8-46dda12937c6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3b3d7591-43c6-58a9-9ac8-46dda12937c6', 'admin', 'st187@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a3c0bc56-577c-558f-8386-a27297acb6c5', '3b3d7591-43c6-58a9-9ac8-46dda12937c6', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.2407436, 85.7590281, 'India EV Network License', 'LIC-IN-ST187', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a3c0bc56-577c-558f-8386-a27297acb6c5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('91a646f6-54e4-5c2a-95d7-44606b5988e5', 'a3c0bc56-577c-558f-8386-a27297acb6c5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('56308ff3-5f5e-5105-9b5b-b8058481cb2c', 'a3c0bc56-577c-558f-8386-a27297acb6c5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 188: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4347872b-9ede-59c3-abdf-847cfc7ae8ea', '00000000-0000-0000-0000-000000000000', 'st188@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st188@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4347872b-9ede-59c3-abdf-847cfc7ae8ea', '4347872b-9ede-59c3-abdf-847cfc7ae8ea', '{"sub": "4347872b-9ede-59c3-abdf-847cfc7ae8ea", "email": "st188@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4347872b-9ede-59c3-abdf-847cfc7ae8ea')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4347872b-9ede-59c3-abdf-847cfc7ae8ea', 'admin', 'st188@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2f106e36-d87e-5232-96c6-b62f425527d8', '4347872b-9ede-59c3-abdf-847cfc7ae8ea', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.223618, 85.726762, 'India EV Network License', 'LIC-IN-ST188', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2f106e36-d87e-5232-96c6-b62f425527d8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('726e0785-c6f7-5694-bc79-d4f1de677191', '2f106e36-d87e-5232-96c6-b62f425527d8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('72ae2b9a-2209-537e-9187-fc194b98a8cd', '2f106e36-d87e-5232-96c6-b62f425527d8', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 189: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('272ae1e8-b9b1-5aab-8d26-2bee16f9a3f0', '00000000-0000-0000-0000-000000000000', 'st189@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st189@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('272ae1e8-b9b1-5aab-8d26-2bee16f9a3f0', '272ae1e8-b9b1-5aab-8d26-2bee16f9a3f0', '{"sub": "272ae1e8-b9b1-5aab-8d26-2bee16f9a3f0", "email": "st189@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '272ae1e8-b9b1-5aab-8d26-2bee16f9a3f0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('272ae1e8-b9b1-5aab-8d26-2bee16f9a3f0', 'admin', 'st189@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('41d1298b-1b1c-5e6b-9429-00bd2046e052', '272ae1e8-b9b1-5aab-8d26-2bee16f9a3f0', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.1939131, 85.6521488, 'India EV Network License', 'LIC-IN-ST189', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '41d1298b-1b1c-5e6b-9429-00bd2046e052';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b81fd1b5-81f5-54a5-a139-84aeea446f13', '41d1298b-1b1c-5e6b-9429-00bd2046e052', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e9faa255-e210-573d-ba2e-ff2f4931165e', '41d1298b-1b1c-5e6b-9429-00bd2046e052', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 190: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('70a24a7b-47ab-508b-861c-d64e0dd8511c', '00000000-0000-0000-0000-000000000000', 'st190@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st190@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('70a24a7b-47ab-508b-861c-d64e0dd8511c', '70a24a7b-47ab-508b-861c-d64e0dd8511c', '{"sub": "70a24a7b-47ab-508b-861c-d64e0dd8511c", "email": "st190@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '70a24a7b-47ab-508b-861c-d64e0dd8511c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('70a24a7b-47ab-508b-861c-d64e0dd8511c', 'admin', 'st190@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('116a6f59-27ad-5876-81c4-043930acdded', '70a24a7b-47ab-508b-861c-d64e0dd8511c', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.178873, 85.61153, 'India EV Network License', 'LIC-IN-ST190', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '116a6f59-27ad-5876-81c4-043930acdded';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('49bb6e34-0e3c-5c7c-9213-3ed144157288', '116a6f59-27ad-5876-81c4-043930acdded', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c6f7ed98-0298-566d-97bb-1c313e852cfd', '116a6f59-27ad-5876-81c4-043930acdded', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 191: Hindustan Petroleum Corporation Limited (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('184eda78-b9cc-5d3c-bf8c-e155d60a70d9', '00000000-0000-0000-0000-000000000000', 'st191@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st191@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('184eda78-b9cc-5d3c-bf8c-e155d60a70d9', '184eda78-b9cc-5d3c-bf8c-e155d60a70d9', '{"sub": "184eda78-b9cc-5d3c-bf8c-e155d60a70d9", "email": "st191@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '184eda78-b9cc-5d3c-bf8c-e155d60a70d9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('184eda78-b9cc-5d3c-bf8c-e155d60a70d9', 'admin', 'st191@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3fc02fdb-dc2b-51c3-8813-baadcdcf49e8', '184eda78-b9cc-5d3c-bf8c-e155d60a70d9', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 20.1545358, 85.0637881, 'India EV Network License', 'LIC-IN-ST191', 500.0, 30.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3fc02fdb-dc2b-51c3-8813-baadcdcf49e8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f430d807-262f-50cc-8947-0359b6588391', '3fc02fdb-dc2b-51c3-8813-baadcdcf49e8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e548a505-5d72-58f4-accd-8d5316d492cb', '3fc02fdb-dc2b-51c3-8813-baadcdcf49e8', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 192: Jio-bp (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('808dd69b-dd8a-59cf-88c1-9c2ca906773a', '00000000-0000-0000-0000-000000000000', 'st192@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st192@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('808dd69b-dd8a-59cf-88c1-9c2ca906773a', '808dd69b-dd8a-59cf-88c1-9c2ca906773a', '{"sub": "808dd69b-dd8a-59cf-88c1-9c2ca906773a", "email": "st192@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '808dd69b-dd8a-59cf-88c1-9c2ca906773a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('808dd69b-dd8a-59cf-88c1-9c2ca906773a', 'admin', 'st192@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0a5024fc-2bec-5d73-bb78-e897a85df304', '808dd69b-dd8a-59cf-88c1-9c2ca906773a', 'Jio-bp', 'Jio-bp, Odisha, India', 20.141301, 83.968362, 'India EV Network License', 'LIC-IN-ST192', 500.0, 50.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0a5024fc-2bec-5d73-bb78-e897a85df304';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('accbe0b1-266c-5d1f-bf9a-a4f19cae70b1', '0a5024fc-2bec-5d73-bb78-e897a85df304', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d958482d-dbcb-54f4-ae91-5ec3f4a07cdb', '0a5024fc-2bec-5d73-bb78-e897a85df304', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 193: Electric Vehicle Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bd2d3f81-0c84-5594-b1c1-cbe327cc6ab6', '00000000-0000-0000-0000-000000000000', 'st193@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st193@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bd2d3f81-0c84-5594-b1c1-cbe327cc6ab6', 'bd2d3f81-0c84-5594-b1c1-cbe327cc6ab6', '{"sub": "bd2d3f81-0c84-5594-b1c1-cbe327cc6ab6", "email": "st193@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bd2d3f81-0c84-5594-b1c1-cbe327cc6ab6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bd2d3f81-0c84-5594-b1c1-cbe327cc6ab6', 'admin', 'st193@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('029cce9e-a72e-5d5e-a511-ea8042b5cdcf', 'bd2d3f81-0c84-5594-b1c1-cbe327cc6ab6', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.2027864, 82.936256, 'India EV Network License', 'LIC-IN-ST193', 500.0, 25.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '029cce9e-a72e-5d5e-a511-ea8042b5cdcf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a751fb0c-cadf-50f1-af8b-24df5b11f22a', '029cce9e-a72e-5d5e-a511-ea8042b5cdcf', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('15443b55-71d1-550b-acf7-179a63a2241e', '029cce9e-a72e-5d5e-a511-ea8042b5cdcf', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 194: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3595fe0e-60e5-5852-8949-abb79361903f', '00000000-0000-0000-0000-000000000000', 'st194@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st194@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3595fe0e-60e5-5852-8949-abb79361903f', '3595fe0e-60e5-5852-8949-abb79361903f', '{"sub": "3595fe0e-60e5-5852-8949-abb79361903f", "email": "st194@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3595fe0e-60e5-5852-8949-abb79361903f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3595fe0e-60e5-5852-8949-abb79361903f', 'admin', 'st194@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2bca70de-79bf-5b13-b150-6d892ca0aab8', '3595fe0e-60e5-5852-8949-abb79361903f', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 20.3013862, 82.7516433, 'India EV Network License', 'LIC-IN-ST194', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2bca70de-79bf-5b13-b150-6d892ca0aab8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dc96cbb8-5c2f-5d09-bfff-e7c9ce038953', '2bca70de-79bf-5b13-b150-6d892ca0aab8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('308eee87-28d7-5efd-b8a3-375c2fd4281a', '2bca70de-79bf-5b13-b150-6d892ca0aab8', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 195: MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE, (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('522e3630-716a-5ae7-9403-79decaf87722', '00000000-0000-0000-0000-000000000000', 'st195@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st195@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('522e3630-716a-5ae7-9403-79decaf87722', '522e3630-716a-5ae7-9403-79decaf87722', '{"sub": "522e3630-716a-5ae7-9403-79decaf87722", "email": "st195@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '522e3630-716a-5ae7-9403-79decaf87722')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('522e3630-716a-5ae7-9403-79decaf87722', 'admin', 'st195@boss.com', 'Admin MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE,', 'MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE,', 'MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE,, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cce8f74c-1172-52e8-8857-f45f71751605', '522e3630-716a-5ae7-9403-79decaf87722', 'MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE,', 'MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE,, Odisha, India', 20.0299963, 86.131915, 'India EV Network License', 'LIC-IN-ST195', 500.0, 7.4, true, 'Ganjam', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cce8f74c-1172-52e8-8857-f45f71751605';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3c8be141-be78-5fbf-972d-9a379abb3dba', 'cce8f74c-1172-52e8-8857-f45f71751605', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 196: Jio-bp pulse Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1f3ae4f1-568a-5541-bb79-a5b62ab5aa81', '00000000-0000-0000-0000-000000000000', 'st196@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st196@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1f3ae4f1-568a-5541-bb79-a5b62ab5aa81', '1f3ae4f1-568a-5541-bb79-a5b62ab5aa81', '{"sub": "1f3ae4f1-568a-5541-bb79-a5b62ab5aa81", "email": "st196@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1f3ae4f1-568a-5541-bb79-a5b62ab5aa81')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1f3ae4f1-568a-5541-bb79-a5b62ab5aa81', 'admin', 'st196@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('af2c267a-82fa-5ce0-89e3-f44cf96859b0', '1f3ae4f1-568a-5541-bb79-a5b62ab5aa81', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 20.036226, 85.825447, 'India EV Network License', 'LIC-IN-ST196', 500.0, 60.0, true, 'Cuttack', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'af2c267a-82fa-5ce0-89e3-f44cf96859b0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('40cdae86-2a19-5aa9-bf45-0dfe7fe8ae70', 'af2c267a-82fa-5ce0-89e3-f44cf96859b0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e75263d7-0c7d-56cd-bb66-25eaa0429473', 'af2c267a-82fa-5ce0-89e3-f44cf96859b0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd9ac360-3010-5fd4-ba59-44a9fb1835d0', 'af2c267a-82fa-5ce0-89e3-f44cf96859b0', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 197: Jio-bp pulse Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('62d48d9e-d74b-565b-9597-5e7d683c8e29', '00000000-0000-0000-0000-000000000000', 'st197@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st197@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('62d48d9e-d74b-565b-9597-5e7d683c8e29', '62d48d9e-d74b-565b-9597-5e7d683c8e29', '{"sub": "62d48d9e-d74b-565b-9597-5e7d683c8e29", "email": "st197@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '62d48d9e-d74b-565b-9597-5e7d683c8e29')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('62d48d9e-d74b-565b-9597-5e7d683c8e29', 'admin', 'st197@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a83d50a8-3fc1-5a69-928f-ee518e5a7295', '62d48d9e-d74b-565b-9597-5e7d683c8e29', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 19.9812257, 85.8251193, 'India EV Network License', 'LIC-IN-ST197', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a83d50a8-3fc1-5a69-928f-ee518e5a7295';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('57b55951-1c6a-50a2-a399-60e7066ddfff', 'a83d50a8-3fc1-5a69-928f-ee518e5a7295', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('503c6062-354a-52b4-9751-a864bd6b0ff0', 'a83d50a8-3fc1-5a69-928f-ee518e5a7295', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c3f4e63b-00a8-5b9d-90d1-9d50da120c39', 'a83d50a8-3fc1-5a69-928f-ee518e5a7295', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 198: Ather Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4758977f-5a48-5cf6-aec7-f876be78f5f3', '00000000-0000-0000-0000-000000000000', 'st198@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st198@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4758977f-5a48-5cf6-aec7-f876be78f5f3', '4758977f-5a48-5cf6-aec7-f876be78f5f3', '{"sub": "4758977f-5a48-5cf6-aec7-f876be78f5f3", "email": "st198@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4758977f-5a48-5cf6-aec7-f876be78f5f3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4758977f-5a48-5cf6-aec7-f876be78f5f3', 'admin', 'st198@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fb0cc7a7-b151-54ee-99b3-a090982305d5', '4758977f-5a48-5cf6-aec7-f876be78f5f3', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 20.001994, 85.8205414, 'India EV Network License', 'LIC-IN-ST198', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fb0cc7a7-b151-54ee-99b3-a090982305d5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f07fa752-dc62-5cfb-92aa-917d4683dddb', 'fb0cc7a7-b151-54ee-99b3-a090982305d5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('250cbdf9-aefe-50a1-999d-6cbd43e5bc3f', 'fb0cc7a7-b151-54ee-99b3-a090982305d5', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 199: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b199f5c2-6acb-5d62-9ec0-399902c7be80', '00000000-0000-0000-0000-000000000000', 'st199@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st199@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b199f5c2-6acb-5d62-9ec0-399902c7be80', 'b199f5c2-6acb-5d62-9ec0-399902c7be80', '{"sub": "b199f5c2-6acb-5d62-9ec0-399902c7be80", "email": "st199@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b199f5c2-6acb-5d62-9ec0-399902c7be80')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b199f5c2-6acb-5d62-9ec0-399902c7be80', 'admin', 'st199@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4a82febc-2dfd-52ef-8fb3-ef775773f6d7', 'b199f5c2-6acb-5d62-9ec0-399902c7be80', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.913864, 85.98975, 'India EV Network License', 'LIC-IN-ST199', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4a82febc-2dfd-52ef-8fb3-ef775773f6d7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d25a1a63-9b42-5226-93fe-dc0941d973bd', '4a82febc-2dfd-52ef-8fb3-ef775773f6d7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('774441d0-685c-5692-9df4-e538a5888d41', '4a82febc-2dfd-52ef-8fb3-ef775773f6d7', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 200: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ef3e21c5-a349-5e06-9eb2-7c906c20b0bc', '00000000-0000-0000-0000-000000000000', 'st200@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st200@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ef3e21c5-a349-5e06-9eb2-7c906c20b0bc', 'ef3e21c5-a349-5e06-9eb2-7c906c20b0bc', '{"sub": "ef3e21c5-a349-5e06-9eb2-7c906c20b0bc", "email": "st200@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ef3e21c5-a349-5e06-9eb2-7c906c20b0bc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ef3e21c5-a349-5e06-9eb2-7c906c20b0bc', 'admin', 'st200@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('655a6025-f478-522f-a8ed-d0c643f57f5e', 'ef3e21c5-a349-5e06-9eb2-7c906c20b0bc', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.0089777, 85.8138496, 'India EV Network License', 'LIC-IN-ST200', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '655a6025-f478-522f-a8ed-d0c643f57f5e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7bb1cb0e-9612-5491-bbb8-392bda32b496', '655a6025-f478-522f-a8ed-d0c643f57f5e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d1c18618-859f-5350-b46f-ee778acb8675', '655a6025-f478-522f-a8ed-d0c643f57f5e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
