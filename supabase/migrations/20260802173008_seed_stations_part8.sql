-- Seed Stations Part 8 (Stations 701 to 800)
BEGIN;

-- Station 701: Parekkat's EVCS - GO EC (Mala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f56cc6d6-5b50-5dc2-93ef-28275c9b8e38', '00000000-0000-0000-0000-000000000000', 'st701@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st701@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f56cc6d6-5b50-5dc2-93ef-28275c9b8e38', 'f56cc6d6-5b50-5dc2-93ef-28275c9b8e38', '{"sub": "f56cc6d6-5b50-5dc2-93ef-28275c9b8e38", "email": "st701@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f56cc6d6-5b50-5dc2-93ef-28275c9b8e38')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f56cc6d6-5b50-5dc2-93ef-28275c9b8e38', 'admin', 'st701@boss.com', 'Admin Parekkat''s EVCS - GO EC', 'Parekkat''s EVCS - GO EC', 'Parekkat''s EVCS - GO EC, Mala, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, created_at)
VALUES ('b4b1695d-150f-5015-8f02-230f523071aa', 'f56cc6d6-5b50-5dc2-93ef-28275c9b8e38', 'Parekkat''s EVCS - GO EC', 'Parekkat''s EVCS - GO EC, Mala, Kerala, India', 10.24066912, 76.27252885, 'India EV Network License', 'LIC-IN-ST701', 500.0, 24.0, true, 'Mala', 'Kerala', 1, 'GO EC (IN)', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('50503a8f-2fe9-58cd-a616-cfc6543a66a3', 'b4b1695d-150f-5015-8f02-230f523071aa', 'Port A', 50, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO NOTHING;

-- Station 702: Kodungallur SVS - GO EC (Kodungallur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b479f557-012d-511a-979e-98ec2eae4e5e', '00000000-0000-0000-0000-000000000000', 'st702@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st702@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b479f557-012d-511a-979e-98ec2eae4e5e', 'b479f557-012d-511a-979e-98ec2eae4e5e', '{"sub": "b479f557-012d-511a-979e-98ec2eae4e5e", "email": "st702@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b479f557-012d-511a-979e-98ec2eae4e5e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b479f557-012d-511a-979e-98ec2eae4e5e', 'admin', 'st702@boss.com', 'Admin Kodungallur SVS - GO EC', 'Kodungallur SVS - GO EC', 'Kodungallur SVS - GO EC, Kodungallur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e66eb5ef-1291-5866-8bef-a3cea2d125e4', 'b479f557-012d-511a-979e-98ec2eae4e5e', 'Kodungallur SVS - GO EC', 'Kodungallur SVS - GO EC, Kodungallur, Kerala, India', 10.21129205, 76.19898867, 'India EV Network License', 'LIC-IN-ST702', 500.0, 30.0, true, 'Kodungallur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e66eb5ef-1291-5866-8bef-a3cea2d125e4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3338ab43-7aa7-5d66-b940-b79737da8b51', 'e66eb5ef-1291-5866-8bef-a3cea2d125e4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e86fa20f-a58c-57b5-ae5e-09917d45b68d', 'e66eb5ef-1291-5866-8bef-a3cea2d125e4', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 703: FUZO EV Super Charging Station (Kodungallur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4d09775e-bdcc-5147-8c90-4c48c69ec7fb', '00000000-0000-0000-0000-000000000000', 'st703@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st703@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4d09775e-bdcc-5147-8c90-4c48c69ec7fb', '4d09775e-bdcc-5147-8c90-4c48c69ec7fb', '{"sub": "4d09775e-bdcc-5147-8c90-4c48c69ec7fb", "email": "st703@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4d09775e-bdcc-5147-8c90-4c48c69ec7fb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4d09775e-bdcc-5147-8c90-4c48c69ec7fb', 'admin', 'st703@boss.com', 'Admin FUZO EV Super Charging Station', 'FUZO EV Super Charging Station', 'FUZO EV Super Charging Station, Kodungallur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('15dedc3f-eb4f-535e-9f84-3c7a646da2fa', '4d09775e-bdcc-5147-8c90-4c48c69ec7fb', 'FUZO EV Super Charging Station', 'FUZO EV Super Charging Station, Kodungallur, Kerala, India', 10.37813516, 76.12254539, 'India EV Network License', 'LIC-IN-ST703', 500.0, 7.4, true, 'Kodungallur', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '15dedc3f-eb4f-535e-9f84-3c7a646da2fa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0c77febd-6086-54d2-9dd9-3a95dce25e48', '15dedc3f-eb4f-535e-9f84-3c7a646da2fa', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 704: Sree Rama EVCS - GO EC (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('24e25857-16cb-59f7-aa7b-8c9c7abba506', '00000000-0000-0000-0000-000000000000', 'st704@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st704@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('24e25857-16cb-59f7-aa7b-8c9c7abba506', '24e25857-16cb-59f7-aa7b-8c9c7abba506', '{"sub": "24e25857-16cb-59f7-aa7b-8c9c7abba506", "email": "st704@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '24e25857-16cb-59f7-aa7b-8c9c7abba506')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('24e25857-16cb-59f7-aa7b-8c9c7abba506', 'admin', 'st704@boss.com', 'Admin Sree Rama EVCS - GO EC', 'Sree Rama EVCS - GO EC', 'Sree Rama EVCS - GO EC, Thrissur, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('14857d3f-b55f-5955-8b1a-82449d8b2938', '24e25857-16cb-59f7-aa7b-8c9c7abba506', 'Sree Rama EVCS - GO EC', 'Sree Rama EVCS - GO EC, Thrissur, Kerala, India', 10.43559497, 76.26587468, 'India EV Network License', 'LIC-IN-ST704', 500.0, 30.0, true, 'Thrissur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '14857d3f-b55f-5955-8b1a-82449d8b2938';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c63a8362-33f4-5aec-a693-5416e52aa686', '14857d3f-b55f-5955-8b1a-82449d8b2938', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8a7a8f86-6ab9-5eb7-b025-3c0c252fcf0f', '14857d3f-b55f-5955-8b1a-82449d8b2938', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 705: Daiz and Co. EVCS - GO EC (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('21115efe-f754-511c-ad33-ecacc464a0c8', '00000000-0000-0000-0000-000000000000', 'st705@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st705@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('21115efe-f754-511c-ad33-ecacc464a0c8', '21115efe-f754-511c-ad33-ecacc464a0c8', '{"sub": "21115efe-f754-511c-ad33-ecacc464a0c8", "email": "st705@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '21115efe-f754-511c-ad33-ecacc464a0c8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('21115efe-f754-511c-ad33-ecacc464a0c8', 'admin', 'st705@boss.com', 'Admin Daiz and Co. EVCS - GO EC', 'Daiz and Co. EVCS - GO EC', 'Daiz and Co. EVCS - GO EC, Thrissur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b188dded-f66b-5f6a-9a5c-67a20f2dd4f2', '21115efe-f754-511c-ad33-ecacc464a0c8', 'Daiz and Co. EVCS - GO EC', 'Daiz and Co. EVCS - GO EC, Thrissur, Kerala, India', 10.52614957, 76.18795462, 'India EV Network License', 'LIC-IN-ST705', 500.0, 30.0, true, 'Thrissur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b188dded-f66b-5f6a-9a5c-67a20f2dd4f2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f9101750-eb34-533c-b1d4-6c7b6a18d539', 'b188dded-f66b-5f6a-9a5c-67a20f2dd4f2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e4f11637-7319-57ec-aa3c-5596e4fc3172', 'b188dded-f66b-5f6a-9a5c-67a20f2dd4f2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 706: Shobha City Mall EVCS - GO EC (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1b8a5c15-8c3d-5d46-b862-212857d0275c', '00000000-0000-0000-0000-000000000000', 'st706@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st706@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1b8a5c15-8c3d-5d46-b862-212857d0275c', '1b8a5c15-8c3d-5d46-b862-212857d0275c', '{"sub": "1b8a5c15-8c3d-5d46-b862-212857d0275c", "email": "st706@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1b8a5c15-8c3d-5d46-b862-212857d0275c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1b8a5c15-8c3d-5d46-b862-212857d0275c', 'admin', 'st706@boss.com', 'Admin Shobha City Mall EVCS - GO EC', 'Shobha City Mall EVCS - GO EC', 'Shobha City Mall EVCS - GO EC, Thrissur, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('40008a12-addf-5139-8416-3f2cf04af58e', '1b8a5c15-8c3d-5d46-b862-212857d0275c', 'Shobha City Mall EVCS - GO EC', 'Shobha City Mall EVCS - GO EC, Thrissur, Kerala, India', 10.54894656, 76.18304111, 'India EV Network License', 'LIC-IN-ST706', 500.0, 30.0, true, 'Thrissur', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '40008a12-addf-5139-8416-3f2cf04af58e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('90741e8d-babd-50b3-9f5b-4afef0904490', '40008a12-addf-5139-8416-3f2cf04af58e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('69b39b8d-2297-5a9f-a817-d4058e6ace7a', '40008a12-addf-5139-8416-3f2cf04af58e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 707: Amala Smart EVCS - GO EC (Peramangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1ea79cc1-298d-5ed0-9f32-55379a2cb865', '00000000-0000-0000-0000-000000000000', 'st707@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st707@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1ea79cc1-298d-5ed0-9f32-55379a2cb865', '1ea79cc1-298d-5ed0-9f32-55379a2cb865', '{"sub": "1ea79cc1-298d-5ed0-9f32-55379a2cb865", "email": "st707@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1ea79cc1-298d-5ed0-9f32-55379a2cb865')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1ea79cc1-298d-5ed0-9f32-55379a2cb865', 'admin', 'st707@boss.com', 'Admin Amala Smart EVCS - GO EC', 'Amala Smart EVCS - GO EC', 'Amala Smart EVCS - GO EC, Peramangalam, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1bb5c147-dfbf-5ff5-9d6a-9b4e1bb6801a', '1ea79cc1-298d-5ed0-9f32-55379a2cb865', 'Amala Smart EVCS - GO EC', 'Amala Smart EVCS - GO EC, Peramangalam, Kerala, India', 10.56496749, 76.16598426, 'India EV Network License', 'LIC-IN-ST707', 500.0, 30.0, true, 'Peramangalam', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1bb5c147-dfbf-5ff5-9d6a-9b4e1bb6801a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d7641e23-3a79-508d-980b-1f7183ad4e7d', '1bb5c147-dfbf-5ff5-9d6a-9b4e1bb6801a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('031a5e2b-17cc-5734-bbda-a9ec59862f25', '1bb5c147-dfbf-5ff5-9d6a-9b4e1bb6801a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 708: Sree Sankara EVCS - GO EC (Vadanappalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('606d6726-ba3f-524f-97af-a0bd96837427', '00000000-0000-0000-0000-000000000000', 'st708@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st708@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('606d6726-ba3f-524f-97af-a0bd96837427', '606d6726-ba3f-524f-97af-a0bd96837427', '{"sub": "606d6726-ba3f-524f-97af-a0bd96837427", "email": "st708@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '606d6726-ba3f-524f-97af-a0bd96837427')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('606d6726-ba3f-524f-97af-a0bd96837427', 'admin', 'st708@boss.com', 'Admin Sree Sankara EVCS - GO EC', 'Sree Sankara EVCS - GO EC', 'Sree Sankara EVCS - GO EC, Vadanappalli, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3167c056-b779-5df7-a255-09cba4a0d6ac', '606d6726-ba3f-524f-97af-a0bd96837427', 'Sree Sankara EVCS - GO EC', 'Sree Sankara EVCS - GO EC, Vadanappalli, Kerala, India', 10.4872912, 76.07083612, 'India EV Network License', 'LIC-IN-ST708', 500.0, 30.0, true, 'Vadanappalli', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3167c056-b779-5df7-a255-09cba4a0d6ac';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('74b456ee-4866-5497-be45-e7848619f074', '3167c056-b779-5df7-a255-09cba4a0d6ac', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ea1f78e5-6ac5-5da6-b604-b1919e82740c', '3167c056-b779-5df7-a255-09cba4a0d6ac', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 709: Green Drive EV Super Charging Station (Vadanappilly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e08ec1f8-0ac8-5afc-8f72-9c6193576d95', '00000000-0000-0000-0000-000000000000', 'st709@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st709@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e08ec1f8-0ac8-5afc-8f72-9c6193576d95', 'e08ec1f8-0ac8-5afc-8f72-9c6193576d95', '{"sub": "e08ec1f8-0ac8-5afc-8f72-9c6193576d95", "email": "st709@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e08ec1f8-0ac8-5afc-8f72-9c6193576d95')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e08ec1f8-0ac8-5afc-8f72-9c6193576d95', 'admin', 'st709@boss.com', 'Admin Green Drive EV Super Charging Station', 'Green Drive EV Super Charging Station', 'Green Drive EV Super Charging Station, Vadanappilly, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('84f95f4d-6613-5638-8ed0-2dba6cd540c4', 'e08ec1f8-0ac8-5afc-8f72-9c6193576d95', 'Green Drive EV Super Charging Station', 'Green Drive EV Super Charging Station, Vadanappilly, Kerala, India', 10.49454247, 76.06584744, 'India EV Network License', 'LIC-IN-ST709', 500.0, 7.4, true, 'Vadanappilly', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '84f95f4d-6613-5638-8ed0-2dba6cd540c4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('af34ff85-0593-5cfd-b2e3-14f4d1939649', '84f95f4d-6613-5638-8ed0-2dba6cd540c4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 710: Sree Krishna Hotel - GO EC (Guruvayoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4965f156-4e2f-5a90-b450-c204d47a4a41', '00000000-0000-0000-0000-000000000000', 'st710@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st710@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4965f156-4e2f-5a90-b450-c204d47a4a41', '4965f156-4e2f-5a90-b450-c204d47a4a41', '{"sub": "4965f156-4e2f-5a90-b450-c204d47a4a41", "email": "st710@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4965f156-4e2f-5a90-b450-c204d47a4a41')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4965f156-4e2f-5a90-b450-c204d47a4a41', 'admin', 'st710@boss.com', 'Admin Sree Krishna Hotel - GO EC', 'Sree Krishna Hotel - GO EC', 'Sree Krishna Hotel - GO EC, Guruvayoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('266c9953-2eb9-5fe4-b356-2525e11cf660', '4965f156-4e2f-5a90-b450-c204d47a4a41', 'Sree Krishna Hotel - GO EC', 'Sree Krishna Hotel - GO EC, Guruvayoor, Kerala, India', 10.59844782, 76.03636789, 'India EV Network License', 'LIC-IN-ST710', 500.0, 30.0, true, 'Guruvayoor', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '266c9953-2eb9-5fe4-b356-2525e11cf660';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3e23293f-4861-5e12-9bae-636aa13297f9', '266c9953-2eb9-5fe4-b356-2525e11cf660', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('04459031-82e4-5d01-826c-b00354514d12', '266c9953-2eb9-5fe4-b356-2525e11cf660', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 711: Palakkad Ahalia Women and Childern Hospital EVCS - GO EC (Elappully, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e881e8d4-e7a2-5338-8616-c2c6d4c12ca4', '00000000-0000-0000-0000-000000000000', 'st711@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st711@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e881e8d4-e7a2-5338-8616-c2c6d4c12ca4', 'e881e8d4-e7a2-5338-8616-c2c6d4c12ca4', '{"sub": "e881e8d4-e7a2-5338-8616-c2c6d4c12ca4", "email": "st711@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e881e8d4-e7a2-5338-8616-c2c6d4c12ca4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e881e8d4-e7a2-5338-8616-c2c6d4c12ca4', 'admin', 'st711@boss.com', 'Admin Palakkad Ahalia Women and Childern Hospital EVCS - GO EC', 'Palakkad Ahalia Women and Childern Hospital EVCS - GO EC', 'Palakkad Ahalia Women and Childern Hospital EVCS - GO EC, Elappully, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0995d06e-f0d8-5bb1-b150-3cfc05a75d27', 'e881e8d4-e7a2-5338-8616-c2c6d4c12ca4', 'Palakkad Ahalia Women and Childern Hospital EVCS - GO EC', 'Palakkad Ahalia Women and Childern Hospital EVCS - GO EC, Elappully, Kerala, India', 10.79730859, 76.82754081, 'India EV Network License', 'LIC-IN-ST711', 500.0, 30.0, true, 'Elappully', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hospital)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0995d06e-f0d8-5bb1-b150-3cfc05a75d27';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7266d578-eebd-5e86-8dfb-197e20ea17d3', '0995d06e-f0d8-5bb1-b150-3cfc05a75d27', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e86e2c6f-5dcd-5bff-a098-e91be0d42baa', '0995d06e-f0d8-5bb1-b150-3cfc05a75d27', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 712: Palakkad Ahalia Eye Hospital EVCS - GO EC (Elappully, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('846165ea-b04e-5231-ac13-3cbd8c086f91', '00000000-0000-0000-0000-000000000000', 'st712@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st712@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('846165ea-b04e-5231-ac13-3cbd8c086f91', '846165ea-b04e-5231-ac13-3cbd8c086f91', '{"sub": "846165ea-b04e-5231-ac13-3cbd8c086f91", "email": "st712@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '846165ea-b04e-5231-ac13-3cbd8c086f91')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('846165ea-b04e-5231-ac13-3cbd8c086f91', 'admin', 'st712@boss.com', 'Admin Palakkad Ahalia Eye Hospital EVCS - GO EC', 'Palakkad Ahalia Eye Hospital EVCS - GO EC', 'Palakkad Ahalia Eye Hospital EVCS - GO EC, Elappully, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ed54ac1a-6b31-5872-b06f-ace8dbec43e3', '846165ea-b04e-5231-ac13-3cbd8c086f91', 'Palakkad Ahalia Eye Hospital EVCS - GO EC', 'Palakkad Ahalia Eye Hospital EVCS - GO EC, Elappully, Kerala, India', 10.79348727, 76.82652951, 'India EV Network License', 'LIC-IN-ST712', 500.0, 30.0, true, 'Elappully', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hospital)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ed54ac1a-6b31-5872-b06f-ace8dbec43e3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('41f31bed-1370-58f7-bd41-f87e60c0199b', 'ed54ac1a-6b31-5872-b06f-ace8dbec43e3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5c308a6b-897d-5163-8266-37f48e449573', 'ed54ac1a-6b31-5872-b06f-ace8dbec43e3', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 713: Palakkad Ahalia Food Point EVCS - GO EC (Elappully, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf45f4d7-5cf2-5d6b-a985-e6760afbde09', '00000000-0000-0000-0000-000000000000', 'st713@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st713@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf45f4d7-5cf2-5d6b-a985-e6760afbde09', 'cf45f4d7-5cf2-5d6b-a985-e6760afbde09', '{"sub": "cf45f4d7-5cf2-5d6b-a985-e6760afbde09", "email": "st713@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf45f4d7-5cf2-5d6b-a985-e6760afbde09')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf45f4d7-5cf2-5d6b-a985-e6760afbde09', 'admin', 'st713@boss.com', 'Admin Palakkad Ahalia Food Point EVCS - GO EC', 'Palakkad Ahalia Food Point EVCS - GO EC', 'Palakkad Ahalia Food Point EVCS - GO EC, Elappully, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8e588039-6bd9-5e6d-9fc5-68c9e50e3036', 'cf45f4d7-5cf2-5d6b-a985-e6760afbde09', 'Palakkad Ahalia Food Point EVCS - GO EC', 'Palakkad Ahalia Food Point EVCS - GO EC, Elappully, Kerala, India', 10.79203226, 76.82834712, 'India EV Network License', 'LIC-IN-ST713', 500.0, 30.0, true, 'Elappully', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8e588039-6bd9-5e6d-9fc5-68c9e50e3036';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b4d760b4-2e27-5f49-afca-90b3e7b790ea', '8e588039-6bd9-5e6d-9fc5-68c9e50e3036', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('aa9d553f-a20b-5c45-a1b8-118360b6853a', '8e588039-6bd9-5e6d-9fc5-68c9e50e3036', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 714: Ahalia Walayar - GO EC (Walayar, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7142a764-3adf-5c44-a50e-81d5654708bd', '00000000-0000-0000-0000-000000000000', 'st714@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st714@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7142a764-3adf-5c44-a50e-81d5654708bd', '7142a764-3adf-5c44-a50e-81d5654708bd', '{"sub": "7142a764-3adf-5c44-a50e-81d5654708bd", "email": "st714@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7142a764-3adf-5c44-a50e-81d5654708bd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7142a764-3adf-5c44-a50e-81d5654708bd', 'admin', 'st714@boss.com', 'Admin Ahalia Walayar - GO EC', 'Ahalia Walayar - GO EC', 'Ahalia Walayar - GO EC, Walayar, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('de3edefe-e00c-5dfa-81c9-21b62fedcca6', '7142a764-3adf-5c44-a50e-81d5654708bd', 'Ahalia Walayar - GO EC', 'Ahalia Walayar - GO EC, Walayar, Kerala, India', 10.82659305, 76.82605307, 'India EV Network License', 'LIC-IN-ST714', 500.0, 30.0, true, 'Walayar', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'de3edefe-e00c-5dfa-81c9-21b62fedcca6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fcb5ed6f-7375-5ff5-96f5-c9b96bcee9c4', 'de3edefe-e00c-5dfa-81c9-21b62fedcca6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3f9c6544-f099-5411-b2f7-f1e172fbd5e0', 'de3edefe-e00c-5dfa-81c9-21b62fedcca6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 715: Le Sky Dine EVCS - GO EC (Palakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('94251361-75a6-5be2-a6d1-e014438e1358', '00000000-0000-0000-0000-000000000000', 'st715@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st715@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('94251361-75a6-5be2-a6d1-e014438e1358', '94251361-75a6-5be2-a6d1-e014438e1358', '{"sub": "94251361-75a6-5be2-a6d1-e014438e1358", "email": "st715@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '94251361-75a6-5be2-a6d1-e014438e1358')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('94251361-75a6-5be2-a6d1-e014438e1358', 'admin', 'st715@boss.com', 'Admin Le Sky Dine EVCS - GO EC', 'Le Sky Dine EVCS - GO EC', 'Le Sky Dine EVCS - GO EC, Palakkad, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('de98d7c2-0aaa-5240-a20e-315df2472c52', '94251361-75a6-5be2-a6d1-e014438e1358', 'Le Sky Dine EVCS - GO EC', 'Le Sky Dine EVCS - GO EC, Palakkad, Kerala, India', 10.77395725, 76.69819741, 'India EV Network License', 'LIC-IN-ST715', 500.0, 30.0, true, 'Palakkad', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'de98d7c2-0aaa-5240-a20e-315df2472c52';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a4fccb3e-dbca-5bae-9f42-80ad1a174ae5', 'de98d7c2-0aaa-5240-a20e-315df2472c52', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('635f6cd8-5cd0-5375-8d5f-d3f8339cfef4', 'de98d7c2-0aaa-5240-a20e-315df2472c52', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 716: Doctor Green EVCS - GO EC (Alathur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e68965eb-22b2-5345-a874-6352c35699a9', '00000000-0000-0000-0000-000000000000', 'st716@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st716@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e68965eb-22b2-5345-a874-6352c35699a9', 'e68965eb-22b2-5345-a874-6352c35699a9', '{"sub": "e68965eb-22b2-5345-a874-6352c35699a9", "email": "st716@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e68965eb-22b2-5345-a874-6352c35699a9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e68965eb-22b2-5345-a874-6352c35699a9', 'admin', 'st716@boss.com', 'Admin Doctor Green EVCS - GO EC', 'Doctor Green EVCS - GO EC', 'Doctor Green EVCS - GO EC, Alathur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('68673bc0-0629-565b-8cdc-96c474e65874', 'e68965eb-22b2-5345-a874-6352c35699a9', 'Doctor Green EVCS - GO EC', 'Doctor Green EVCS - GO EC, Alathur, Kerala, India', 10.64616636, 76.55140239, 'India EV Network License', 'LIC-IN-ST716', 500.0, 30.0, true, 'Alathur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '68673bc0-0629-565b-8cdc-96c474e65874';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1919d7e8-bd24-54a6-aa50-7267845e2ac7', '68673bc0-0629-565b-8cdc-96c474e65874', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a30b583d-3095-5a5b-a251-cfa78b6f7b54', '68673bc0-0629-565b-8cdc-96c474e65874', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 717: Jeevz - GO EC (Vadakkencherry, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f7a03e61-96d7-5ef0-b3ac-2623468f8192', '00000000-0000-0000-0000-000000000000', 'st717@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st717@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f7a03e61-96d7-5ef0-b3ac-2623468f8192', 'f7a03e61-96d7-5ef0-b3ac-2623468f8192', '{"sub": "f7a03e61-96d7-5ef0-b3ac-2623468f8192", "email": "st717@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f7a03e61-96d7-5ef0-b3ac-2623468f8192')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f7a03e61-96d7-5ef0-b3ac-2623468f8192', 'admin', 'st717@boss.com', 'Admin Jeevz - GO EC', 'Jeevz - GO EC', 'Jeevz - GO EC, Vadakkencherry, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('301122dd-de9f-52a5-87f3-7ef40ef5c74f', 'f7a03e61-96d7-5ef0-b3ac-2623468f8192', 'Jeevz - GO EC', 'Jeevz - GO EC, Vadakkencherry, Kerala, India', 10.59323903, 76.48253527, 'India EV Network License', 'LIC-IN-ST717', 500.0, 30.0, true, 'Vadakkencherry', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '301122dd-de9f-52a5-87f3-7ef40ef5c74f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3679c4e5-73bd-59c5-8d2e-7a4f62f3f549', '301122dd-de9f-52a5-87f3-7ef40ef5c74f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4dc363d7-8df9-5250-9cb2-36dc03e3d438', '301122dd-de9f-52a5-87f3-7ef40ef5c74f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 718: Sanjeevani Green - GO EC (Thiruvilwamala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('afa4ca22-ed2c-514c-96dd-f41ce7518748', '00000000-0000-0000-0000-000000000000', 'st718@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st718@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('afa4ca22-ed2c-514c-96dd-f41ce7518748', 'afa4ca22-ed2c-514c-96dd-f41ce7518748', '{"sub": "afa4ca22-ed2c-514c-96dd-f41ce7518748", "email": "st718@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'afa4ca22-ed2c-514c-96dd-f41ce7518748')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('afa4ca22-ed2c-514c-96dd-f41ce7518748', 'admin', 'st718@boss.com', 'Admin Sanjeevani Green - GO EC', 'Sanjeevani Green - GO EC', 'Sanjeevani Green - GO EC, Thiruvilwamala, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5036433d-b800-5a73-af4c-518187d58614', 'afa4ca22-ed2c-514c-96dd-f41ce7518748', 'Sanjeevani Green - GO EC', 'Sanjeevani Green - GO EC, Thiruvilwamala, Kerala, India', 10.71002171, 76.42879294, 'India EV Network License', 'LIC-IN-ST718', 500.0, 30.0, true, 'Thiruvilwamala', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5036433d-b800-5a73-af4c-518187d58614';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('82e3ad9e-4e5c-5bad-b443-91458928f534', '5036433d-b800-5a73-af4c-518187d58614', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bbcf2df7-455c-5546-8e7d-bb3a2575af70', '5036433d-b800-5a73-af4c-518187d58614', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 719: Green Valley - GO EC (Thirissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cc48448a-1cba-5f9d-9161-493f46ab308b', '00000000-0000-0000-0000-000000000000', 'st719@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st719@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cc48448a-1cba-5f9d-9161-493f46ab308b', 'cc48448a-1cba-5f9d-9161-493f46ab308b', '{"sub": "cc48448a-1cba-5f9d-9161-493f46ab308b", "email": "st719@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cc48448a-1cba-5f9d-9161-493f46ab308b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cc48448a-1cba-5f9d-9161-493f46ab308b', 'admin', 'st719@boss.com', 'Admin Green Valley - GO EC', 'Green Valley - GO EC', 'Green Valley - GO EC, Thirissur, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ed31939b-71da-525a-9ffe-9d72054ac7aa', 'cc48448a-1cba-5f9d-9161-493f46ab308b', 'Green Valley - GO EC', 'Green Valley - GO EC, Thirissur, Kerala, India', 10.69271606, 76.26858375, 'India EV Network License', 'LIC-IN-ST719', 500.0, 30.0, true, 'Thirissur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ed31939b-71da-525a-9ffe-9d72054ac7aa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('35924a22-a698-5997-8746-8906758d47ee', 'ed31939b-71da-525a-9ffe-9d72054ac7aa', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d0ca53af-8589-5861-925c-2f5c9110b358', 'ed31939b-71da-525a-9ffe-9d72054ac7aa', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 720: AR Dine - GO EC (Cheruthuruthi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('15536369-9612-5e36-85eb-81e5b3347d51', '00000000-0000-0000-0000-000000000000', 'st720@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st720@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('15536369-9612-5e36-85eb-81e5b3347d51', '15536369-9612-5e36-85eb-81e5b3347d51', '{"sub": "15536369-9612-5e36-85eb-81e5b3347d51", "email": "st720@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '15536369-9612-5e36-85eb-81e5b3347d51')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('15536369-9612-5e36-85eb-81e5b3347d51', 'admin', 'st720@boss.com', 'Admin AR Dine - GO EC', 'AR Dine - GO EC', 'AR Dine - GO EC, Cheruthuruthi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dd180bb0-b86d-543e-b07d-dad647eaa568', '15536369-9612-5e36-85eb-81e5b3347d51', 'AR Dine - GO EC', 'AR Dine - GO EC, Cheruthuruthi, Kerala, India', 10.75038197, 76.2747566, 'India EV Network License', 'LIC-IN-ST720', 500.0, 30.0, true, 'Cheruthuruthi', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dd180bb0-b86d-543e-b07d-dad647eaa568';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('86325ade-9caf-5b24-a00a-3e2d276af270', 'dd180bb0-b86d-543e-b07d-dad647eaa568', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('316d0951-ee7f-5e33-90d5-583026584710', 'dd180bb0-b86d-543e-b07d-dad647eaa568', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 721: EV Super Charging Station (Pattambi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('03eb979f-5f45-5e1c-8392-2b7ac4579d22', '00000000-0000-0000-0000-000000000000', 'st721@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st721@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('03eb979f-5f45-5e1c-8392-2b7ac4579d22', '03eb979f-5f45-5e1c-8392-2b7ac4579d22', '{"sub": "03eb979f-5f45-5e1c-8392-2b7ac4579d22", "email": "st721@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '03eb979f-5f45-5e1c-8392-2b7ac4579d22')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('03eb979f-5f45-5e1c-8392-2b7ac4579d22', 'admin', 'st721@boss.com', 'Admin EV Super Charging Station', 'EV Super Charging Station', 'EV Super Charging Station, Pattambi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f1eef883-6376-5f33-b3ea-3b3b3c84824d', '03eb979f-5f45-5e1c-8392-2b7ac4579d22', 'EV Super Charging Station', 'EV Super Charging Station, Pattambi, Kerala, India', 10.80479517, 76.20815708, 'India EV Network License', 'LIC-IN-ST721', 500.0, 7.4, true, 'Pattambi', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f1eef883-6376-5f33-b3ea-3b3b3c84824d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ee66928b-8467-5779-a32f-fc74d8b73b2f', 'f1eef883-6376-5f33-b3ea-3b3b3c84824d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 722: Pattambi Power Bank - GO EC (Pattambi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5db9650b-9091-543d-888c-0d87826f80d8', '00000000-0000-0000-0000-000000000000', 'st722@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st722@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5db9650b-9091-543d-888c-0d87826f80d8', '5db9650b-9091-543d-888c-0d87826f80d8', '{"sub": "5db9650b-9091-543d-888c-0d87826f80d8", "email": "st722@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5db9650b-9091-543d-888c-0d87826f80d8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5db9650b-9091-543d-888c-0d87826f80d8', 'admin', 'st722@boss.com', 'Admin Pattambi Power Bank - GO EC', 'Pattambi Power Bank - GO EC', 'Pattambi Power Bank - GO EC, Pattambi, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cef280f3-354c-566e-9a1a-576dcdb853a1', '5db9650b-9091-543d-888c-0d87826f80d8', 'Pattambi Power Bank - GO EC', 'Pattambi Power Bank - GO EC, Pattambi, Kerala, India', 10.81106853, 76.1864437, 'India EV Network License', 'LIC-IN-ST722', 500.0, 30.0, true, 'Pattambi', 'Kerala', 2, 'GO EC (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cef280f3-354c-566e-9a1a-576dcdb853a1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('24a5f024-4fb8-5210-befa-0801e602c284', 'cef280f3-354c-566e-9a1a-576dcdb853a1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('63176757-afa8-51f4-807d-80d48184834d', 'cef280f3-354c-566e-9a1a-576dcdb853a1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 723: New Kerala Hotel EVCS - GO EC (Nhangattiri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fc260ce2-a7e4-5bbd-a003-769850986dca', '00000000-0000-0000-0000-000000000000', 'st723@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st723@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fc260ce2-a7e4-5bbd-a003-769850986dca', 'fc260ce2-a7e4-5bbd-a003-769850986dca', '{"sub": "fc260ce2-a7e4-5bbd-a003-769850986dca", "email": "st723@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fc260ce2-a7e4-5bbd-a003-769850986dca')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fc260ce2-a7e4-5bbd-a003-769850986dca', 'admin', 'st723@boss.com', 'Admin New Kerala Hotel EVCS - GO EC', 'New Kerala Hotel EVCS - GO EC', 'New Kerala Hotel EVCS - GO EC, Nhangattiri, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d0d0b6a0-51bb-5232-bad7-83d5c69cbc06', 'fc260ce2-a7e4-5bbd-a003-769850986dca', 'New Kerala Hotel EVCS - GO EC', 'New Kerala Hotel EVCS - GO EC, Nhangattiri, Kerala, India', 10.78488099, 76.17067627, 'India EV Network License', 'LIC-IN-ST723', 500.0, 30.0, true, 'Nhangattiri', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd0d0b6a0-51bb-5232-bad7-83d5c69cbc06';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1acb8108-45a7-58be-ab2d-bb858fea1700', 'd0d0b6a0-51bb-5232-bad7-83d5c69cbc06', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f63adff1-bb72-5cb2-96e5-ae2cf6fc4d1c', 'd0d0b6a0-51bb-5232-bad7-83d5c69cbc06', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 724: Oasis EV Super Charging Station (Mannarkkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('523ec2fc-64c2-542e-9e26-c5bc009f6f27', '00000000-0000-0000-0000-000000000000', 'st724@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st724@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('523ec2fc-64c2-542e-9e26-c5bc009f6f27', '523ec2fc-64c2-542e-9e26-c5bc009f6f27', '{"sub": "523ec2fc-64c2-542e-9e26-c5bc009f6f27", "email": "st724@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '523ec2fc-64c2-542e-9e26-c5bc009f6f27')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('523ec2fc-64c2-542e-9e26-c5bc009f6f27', 'admin', 'st724@boss.com', 'Admin Oasis EV Super Charging Station', 'Oasis EV Super Charging Station', 'Oasis EV Super Charging Station, Mannarkkad, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c16e7363-afb0-5e23-8acf-5dec340c8457', '523ec2fc-64c2-542e-9e26-c5bc009f6f27', 'Oasis EV Super Charging Station', 'Oasis EV Super Charging Station, Mannarkkad, Kerala, India', 10.93355662, 76.5272171, 'India EV Network License', 'LIC-IN-ST724', 500.0, 7.4, true, 'Mannarkkad', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c16e7363-afb0-5e23-8acf-5dec340c8457';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('23037279-3800-5af1-a623-f3f5d76918fa', 'c16e7363-afb0-5e23-8acf-5dec340c8457', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 725: Shalimar EVCS - GO EC (Perinthalmanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f7b36f2f-f6a4-524b-aada-790fdd73f1c6', '00000000-0000-0000-0000-000000000000', 'st725@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st725@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f7b36f2f-f6a4-524b-aada-790fdd73f1c6', 'f7b36f2f-f6a4-524b-aada-790fdd73f1c6', '{"sub": "f7b36f2f-f6a4-524b-aada-790fdd73f1c6", "email": "st725@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f7b36f2f-f6a4-524b-aada-790fdd73f1c6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f7b36f2f-f6a4-524b-aada-790fdd73f1c6', 'admin', 'st725@boss.com', 'Admin Shalimar EVCS - GO EC', 'Shalimar EVCS - GO EC', 'Shalimar EVCS - GO EC, Perinthalmanna, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b7d38887-fa5f-59fd-9bc3-661b52a5d6fe', 'f7b36f2f-f6a4-524b-aada-790fdd73f1c6', 'Shalimar EVCS - GO EC', 'Shalimar EVCS - GO EC, Perinthalmanna, Kerala, India', 10.96529678, 76.28389833, 'India EV Network License', 'LIC-IN-ST725', 500.0, 30.0, true, 'Perinthalmanna', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b7d38887-fa5f-59fd-9bc3-661b52a5d6fe';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1999d28c-bac1-5923-b44f-39164f5cce48', 'b7d38887-fa5f-59fd-9bc3-661b52a5d6fe', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b4038544-47cb-544c-a43a-0826ac2226e6', 'b7d38887-fa5f-59fd-9bc3-661b52a5d6fe', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 726: Green Zone EVCS - GO EC (Valanchery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('388abd95-a261-598b-b0d5-4dbaf0e89a57', '00000000-0000-0000-0000-000000000000', 'st726@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st726@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('388abd95-a261-598b-b0d5-4dbaf0e89a57', '388abd95-a261-598b-b0d5-4dbaf0e89a57', '{"sub": "388abd95-a261-598b-b0d5-4dbaf0e89a57", "email": "st726@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '388abd95-a261-598b-b0d5-4dbaf0e89a57')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('388abd95-a261-598b-b0d5-4dbaf0e89a57', 'admin', 'st726@boss.com', 'Admin Green Zone EVCS - GO EC', 'Green Zone EVCS - GO EC', 'Green Zone EVCS - GO EC, Valanchery, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bfc86121-3d66-5c86-80f0-3f1bab9e21b9', '388abd95-a261-598b-b0d5-4dbaf0e89a57', 'Green Zone EVCS - GO EC', 'Green Zone EVCS - GO EC, Valanchery, Kerala, India', 10.87341308, 76.06245823, 'India EV Network License', 'LIC-IN-ST726', 500.0, 30.0, true, 'Valanchery', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bfc86121-3d66-5c86-80f0-3f1bab9e21b9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eb293b44-99ef-5b8e-a030-eff089b3dc73', 'bfc86121-3d66-5c86-80f0-3f1bab9e21b9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ad1f5335-6503-5d54-b3c6-f6e7098dd4d8', 'bfc86121-3d66-5c86-80f0-3f1bab9e21b9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 727: Environ EVCS (Changaramkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fa152efd-045e-57be-bafb-acde38bd812d', '00000000-0000-0000-0000-000000000000', 'st727@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st727@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fa152efd-045e-57be-bafb-acde38bd812d', 'fa152efd-045e-57be-bafb-acde38bd812d', '{"sub": "fa152efd-045e-57be-bafb-acde38bd812d", "email": "st727@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fa152efd-045e-57be-bafb-acde38bd812d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fa152efd-045e-57be-bafb-acde38bd812d', 'admin', 'st727@boss.com', 'Admin Environ EVCS', 'Environ EVCS', 'Environ EVCS, Changaramkulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('64e70883-69bd-5939-9d62-ec1e5e3d14d4', 'fa152efd-045e-57be-bafb-acde38bd812d', 'Environ EVCS', 'Environ EVCS, Changaramkulam, Kerala, India', 10.73956943, 76.02927251, 'India EV Network License', 'LIC-IN-ST727', 500.0, 7.4, true, 'Changaramkulam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '64e70883-69bd-5939-9d62-ec1e5e3d14d4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cbaac2ab-5dfa-580b-b1d0-892bd855eb9f', '64e70883-69bd-5939-9d62-ec1e5e3d14d4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 728: CG Cafe EVCS - GO EC (Pandikkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9192fde8-5e44-57dc-9101-41620ac092b5', '00000000-0000-0000-0000-000000000000', 'st728@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st728@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9192fde8-5e44-57dc-9101-41620ac092b5', '9192fde8-5e44-57dc-9101-41620ac092b5', '{"sub": "9192fde8-5e44-57dc-9101-41620ac092b5", "email": "st728@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9192fde8-5e44-57dc-9101-41620ac092b5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9192fde8-5e44-57dc-9101-41620ac092b5', 'admin', 'st728@boss.com', 'Admin CG Cafe EVCS - GO EC', 'CG Cafe EVCS - GO EC', 'CG Cafe EVCS - GO EC, Pandikkad, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b355d81c-d9f0-5dc9-9adc-d6c4edea585e', '9192fde8-5e44-57dc-9101-41620ac092b5', 'CG Cafe EVCS - GO EC', 'CG Cafe EVCS - GO EC, Pandikkad, Kerala, India', 11.13959615, 76.23611346, 'India EV Network License', 'LIC-IN-ST728', 500.0, 30.0, true, 'Pandikkad', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b355d81c-d9f0-5dc9-9adc-d6c4edea585e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4f7ababf-e893-58dc-a331-d7ba1108b1ac', 'b355d81c-d9f0-5dc9-9adc-d6c4edea585e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c7ab0155-d5e8-573d-bde5-1ecc0e222125', 'b355d81c-d9f0-5dc9-9adc-d6c4edea585e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 729: Karulai Malayora Express EVCS - GO EC (Karulai, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('97051449-b292-51b4-a62f-50a94dde2b06', '00000000-0000-0000-0000-000000000000', 'st729@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st729@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('97051449-b292-51b4-a62f-50a94dde2b06', '97051449-b292-51b4-a62f-50a94dde2b06', '{"sub": "97051449-b292-51b4-a62f-50a94dde2b06", "email": "st729@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '97051449-b292-51b4-a62f-50a94dde2b06')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('97051449-b292-51b4-a62f-50a94dde2b06', 'admin', 'st729@boss.com', 'Admin Karulai Malayora Express EVCS - GO EC', 'Karulai Malayora Express EVCS - GO EC', 'Karulai Malayora Express EVCS - GO EC, Karulai, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2989971f-073d-596d-92ec-01e9ee35f9cd', '97051449-b292-51b4-a62f-50a94dde2b06', 'Karulai Malayora Express EVCS - GO EC', 'Karulai Malayora Express EVCS - GO EC, Karulai, Kerala, India', 11.28804948, 76.29798171, 'India EV Network License', 'LIC-IN-ST729', 500.0, 30.0, true, 'Karulai', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2989971f-073d-596d-92ec-01e9ee35f9cd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c6ba0eec-5357-57f8-b1f4-544c6b2ec0e4', '2989971f-073d-596d-92ec-01e9ee35f9cd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('afcbdf16-d133-599c-b177-4e8674ac03ca', '2989971f-073d-596d-92ec-01e9ee35f9cd', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 730: Jam Joom Super Market - GO EC (Nilambur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e04cf52c-6d69-5b6c-8c3c-dfe03a2a627a', '00000000-0000-0000-0000-000000000000', 'st730@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st730@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e04cf52c-6d69-5b6c-8c3c-dfe03a2a627a', 'e04cf52c-6d69-5b6c-8c3c-dfe03a2a627a', '{"sub": "e04cf52c-6d69-5b6c-8c3c-dfe03a2a627a", "email": "st730@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e04cf52c-6d69-5b6c-8c3c-dfe03a2a627a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e04cf52c-6d69-5b6c-8c3c-dfe03a2a627a', 'admin', 'st730@boss.com', 'Admin Jam Joom Super Market - GO EC', 'Jam Joom Super Market - GO EC', 'Jam Joom Super Market - GO EC, Nilambur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('321439e8-765e-5019-ae10-ec04f1dcc509', 'e04cf52c-6d69-5b6c-8c3c-dfe03a2a627a', 'Jam Joom Super Market - GO EC', 'Jam Joom Super Market - GO EC, Nilambur, Kerala, India', 11.28668073, 76.23926379, 'India EV Network License', 'LIC-IN-ST730', 500.0, 30.0, true, 'Nilambur', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '321439e8-765e-5019-ae10-ec04f1dcc509';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0c46ecec-0ecd-514f-a3fc-ab6d6d7a3f0c', '321439e8-765e-5019-ae10-ec04f1dcc509', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8a8dbba0-80dc-5bdb-8160-818dd88dbaf3', '321439e8-765e-5019-ae10-ec04f1dcc509', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 731: ABS Motors - GO EC (Nilambur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('94590fbe-ad64-5e67-b11b-caf484eac0c0', '00000000-0000-0000-0000-000000000000', 'st731@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st731@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('94590fbe-ad64-5e67-b11b-caf484eac0c0', '94590fbe-ad64-5e67-b11b-caf484eac0c0', '{"sub": "94590fbe-ad64-5e67-b11b-caf484eac0c0", "email": "st731@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '94590fbe-ad64-5e67-b11b-caf484eac0c0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('94590fbe-ad64-5e67-b11b-caf484eac0c0', 'admin', 'st731@boss.com', 'Admin ABS Motors - GO EC', 'ABS Motors - GO EC', 'ABS Motors - GO EC, Nilambur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1bf49ca6-649b-5ec2-a819-c52138dd88b0', '94590fbe-ad64-5e67-b11b-caf484eac0c0', 'ABS Motors - GO EC', 'ABS Motors - GO EC, Nilambur, Kerala, India', 11.25364726, 76.2019012, 'India EV Network License', 'LIC-IN-ST731', 500.0, 30.0, true, 'Nilambur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1bf49ca6-649b-5ec2-a819-c52138dd88b0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2338c4fc-467b-5377-a561-9d20fb89fd0e', '1bf49ca6-649b-5ec2-a819-c52138dd88b0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d016325b-e9ae-5772-93f4-a6a902216b22', '1bf49ca6-649b-5ec2-a819-c52138dd88b0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 732: VP Mall EVCS - GO EC (Manjeri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c20f73c1-7875-51ce-b8b7-142058fd5abe', '00000000-0000-0000-0000-000000000000', 'st732@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st732@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c20f73c1-7875-51ce-b8b7-142058fd5abe', 'c20f73c1-7875-51ce-b8b7-142058fd5abe', '{"sub": "c20f73c1-7875-51ce-b8b7-142058fd5abe", "email": "st732@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c20f73c1-7875-51ce-b8b7-142058fd5abe')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c20f73c1-7875-51ce-b8b7-142058fd5abe', 'admin', 'st732@boss.com', 'Admin VP Mall EVCS - GO EC', 'VP Mall EVCS - GO EC', 'VP Mall EVCS - GO EC, Manjeri, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8a316482-7c12-53fc-bc8f-aa763779dc1f', 'c20f73c1-7875-51ce-b8b7-142058fd5abe', 'VP Mall EVCS - GO EC', 'VP Mall EVCS - GO EC, Manjeri, Kerala, India', 11.12891582, 76.11539461, 'India EV Network License', 'LIC-IN-ST732', 500.0, 30.0, true, 'Manjeri', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8a316482-7c12-53fc-bc8f-aa763779dc1f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fbbc24c2-0d87-57dd-b87a-19c130bb5ee6', '8a316482-7c12-53fc-bc8f-aa763779dc1f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c852914b-4a19-5431-8e66-24e7dce3763e', '8a316482-7c12-53fc-bc8f-aa763779dc1f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 733: Jam Joom EV Charging Station - GO EC (Malappuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f49b9bd1-fe6e-56d4-aa26-72fe34f4b6cc', '00000000-0000-0000-0000-000000000000', 'st733@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st733@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f49b9bd1-fe6e-56d4-aa26-72fe34f4b6cc', 'f49b9bd1-fe6e-56d4-aa26-72fe34f4b6cc', '{"sub": "f49b9bd1-fe6e-56d4-aa26-72fe34f4b6cc", "email": "st733@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f49b9bd1-fe6e-56d4-aa26-72fe34f4b6cc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f49b9bd1-fe6e-56d4-aa26-72fe34f4b6cc', 'admin', 'st733@boss.com', 'Admin Jam Joom EV Charging Station - GO EC', 'Jam Joom EV Charging Station - GO EC', 'Jam Joom EV Charging Station - GO EC, Malappuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6e2ea20e-cc10-5d36-a072-8dcd7ed18b88', 'f49b9bd1-fe6e-56d4-aa26-72fe34f4b6cc', 'Jam Joom EV Charging Station - GO EC', 'Jam Joom EV Charging Station - GO EC, Malappuram, Kerala, India', 11.04318059, 76.08430156, 'India EV Network License', 'LIC-IN-ST733', 500.0, 30.0, true, 'Malappuram', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6e2ea20e-cc10-5d36-a072-8dcd7ed18b88';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1be97956-7974-5ce6-975c-d226a231d2fb', '6e2ea20e-cc10-5d36-a072-8dcd7ed18b88', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0d140454-b2c1-5aaa-9334-dfce82f8758c', '6e2ea20e-cc10-5d36-a072-8dcd7ed18b88', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 734: HIQ Highway Market - GO EC (Venniyour, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e7c5644d-a7eb-5353-aebc-8f18c04247e8', '00000000-0000-0000-0000-000000000000', 'st734@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st734@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e7c5644d-a7eb-5353-aebc-8f18c04247e8', 'e7c5644d-a7eb-5353-aebc-8f18c04247e8', '{"sub": "e7c5644d-a7eb-5353-aebc-8f18c04247e8", "email": "st734@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e7c5644d-a7eb-5353-aebc-8f18c04247e8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e7c5644d-a7eb-5353-aebc-8f18c04247e8', 'admin', 'st734@boss.com', 'Admin HIQ Highway Market - GO EC', 'HIQ Highway Market - GO EC', 'HIQ Highway Market - GO EC, Venniyour, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('787d9b78-2385-57c1-a89d-d2e41229e187', 'e7c5644d-a7eb-5353-aebc-8f18c04247e8', 'HIQ Highway Market - GO EC', 'HIQ Highway Market - GO EC, Venniyour, Kerala, India', 11.02117549, 75.94812609, 'India EV Network License', 'LIC-IN-ST734', 500.0, 30.0, true, 'Venniyour', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '787d9b78-2385-57c1-a89d-d2e41229e187';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5c5523a0-212f-58e3-85a5-ac0d8b13e6d0', '787d9b78-2385-57c1-a89d-d2e41229e187', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5e23531-0bb0-5336-8a07-df5aaf796453', '787d9b78-2385-57c1-a89d-d2e41229e187', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 735: Chargify EV Super Charging Station (Malappuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3a5ad242-be29-5b3f-9521-072b0acbb241', '00000000-0000-0000-0000-000000000000', 'st735@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st735@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3a5ad242-be29-5b3f-9521-072b0acbb241', '3a5ad242-be29-5b3f-9521-072b0acbb241', '{"sub": "3a5ad242-be29-5b3f-9521-072b0acbb241", "email": "st735@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3a5ad242-be29-5b3f-9521-072b0acbb241')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3a5ad242-be29-5b3f-9521-072b0acbb241', 'admin', 'st735@boss.com', 'Admin Chargify EV Super Charging Station', 'Chargify EV Super Charging Station', 'Chargify EV Super Charging Station, Malappuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('64b297c7-d1d6-51ac-a7a6-c311d7d15f0c', '3a5ad242-be29-5b3f-9521-072b0acbb241', 'Chargify EV Super Charging Station', 'Chargify EV Super Charging Station, Malappuram, Kerala, India', 11.07841705, 75.90276392, 'India EV Network License', 'LIC-IN-ST735', 500.0, 7.4, true, 'Malappuram', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '64b297c7-d1d6-51ac-a7a6-c311d7d15f0c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8023eddc-b008-5e80-aa59-ac15791e5446', '64b297c7-d1d6-51ac-a7a6-c311d7d15f0c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 736: Reliance Fresh EVCS (Kozhikode, Keral)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f9dbad4e-3481-596c-bf9f-fb161bdd3a1b', '00000000-0000-0000-0000-000000000000', 'st736@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st736@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f9dbad4e-3481-596c-bf9f-fb161bdd3a1b', 'f9dbad4e-3481-596c-bf9f-fb161bdd3a1b', '{"sub": "f9dbad4e-3481-596c-bf9f-fb161bdd3a1b", "email": "st736@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f9dbad4e-3481-596c-bf9f-fb161bdd3a1b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f9dbad4e-3481-596c-bf9f-fb161bdd3a1b', 'admin', 'st736@boss.com', 'Admin Reliance Fresh EVCS', 'Reliance Fresh EVCS', 'Reliance Fresh EVCS, Kozhikode, Keral, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6a2ec2e0-6c25-56c8-824a-e1450f55e506', 'f9dbad4e-3481-596c-bf9f-fb161bdd3a1b', 'Reliance Fresh EVCS', 'Reliance Fresh EVCS, Kozhikode, Keral, India', 11.23473742, 75.84670659, 'India EV Network License', 'LIC-IN-ST736', 500.0, 7.4, true, 'Kozhikode', 'Keral', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6a2ec2e0-6c25-56c8-824a-e1450f55e506';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('03977524-4aa0-5481-8d99-b41ea0441845', '6a2ec2e0-6c25-56c8-824a-e1450f55e506', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 737: Top Dines Hotel - GO EC (Muthanga, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f4ab17cd-88b3-5365-8c21-a8661607ad1a', '00000000-0000-0000-0000-000000000000', 'st737@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st737@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f4ab17cd-88b3-5365-8c21-a8661607ad1a', 'f4ab17cd-88b3-5365-8c21-a8661607ad1a', '{"sub": "f4ab17cd-88b3-5365-8c21-a8661607ad1a", "email": "st737@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f4ab17cd-88b3-5365-8c21-a8661607ad1a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f4ab17cd-88b3-5365-8c21-a8661607ad1a', 'admin', 'st737@boss.com', 'Admin Top Dines Hotel - GO EC', 'Top Dines Hotel - GO EC', 'Top Dines Hotel - GO EC, Muthanga, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('24b09de2-3bac-5eae-9bce-500c1f29035e', 'f4ab17cd-88b3-5365-8c21-a8661607ad1a', 'Top Dines Hotel - GO EC', 'Top Dines Hotel - GO EC, Muthanga, Kerala, India', 11.67080199, 76.36101966, 'India EV Network License', 'LIC-IN-ST737', 500.0, 30.0, true, 'Muthanga', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '24b09de2-3bac-5eae-9bce-500c1f29035e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8bf9dbc8-4f3c-5786-84ca-03ec149c83b9', '24b09de2-3bac-5eae-9bce-500c1f29035e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3a3e582b-25f0-56a1-bdb2-678920b07ce7', '24b09de2-3bac-5eae-9bce-500c1f29035e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 738: Cafe Manoila - GO EC (Kalpetta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9c862d19-788b-5d2b-aea7-da6f2f5303cc', '00000000-0000-0000-0000-000000000000', 'st738@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st738@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9c862d19-788b-5d2b-aea7-da6f2f5303cc', '9c862d19-788b-5d2b-aea7-da6f2f5303cc', '{"sub": "9c862d19-788b-5d2b-aea7-da6f2f5303cc", "email": "st738@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9c862d19-788b-5d2b-aea7-da6f2f5303cc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9c862d19-788b-5d2b-aea7-da6f2f5303cc', 'admin', 'st738@boss.com', 'Admin Cafe Manoila - GO EC', 'Cafe Manoila - GO EC', 'Cafe Manoila - GO EC, Kalpetta, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3258064a-3062-58c0-b23f-5518e502992d', '9c862d19-788b-5d2b-aea7-da6f2f5303cc', 'Cafe Manoila - GO EC', 'Cafe Manoila - GO EC, Kalpetta, Kerala, India', 11.59777661, 76.08013837, 'India EV Network License', 'LIC-IN-ST738', 500.0, 30.0, true, 'Kalpetta', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3258064a-3062-58c0-b23f-5518e502992d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1c4223f4-1425-5438-8ca1-cd1179632c4e', '3258064a-3062-58c0-b23f-5518e502992d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('53803f63-12d5-5ef0-a422-824af58ee7c2', '3258064a-3062-58c0-b23f-5518e502992d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 739: CGH Wayanad Wild EV Charging Station - GO EC (Lakkidi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('068df3c1-37e5-5b7a-a6d4-91bbca10bd21', '00000000-0000-0000-0000-000000000000', 'st739@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st739@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('068df3c1-37e5-5b7a-a6d4-91bbca10bd21', '068df3c1-37e5-5b7a-a6d4-91bbca10bd21', '{"sub": "068df3c1-37e5-5b7a-a6d4-91bbca10bd21", "email": "st739@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '068df3c1-37e5-5b7a-a6d4-91bbca10bd21')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('068df3c1-37e5-5b7a-a6d4-91bbca10bd21', 'admin', 'st739@boss.com', 'Admin CGH Wayanad Wild EV Charging Station - GO EC', 'CGH Wayanad Wild EV Charging Station - GO EC', 'CGH Wayanad Wild EV Charging Station - GO EC, Lakkidi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1fa5246d-ec69-5fc3-bfcc-ecba0c069c0f', '068df3c1-37e5-5b7a-a6d4-91bbca10bd21', 'CGH Wayanad Wild EV Charging Station - GO EC', 'CGH Wayanad Wild EV Charging Station - GO EC, Lakkidi, Kerala, India', 11.51834425, 76.0212557, 'India EV Network License', 'LIC-IN-ST739', 500.0, 30.0, true, 'Lakkidi', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1fa5246d-ec69-5fc3-bfcc-ecba0c069c0f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ec583649-d1d0-55e9-91b1-a40bdc9f86a9', '1fa5246d-ec69-5fc3-bfcc-ecba0c069c0f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4a2459db-7e07-5d8b-945c-5c5b418d7e59', '1fa5246d-ec69-5fc3-bfcc-ecba0c069c0f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 740: Mall of Mukkom EVCS - GO EC (Mukkom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b55083f9-9467-537d-a5e3-460126eae861', '00000000-0000-0000-0000-000000000000', 'st740@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st740@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b55083f9-9467-537d-a5e3-460126eae861', 'b55083f9-9467-537d-a5e3-460126eae861', '{"sub": "b55083f9-9467-537d-a5e3-460126eae861", "email": "st740@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b55083f9-9467-537d-a5e3-460126eae861')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b55083f9-9467-537d-a5e3-460126eae861', 'admin', 'st740@boss.com', 'Admin Mall of Mukkom EVCS - GO EC', 'Mall of Mukkom EVCS - GO EC', 'Mall of Mukkom EVCS - GO EC, Mukkom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0c9bd570-716d-5838-8563-784c2b322c4e', 'b55083f9-9467-537d-a5e3-460126eae861', 'Mall of Mukkom EVCS - GO EC', 'Mall of Mukkom EVCS - GO EC, Mukkom, Kerala, India', 11.31972723, 75.99551711, 'India EV Network License', 'LIC-IN-ST740', 500.0, 30.0, true, 'Mukkom', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0c9bd570-716d-5838-8563-784c2b322c4e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('569c3080-9b43-506a-91a8-b02a27393de6', '0c9bd570-716d-5838-8563-784c2b322c4e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('938e29fd-9b45-51aa-9c70-7fe66e7a3fd1', '0c9bd570-716d-5838-8563-784c2b322c4e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 741: HOTAG EV Charging Station - GO EC (Thamarassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('02086334-bfb8-5047-845a-4a097415701c', '00000000-0000-0000-0000-000000000000', 'st741@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st741@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('02086334-bfb8-5047-845a-4a097415701c', '02086334-bfb8-5047-845a-4a097415701c', '{"sub": "02086334-bfb8-5047-845a-4a097415701c", "email": "st741@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '02086334-bfb8-5047-845a-4a097415701c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('02086334-bfb8-5047-845a-4a097415701c', 'admin', 'st741@boss.com', 'Admin HOTAG EV Charging Station - GO EC', 'HOTAG EV Charging Station - GO EC', 'HOTAG EV Charging Station - GO EC, Thamarassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('96665d0e-6d0b-5a8f-a226-890e2b1a96a0', '02086334-bfb8-5047-845a-4a097415701c', 'HOTAG EV Charging Station - GO EC', 'HOTAG EV Charging Station - GO EC, Thamarassery, Kerala, India', 11.40469328, 75.92956806, 'India EV Network License', 'LIC-IN-ST741', 500.0, 30.0, true, 'Thamarassery', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '96665d0e-6d0b-5a8f-a226-890e2b1a96a0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('642691e0-2d9f-500b-9878-547a06d6bf4d', '96665d0e-6d0b-5a8f-a226-890e2b1a96a0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d14104ff-740f-57de-9f1d-1d9d8fc0b7a7', '96665d0e-6d0b-5a8f-a226-890e2b1a96a0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 742: Green Amp EVCS - GO EC (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5ef36ee9-0491-5ec5-810a-f618559c2896', '00000000-0000-0000-0000-000000000000', 'st742@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st742@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5ef36ee9-0491-5ec5-810a-f618559c2896', '5ef36ee9-0491-5ec5-810a-f618559c2896', '{"sub": "5ef36ee9-0491-5ec5-810a-f618559c2896", "email": "st742@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5ef36ee9-0491-5ec5-810a-f618559c2896')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5ef36ee9-0491-5ec5-810a-f618559c2896', 'admin', 'st742@boss.com', 'Admin Green Amp EVCS - GO EC', 'Green Amp EVCS - GO EC', 'Green Amp EVCS - GO EC, Kozhikode, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dc037552-0c7c-55bf-a73e-d78e6831b469', '5ef36ee9-0491-5ec5-810a-f618559c2896', 'Green Amp EVCS - GO EC', 'Green Amp EVCS - GO EC, Kozhikode, Kerala, India', 11.25880102, 75.80890435, 'India EV Network License', 'LIC-IN-ST742', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dc037552-0c7c-55bf-a73e-d78e6831b469';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('53dd1aac-79b2-552b-963a-77a1bea46a5f', 'dc037552-0c7c-55bf-a73e-d78e6831b469', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('058be2f9-c7f2-5de5-a9f0-d6b306e3d1b4', 'dc037552-0c7c-55bf-a73e-d78e6831b469', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 743: Calicut Malabar Gold - GO EC (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8b56d5d0-b930-5e61-b589-7640e42b619c', '00000000-0000-0000-0000-000000000000', 'st743@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st743@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8b56d5d0-b930-5e61-b589-7640e42b619c', '8b56d5d0-b930-5e61-b589-7640e42b619c', '{"sub": "8b56d5d0-b930-5e61-b589-7640e42b619c", "email": "st743@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8b56d5d0-b930-5e61-b589-7640e42b619c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8b56d5d0-b930-5e61-b589-7640e42b619c', 'admin', 'st743@boss.com', 'Admin Calicut Malabar Gold - GO EC', 'Calicut Malabar Gold - GO EC', 'Calicut Malabar Gold - GO EC, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('eb7e47c2-dfee-568c-9dc6-adfb79168529', '8b56d5d0-b930-5e61-b589-7640e42b619c', 'Calicut Malabar Gold - GO EC', 'Calicut Malabar Gold - GO EC, Kozhikode, Kerala, India', 11.2578618, 75.7802306, 'India EV Network License', 'LIC-IN-ST743', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'eb7e47c2-dfee-568c-9dc6-adfb79168529';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b8c6a7a6-123b-5d5b-9daf-86e19ba73d65', 'eb7e47c2-dfee-568c-9dc6-adfb79168529', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e4e8b364-2e5c-5cb7-9008-41dbef0f6181', 'eb7e47c2-dfee-568c-9dc6-adfb79168529', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 744: Mandrin Sky - GO EC (Kannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('23a149f5-8dbe-5045-8c31-4a9ac1a50111', '00000000-0000-0000-0000-000000000000', 'st744@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st744@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('23a149f5-8dbe-5045-8c31-4a9ac1a50111', '23a149f5-8dbe-5045-8c31-4a9ac1a50111', '{"sub": "23a149f5-8dbe-5045-8c31-4a9ac1a50111", "email": "st744@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '23a149f5-8dbe-5045-8c31-4a9ac1a50111')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('23a149f5-8dbe-5045-8c31-4a9ac1a50111', 'admin', 'st744@boss.com', 'Admin Mandrin Sky - GO EC', 'Mandrin Sky - GO EC', 'Mandrin Sky - GO EC, Kannur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8f237d82-096d-5351-b55f-caa4b88466ee', '23a149f5-8dbe-5045-8c31-4a9ac1a50111', 'Mandrin Sky - GO EC', 'Mandrin Sky - GO EC, Kannur, Kerala, India', 11.92755972, 75.50047315, 'India EV Network License', 'LIC-IN-ST744', 500.0, 30.0, true, 'Kannur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8f237d82-096d-5351-b55f-caa4b88466ee';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8b4511bc-6716-51b1-a46d-feb2e6606a7b', '8f237d82-096d-5351-b55f-caa4b88466ee', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('91ec9661-6a21-5ca5-87d7-d1138a6b28ac', '8f237d82-096d-5351-b55f-caa4b88466ee', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 745: JSR EVCS - GO EC (Mambaram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('45337d3d-b54a-5cb2-a22f-c85ffa219cee', '00000000-0000-0000-0000-000000000000', 'st745@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st745@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('45337d3d-b54a-5cb2-a22f-c85ffa219cee', '45337d3d-b54a-5cb2-a22f-c85ffa219cee', '{"sub": "45337d3d-b54a-5cb2-a22f-c85ffa219cee", "email": "st745@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '45337d3d-b54a-5cb2-a22f-c85ffa219cee')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('45337d3d-b54a-5cb2-a22f-c85ffa219cee', 'admin', 'st745@boss.com', 'Admin JSR EVCS - GO EC', 'JSR EVCS - GO EC', 'JSR EVCS - GO EC, Mambaram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7418642b-6eb9-5dd2-a1e0-f763b0a116e1', '45337d3d-b54a-5cb2-a22f-c85ffa219cee', 'JSR EVCS - GO EC', 'JSR EVCS - GO EC, Mambaram, Kerala, India', 11.82580205, 75.50895671, 'India EV Network License', 'LIC-IN-ST745', 500.0, 30.0, true, 'Mambaram', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7418642b-6eb9-5dd2-a1e0-f763b0a116e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3ae57ad3-d8ea-5630-ae63-83e3b3608281', '7418642b-6eb9-5dd2-a1e0-f763b0a116e1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6433ba55-acc0-51c9-b2f4-0fc49ba9917a', '7418642b-6eb9-5dd2-a1e0-f763b0a116e1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 746: Kannur H&H (Melechowa, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cc48724b-78c9-57ec-863c-1aa97ddfd76d', '00000000-0000-0000-0000-000000000000', 'st746@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st746@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cc48724b-78c9-57ec-863c-1aa97ddfd76d', 'cc48724b-78c9-57ec-863c-1aa97ddfd76d', '{"sub": "cc48724b-78c9-57ec-863c-1aa97ddfd76d", "email": "st746@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cc48724b-78c9-57ec-863c-1aa97ddfd76d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cc48724b-78c9-57ec-863c-1aa97ddfd76d', 'admin', 'st746@boss.com', 'Admin Kannur H&H', 'Kannur H&H', 'Kannur H&H, Melechowa, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('06aac41a-f885-5f54-a28a-7caadfb33994', 'cc48724b-78c9-57ec-863c-1aa97ddfd76d', 'Kannur H&H', 'Kannur H&H, Melechowa, Kerala, India', 11.8716637, 75.39598586, 'India EV Network License', 'LIC-IN-ST746', 500.0, 7.4, true, 'Melechowa', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '06aac41a-f885-5f54-a28a-7caadfb33994';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('321ef065-4a3b-5519-aa34-8f961d99d0c3', '06aac41a-f885-5f54-a28a-7caadfb33994', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 747: G Mall - GO EC (Kannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('af37d44c-fbcb-5372-bc3a-ab66e8726180', '00000000-0000-0000-0000-000000000000', 'st747@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st747@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('af37d44c-fbcb-5372-bc3a-ab66e8726180', 'af37d44c-fbcb-5372-bc3a-ab66e8726180', '{"sub": "af37d44c-fbcb-5372-bc3a-ab66e8726180", "email": "st747@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'af37d44c-fbcb-5372-bc3a-ab66e8726180')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('af37d44c-fbcb-5372-bc3a-ab66e8726180', 'admin', 'st747@boss.com', 'Admin G Mall - GO EC', 'G Mall - GO EC', 'G Mall - GO EC, Kannur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4cb2c894-0852-5efb-bca9-4b91af72c069', 'af37d44c-fbcb-5372-bc3a-ab66e8726180', 'G Mall - GO EC', 'G Mall - GO EC, Kannur, Kerala, India', 11.88020075, 75.37466479, 'India EV Network License', 'LIC-IN-ST747', 500.0, 30.0, true, 'Kannur', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4cb2c894-0852-5efb-bca9-4b91af72c069';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5311e2b8-adb0-5a11-804e-d7109f59b2b3', '4cb2c894-0852-5efb-bca9-4b91af72c069', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7fccde39-98ee-5434-8268-3e690ed6d486', '4cb2c894-0852-5efb-bca9-4b91af72c069', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 748: Exit 17 - GO EC (Payyannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('088a1b4b-0373-58b8-b7f3-78fad6a36fa3', '00000000-0000-0000-0000-000000000000', 'st748@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st748@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('088a1b4b-0373-58b8-b7f3-78fad6a36fa3', '088a1b4b-0373-58b8-b7f3-78fad6a36fa3', '{"sub": "088a1b4b-0373-58b8-b7f3-78fad6a36fa3", "email": "st748@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '088a1b4b-0373-58b8-b7f3-78fad6a36fa3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('088a1b4b-0373-58b8-b7f3-78fad6a36fa3', 'admin', 'st748@boss.com', 'Admin Exit 17 - GO EC', 'Exit 17 - GO EC', 'Exit 17 - GO EC, Payyannur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5d506ce5-01f6-5e9f-961a-809c0d0e6a02', '088a1b4b-0373-58b8-b7f3-78fad6a36fa3', 'Exit 17 - GO EC', 'Exit 17 - GO EC, Payyannur, Kerala, India', 12.08863773, 75.25264585, 'India EV Network License', 'LIC-IN-ST748', 500.0, 30.0, true, 'Payyannur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5d506ce5-01f6-5e9f-961a-809c0d0e6a02';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7b85efc6-5fa4-5ae9-bf85-6513a264e86d', '5d506ce5-01f6-5e9f-961a-809c0d0e6a02', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('23a16b5d-e41f-56d9-aca6-1c0130cceb9a', '5d506ce5-01f6-5e9f-961a-809c0d0e6a02', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 749: Periya A Star - GO EC (Hosdurg, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a0430e27-9d20-519f-b6a8-e4538ef99c73', '00000000-0000-0000-0000-000000000000', 'st749@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st749@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a0430e27-9d20-519f-b6a8-e4538ef99c73', 'a0430e27-9d20-519f-b6a8-e4538ef99c73', '{"sub": "a0430e27-9d20-519f-b6a8-e4538ef99c73", "email": "st749@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a0430e27-9d20-519f-b6a8-e4538ef99c73')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a0430e27-9d20-519f-b6a8-e4538ef99c73', 'admin', 'st749@boss.com', 'Admin Periya A Star - GO EC', 'Periya A Star - GO EC', 'Periya A Star - GO EC, Hosdurg, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('65e99d2a-7b7c-526d-ad45-1b2e145853c7', 'a0430e27-9d20-519f-b6a8-e4538ef99c73', 'Periya A Star - GO EC', 'Periya A Star - GO EC, Hosdurg, Kerala, India', 12.40580531, 75.09629761, 'India EV Network License', 'LIC-IN-ST749', 500.0, 30.0, true, 'Hosdurg', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '65e99d2a-7b7c-526d-ad45-1b2e145853c7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('33dff9db-3703-54c3-a5d6-010309b39a1c', '65e99d2a-7b7c-526d-ad45-1b2e145853c7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('afc6e1a0-1beb-5b82-8583-8b2bdcf907d2', '65e99d2a-7b7c-526d-ad45-1b2e145853c7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 750: Roshi EVCS (EVOK) - ChargeMOD (Kasaragod, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c1eb68a3-7efa-52c6-87a1-d0368a6a8d46', '00000000-0000-0000-0000-000000000000', 'st750@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st750@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c1eb68a3-7efa-52c6-87a1-d0368a6a8d46', 'c1eb68a3-7efa-52c6-87a1-d0368a6a8d46', '{"sub": "c1eb68a3-7efa-52c6-87a1-d0368a6a8d46", "email": "st750@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c1eb68a3-7efa-52c6-87a1-d0368a6a8d46')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c1eb68a3-7efa-52c6-87a1-d0368a6a8d46', 'admin', 'st750@boss.com', 'Admin Roshi EVCS (EVOK) - ChargeMOD', 'Roshi EVCS (EVOK) - ChargeMOD', 'Roshi EVCS (EVOK) - ChargeMOD, Kasaragod, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('af36a339-ab65-57d7-8998-18c1b3dda629', 'c1eb68a3-7efa-52c6-87a1-d0368a6a8d46', 'Roshi EVCS (EVOK) - ChargeMOD', 'Roshi EVCS (EVOK) - ChargeMOD, Kasaragod, Kerala, India', 12.50597417, 74.98678089, 'India EV Network License', 'LIC-IN-ST750', 500.0, 30.0, true, 'Kasaragod', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'af36a339-ab65-57d7-8998-18c1b3dda629';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('255fe1f2-27ac-5ecb-9f4c-89ddbdbce704', 'af36a339-ab65-57d7-8998-18c1b3dda629', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 751: Kanhangad KSEB EVCS - ChangeMOD (Kanhangad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9a65a740-9d36-5a47-b32f-ec07f233b3b9', '00000000-0000-0000-0000-000000000000', 'st751@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st751@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9a65a740-9d36-5a47-b32f-ec07f233b3b9', '9a65a740-9d36-5a47-b32f-ec07f233b3b9', '{"sub": "9a65a740-9d36-5a47-b32f-ec07f233b3b9", "email": "st751@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9a65a740-9d36-5a47-b32f-ec07f233b3b9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9a65a740-9d36-5a47-b32f-ec07f233b3b9', 'admin', 'st751@boss.com', 'Admin Kanhangad KSEB EVCS - ChangeMOD', 'Kanhangad KSEB EVCS - ChangeMOD', 'Kanhangad KSEB EVCS - ChangeMOD, Kanhangad, Kerala, India', 500.0, 7, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b4517a51-1eab-5e53-806a-028be9d4ea5b', '9a65a740-9d36-5a47-b32f-ec07f233b3b9', 'Kanhangad KSEB EVCS - ChangeMOD', 'Kanhangad KSEB EVCS - ChangeMOD, Kanhangad, Kerala, India', 12.34250549, 75.11266367, 'India EV Network License', 'LIC-IN-ST751', 500.0, 7.4, true, 'Kanhangad', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b4517a51-1eab-5e53-806a-028be9d4ea5b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8349f68d-09c2-5fd8-937d-4413501d2f18', 'b4517a51-1eab-5e53-806a-028be9d4ea5b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 752: Ammas Fast - ChargeMOD (Cheruvathur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('512c660a-777a-59c5-9356-f6de5e8d6067', '00000000-0000-0000-0000-000000000000', 'st752@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st752@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('512c660a-777a-59c5-9356-f6de5e8d6067', '512c660a-777a-59c5-9356-f6de5e8d6067', '{"sub": "512c660a-777a-59c5-9356-f6de5e8d6067", "email": "st752@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '512c660a-777a-59c5-9356-f6de5e8d6067')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('512c660a-777a-59c5-9356-f6de5e8d6067', 'admin', 'st752@boss.com', 'Admin Ammas Fast - ChargeMOD', 'Ammas Fast - ChargeMOD', 'Ammas Fast - ChargeMOD, Cheruvathur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('43366c14-9c40-59de-b9b4-81e1a36f0c12', '512c660a-777a-59c5-9356-f6de5e8d6067', 'Ammas Fast - ChargeMOD', 'Ammas Fast - ChargeMOD, Cheruvathur, Kerala, India', 12.22720023, 75.15911994, 'India EV Network License', 'LIC-IN-ST752', 500.0, 30.0, true, 'Cheruvathur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '43366c14-9c40-59de-b9b4-81e1a36f0c12';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fdab31a1-f8f1-5414-98b3-aa92bea1b1c9', '43366c14-9c40-59de-b9b4-81e1a36f0c12', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 753: Mathil Service Co-Operative Bank EVCS - ChargeMOD (Mathil, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7ed05799-8218-51ab-9a54-f1fbf57d6ab2', '00000000-0000-0000-0000-000000000000', 'st753@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st753@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7ed05799-8218-51ab-9a54-f1fbf57d6ab2', '7ed05799-8218-51ab-9a54-f1fbf57d6ab2', '{"sub": "7ed05799-8218-51ab-9a54-f1fbf57d6ab2", "email": "st753@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7ed05799-8218-51ab-9a54-f1fbf57d6ab2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7ed05799-8218-51ab-9a54-f1fbf57d6ab2', 'admin', 'st753@boss.com', 'Admin Mathil Service Co-Operative Bank EVCS - ChargeMOD', 'Mathil Service Co-Operative Bank EVCS - ChargeMOD', 'Mathil Service Co-Operative Bank EVCS - ChargeMOD, Mathil, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6c35abd1-387a-55dc-bbaa-c3f5d99e0af5', '7ed05799-8218-51ab-9a54-f1fbf57d6ab2', 'Mathil Service Co-Operative Bank EVCS - ChargeMOD', 'Mathil Service Co-Operative Bank EVCS - ChargeMOD, Mathil, Kerala, India', 12.17697015, 75.2467558, 'India EV Network License', 'LIC-IN-ST753', 500.0, 30.0, true, 'Mathil', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6c35abd1-387a-55dc-bbaa-c3f5d99e0af5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9bc5d117-32fb-571f-8a4d-e607e5400343', '6c35abd1-387a-55dc-bbaa-c3f5d99e0af5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 754: EQ Point EVCS - ChargeMOD (Payyannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('198aad29-52aa-518b-92db-0d97eedc6a06', '00000000-0000-0000-0000-000000000000', 'st754@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st754@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('198aad29-52aa-518b-92db-0d97eedc6a06', '198aad29-52aa-518b-92db-0d97eedc6a06', '{"sub": "198aad29-52aa-518b-92db-0d97eedc6a06", "email": "st754@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '198aad29-52aa-518b-92db-0d97eedc6a06')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('198aad29-52aa-518b-92db-0d97eedc6a06', 'admin', 'st754@boss.com', 'Admin EQ Point EVCS - ChargeMOD', 'EQ Point EVCS - ChargeMOD', 'EQ Point EVCS - ChargeMOD, Payyannur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3286feed-724d-5e47-84a2-b6064cea149d', '198aad29-52aa-518b-92db-0d97eedc6a06', 'EQ Point EVCS - ChargeMOD', 'EQ Point EVCS - ChargeMOD, Payyannur, Kerala, India', 12.20776624, 75.27945213, 'India EV Network License', 'LIC-IN-ST754', 500.0, 30.0, true, 'Payyannur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3286feed-724d-5e47-84a2-b6064cea149d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a353cab5-5157-57da-a1b7-d8740d79b72f', '3286feed-724d-5e47-84a2-b6064cea149d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 755: PCR Bank EVCS - ChargeMOD (Bakkalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2a0ed957-3fd7-59f0-8fee-985df7cd4df9', '00000000-0000-0000-0000-000000000000', 'st755@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st755@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2a0ed957-3fd7-59f0-8fee-985df7cd4df9', '2a0ed957-3fd7-59f0-8fee-985df7cd4df9', '{"sub": "2a0ed957-3fd7-59f0-8fee-985df7cd4df9", "email": "st755@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2a0ed957-3fd7-59f0-8fee-985df7cd4df9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2a0ed957-3fd7-59f0-8fee-985df7cd4df9', 'admin', 'st755@boss.com', 'Admin PCR Bank EVCS - ChargeMOD', 'PCR Bank EVCS - ChargeMOD', 'PCR Bank EVCS - ChargeMOD, Bakkalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1806b334-c733-520c-a969-d181ad92edb1', '2a0ed957-3fd7-59f0-8fee-985df7cd4df9', 'PCR Bank EVCS - ChargeMOD', 'PCR Bank EVCS - ChargeMOD, Bakkalam, Kerala, India', 11.99744945, 75.37090753, 'India EV Network License', 'LIC-IN-ST755', 500.0, 30.0, true, 'Bakkalam', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1806b334-c733-520c-a969-d181ad92edb1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eb485c60-780f-518a-9244-e55a29c16e8b', '1806b334-c733-520c-a969-d181ad92edb1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 756: Manjapalam KSEB EVCS - ChargeMOD (Kannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9c7a4152-a322-53b9-a7a0-c7c358d9a221', '00000000-0000-0000-0000-000000000000', 'st756@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st756@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9c7a4152-a322-53b9-a7a0-c7c358d9a221', '9c7a4152-a322-53b9-a7a0-c7c358d9a221', '{"sub": "9c7a4152-a322-53b9-a7a0-c7c358d9a221", "email": "st756@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9c7a4152-a322-53b9-a7a0-c7c358d9a221')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9c7a4152-a322-53b9-a7a0-c7c358d9a221', 'admin', 'st756@boss.com', 'Admin Manjapalam KSEB EVCS - ChargeMOD', 'Manjapalam KSEB EVCS - ChargeMOD', 'Manjapalam KSEB EVCS - ChargeMOD, Kannur, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0dbe1ceb-6a3d-59cd-aa15-98e19cf88448', '9c7a4152-a322-53b9-a7a0-c7c358d9a221', 'Manjapalam KSEB EVCS - ChargeMOD', 'Manjapalam KSEB EVCS - ChargeMOD, Kannur, Kerala, India', 11.87836828, 75.35952615, 'India EV Network License', 'LIC-IN-ST756', 500.0, 30.0, true, 'Kannur', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0dbe1ceb-6a3d-59cd-aa15-98e19cf88448';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0f93a549-6a5e-5903-85db-fd77cfaed416', '0dbe1ceb-6a3d-59cd-aa15-98e19cf88448', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 757: Eastend Hotel and Resorts - ChargeMOD (Munnar, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2fcb9a41-d76b-50da-904c-a01aaaf289fb', '00000000-0000-0000-0000-000000000000', 'st757@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st757@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2fcb9a41-d76b-50da-904c-a01aaaf289fb', '2fcb9a41-d76b-50da-904c-a01aaaf289fb', '{"sub": "2fcb9a41-d76b-50da-904c-a01aaaf289fb", "email": "st757@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2fcb9a41-d76b-50da-904c-a01aaaf289fb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2fcb9a41-d76b-50da-904c-a01aaaf289fb', 'admin', 'st757@boss.com', 'Admin Eastend Hotel and Resorts - ChargeMOD', 'Eastend Hotel and Resorts - ChargeMOD', 'Eastend Hotel and Resorts - ChargeMOD, Munnar, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0e4c49b0-40e6-56ee-be8c-d1d38360ba2c', '2fcb9a41-d76b-50da-904c-a01aaaf289fb', 'Eastend Hotel and Resorts - ChargeMOD', 'Eastend Hotel and Resorts - ChargeMOD, Munnar, Kerala, India', 10.0873794, 77.06169963, 'India EV Network License', 'LIC-IN-ST757', 500.0, 30.0, true, 'Munnar', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0e4c49b0-40e6-56ee-be8c-d1d38360ba2c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1addee32-2ab9-5642-bf30-20c8664d06b9', '0e4c49b0-40e6-56ee-be8c-d1d38360ba2c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 758: Sky Penta EVCS - ChargeMOD (Iritty, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('525b2d1a-b295-584f-b168-63c2f3f325e1', '00000000-0000-0000-0000-000000000000', 'st758@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st758@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('525b2d1a-b295-584f-b168-63c2f3f325e1', '525b2d1a-b295-584f-b168-63c2f3f325e1', '{"sub": "525b2d1a-b295-584f-b168-63c2f3f325e1", "email": "st758@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '525b2d1a-b295-584f-b168-63c2f3f325e1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('525b2d1a-b295-584f-b168-63c2f3f325e1', 'admin', 'st758@boss.com', 'Admin Sky Penta EVCS - ChargeMOD', 'Sky Penta EVCS - ChargeMOD', 'Sky Penta EVCS - ChargeMOD, Iritty, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6cfaf753-24c9-52dd-bf86-06734b928fe8', '525b2d1a-b295-584f-b168-63c2f3f325e1', 'Sky Penta EVCS - ChargeMOD', 'Sky Penta EVCS - ChargeMOD, Iritty, Kerala, India', 11.98556153, 75.67618166, 'India EV Network License', 'LIC-IN-ST758', 500.0, 30.0, true, 'Iritty', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6cfaf753-24c9-52dd-bf86-06734b928fe8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ff9e1334-fbab-5b08-af78-5c3a46f1de55', '6cfaf753-24c9-52dd-bf86-06734b928fe8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 759: Reboost EVCS - ChargeMOD (Panoor, Kannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('04652896-10cc-5b6d-bb6a-7cb53243658d', '00000000-0000-0000-0000-000000000000', 'st759@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st759@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('04652896-10cc-5b6d-bb6a-7cb53243658d', '04652896-10cc-5b6d-bb6a-7cb53243658d', '{"sub": "04652896-10cc-5b6d-bb6a-7cb53243658d", "email": "st759@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '04652896-10cc-5b6d-bb6a-7cb53243658d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('04652896-10cc-5b6d-bb6a-7cb53243658d', 'admin', 'st759@boss.com', 'Admin Reboost EVCS - ChargeMOD', 'Reboost EVCS - ChargeMOD', 'Reboost EVCS - ChargeMOD, Panoor, Kannur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b37d6d7c-9645-5950-9307-005df19bf32d', '04652896-10cc-5b6d-bb6a-7cb53243658d', 'Reboost EVCS - ChargeMOD', 'Reboost EVCS - ChargeMOD, Panoor, Kannur, Kerala, India', 11.75486663, 75.57806506, 'India EV Network License', 'LIC-IN-ST759', 500.0, 30.0, true, 'Panoor, Kannur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b37d6d7c-9645-5950-9307-005df19bf32d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4cbeb8ec-75cd-5e29-ab60-a20dbf24e50e', 'b37d6d7c-9645-5950-9307-005df19bf32d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 760: Mindful EVCS - ChargeMOD (Payyoli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('911ac62f-1285-55d9-8a44-f4f543f07fdc', '00000000-0000-0000-0000-000000000000', 'st760@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st760@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('911ac62f-1285-55d9-8a44-f4f543f07fdc', '911ac62f-1285-55d9-8a44-f4f543f07fdc', '{"sub": "911ac62f-1285-55d9-8a44-f4f543f07fdc", "email": "st760@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '911ac62f-1285-55d9-8a44-f4f543f07fdc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('911ac62f-1285-55d9-8a44-f4f543f07fdc', 'admin', 'st760@boss.com', 'Admin Mindful EVCS - ChargeMOD', 'Mindful EVCS - ChargeMOD', 'Mindful EVCS - ChargeMOD, Payyoli, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9e51b00a-56d5-5760-a447-c095c4f3ee13', '911ac62f-1285-55d9-8a44-f4f543f07fdc', 'Mindful EVCS - ChargeMOD', 'Mindful EVCS - ChargeMOD, Payyoli, Kerala, India', 11.52044492, 75.61798774, 'India EV Network License', 'LIC-IN-ST760', 500.0, 30.0, true, 'Payyoli', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9e51b00a-56d5-5760-a447-c095c4f3ee13';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1026d906-b812-5b3c-b86f-6d0f26734504', '9e51b00a-56d5-5760-a447-c095c4f3ee13', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 761: EVOK Charger - ChargeMOD (Kuttiyady, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('95fb1021-a3c7-5caa-ae47-6b2565d093ec', '00000000-0000-0000-0000-000000000000', 'st761@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st761@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('95fb1021-a3c7-5caa-ae47-6b2565d093ec', '95fb1021-a3c7-5caa-ae47-6b2565d093ec', '{"sub": "95fb1021-a3c7-5caa-ae47-6b2565d093ec", "email": "st761@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '95fb1021-a3c7-5caa-ae47-6b2565d093ec')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('95fb1021-a3c7-5caa-ae47-6b2565d093ec', 'admin', 'st761@boss.com', 'Admin EVOK Charger - ChargeMOD', 'EVOK Charger - ChargeMOD', 'EVOK Charger - ChargeMOD, Kuttiyady, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d068bef6-7f8d-5829-8f2e-990501ddb770', '95fb1021-a3c7-5caa-ae47-6b2565d093ec', 'EVOK Charger - ChargeMOD', 'EVOK Charger - ChargeMOD, Kuttiyady, Kerala, India', 11.64890104, 75.75593648, 'India EV Network License', 'LIC-IN-ST761', 500.0, 30.0, true, 'Kuttiyady', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd068bef6-7f8d-5829-8f2e-990501ddb770';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6480af35-284f-5158-b1a7-e7ed506c1fd1', 'd068bef6-7f8d-5829-8f2e-990501ddb770', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 762: Banasura Sagar KSEB EVCS - ChargeMOD (Padinjarathara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8f503b40-438e-5426-a1bc-7173d9736542', '00000000-0000-0000-0000-000000000000', 'st762@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st762@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8f503b40-438e-5426-a1bc-7173d9736542', '8f503b40-438e-5426-a1bc-7173d9736542', '{"sub": "8f503b40-438e-5426-a1bc-7173d9736542", "email": "st762@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8f503b40-438e-5426-a1bc-7173d9736542')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8f503b40-438e-5426-a1bc-7173d9736542', 'admin', 'st762@boss.com', 'Admin Banasura Sagar KSEB EVCS - ChargeMOD', 'Banasura Sagar KSEB EVCS - ChargeMOD', 'Banasura Sagar KSEB EVCS - ChargeMOD, Padinjarathara, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bae20b45-b4b3-5e3c-85bd-a2a0b5e45bf1', '8f503b40-438e-5426-a1bc-7173d9736542', 'Banasura Sagar KSEB EVCS - ChargeMOD', 'Banasura Sagar KSEB EVCS - ChargeMOD, Padinjarathara, Kerala, India', 11.67292398, 75.95730581, 'India EV Network License', 'LIC-IN-ST762', 500.0, 30.0, true, 'Padinjarathara', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bae20b45-b4b3-5e3c-85bd-a2a0b5e45bf1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fb537f66-1296-5c65-8c0a-e84a398dd456', 'bae20b45-b4b3-5e3c-85bd-a2a0b5e45bf1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 763: Empire Restaurant - ChargeMOD (Tharuvana, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('33d7a82c-9e73-5734-a7d1-38a7f5feaa95', '00000000-0000-0000-0000-000000000000', 'st763@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st763@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('33d7a82c-9e73-5734-a7d1-38a7f5feaa95', '33d7a82c-9e73-5734-a7d1-38a7f5feaa95', '{"sub": "33d7a82c-9e73-5734-a7d1-38a7f5feaa95", "email": "st763@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '33d7a82c-9e73-5734-a7d1-38a7f5feaa95')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('33d7a82c-9e73-5734-a7d1-38a7f5feaa95', 'admin', 'st763@boss.com', 'Admin Empire Restaurant - ChargeMOD', 'Empire Restaurant - ChargeMOD', 'Empire Restaurant - ChargeMOD, Tharuvana, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('37895062-7be1-5bfe-b1c8-07a444ff9144', '33d7a82c-9e73-5734-a7d1-38a7f5feaa95', 'Empire Restaurant - ChargeMOD', 'Empire Restaurant - ChargeMOD, Tharuvana, Kerala, India', 11.73640531, 75.98674423, 'India EV Network License', 'LIC-IN-ST763', 500.0, 30.0, true, 'Tharuvana', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '37895062-7be1-5bfe-b1c8-07a444ff9144';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('694c5831-7f9b-5f93-b510-57e3cf317246', '37895062-7be1-5bfe-b1c8-07a444ff9144', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 764: Hotel Wayanad Square - ChargeMOD (Mananthavady, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('52fb8aad-58f7-5bee-8cfb-4fba203fd357', '00000000-0000-0000-0000-000000000000', 'st764@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st764@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('52fb8aad-58f7-5bee-8cfb-4fba203fd357', '52fb8aad-58f7-5bee-8cfb-4fba203fd357', '{"sub": "52fb8aad-58f7-5bee-8cfb-4fba203fd357", "email": "st764@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '52fb8aad-58f7-5bee-8cfb-4fba203fd357')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('52fb8aad-58f7-5bee-8cfb-4fba203fd357', 'admin', 'st764@boss.com', 'Admin Hotel Wayanad Square - ChargeMOD', 'Hotel Wayanad Square - ChargeMOD', 'Hotel Wayanad Square - ChargeMOD, Mananthavady, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('22bb4f55-728e-5004-95b8-b31e03e6da80', '52fb8aad-58f7-5bee-8cfb-4fba203fd357', 'Hotel Wayanad Square - ChargeMOD', 'Hotel Wayanad Square - ChargeMOD, Mananthavady, Kerala, India', 11.79697764, 76.00660113, 'India EV Network License', 'LIC-IN-ST764', 500.0, 30.0, true, 'Mananthavady', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '22bb4f55-728e-5004-95b8-b31e03e6da80';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('013b4df9-9745-5e46-aa70-651f3546c452', '22bb4f55-728e-5004-95b8-b31e03e6da80', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 765: Adhithya (EVOK) - ChargeMOD (Sulthan Bathery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4d9d067b-6efe-5dfd-a265-decd35827d4f', '00000000-0000-0000-0000-000000000000', 'st765@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st765@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4d9d067b-6efe-5dfd-a265-decd35827d4f', '4d9d067b-6efe-5dfd-a265-decd35827d4f', '{"sub": "4d9d067b-6efe-5dfd-a265-decd35827d4f", "email": "st765@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4d9d067b-6efe-5dfd-a265-decd35827d4f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4d9d067b-6efe-5dfd-a265-decd35827d4f', 'admin', 'st765@boss.com', 'Admin Adhithya (EVOK) - ChargeMOD', 'Adhithya (EVOK) - ChargeMOD', 'Adhithya (EVOK) - ChargeMOD, Sulthan Bathery, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8b5ddb37-64f8-5675-8926-17aa13bbfa26', '4d9d067b-6efe-5dfd-a265-decd35827d4f', 'Adhithya (EVOK) - ChargeMOD', 'Adhithya (EVOK) - ChargeMOD, Sulthan Bathery, Kerala, India', 11.66208634, 76.26492171, 'India EV Network License', 'LIC-IN-ST765', 500.0, 30.0, true, 'Sulthan Bathery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8b5ddb37-64f8-5675-8926-17aa13bbfa26';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d2fc474b-a3be-570a-9677-d171c3ed629c', '8b5ddb37-64f8-5675-8926-17aa13bbfa26', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 766: Meenangadi EVCS - ChargeMOD (Meenangadi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('702d573b-2740-55e6-a338-b459da957ad7', '00000000-0000-0000-0000-000000000000', 'st766@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st766@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('702d573b-2740-55e6-a338-b459da957ad7', '702d573b-2740-55e6-a338-b459da957ad7', '{"sub": "702d573b-2740-55e6-a338-b459da957ad7", "email": "st766@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '702d573b-2740-55e6-a338-b459da957ad7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('702d573b-2740-55e6-a338-b459da957ad7', 'admin', 'st766@boss.com', 'Admin Meenangadi EVCS - ChargeMOD', 'Meenangadi EVCS - ChargeMOD', 'Meenangadi EVCS - ChargeMOD, Meenangadi, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c05be733-11e6-5351-a037-efb206b413e8', '702d573b-2740-55e6-a338-b459da957ad7', 'Meenangadi EVCS - ChargeMOD', 'Meenangadi EVCS - ChargeMOD, Meenangadi, Kerala, India', 11.6540457, 76.15358524, 'India EV Network License', 'LIC-IN-ST766', 500.0, 30.0, true, 'Meenangadi', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c05be733-11e6-5351-a037-efb206b413e8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('70708d4b-75b2-55ae-bd25-f5861296edde', 'c05be733-11e6-5351-a037-efb206b413e8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 767: Konfudha Resort - ChargeMOD (Kalpetta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1cb908e8-90a2-5a65-817e-b82b3bd9cb11', '00000000-0000-0000-0000-000000000000', 'st767@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st767@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1cb908e8-90a2-5a65-817e-b82b3bd9cb11', '1cb908e8-90a2-5a65-817e-b82b3bd9cb11', '{"sub": "1cb908e8-90a2-5a65-817e-b82b3bd9cb11", "email": "st767@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1cb908e8-90a2-5a65-817e-b82b3bd9cb11')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1cb908e8-90a2-5a65-817e-b82b3bd9cb11', 'admin', 'st767@boss.com', 'Admin Konfudha Resort - ChargeMOD', 'Konfudha Resort - ChargeMOD', 'Konfudha Resort - ChargeMOD, Kalpetta, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b0a027df-0b3d-58a9-ac50-74977ac17668', '1cb908e8-90a2-5a65-817e-b82b3bd9cb11', 'Konfudha Resort - ChargeMOD', 'Konfudha Resort - ChargeMOD, Kalpetta, Kerala, India', 11.59145545, 76.07090978, 'India EV Network License', 'LIC-IN-ST767', 500.0, 30.0, true, 'Kalpetta', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b0a027df-0b3d-58a9-ac50-74977ac17668';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e8c034a1-4182-5c43-a093-f91da3edda22', 'b0a027df-0b3d-58a9-ac50-74977ac17668', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 768: Vythiri KSEB EVCS - ChargeMOD (Vythiri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f82ac2af-373c-51ff-9bc6-acf32a089d7a', '00000000-0000-0000-0000-000000000000', 'st768@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st768@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f82ac2af-373c-51ff-9bc6-acf32a089d7a', 'f82ac2af-373c-51ff-9bc6-acf32a089d7a', '{"sub": "f82ac2af-373c-51ff-9bc6-acf32a089d7a", "email": "st768@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f82ac2af-373c-51ff-9bc6-acf32a089d7a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f82ac2af-373c-51ff-9bc6-acf32a089d7a', 'admin', 'st768@boss.com', 'Admin Vythiri KSEB EVCS - ChargeMOD', 'Vythiri KSEB EVCS - ChargeMOD', 'Vythiri KSEB EVCS - ChargeMOD, Vythiri, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('edff276d-2f70-5bc5-a5c7-92959050800a', 'f82ac2af-373c-51ff-9bc6-acf32a089d7a', 'Vythiri KSEB EVCS - ChargeMOD', 'Vythiri KSEB EVCS - ChargeMOD, Vythiri, Kerala, India', 11.54575372, 76.03937193, 'India EV Network License', 'LIC-IN-ST768', 500.0, 30.0, true, 'Vythiri', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'edff276d-2f70-5bc5-a5c7-92959050800a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0619a095-f3d7-5bc1-9ffe-406ba73d61b4', 'edff276d-2f70-5bc5-a5c7-92959050800a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 769: Thamarassery KESEB EVCS - ChargeMOD (Thamarassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4d9383b1-5423-55e8-a040-3d2eb2ff78c7', '00000000-0000-0000-0000-000000000000', 'st769@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st769@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4d9383b1-5423-55e8-a040-3d2eb2ff78c7', '4d9383b1-5423-55e8-a040-3d2eb2ff78c7', '{"sub": "4d9383b1-5423-55e8-a040-3d2eb2ff78c7", "email": "st769@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4d9383b1-5423-55e8-a040-3d2eb2ff78c7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4d9383b1-5423-55e8-a040-3d2eb2ff78c7', 'admin', 'st769@boss.com', 'Admin Thamarassery KESEB EVCS - ChargeMOD', 'Thamarassery KESEB EVCS - ChargeMOD', 'Thamarassery KESEB EVCS - ChargeMOD, Thamarassery, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d2fdfb19-c442-5f19-9be6-0bc721a16339', '4d9383b1-5423-55e8-a040-3d2eb2ff78c7', 'Thamarassery KESEB EVCS - ChargeMOD', 'Thamarassery KESEB EVCS - ChargeMOD, Thamarassery, Kerala, India', 11.44408743, 75.95587691, 'India EV Network License', 'LIC-IN-ST769', 500.0, 30.0, true, 'Thamarassery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd2fdfb19-c442-5f19-9be6-0bc721a16339';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('146dfa17-805d-54e9-9b71-f58ed71e18fe', 'd2fdfb19-c442-5f19-9be6-0bc721a16339', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 770: Locus EVCS - ChargeMOD (Koduvally, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bf1e6e12-d2ea-52d2-86b2-b170a2c5935c', '00000000-0000-0000-0000-000000000000', 'st770@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st770@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bf1e6e12-d2ea-52d2-86b2-b170a2c5935c', 'bf1e6e12-d2ea-52d2-86b2-b170a2c5935c', '{"sub": "bf1e6e12-d2ea-52d2-86b2-b170a2c5935c", "email": "st770@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bf1e6e12-d2ea-52d2-86b2-b170a2c5935c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bf1e6e12-d2ea-52d2-86b2-b170a2c5935c', 'admin', 'st770@boss.com', 'Admin Locus EVCS - ChargeMOD', 'Locus EVCS - ChargeMOD', 'Locus EVCS - ChargeMOD, Koduvally, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dd896121-decf-5a0f-a60f-70dfce1a7359', 'bf1e6e12-d2ea-52d2-86b2-b170a2c5935c', 'Locus EVCS - ChargeMOD', 'Locus EVCS - ChargeMOD, Koduvally, Kerala, India', 11.33968384, 75.89871569, 'India EV Network License', 'LIC-IN-ST770', 500.0, 30.0, true, 'Koduvally', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dd896121-decf-5a0f-a60f-70dfce1a7359';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('292633a8-83d6-53a6-9d05-c12d096c4f34', 'dd896121-decf-5a0f-a60f-70dfce1a7359', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 771: Yadav EV Charging Station - ChargeMOD (Kunnamangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e2d25e8b-d3dc-53fe-8f38-95c270297e37', '00000000-0000-0000-0000-000000000000', 'st771@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st771@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e2d25e8b-d3dc-53fe-8f38-95c270297e37', 'e2d25e8b-d3dc-53fe-8f38-95c270297e37', '{"sub": "e2d25e8b-d3dc-53fe-8f38-95c270297e37", "email": "st771@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e2d25e8b-d3dc-53fe-8f38-95c270297e37')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e2d25e8b-d3dc-53fe-8f38-95c270297e37', 'admin', 'st771@boss.com', 'Admin Yadav EV Charging Station - ChargeMOD', 'Yadav EV Charging Station - ChargeMOD', 'Yadav EV Charging Station - ChargeMOD, Kunnamangalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('987f61e4-c941-59aa-909c-3a04de14fa1a', 'e2d25e8b-d3dc-53fe-8f38-95c270297e37', 'Yadav EV Charging Station - ChargeMOD', 'Yadav EV Charging Station - ChargeMOD, Kunnamangalam, Kerala, India', 11.31169215, 75.8825934, 'India EV Network License', 'LIC-IN-ST771', 500.0, 30.0, true, 'Kunnamangalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '987f61e4-c941-59aa-909c-3a04de14fa1a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a01ba87c-e6e3-5036-839a-59823d4d30c6', '987f61e4-c941-59aa-909c-3a04de14fa1a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 772: Kuttoth Enterprises EVCS - ChargeMOD (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bc72bed6-d2d5-5242-a569-e65ea43acc72', '00000000-0000-0000-0000-000000000000', 'st772@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st772@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bc72bed6-d2d5-5242-a569-e65ea43acc72', 'bc72bed6-d2d5-5242-a569-e65ea43acc72', '{"sub": "bc72bed6-d2d5-5242-a569-e65ea43acc72", "email": "st772@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bc72bed6-d2d5-5242-a569-e65ea43acc72')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bc72bed6-d2d5-5242-a569-e65ea43acc72', 'admin', 'st772@boss.com', 'Admin Kuttoth Enterprises EVCS - ChargeMOD', 'Kuttoth Enterprises EVCS - ChargeMOD', 'Kuttoth Enterprises EVCS - ChargeMOD, Kozhikode, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('03f247c4-b578-558c-82d2-e31555da4226', 'bc72bed6-d2d5-5242-a569-e65ea43acc72', 'Kuttoth Enterprises EVCS - ChargeMOD', 'Kuttoth Enterprises EVCS - ChargeMOD, Kozhikode, Kerala, India', 11.28067356, 75.82463167, 'India EV Network License', 'LIC-IN-ST772', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '03f247c4-b578-558c-82d2-e31555da4226';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b3c3c70-13ef-5f05-8991-60986e7353c8', '03f247c4-b578-558c-82d2-e31555da4226', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 773: RG Nallanna EVCS (EVOK) - ChargeMOD (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ec2f0d20-a060-5139-beb7-b472ba69e8ba', '00000000-0000-0000-0000-000000000000', 'st773@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st773@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ec2f0d20-a060-5139-beb7-b472ba69e8ba', 'ec2f0d20-a060-5139-beb7-b472ba69e8ba', '{"sub": "ec2f0d20-a060-5139-beb7-b472ba69e8ba", "email": "st773@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ec2f0d20-a060-5139-beb7-b472ba69e8ba')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ec2f0d20-a060-5139-beb7-b472ba69e8ba', 'admin', 'st773@boss.com', 'Admin RG Nallanna EVCS (EVOK) - ChargeMOD', 'RG Nallanna EVCS (EVOK) - ChargeMOD', 'RG Nallanna EVCS (EVOK) - ChargeMOD, Kozhikode, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8dcaec0b-15f9-5976-b304-d727a052e526', 'ec2f0d20-a060-5139-beb7-b472ba69e8ba', 'RG Nallanna EVCS (EVOK) - ChargeMOD', 'RG Nallanna EVCS (EVOK) - ChargeMOD, Kozhikode, Kerala, India', 11.28081467, 75.82434977, 'India EV Network License', 'LIC-IN-ST773', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8dcaec0b-15f9-5976-b304-d727a052e526';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('66c4c824-0312-5810-bdd7-4edeef5141e4', '8dcaec0b-15f9-5976-b304-d727a052e526', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 774: Solar Sparks EVCS - ChargeMOD (Koyilandi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('451ade13-a275-5160-b8b1-f181d39f143d', '00000000-0000-0000-0000-000000000000', 'st774@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st774@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('451ade13-a275-5160-b8b1-f181d39f143d', '451ade13-a275-5160-b8b1-f181d39f143d', '{"sub": "451ade13-a275-5160-b8b1-f181d39f143d", "email": "st774@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '451ade13-a275-5160-b8b1-f181d39f143d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('451ade13-a275-5160-b8b1-f181d39f143d', 'admin', 'st774@boss.com', 'Admin Solar Sparks EVCS - ChargeMOD', 'Solar Sparks EVCS - ChargeMOD', 'Solar Sparks EVCS - ChargeMOD, Koyilandi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('10e9e54a-c886-5a7c-8769-d9a2eda47a79', '451ade13-a275-5160-b8b1-f181d39f143d', 'Solar Sparks EVCS - ChargeMOD', 'Solar Sparks EVCS - ChargeMOD, Koyilandi, Kerala, India', 11.42767541, 75.70299624, 'India EV Network License', 'LIC-IN-ST774', 500.0, 30.0, true, 'Koyilandi', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '10e9e54a-c886-5a7c-8769-d9a2eda47a79';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fde01665-2e52-54da-9bcf-1c45805a84a2', '10e9e54a-c886-5a7c-8769-d9a2eda47a79', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 775: Hotel Arcore (Mysuru, Karnataka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c53853f8-7646-56e9-8a10-f9b63eb7b753', '00000000-0000-0000-0000-000000000000', 'st775@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st775@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c53853f8-7646-56e9-8a10-f9b63eb7b753', 'c53853f8-7646-56e9-8a10-f9b63eb7b753', '{"sub": "c53853f8-7646-56e9-8a10-f9b63eb7b753", "email": "st775@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c53853f8-7646-56e9-8a10-f9b63eb7b753')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c53853f8-7646-56e9-8a10-f9b63eb7b753', 'admin', 'st775@boss.com', 'Admin Hotel Arcore', 'Hotel Arcore', 'Hotel Arcore, Mysuru, Karnataka, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('49741f11-3e05-5426-8f1f-c276c326520c', 'c53853f8-7646-56e9-8a10-f9b63eb7b753', 'Hotel Arcore', 'Hotel Arcore, Mysuru, Karnataka, India', 12.3526874, 76.6292033, 'India EV Network License', 'LIC-IN-ST775', 500.0, 7.4, true, 'Mysuru', 'Karnataka', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '49741f11-3e05-5426-8f1f-c276c326520c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3395578f-502b-5a0d-a809-bb58012abbe9', '49741f11-3e05-5426-8f1f-c276c326520c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 776: Manipal Hospital Mysore (Mysuru, Karnataka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('474050d3-f431-53d5-ba34-c09802f3567e', '00000000-0000-0000-0000-000000000000', 'st776@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st776@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('474050d3-f431-53d5-ba34-c09802f3567e', '474050d3-f431-53d5-ba34-c09802f3567e', '{"sub": "474050d3-f431-53d5-ba34-c09802f3567e", "email": "st776@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '474050d3-f431-53d5-ba34-c09802f3567e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('474050d3-f431-53d5-ba34-c09802f3567e', 'admin', 'st776@boss.com', 'Admin Manipal Hospital Mysore', 'Manipal Hospital Mysore', 'Manipal Hospital Mysore, Mysuru, Karnataka, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1ebe4058-b139-582a-9824-c24dc3c3822d', '474050d3-f431-53d5-ba34-c09802f3567e', 'Manipal Hospital Mysore', 'Manipal Hospital Mysore, Mysuru, Karnataka, India', 12.35014588, 76.66019891, 'India EV Network License', 'LIC-IN-ST776', 500.0, 7.4, true, 'Mysuru', 'Karnataka', 1, 'Zeon Charging', '24 Hours (Hospital)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1ebe4058-b139-582a-9824-c24dc3c3822d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('aab5f760-2bb1-5edc-a96c-598767c90456', '1ebe4058-b139-582a-9824-c24dc3c3822d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 777: Pavangad KSEB EVCS - ChargeMOD (Pavangad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fed6490b-1f25-5aac-ac56-da5ab092f198', '00000000-0000-0000-0000-000000000000', 'st777@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st777@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fed6490b-1f25-5aac-ac56-da5ab092f198', 'fed6490b-1f25-5aac-ac56-da5ab092f198', '{"sub": "fed6490b-1f25-5aac-ac56-da5ab092f198", "email": "st777@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fed6490b-1f25-5aac-ac56-da5ab092f198')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fed6490b-1f25-5aac-ac56-da5ab092f198', 'admin', 'st777@boss.com', 'Admin Pavangad KSEB EVCS - ChargeMOD', 'Pavangad KSEB EVCS - ChargeMOD', 'Pavangad KSEB EVCS - ChargeMOD, Pavangad, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7d321f35-194e-59e7-bc47-40de4c742951', 'fed6490b-1f25-5aac-ac56-da5ab092f198', 'Pavangad KSEB EVCS - ChargeMOD', 'Pavangad KSEB EVCS - ChargeMOD, Pavangad, Kerala, India', 11.31241162, 75.75859063, 'India EV Network License', 'LIC-IN-ST777', 500.0, 30.0, true, 'Pavangad', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7d321f35-194e-59e7-bc47-40de4c742951';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5a6e128d-201c-5f51-bee2-3682b2f23e58', '7d321f35-194e-59e7-bc47-40de4c742951', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 778: Gandhi Road KSEB EVCS - ChargeMOD (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1cf89553-5f8f-50d0-80da-35c35385c300', '00000000-0000-0000-0000-000000000000', 'st778@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st778@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1cf89553-5f8f-50d0-80da-35c35385c300', '1cf89553-5f8f-50d0-80da-35c35385c300', '{"sub": "1cf89553-5f8f-50d0-80da-35c35385c300", "email": "st778@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1cf89553-5f8f-50d0-80da-35c35385c300')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1cf89553-5f8f-50d0-80da-35c35385c300', 'admin', 'st778@boss.com', 'Admin Gandhi Road KSEB EVCS - ChargeMOD', 'Gandhi Road KSEB EVCS - ChargeMOD', 'Gandhi Road KSEB EVCS - ChargeMOD, Kozhikode, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('96459afe-b67e-52ba-8221-63e36478e60f', '1cf89553-5f8f-50d0-80da-35c35385c300', 'Gandhi Road KSEB EVCS - ChargeMOD', 'Gandhi Road KSEB EVCS - ChargeMOD, Kozhikode, Kerala, India', 11.26278446, 75.76824105, 'India EV Network License', 'LIC-IN-ST778', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '96459afe-b67e-52ba-8221-63e36478e60f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9a171ca1-3546-50fb-a6f5-56c1f057f644', '96459afe-b67e-52ba-8221-63e36478e60f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 779: Mountainpass Residency - ChargeMOD (Vazhikadavu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bef12f7f-5859-5339-966b-94dd1a9cea90', '00000000-0000-0000-0000-000000000000', 'st779@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st779@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bef12f7f-5859-5339-966b-94dd1a9cea90', 'bef12f7f-5859-5339-966b-94dd1a9cea90', '{"sub": "bef12f7f-5859-5339-966b-94dd1a9cea90", "email": "st779@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bef12f7f-5859-5339-966b-94dd1a9cea90')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bef12f7f-5859-5339-966b-94dd1a9cea90', 'admin', 'st779@boss.com', 'Admin Mountainpass Residency - ChargeMOD', 'Mountainpass Residency - ChargeMOD', 'Mountainpass Residency - ChargeMOD, Vazhikadavu, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c44c7129-147d-5064-95c8-e415d4ea021d', 'bef12f7f-5859-5339-966b-94dd1a9cea90', 'Mountainpass Residency - ChargeMOD', 'Mountainpass Residency - ChargeMOD, Vazhikadavu, Kerala, India', 11.38662806, 76.35472249, 'India EV Network License', 'LIC-IN-ST779', 500.0, 30.0, true, 'Vazhikadavu', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c44c7129-147d-5064-95c8-e415d4ea021d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1ba70f91-5389-50cf-b504-6682985eef52', 'c44c7129-147d-5064-95c8-e415d4ea021d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 780: Trends Edavannappara EVCS - ChargeMOD (Edavannappara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('53d0a19d-420b-5c40-b9c8-3f134511e54a', '00000000-0000-0000-0000-000000000000', 'st780@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st780@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('53d0a19d-420b-5c40-b9c8-3f134511e54a', '53d0a19d-420b-5c40-b9c8-3f134511e54a', '{"sub": "53d0a19d-420b-5c40-b9c8-3f134511e54a", "email": "st780@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '53d0a19d-420b-5c40-b9c8-3f134511e54a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('53d0a19d-420b-5c40-b9c8-3f134511e54a', 'admin', 'st780@boss.com', 'Admin Trends Edavannappara EVCS - ChargeMOD', 'Trends Edavannappara EVCS - ChargeMOD', 'Trends Edavannappara EVCS - ChargeMOD, Edavannappara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e93d7e4a-3482-5347-b14d-88ad3e5881ff', '53d0a19d-420b-5c40-b9c8-3f134511e54a', 'Trends Edavannappara EVCS - ChargeMOD', 'Trends Edavannappara EVCS - ChargeMOD, Edavannappara, Kerala, India', 11.24532315, 75.97749175, 'India EV Network License', 'LIC-IN-ST780', 500.0, 30.0, true, 'Edavannappara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e93d7e4a-3482-5347-b14d-88ad3e5881ff';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('49f2753c-a32a-53b1-91c8-60a1a649f93d', 'e93d7e4a-3482-5347-b14d-88ad3e5881ff', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 781: Indus Motors - ChargeMOD (Feroke, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('deb8cae2-c9a5-5d9a-b11f-bf0bc4cc3ce1', '00000000-0000-0000-0000-000000000000', 'st781@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st781@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('deb8cae2-c9a5-5d9a-b11f-bf0bc4cc3ce1', 'deb8cae2-c9a5-5d9a-b11f-bf0bc4cc3ce1', '{"sub": "deb8cae2-c9a5-5d9a-b11f-bf0bc4cc3ce1", "email": "st781@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'deb8cae2-c9a5-5d9a-b11f-bf0bc4cc3ce1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('deb8cae2-c9a5-5d9a-b11f-bf0bc4cc3ce1', 'admin', 'st781@boss.com', 'Admin Indus Motors - ChargeMOD', 'Indus Motors - ChargeMOD', 'Indus Motors - ChargeMOD, Feroke, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3da3a43d-f3f9-5666-acce-43b3ed54d0c9', 'deb8cae2-c9a5-5d9a-b11f-bf0bc4cc3ce1', 'Indus Motors - ChargeMOD', 'Indus Motors - ChargeMOD, Feroke, Kerala, India', 11.18074376, 75.85119864, 'India EV Network License', 'LIC-IN-ST781', 500.0, 30.0, true, 'Feroke', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3da3a43d-f3f9-5666-acce-43b3ed54d0c9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('768cd774-16da-5612-b5f9-391389c6fd13', '3da3a43d-f3f9-5666-acce-43b3ed54d0c9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 782: Kay Pees Electricals (EVOK) - ChargeMOD (Pulikkal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a6a4ac5f-ea33-50fd-97a7-455d17f74907', '00000000-0000-0000-0000-000000000000', 'st782@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st782@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a6a4ac5f-ea33-50fd-97a7-455d17f74907', 'a6a4ac5f-ea33-50fd-97a7-455d17f74907', '{"sub": "a6a4ac5f-ea33-50fd-97a7-455d17f74907", "email": "st782@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a6a4ac5f-ea33-50fd-97a7-455d17f74907')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a6a4ac5f-ea33-50fd-97a7-455d17f74907', 'admin', 'st782@boss.com', 'Admin Kay Pees Electricals (EVOK) - ChargeMOD', 'Kay Pees Electricals (EVOK) - ChargeMOD', 'Kay Pees Electricals (EVOK) - ChargeMOD, Pulikkal, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ab56d967-764f-5ea5-b343-0556f07df60d', 'a6a4ac5f-ea33-50fd-97a7-455d17f74907', 'Kay Pees Electricals (EVOK) - ChargeMOD', 'Kay Pees Electricals (EVOK) - ChargeMOD, Pulikkal, Kerala, India', 11.16886778, 75.92676863, 'India EV Network License', 'LIC-IN-ST782', 500.0, 30.0, true, 'Pulikkal', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ab56d967-764f-5ea5-b343-0556f07df60d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06414020-4ad8-5b17-843c-71932903bd9a', 'ab56d967-764f-5ea5-b343-0556f07df60d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 783: RG Nallanna EVCS (EVOK) - ChargeMOD (Aikkarapadi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('58a362d7-1fd4-566c-a321-1b93d176e8a1', '00000000-0000-0000-0000-000000000000', 'st783@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st783@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('58a362d7-1fd4-566c-a321-1b93d176e8a1', '58a362d7-1fd4-566c-a321-1b93d176e8a1', '{"sub": "58a362d7-1fd4-566c-a321-1b93d176e8a1", "email": "st783@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '58a362d7-1fd4-566c-a321-1b93d176e8a1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('58a362d7-1fd4-566c-a321-1b93d176e8a1', 'admin', 'st783@boss.com', 'Admin RG Nallanna EVCS (EVOK) - ChargeMOD', 'RG Nallanna EVCS (EVOK) - ChargeMOD', 'RG Nallanna EVCS (EVOK) - ChargeMOD, Aikkarapadi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4945aa6d-b29c-5ba1-9cf4-03b13eeea7d7', '58a362d7-1fd4-566c-a321-1b93d176e8a1', 'RG Nallanna EVCS (EVOK) - ChargeMOD', 'RG Nallanna EVCS (EVOK) - ChargeMOD, Aikkarapadi, Kerala, India', 11.17327991, 75.9021518, 'India EV Network License', 'LIC-IN-ST783', 500.0, 30.0, true, 'Aikkarapadi', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4945aa6d-b29c-5ba1-9cf4-03b13eeea7d7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ebb291da-9fc5-5599-b66d-05dcb2d6c92f', '4945aa6d-b29c-5ba1-9cf4-03b13eeea7d7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 784: Barakah Tiles and Stones | EVOK | Thenhipalam (Pingottoormad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('91412e73-a03b-5ce3-9405-83f1f2f9e954', '00000000-0000-0000-0000-000000000000', 'st784@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st784@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('91412e73-a03b-5ce3-9405-83f1f2f9e954', '91412e73-a03b-5ce3-9405-83f1f2f9e954', '{"sub": "91412e73-a03b-5ce3-9405-83f1f2f9e954", "email": "st784@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '91412e73-a03b-5ce3-9405-83f1f2f9e954')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('91412e73-a03b-5ce3-9405-83f1f2f9e954', 'admin', 'st784@boss.com', 'Admin Barakah Tiles and Stones | EVOK | Thenhipalam', 'Barakah Tiles and Stones | EVOK | Thenhipalam', 'Barakah Tiles and Stones | EVOK | Thenhipalam, Pingottoormad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b1f44152-4841-5a06-9ff8-3233257bb42f', '91412e73-a03b-5ce3-9405-83f1f2f9e954', 'Barakah Tiles and Stones | EVOK | Thenhipalam', 'Barakah Tiles and Stones | EVOK | Thenhipalam, Pingottoormad, Kerala, India', 11.14491898, 75.89616976, 'India EV Network License', 'LIC-IN-ST784', 500.0, 30.0, true, 'Pingottoormad', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b1f44152-4841-5a06-9ff8-3233257bb42f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e6532597-f666-578f-b824-2206cf23524f', 'b1f44152-4841-5a06-9ff8-3233257bb42f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4702f328-72ac-58db-a930-49036b743a3a', 'b1f44152-4841-5a06-9ff8-3233257bb42f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 785: Tirur KSEB EVCS - ChargeMOD (Tirur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('28e32982-1c9e-5084-aaec-c735b1d2a686', '00000000-0000-0000-0000-000000000000', 'st785@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st785@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('28e32982-1c9e-5084-aaec-c735b1d2a686', '28e32982-1c9e-5084-aaec-c735b1d2a686', '{"sub": "28e32982-1c9e-5084-aaec-c735b1d2a686", "email": "st785@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '28e32982-1c9e-5084-aaec-c735b1d2a686')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('28e32982-1c9e-5084-aaec-c735b1d2a686', 'admin', 'st785@boss.com', 'Admin Tirur KSEB EVCS - ChargeMOD', 'Tirur KSEB EVCS - ChargeMOD', 'Tirur KSEB EVCS - ChargeMOD, Tirur, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b5d347e7-b403-5ce1-933c-bc9e17fa64ea', '28e32982-1c9e-5084-aaec-c735b1d2a686', 'Tirur KSEB EVCS - ChargeMOD', 'Tirur KSEB EVCS - ChargeMOD, Tirur, Kerala, India', 10.91624728, 75.91828654, 'India EV Network License', 'LIC-IN-ST785', 500.0, 30.0, true, 'Tirur', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b5d347e7-b403-5ce1-933c-bc9e17fa64ea';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('57f3c877-0939-5b4e-832e-cf6991d93f6e', 'b5d347e7-b403-5ce1-933c-bc9e17fa64ea', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 786: Relax Point Restaurant (Karippol, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('03d992be-bef0-5bee-9d4c-04bbde0aa28a', '00000000-0000-0000-0000-000000000000', 'st786@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st786@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('03d992be-bef0-5bee-9d4c-04bbde0aa28a', '03d992be-bef0-5bee-9d4c-04bbde0aa28a', '{"sub": "03d992be-bef0-5bee-9d4c-04bbde0aa28a", "email": "st786@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '03d992be-bef0-5bee-9d4c-04bbde0aa28a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('03d992be-bef0-5bee-9d4c-04bbde0aa28a', 'admin', 'st786@boss.com', 'Admin Relax Point Restaurant', 'Relax Point Restaurant', 'Relax Point Restaurant, Karippol, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0c72c21d-5a85-50a8-bc3e-b5ea2e05b9c6', '03d992be-bef0-5bee-9d4c-04bbde0aa28a', 'Relax Point Restaurant', 'Relax Point Restaurant, Karippol, Kerala, India', 10.92282041, 76.03291841, 'India EV Network License', 'LIC-IN-ST786', 500.0, 7.4, true, 'Karippol', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0c72c21d-5a85-50a8-bc3e-b5ea2e05b9c6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('920bbc08-b72c-5962-bda6-8728b6c730f4', '0c72c21d-5a85-50a8-bc3e-b5ea2e05b9c6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 787: Thirunilath ECVS Charging Station - ChargeMOD (Kottakkal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d1faf7d4-9a2e-527c-bedb-bbaa285c7147', '00000000-0000-0000-0000-000000000000', 'st787@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st787@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d1faf7d4-9a2e-527c-bedb-bbaa285c7147', 'd1faf7d4-9a2e-527c-bedb-bbaa285c7147', '{"sub": "d1faf7d4-9a2e-527c-bedb-bbaa285c7147", "email": "st787@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd1faf7d4-9a2e-527c-bedb-bbaa285c7147')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d1faf7d4-9a2e-527c-bedb-bbaa285c7147', 'admin', 'st787@boss.com', 'Admin Thirunilath ECVS Charging Station - ChargeMOD', 'Thirunilath ECVS Charging Station - ChargeMOD', 'Thirunilath ECVS Charging Station - ChargeMOD, Kottakkal, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f974a468-1f71-59b0-a221-143f6dc8f04e', 'd1faf7d4-9a2e-527c-bedb-bbaa285c7147', 'Thirunilath ECVS Charging Station - ChargeMOD', 'Thirunilath ECVS Charging Station - ChargeMOD, Kottakkal, Kerala, India', 11.00172659, 75.98044942, 'India EV Network License', 'LIC-IN-ST787', 500.0, 30.0, true, 'Kottakkal', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f974a468-1f71-59b0-a221-143f6dc8f04e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0ec8b743-8b15-5417-8872-50ab44abaeab', 'f974a468-1f71-59b0-a221-143f6dc8f04e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 788: Malappuram KSEB EVCS - ChargeMOD (Munduparamba, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('de045dbc-af82-55c2-b678-56db52b48778', '00000000-0000-0000-0000-000000000000', 'st788@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st788@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('de045dbc-af82-55c2-b678-56db52b48778', 'de045dbc-af82-55c2-b678-56db52b48778', '{"sub": "de045dbc-af82-55c2-b678-56db52b48778", "email": "st788@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'de045dbc-af82-55c2-b678-56db52b48778')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('de045dbc-af82-55c2-b678-56db52b48778', 'admin', 'st788@boss.com', 'Admin Malappuram KSEB EVCS - ChargeMOD', 'Malappuram KSEB EVCS - ChargeMOD', 'Malappuram KSEB EVCS - ChargeMOD, Munduparamba, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dc0c1f11-e8fb-5c8f-bf82-ded06a3214dd', 'de045dbc-af82-55c2-b678-56db52b48778', 'Malappuram KSEB EVCS - ChargeMOD', 'Malappuram KSEB EVCS - ChargeMOD, Munduparamba, Kerala, India', 11.05422453, 76.09214302, 'India EV Network License', 'LIC-IN-ST788', 500.0, 30.0, true, 'Munduparamba', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dc0c1f11-e8fb-5c8f-bf82-ded06a3214dd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c00ee258-37a0-5296-98c1-39ad114826c5', 'dc0c1f11-e8fb-5c8f-bf82-ded06a3214dd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 789: Krishna Enterprises - ChargeMOD (Manjeri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('62907a78-f5df-55ca-ae92-44c3042a257e', '00000000-0000-0000-0000-000000000000', 'st789@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st789@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('62907a78-f5df-55ca-ae92-44c3042a257e', '62907a78-f5df-55ca-ae92-44c3042a257e', '{"sub": "62907a78-f5df-55ca-ae92-44c3042a257e", "email": "st789@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '62907a78-f5df-55ca-ae92-44c3042a257e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('62907a78-f5df-55ca-ae92-44c3042a257e', 'admin', 'st789@boss.com', 'Admin Krishna Enterprises - ChargeMOD', 'Krishna Enterprises - ChargeMOD', 'Krishna Enterprises - ChargeMOD, Manjeri, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cd7637d1-c749-5a13-ab78-2883b46ab4c7', '62907a78-f5df-55ca-ae92-44c3042a257e', 'Krishna Enterprises - ChargeMOD', 'Krishna Enterprises - ChargeMOD, Manjeri, Kerala, India', 11.12303335, 76.11586843, 'India EV Network License', 'LIC-IN-ST789', 500.0, 30.0, true, 'Manjeri', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cd7637d1-c749-5a13-ab78-2883b46ab4c7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('905591cf-cf64-526b-bd3c-4af7db2debb5', 'cd7637d1-c749-5a13-ab78-2883b46ab4c7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 790: Golden Baked EVCS - ChargeMOD (Manjeri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f20ba777-17f6-59e8-823c-a1b6a1a45ee6', '00000000-0000-0000-0000-000000000000', 'st790@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st790@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f20ba777-17f6-59e8-823c-a1b6a1a45ee6', 'f20ba777-17f6-59e8-823c-a1b6a1a45ee6', '{"sub": "f20ba777-17f6-59e8-823c-a1b6a1a45ee6", "email": "st790@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f20ba777-17f6-59e8-823c-a1b6a1a45ee6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f20ba777-17f6-59e8-823c-a1b6a1a45ee6', 'admin', 'st790@boss.com', 'Admin Golden Baked EVCS - ChargeMOD', 'Golden Baked EVCS - ChargeMOD', 'Golden Baked EVCS - ChargeMOD, Manjeri, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b472e201-3f2b-58d5-a1c6-708c777e0650', 'f20ba777-17f6-59e8-823c-a1b6a1a45ee6', 'Golden Baked EVCS - ChargeMOD', 'Golden Baked EVCS - ChargeMOD, Manjeri, Kerala, India', 11.12341107, 76.12418516, 'India EV Network License', 'LIC-IN-ST790', 500.0, 30.0, true, 'Manjeri', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b472e201-3f2b-58d5-a1c6-708c777e0650';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('72a5c7aa-30c0-592f-aeb5-27fc7eb1411a', 'b472e201-3f2b-58d5-a1c6-708c777e0650', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 791: EcoCharge EVCS - ChargeMOD (Pandikkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0879c514-c11b-5fb3-ac3f-e3c536d2c72e', '00000000-0000-0000-0000-000000000000', 'st791@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st791@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0879c514-c11b-5fb3-ac3f-e3c536d2c72e', '0879c514-c11b-5fb3-ac3f-e3c536d2c72e', '{"sub": "0879c514-c11b-5fb3-ac3f-e3c536d2c72e", "email": "st791@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0879c514-c11b-5fb3-ac3f-e3c536d2c72e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0879c514-c11b-5fb3-ac3f-e3c536d2c72e', 'admin', 'st791@boss.com', 'Admin EcoCharge EVCS - ChargeMOD', 'EcoCharge EVCS - ChargeMOD', 'EcoCharge EVCS - ChargeMOD, Pandikkad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7c932a98-98aa-5d7c-b2b1-364626ecfb49', '0879c514-c11b-5fb3-ac3f-e3c536d2c72e', 'EcoCharge EVCS - ChargeMOD', 'EcoCharge EVCS - ChargeMOD, Pandikkad, Kerala, India', 11.09639986, 76.21070705, 'India EV Network License', 'LIC-IN-ST791', 500.0, 30.0, true, 'Pandikkad', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7c932a98-98aa-5d7c-b2b1-364626ecfb49';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c43a4965-47f2-5fac-bb39-b3d1408e76f1', '7c932a98-98aa-5d7c-b2b1-364626ecfb49', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 792: MKM Melattur (EVOK) - ChargeMOD (Melattur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5483bd2a-36a2-5938-86af-3449c00e4a9d', '00000000-0000-0000-0000-000000000000', 'st792@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st792@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5483bd2a-36a2-5938-86af-3449c00e4a9d', '5483bd2a-36a2-5938-86af-3449c00e4a9d', '{"sub": "5483bd2a-36a2-5938-86af-3449c00e4a9d", "email": "st792@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5483bd2a-36a2-5938-86af-3449c00e4a9d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5483bd2a-36a2-5938-86af-3449c00e4a9d', 'admin', 'st792@boss.com', 'Admin MKM Melattur (EVOK) - ChargeMOD', 'MKM Melattur (EVOK) - ChargeMOD', 'MKM Melattur (EVOK) - ChargeMOD, Melattur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ac820055-ce88-5b99-851a-d7c25514891e', '5483bd2a-36a2-5938-86af-3449c00e4a9d', 'MKM Melattur (EVOK) - ChargeMOD', 'MKM Melattur (EVOK) - ChargeMOD, Melattur, Kerala, India', 11.05620809, 76.27851203, 'India EV Network License', 'LIC-IN-ST792', 500.0, 30.0, true, 'Melattur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ac820055-ce88-5b99-851a-d7c25514891e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('33c42e7f-08e6-573f-a232-a0f3a8b27178', 'ac820055-ce88-5b99-851a-d7c25514891e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 793: Green Drive EVCS - ChargeMOD (Vengoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a617fcba-3bb4-5356-bf56-c6de5d59e599', '00000000-0000-0000-0000-000000000000', 'st793@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st793@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a617fcba-3bb4-5356-bf56-c6de5d59e599', 'a617fcba-3bb4-5356-bf56-c6de5d59e599', '{"sub": "a617fcba-3bb4-5356-bf56-c6de5d59e599", "email": "st793@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a617fcba-3bb4-5356-bf56-c6de5d59e599')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a617fcba-3bb4-5356-bf56-c6de5d59e599', 'admin', 'st793@boss.com', 'Admin Green Drive EVCS - ChargeMOD', 'Green Drive EVCS - ChargeMOD', 'Green Drive EVCS - ChargeMOD, Vengoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4571802d-d753-5b26-8e36-8e0a86f68436', 'a617fcba-3bb4-5356-bf56-c6de5d59e599', 'Green Drive EVCS - ChargeMOD', 'Green Drive EVCS - ChargeMOD, Vengoor, Kerala, India', 11.03450239, 76.26188661, 'India EV Network License', 'LIC-IN-ST793', 500.0, 30.0, true, 'Vengoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4571802d-d753-5b26-8e36-8e0a86f68436';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('46fb31e7-6a28-5d5c-bc33-f232a2d5ab4c', '4571802d-d753-5b26-8e36-8e0a86f68436', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 794: Hotel Mughal Park - ChargeMOD (Perinthalmanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('76f6aa86-7ba4-5b18-972a-a05b3bf87ff8', '00000000-0000-0000-0000-000000000000', 'st794@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st794@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('76f6aa86-7ba4-5b18-972a-a05b3bf87ff8', '76f6aa86-7ba4-5b18-972a-a05b3bf87ff8', '{"sub": "76f6aa86-7ba4-5b18-972a-a05b3bf87ff8", "email": "st794@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '76f6aa86-7ba4-5b18-972a-a05b3bf87ff8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('76f6aa86-7ba4-5b18-972a-a05b3bf87ff8', 'admin', 'st794@boss.com', 'Admin Hotel Mughal Park - ChargeMOD', 'Hotel Mughal Park - ChargeMOD', 'Hotel Mughal Park - ChargeMOD, Perinthalmanna, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c8cff9c5-d0af-5636-ba47-f0c77f4db6d3', '76f6aa86-7ba4-5b18-972a-a05b3bf87ff8', 'Hotel Mughal Park - ChargeMOD', 'Hotel Mughal Park - ChargeMOD, Perinthalmanna, Kerala, India', 10.97719389, 76.22165089, 'India EV Network License', 'LIC-IN-ST794', 500.0, 30.0, true, 'Perinthalmanna', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c8cff9c5-d0af-5636-ba47-f0c77f4db6d3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('492d0a95-d3e6-5e12-801b-16e1bb921b6f', 'c8cff9c5-d0af-5636-ba47-f0c77f4db6d3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 795: Avenue Plaza - ChargeMOD (Mannarkkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c0ccc800-5c45-5efd-9802-1c4c7cf90035', '00000000-0000-0000-0000-000000000000', 'st795@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st795@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c0ccc800-5c45-5efd-9802-1c4c7cf90035', 'c0ccc800-5c45-5efd-9802-1c4c7cf90035', '{"sub": "c0ccc800-5c45-5efd-9802-1c4c7cf90035", "email": "st795@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c0ccc800-5c45-5efd-9802-1c4c7cf90035')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c0ccc800-5c45-5efd-9802-1c4c7cf90035', 'admin', 'st795@boss.com', 'Admin Avenue Plaza - ChargeMOD', 'Avenue Plaza - ChargeMOD', 'Avenue Plaza - ChargeMOD, Mannarkkad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4ef05b60-1b56-5dc2-9683-49f5ff5ac65a', 'c0ccc800-5c45-5efd-9802-1c4c7cf90035', 'Avenue Plaza - ChargeMOD', 'Avenue Plaza - ChargeMOD, Mannarkkad, Kerala, India', 10.98886452, 76.43668851, 'India EV Network License', 'LIC-IN-ST795', 500.0, 30.0, true, 'Mannarkkad', 'Kerala', 1, 'ChargeMod (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4ef05b60-1b56-5dc2-9683-49f5ff5ac65a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b43812f1-e42e-53a6-afe7-429b331c90ef', '4ef05b60-1b56-5dc2-9683-49f5ff5ac65a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 796: Velanthavalam (Vellamthavalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d3cfba06-ea3b-5ba6-b17d-ebb4cf849e5f', '00000000-0000-0000-0000-000000000000', 'st796@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st796@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d3cfba06-ea3b-5ba6-b17d-ebb4cf849e5f', 'd3cfba06-ea3b-5ba6-b17d-ebb4cf849e5f', '{"sub": "d3cfba06-ea3b-5ba6-b17d-ebb4cf849e5f", "email": "st796@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd3cfba06-ea3b-5ba6-b17d-ebb4cf849e5f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d3cfba06-ea3b-5ba6-b17d-ebb4cf849e5f', 'admin', 'st796@boss.com', 'Admin Velanthavalam', 'Velanthavalam', 'Velanthavalam, Vellamthavalam, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('790f2be2-96cd-518a-917e-f034cdaf5e4c', 'd3cfba06-ea3b-5ba6-b17d-ebb4cf849e5f', 'Velanthavalam', 'Velanthavalam, Vellamthavalam, Kerala, India', 10.80936299, 76.84632159, 'India EV Network License', 'LIC-IN-ST796', 500.0, 7.4, true, 'Vellamthavalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '790f2be2-96cd-518a-917e-f034cdaf5e4c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e9a95942-c576-5d34-ab89-6d84d5c4838d', '790f2be2-96cd-518a-917e-f034cdaf5e4c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 797: Flash Charge EVCS - ChargeMOD (Kanjikkode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4233ae3c-3653-5f7e-acbe-62e6f35f0590', '00000000-0000-0000-0000-000000000000', 'st797@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st797@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4233ae3c-3653-5f7e-acbe-62e6f35f0590', '4233ae3c-3653-5f7e-acbe-62e6f35f0590', '{"sub": "4233ae3c-3653-5f7e-acbe-62e6f35f0590", "email": "st797@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4233ae3c-3653-5f7e-acbe-62e6f35f0590')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4233ae3c-3653-5f7e-acbe-62e6f35f0590', 'admin', 'st797@boss.com', 'Admin Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD, Kanjikkode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e74ae458-9617-5dc9-b941-7b0e72e4880f', '4233ae3c-3653-5f7e-acbe-62e6f35f0590', 'Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD, Kanjikkode, Kerala, India', 10.80227998, 76.78520299, 'India EV Network License', 'LIC-IN-ST797', 500.0, 30.0, true, 'Kanjikkode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e74ae458-9617-5dc9-b941-7b0e72e4880f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('74cab7d8-dede-595b-b1ef-85e713faf523', 'e74ae458-9617-5dc9-b941-7b0e72e4880f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 798: Electrica EVCS - ChargeMOD (Palakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('82b5fb64-8d10-5a7c-8a3c-566bb2db9d13', '00000000-0000-0000-0000-000000000000', 'st798@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st798@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('82b5fb64-8d10-5a7c-8a3c-566bb2db9d13', '82b5fb64-8d10-5a7c-8a3c-566bb2db9d13', '{"sub": "82b5fb64-8d10-5a7c-8a3c-566bb2db9d13", "email": "st798@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '82b5fb64-8d10-5a7c-8a3c-566bb2db9d13')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('82b5fb64-8d10-5a7c-8a3c-566bb2db9d13', 'admin', 'st798@boss.com', 'Admin Electrica EVCS - ChargeMOD', 'Electrica EVCS - ChargeMOD', 'Electrica EVCS - ChargeMOD, Palakkad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e4474458-5389-5f60-b4e4-82fad731bb00', '82b5fb64-8d10-5a7c-8a3c-566bb2db9d13', 'Electrica EVCS - ChargeMOD', 'Electrica EVCS - ChargeMOD, Palakkad, Kerala, India', 10.78535486, 76.60395568, 'India EV Network License', 'LIC-IN-ST798', 500.0, 30.0, true, 'Palakkad', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e4474458-5389-5f60-b4e4-82fad731bb00';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('51a09606-cfd2-5e1c-bd9e-ebc5fd3e9da5', 'e4474458-5389-5f60-b4e4-82fad731bb00', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 799: Sihla Energy - ChargeMOD (Mundur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf500be0-c934-565d-8d43-b238de48516d', '00000000-0000-0000-0000-000000000000', 'st799@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st799@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf500be0-c934-565d-8d43-b238de48516d', 'cf500be0-c934-565d-8d43-b238de48516d', '{"sub": "cf500be0-c934-565d-8d43-b238de48516d", "email": "st799@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf500be0-c934-565d-8d43-b238de48516d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf500be0-c934-565d-8d43-b238de48516d', 'admin', 'st799@boss.com', 'Admin Sihla Energy - ChargeMOD', 'Sihla Energy - ChargeMOD', 'Sihla Energy - ChargeMOD, Mundur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ec37b364-a195-5aa0-adbe-3142c1b7f3c2', 'cf500be0-c934-565d-8d43-b238de48516d', 'Sihla Energy - ChargeMOD', 'Sihla Energy - ChargeMOD, Mundur, Kerala, India', 10.83949185, 76.57999971, 'India EV Network License', 'LIC-IN-ST799', 500.0, 30.0, true, 'Mundur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ec37b364-a195-5aa0-adbe-3142c1b7f3c2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5a52f5ee-4760-5b90-a6f9-f358c1926ff6', 'ec37b364-a195-5aa0-adbe-3142c1b7f3c2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 800: Lakshmi KRS EVCS - ChargeMOD (Sreekrishnapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ab3cec6d-4113-5957-a4c9-843c7dec235d', '00000000-0000-0000-0000-000000000000', 'st800@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st800@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ab3cec6d-4113-5957-a4c9-843c7dec235d', 'ab3cec6d-4113-5957-a4c9-843c7dec235d', '{"sub": "ab3cec6d-4113-5957-a4c9-843c7dec235d", "email": "st800@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ab3cec6d-4113-5957-a4c9-843c7dec235d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ab3cec6d-4113-5957-a4c9-843c7dec235d', 'admin', 'st800@boss.com', 'Admin Lakshmi KRS EVCS - ChargeMOD', 'Lakshmi KRS EVCS - ChargeMOD', 'Lakshmi KRS EVCS - ChargeMOD, Sreekrishnapuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4fbfe322-93b7-55cf-bd57-8e249717b948', 'ab3cec6d-4113-5957-a4c9-843c7dec235d', 'Lakshmi KRS EVCS - ChargeMOD', 'Lakshmi KRS EVCS - ChargeMOD, Sreekrishnapuram, Kerala, India', 10.89808011, 76.39529565, 'India EV Network License', 'LIC-IN-ST800', 500.0, 30.0, true, 'Sreekrishnapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4fbfe322-93b7-55cf-bd57-8e249717b948';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('520b824a-0fe8-5587-ac20-2a33a0e8af43', '4fbfe322-93b7-55cf-bd57-8e249717b948', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
