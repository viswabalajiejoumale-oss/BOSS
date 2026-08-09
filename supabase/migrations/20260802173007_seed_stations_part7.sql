-- Seed Stations Part 7 (Stations 601 to 700)
BEGIN;

-- Station 601: IOCL Sigma Enterprises Charging Station - Tata Power (Valanchery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3ea7a466-f62b-5f53-8e60-1261c00bf8b1', '00000000-0000-0000-0000-000000000000', 'st601@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st601@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3ea7a466-f62b-5f53-8e60-1261c00bf8b1', '3ea7a466-f62b-5f53-8e60-1261c00bf8b1', '{"sub": "3ea7a466-f62b-5f53-8e60-1261c00bf8b1", "email": "st601@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3ea7a466-f62b-5f53-8e60-1261c00bf8b1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3ea7a466-f62b-5f53-8e60-1261c00bf8b1', 'admin', 'st601@boss.com', 'Admin IOCL Sigma Enterprises Charging Station - Tata Power', 'IOCL Sigma Enterprises Charging Station - Tata Power', 'IOCL Sigma Enterprises Charging Station - Tata Power, Valanchery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7a119446-b7c6-5b9f-a162-1b03a7a70b6f', '3ea7a466-f62b-5f53-8e60-1261c00bf8b1', 'IOCL Sigma Enterprises Charging Station - Tata Power', 'IOCL Sigma Enterprises Charging Station - Tata Power, Valanchery, Kerala, India', 10.89791419, 76.06100967, 'India EV Network License', 'LIC-IN-ST601', 500.0, 60.0, true, 'Valanchery', 'Kerala', 2, 'Tata Power', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7a119446-b7c6-5b9f-a162-1b03a7a70b6f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2ab7a9d3-6802-511c-bc00-805e29cfff02', '7a119446-b7c6-5b9f-a162-1b03a7a70b6f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('866b0d3d-b717-50a6-8f5b-9d3f5f2c6def', '7a119446-b7c6-5b9f-a162-1b03a7a70b6f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 602: AAK Mall (Tirur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('044e3efe-b8df-558f-bad8-b9a6236ad757', '00000000-0000-0000-0000-000000000000', 'st602@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st602@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('044e3efe-b8df-558f-bad8-b9a6236ad757', '044e3efe-b8df-558f-bad8-b9a6236ad757', '{"sub": "044e3efe-b8df-558f-bad8-b9a6236ad757", "email": "st602@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '044e3efe-b8df-558f-bad8-b9a6236ad757')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('044e3efe-b8df-558f-bad8-b9a6236ad757', 'admin', 'st602@boss.com', 'Admin AAK Mall', 'AAK Mall', 'AAK Mall, Tirur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ca4503b8-c007-51a9-9a5f-abce4853831f', '044e3efe-b8df-558f-bad8-b9a6236ad757', 'AAK Mall', 'AAK Mall, Tirur, Kerala, India', 10.91858061, 75.91779833, 'India EV Network License', 'LIC-IN-ST602', 500.0, 7.4, true, 'Tirur', 'Kerala', 1, 'Tata Power', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ca4503b8-c007-51a9-9a5f-abce4853831f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c4ecd793-e4bf-5b6b-9d08-c0bd434503d3', 'ca4503b8-c007-51a9-9a5f-abce4853831f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 603: Tata.ev Store Malappuram (Malappuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('de851c13-b653-5604-a445-b8f012ee4c5c', '00000000-0000-0000-0000-000000000000', 'st603@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st603@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('de851c13-b653-5604-a445-b8f012ee4c5c', 'de851c13-b653-5604-a445-b8f012ee4c5c', '{"sub": "de851c13-b653-5604-a445-b8f012ee4c5c", "email": "st603@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'de851c13-b653-5604-a445-b8f012ee4c5c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('de851c13-b653-5604-a445-b8f012ee4c5c', 'admin', 'st603@boss.com', 'Admin Tata.ev Store Malappuram', 'Tata.ev Store Malappuram', 'Tata.ev Store Malappuram, Malappuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('86fcf0b4-1894-5516-94c7-56a1591480aa', 'de851c13-b653-5604-a445-b8f012ee4c5c', 'Tata.ev Store Malappuram', 'Tata.ev Store Malappuram, Malappuram, Kerala, India', 11.05251525, 76.07764045, 'India EV Network License', 'LIC-IN-ST603', 500.0, 60.0, true, 'Malappuram', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '86fcf0b4-1894-5516-94c7-56a1591480aa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ec4d9e61-bd45-5e79-8c68-4306e046cf6e', '86fcf0b4-1894-5516-94c7-56a1591480aa', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0c1a23a0-1113-505b-b445-1cc68386d555', '86fcf0b4-1894-5516-94c7-56a1591480aa', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 604: A M Tyres Malappuram - Tata Power (Malappuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f7d566d5-a98c-58b1-b6d1-742151a968fa', '00000000-0000-0000-0000-000000000000', 'st604@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st604@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f7d566d5-a98c-58b1-b6d1-742151a968fa', 'f7d566d5-a98c-58b1-b6d1-742151a968fa', '{"sub": "f7d566d5-a98c-58b1-b6d1-742151a968fa", "email": "st604@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f7d566d5-a98c-58b1-b6d1-742151a968fa')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f7d566d5-a98c-58b1-b6d1-742151a968fa', 'admin', 'st604@boss.com', 'Admin A M Tyres Malappuram - Tata Power', 'A M Tyres Malappuram - Tata Power', 'A M Tyres Malappuram - Tata Power, Malappuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f00f1300-c092-577d-b60b-fe741edcc039', 'f7d566d5-a98c-58b1-b6d1-742151a968fa', 'A M Tyres Malappuram - Tata Power', 'A M Tyres Malappuram - Tata Power, Malappuram, Kerala, India', 11.06040253, 76.08084416, 'India EV Network License', 'LIC-IN-ST604', 500.0, 60.0, true, 'Malappuram', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f00f1300-c092-577d-b60b-fe741edcc039';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c8c7418c-4e97-5865-9018-7d6cd29cbb83', 'f00f1300-c092-577d-b60b-fe741edcc039', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a0023cf4-3a2c-568c-ba91-77c991a25ac6', 'f00f1300-c092-577d-b60b-fe741edcc039', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 605: Hotel Gokulam Relax Park (Manjeri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2af64634-376f-5b8b-ad68-203c066d0785', '00000000-0000-0000-0000-000000000000', 'st605@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st605@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2af64634-376f-5b8b-ad68-203c066d0785', '2af64634-376f-5b8b-ad68-203c066d0785', '{"sub": "2af64634-376f-5b8b-ad68-203c066d0785", "email": "st605@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2af64634-376f-5b8b-ad68-203c066d0785')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2af64634-376f-5b8b-ad68-203c066d0785', 'admin', 'st605@boss.com', 'Admin Hotel Gokulam Relax Park', 'Hotel Gokulam Relax Park', 'Hotel Gokulam Relax Park, Manjeri, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('258aa7aa-ea62-50f8-8f8d-2f0c7c0f825a', '2af64634-376f-5b8b-ad68-203c066d0785', 'Hotel Gokulam Relax Park', 'Hotel Gokulam Relax Park, Manjeri, Kerala, India', 11.11890611, 76.11847374, 'India EV Network License', 'LIC-IN-ST605', 500.0, 7.4, true, 'Manjeri', 'Kerala', 1, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '258aa7aa-ea62-50f8-8f8d-2f0c7c0f825a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9073e214-30bc-5218-8790-da839ac2997d', '258aa7aa-ea62-50f8-8f8d-2f0c7c0f825a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 606: One Stop Automotive Cahrging Station - Tata Power (Edavanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ae43e6f7-403e-51c8-8367-7b5e9088a258', '00000000-0000-0000-0000-000000000000', 'st606@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st606@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ae43e6f7-403e-51c8-8367-7b5e9088a258', 'ae43e6f7-403e-51c8-8367-7b5e9088a258', '{"sub": "ae43e6f7-403e-51c8-8367-7b5e9088a258", "email": "st606@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ae43e6f7-403e-51c8-8367-7b5e9088a258')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ae43e6f7-403e-51c8-8367-7b5e9088a258', 'admin', 'st606@boss.com', 'Admin One Stop Automotive Cahrging Station - Tata Power', 'One Stop Automotive Cahrging Station - Tata Power', 'One Stop Automotive Cahrging Station - Tata Power, Edavanna, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ca02ea40-c22f-5128-a6fb-3fd892f8a4a6', 'ae43e6f7-403e-51c8-8367-7b5e9088a258', 'One Stop Automotive Cahrging Station - Tata Power', 'One Stop Automotive Cahrging Station - Tata Power, Edavanna, Kerala, India', 11.2041462, 76.13673353, 'India EV Network License', 'LIC-IN-ST606', 500.0, 60.0, true, 'Edavanna', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ca02ea40-c22f-5128-a6fb-3fd892f8a4a6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('997b88a7-bb9c-596a-a138-487eeb6ca78a', 'ca02ea40-c22f-5128-a6fb-3fd892f8a4a6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dc413a44-ccd8-5ca0-acf1-d5a17e965012', 'ca02ea40-c22f-5128-a6fb-3fd892f8a4a6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 607: Moto Town Auto Hub - Tata Power (Wandoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('303221ed-a20a-5a2c-a6f6-c1f2eca60219', '00000000-0000-0000-0000-000000000000', 'st607@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st607@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('303221ed-a20a-5a2c-a6f6-c1f2eca60219', '303221ed-a20a-5a2c-a6f6-c1f2eca60219', '{"sub": "303221ed-a20a-5a2c-a6f6-c1f2eca60219", "email": "st607@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '303221ed-a20a-5a2c-a6f6-c1f2eca60219')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('303221ed-a20a-5a2c-a6f6-c1f2eca60219', 'admin', 'st607@boss.com', 'Admin Moto Town Auto Hub - Tata Power', 'Moto Town Auto Hub - Tata Power', 'Moto Town Auto Hub - Tata Power, Wandoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('55888289-a3ac-59de-b079-46a761016b65', '303221ed-a20a-5a2c-a6f6-c1f2eca60219', 'Moto Town Auto Hub - Tata Power', 'Moto Town Auto Hub - Tata Power, Wandoor, Kerala, India', 11.2232496, 76.21691525, 'India EV Network License', 'LIC-IN-ST607', 500.0, 60.0, true, 'Wandoor', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '55888289-a3ac-59de-b079-46a761016b65';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('36f718b2-eef0-56a6-a23e-e6017adb402a', '55888289-a3ac-59de-b079-46a761016b65', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a669d35a-cdf1-5112-97ef-394e20c108df', '55888289-a3ac-59de-b079-46a761016b65', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 608: IOCL Aaditya Petroleum Naduvath Charging Station - Tata Power (Wandoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7f876611-3173-5868-aefe-49fc91ec93af', '00000000-0000-0000-0000-000000000000', 'st608@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st608@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7f876611-3173-5868-aefe-49fc91ec93af', '7f876611-3173-5868-aefe-49fc91ec93af', '{"sub": "7f876611-3173-5868-aefe-49fc91ec93af", "email": "st608@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7f876611-3173-5868-aefe-49fc91ec93af')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7f876611-3173-5868-aefe-49fc91ec93af', 'admin', 'st608@boss.com', 'Admin IOCL Aaditya Petroleum Naduvath Charging Station - Tata Power', 'IOCL Aaditya Petroleum Naduvath Charging Station - Tata Power', 'IOCL Aaditya Petroleum Naduvath Charging Station - Tata Power, Wandoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, created_at)
VALUES ('283a8d3a-a181-5784-98cc-df230f8339e4', '7f876611-3173-5868-aefe-49fc91ec93af', 'IOCL Aaditya Petroleum Naduvath Charging Station - Tata Power', 'IOCL Aaditya Petroleum Naduvath Charging Station - Tata Power, Wandoor, Kerala, India', 11.21105437, 76.22468507, 'India EV Network License', 'LIC-IN-ST608', 500.0, 24.0, true, 'Wandoor', 'Kerala', 1, 'Tata Power', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9a3b0910-60ae-5ddd-973b-400ab580b978', '283a8d3a-a181-5784-98cc-df230f8339e4', 'Port A', 50, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO NOTHING;

-- Station 609: Calicut Airport Charging Station - Tata Power (Kondotty, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('598aa276-76ce-5f07-8304-d6e3b199fb58', '00000000-0000-0000-0000-000000000000', 'st609@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st609@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('598aa276-76ce-5f07-8304-d6e3b199fb58', '598aa276-76ce-5f07-8304-d6e3b199fb58', '{"sub": "598aa276-76ce-5f07-8304-d6e3b199fb58", "email": "st609@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '598aa276-76ce-5f07-8304-d6e3b199fb58')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('598aa276-76ce-5f07-8304-d6e3b199fb58', 'admin', 'st609@boss.com', 'Admin Calicut Airport Charging Station - Tata Power', 'Calicut Airport Charging Station - Tata Power', 'Calicut Airport Charging Station - Tata Power, Kondotty, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('18294ff0-645a-54a4-8f50-16b717aa4418', '598aa276-76ce-5f07-8304-d6e3b199fb58', 'Calicut Airport Charging Station - Tata Power', 'Calicut Airport Charging Station - Tata Power, Kondotty, Kerala, India', 11.14029227, 75.94831371, 'India EV Network License', 'LIC-IN-ST609', 500.0, 60.0, true, 'Kondotty', 'Kerala', 2, 'Tata Power', '24 Hours (Airport)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '18294ff0-645a-54a4-8f50-16b717aa4418';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('078dea86-15c5-55c1-8440-f646c0e65d93', '18294ff0-645a-54a4-8f50-16b717aa4418', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('82e3e9c9-749a-5720-93a3-686bb0a89068', '18294ff0-645a-54a4-8f50-16b717aa4418', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 610: TML Marina Motors - Tata Power (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('30ebfcf5-8ff6-53bf-a620-e1b8e9379dae', '00000000-0000-0000-0000-000000000000', 'st610@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st610@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('30ebfcf5-8ff6-53bf-a620-e1b8e9379dae', '30ebfcf5-8ff6-53bf-a620-e1b8e9379dae', '{"sub": "30ebfcf5-8ff6-53bf-a620-e1b8e9379dae", "email": "st610@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '30ebfcf5-8ff6-53bf-a620-e1b8e9379dae')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('30ebfcf5-8ff6-53bf-a620-e1b8e9379dae', 'admin', 'st610@boss.com', 'Admin TML Marina Motors - Tata Power', 'TML Marina Motors - Tata Power', 'TML Marina Motors - Tata Power, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7542934e-615c-5bc9-99a8-3bf2946c6ad1', '30ebfcf5-8ff6-53bf-a620-e1b8e9379dae', 'TML Marina Motors - Tata Power', 'TML Marina Motors - Tata Power, Kozhikode, Kerala, India', 11.21696527, 75.85795106, 'India EV Network License', 'LIC-IN-ST610', 500.0, 60.0, true, 'Kozhikode', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7542934e-615c-5bc9-99a8-3bf2946c6ad1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9c15cfb3-203c-573e-a525-4a3918af2c8e', '7542934e-615c-5bc9-99a8-3bf2946c6ad1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d957b0b0-c96a-5c85-bcac-2db99c95e768', '7542934e-615c-5bc9-99a8-3bf2946c6ad1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 611: Rotana Motors Meenchanda - Tata Power (Meenchanda, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9bd70f68-fe65-52c6-9971-a07c1e9a897f', '00000000-0000-0000-0000-000000000000', 'st611@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st611@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9bd70f68-fe65-52c6-9971-a07c1e9a897f', '9bd70f68-fe65-52c6-9971-a07c1e9a897f', '{"sub": "9bd70f68-fe65-52c6-9971-a07c1e9a897f", "email": "st611@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9bd70f68-fe65-52c6-9971-a07c1e9a897f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9bd70f68-fe65-52c6-9971-a07c1e9a897f', 'admin', 'st611@boss.com', 'Admin Rotana Motors Meenchanda - Tata Power', 'Rotana Motors Meenchanda - Tata Power', 'Rotana Motors Meenchanda - Tata Power, Meenchanda, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1936fff9-c7f2-5bc0-b08d-4bf326fd76e7', '9bd70f68-fe65-52c6-9971-a07c1e9a897f', 'Rotana Motors Meenchanda - Tata Power', 'Rotana Motors Meenchanda - Tata Power, Meenchanda, Kerala, India', 11.21390853, 75.80263211, 'India EV Network License', 'LIC-IN-ST611', 500.0, 60.0, true, 'Meenchanda', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1936fff9-c7f2-5bc0-b08d-4bf326fd76e7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('715b7403-660a-5906-8f82-7d567d9ae6f7', '1936fff9-c7f2-5bc0-b08d-4bf326fd76e7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4f1c574f-7aa1-57bb-b499-590c86a36d00', '1936fff9-c7f2-5bc0-b08d-4bf326fd76e7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 612: IOCL Lakshmi Sales & Service - Tata Power (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('43efd69d-0b77-5e2a-9f1b-654c230f6c77', '00000000-0000-0000-0000-000000000000', 'st612@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st612@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('43efd69d-0b77-5e2a-9f1b-654c230f6c77', '43efd69d-0b77-5e2a-9f1b-654c230f6c77', '{"sub": "43efd69d-0b77-5e2a-9f1b-654c230f6c77", "email": "st612@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '43efd69d-0b77-5e2a-9f1b-654c230f6c77')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('43efd69d-0b77-5e2a-9f1b-654c230f6c77', 'admin', 'st612@boss.com', 'Admin IOCL Lakshmi Sales & Service - Tata Power', 'IOCL Lakshmi Sales & Service - Tata Power', 'IOCL Lakshmi Sales & Service - Tata Power, Kozhikode, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f79cc9ed-353d-5254-8734-1d790a51c1c5', '43efd69d-0b77-5e2a-9f1b-654c230f6c77', 'IOCL Lakshmi Sales & Service - Tata Power', 'IOCL Lakshmi Sales & Service - Tata Power, Kozhikode, Kerala, India', 11.23362686, 75.80323853, 'India EV Network License', 'LIC-IN-ST612', 500.0, 60.0, true, 'Kozhikode', 'Kerala', 2, 'Tata Power', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f79cc9ed-353d-5254-8734-1d790a51c1c5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8de8cb8d-3cea-5993-8b6f-2c0dd6e2eaab', 'f79cc9ed-353d-5254-8734-1d790a51c1c5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5855d5e4-9ac9-517d-bda1-a34b693c6f04', 'f79cc9ed-353d-5254-8734-1d790a51c1c5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 613: Gokulam Galleria Mall - Tata Power (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('39f27542-f0ac-5ef1-8077-eb43a994da11', '00000000-0000-0000-0000-000000000000', 'st613@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st613@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('39f27542-f0ac-5ef1-8077-eb43a994da11', '39f27542-f0ac-5ef1-8077-eb43a994da11', '{"sub": "39f27542-f0ac-5ef1-8077-eb43a994da11", "email": "st613@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '39f27542-f0ac-5ef1-8077-eb43a994da11')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('39f27542-f0ac-5ef1-8077-eb43a994da11', 'admin', 'st613@boss.com', 'Admin Gokulam Galleria Mall - Tata Power', 'Gokulam Galleria Mall - Tata Power', 'Gokulam Galleria Mall - Tata Power, Kozhikode, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('077bd58d-75f1-5ec0-9883-a123b0c2ce7e', '39f27542-f0ac-5ef1-8077-eb43a994da11', 'Gokulam Galleria Mall - Tata Power', 'Gokulam Galleria Mall - Tata Power, Kozhikode, Kerala, India', 11.25846513, 75.79290612, 'India EV Network License', 'LIC-IN-ST613', 500.0, 60.0, true, 'Kozhikode', 'Kerala', 2, 'Tata Power', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '077bd58d-75f1-5ec0-9883-a123b0c2ce7e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('09d62002-9254-5556-a370-5eb8981febb3', '077bd58d-75f1-5ec0-9883-a123b0c2ce7e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9e401a50-f372-521d-a412-34cff4b35f01', '077bd58d-75f1-5ec0-9883-a123b0c2ce7e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 614: Hotel Hyson Heritage - Tata Power (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ed8f79de-6f06-50fd-8921-7c5bab64d70e', '00000000-0000-0000-0000-000000000000', 'st614@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st614@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ed8f79de-6f06-50fd-8921-7c5bab64d70e', 'ed8f79de-6f06-50fd-8921-7c5bab64d70e', '{"sub": "ed8f79de-6f06-50fd-8921-7c5bab64d70e", "email": "st614@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ed8f79de-6f06-50fd-8921-7c5bab64d70e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ed8f79de-6f06-50fd-8921-7c5bab64d70e', 'admin', 'st614@boss.com', 'Admin Hotel Hyson Heritage - Tata Power', 'Hotel Hyson Heritage - Tata Power', 'Hotel Hyson Heritage - Tata Power, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('70adbac2-84b4-50cb-8d7c-0d3d386e54b1', 'ed8f79de-6f06-50fd-8921-7c5bab64d70e', 'Hotel Hyson Heritage - Tata Power', 'Hotel Hyson Heritage - Tata Power, Kozhikode, Kerala, India', 11.2592145, 75.77933452, 'India EV Network License', 'LIC-IN-ST614', 500.0, 60.0, true, 'Kozhikode', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '70adbac2-84b4-50cb-8d7c-0d3d386e54b1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9f73ad7e-b127-515b-b55e-09edfd4ef6a5', '70adbac2-84b4-50cb-8d7c-0d3d386e54b1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('25d8c353-2730-558c-9b56-bafa500e955b', '70adbac2-84b4-50cb-8d7c-0d3d386e54b1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 615: Taj The Gateway Hotel - Tata Power (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a4cb41f7-5fbc-5215-8214-29bb19479a42', '00000000-0000-0000-0000-000000000000', 'st615@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st615@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a4cb41f7-5fbc-5215-8214-29bb19479a42', 'a4cb41f7-5fbc-5215-8214-29bb19479a42', '{"sub": "a4cb41f7-5fbc-5215-8214-29bb19479a42", "email": "st615@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a4cb41f7-5fbc-5215-8214-29bb19479a42')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a4cb41f7-5fbc-5215-8214-29bb19479a42', 'admin', 'st615@boss.com', 'Admin Taj The Gateway Hotel - Tata Power', 'Taj The Gateway Hotel - Tata Power', 'Taj The Gateway Hotel - Tata Power, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ea9662b5-abda-5d45-b76b-806e7e709a38', 'a4cb41f7-5fbc-5215-8214-29bb19479a42', 'Taj The Gateway Hotel - Tata Power', 'Taj The Gateway Hotel - Tata Power, Kozhikode, Kerala, India', 11.25868982, 75.77397871, 'India EV Network License', 'LIC-IN-ST615', 500.0, 60.0, true, 'Kozhikode', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ea9662b5-abda-5d45-b76b-806e7e709a38';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ba1a20d8-1555-5275-8723-b27f0bc86107', 'ea9662b5-abda-5d45-b76b-806e7e709a38', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('40910020-db8f-5a34-adbe-6c172bf66b9c', 'ea9662b5-abda-5d45-b76b-806e7e709a38', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 616: Taj The Gateway Hotel - Tata Power (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3389e2df-c7e0-5b33-aa1e-f836af787c71', '00000000-0000-0000-0000-000000000000', 'st616@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st616@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3389e2df-c7e0-5b33-aa1e-f836af787c71', '3389e2df-c7e0-5b33-aa1e-f836af787c71', '{"sub": "3389e2df-c7e0-5b33-aa1e-f836af787c71", "email": "st616@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3389e2df-c7e0-5b33-aa1e-f836af787c71')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3389e2df-c7e0-5b33-aa1e-f836af787c71', 'admin', 'st616@boss.com', 'Admin Taj The Gateway Hotel - Tata Power', 'Taj The Gateway Hotel - Tata Power', 'Taj The Gateway Hotel - Tata Power, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('55216b16-9a24-5b5a-83c7-e3760f24dfc5', '3389e2df-c7e0-5b33-aa1e-f836af787c71', 'Taj The Gateway Hotel - Tata Power', 'Taj The Gateway Hotel - Tata Power, Kozhikode, Kerala, India', 11.25902905, 75.77370839, 'India EV Network License', 'LIC-IN-ST616', 500.0, 60.0, true, 'Kozhikode', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '55216b16-9a24-5b5a-83c7-e3760f24dfc5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3269805d-041b-5f46-a9d4-e566153e8595', '55216b16-9a24-5b5a-83c7-e3760f24dfc5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('63f7987a-1ac7-5402-8fd4-dd45f8f8e516', '55216b16-9a24-5b5a-83c7-e3760f24dfc5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 617: IOCL Engapuzha Fuel - Tata Power (Engapuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6d611979-82f2-5f81-b647-b8edc93cda43', '00000000-0000-0000-0000-000000000000', 'st617@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st617@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6d611979-82f2-5f81-b647-b8edc93cda43', '6d611979-82f2-5f81-b647-b8edc93cda43', '{"sub": "6d611979-82f2-5f81-b647-b8edc93cda43", "email": "st617@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6d611979-82f2-5f81-b647-b8edc93cda43')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6d611979-82f2-5f81-b647-b8edc93cda43', 'admin', 'st617@boss.com', 'Admin IOCL Engapuzha Fuel - Tata Power', 'IOCL Engapuzha Fuel - Tata Power', 'IOCL Engapuzha Fuel - Tata Power, Engapuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9388cb77-9ac6-5d85-b965-79b4219ed68e', '6d611979-82f2-5f81-b647-b8edc93cda43', 'IOCL Engapuzha Fuel - Tata Power', 'IOCL Engapuzha Fuel - Tata Power, Engapuzha, Kerala, India', 11.46505013, 75.9701747, 'India EV Network License', 'LIC-IN-ST617', 500.0, 60.0, true, 'Engapuzha', 'Kerala', 2, 'Tata Power', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9388cb77-9ac6-5d85-b965-79b4219ed68e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7ba48dbb-41ba-508a-8723-2e40f9f01242', '9388cb77-9ac6-5d85-b965-79b4219ed68e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ac6d82e5-61d6-5531-a38b-352daf793516', '9388cb77-9ac6-5d85-b965-79b4219ed68e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 618: IOCl Balaji Petroleum - Tata Power (Sulthan Bathery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c022e452-3742-534d-af9a-78a7c0dd2189', '00000000-0000-0000-0000-000000000000', 'st618@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st618@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c022e452-3742-534d-af9a-78a7c0dd2189', 'c022e452-3742-534d-af9a-78a7c0dd2189', '{"sub": "c022e452-3742-534d-af9a-78a7c0dd2189", "email": "st618@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c022e452-3742-534d-af9a-78a7c0dd2189')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c022e452-3742-534d-af9a-78a7c0dd2189', 'admin', 'st618@boss.com', 'Admin IOCl Balaji Petroleum - Tata Power', 'IOCl Balaji Petroleum - Tata Power', 'IOCl Balaji Petroleum - Tata Power, Sulthan Bathery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('855ccfd0-5b2f-5763-af50-29c7eb156504', 'c022e452-3742-534d-af9a-78a7c0dd2189', 'IOCl Balaji Petroleum - Tata Power', 'IOCl Balaji Petroleum - Tata Power, Sulthan Bathery, Kerala, India', 11.66094302, 76.24002282, 'India EV Network License', 'LIC-IN-ST618', 500.0, 60.0, true, 'Sulthan Bathery', 'Kerala', 2, 'Tata Power', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '855ccfd0-5b2f-5763-af50-29c7eb156504';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('adc61150-61f3-5cf2-9e08-f2efed658e65', '855ccfd0-5b2f-5763-af50-29c7eb156504', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b3912442-5da5-5ecb-91b0-c509df71e93e', '855ccfd0-5b2f-5763-af50-29c7eb156504', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 619: Hotel Saugandhika Charging Station - Tata Power (Meenangadi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6700b5ee-c24d-5289-a3bc-3b0d913a5381', '00000000-0000-0000-0000-000000000000', 'st619@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st619@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6700b5ee-c24d-5289-a3bc-3b0d913a5381', '6700b5ee-c24d-5289-a3bc-3b0d913a5381', '{"sub": "6700b5ee-c24d-5289-a3bc-3b0d913a5381", "email": "st619@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6700b5ee-c24d-5289-a3bc-3b0d913a5381')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6700b5ee-c24d-5289-a3bc-3b0d913a5381', 'admin', 'st619@boss.com', 'Admin Hotel Saugandhika Charging Station - Tata Power', 'Hotel Saugandhika Charging Station - Tata Power', 'Hotel Saugandhika Charging Station - Tata Power, Meenangadi, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('735e2db8-e13e-59c9-96d4-b817005ae1a3', '6700b5ee-c24d-5289-a3bc-3b0d913a5381', 'Hotel Saugandhika Charging Station - Tata Power', 'Hotel Saugandhika Charging Station - Tata Power, Meenangadi, Kerala, India', 11.65932826, 76.20718523, 'India EV Network License', 'LIC-IN-ST619', 500.0, 60.0, true, 'Meenangadi', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '735e2db8-e13e-59c9-96d4-b817005ae1a3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c688601c-c36c-58cd-a0fb-8a69686c3100', '735e2db8-e13e-59c9-96d4-b817005ae1a3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e3cfbd9a-b206-54ac-9a0d-404a0c737a03', '735e2db8-e13e-59c9-96d4-b817005ae1a3', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 620: TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power (Kalpetta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d8c5fbbd-13fc-5dd5-b915-c21a7f8f62e3', '00000000-0000-0000-0000-000000000000', 'st620@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st620@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d8c5fbbd-13fc-5dd5-b915-c21a7f8f62e3', 'd8c5fbbd-13fc-5dd5-b915-c21a7f8f62e3', '{"sub": "d8c5fbbd-13fc-5dd5-b915-c21a7f8f62e3", "email": "st620@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd8c5fbbd-13fc-5dd5-b915-c21a7f8f62e3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d8c5fbbd-13fc-5dd5-b915-c21a7f8f62e3', 'admin', 'st620@boss.com', 'Admin TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power', 'TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power', 'TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power, Kalpetta, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e4d654d2-8e1c-525c-9cac-426057107cdc', 'd8c5fbbd-13fc-5dd5-b915-c21a7f8f62e3', 'TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power', 'TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power, Kalpetta, Kerala, India', 11.63735277, 76.09468538, 'India EV Network License', 'LIC-IN-ST620', 500.0, 60.0, true, 'Kalpetta', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e4d654d2-8e1c-525c-9cac-426057107cdc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f73a1f27-2fa8-5f1d-a653-d8c151566e4a', 'e4d654d2-8e1c-525c-9cac-426057107cdc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('55792700-f0e9-52bc-92cc-b67f80dd41d1', 'e4d654d2-8e1c-525c-9cac-426057107cdc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 621: Taj Wayanad Resort and Spa- Tata Power (Padinjarathara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f0ab8ed7-9aa2-5efa-a139-cc86540b7dfd', '00000000-0000-0000-0000-000000000000', 'st621@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st621@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f0ab8ed7-9aa2-5efa-a139-cc86540b7dfd', 'f0ab8ed7-9aa2-5efa-a139-cc86540b7dfd', '{"sub": "f0ab8ed7-9aa2-5efa-a139-cc86540b7dfd", "email": "st621@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f0ab8ed7-9aa2-5efa-a139-cc86540b7dfd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f0ab8ed7-9aa2-5efa-a139-cc86540b7dfd', 'admin', 'st621@boss.com', 'Admin Taj Wayanad Resort and Spa- Tata Power', 'Taj Wayanad Resort and Spa- Tata Power', 'Taj Wayanad Resort and Spa- Tata Power, Padinjarathara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('de91701a-235e-5671-b91a-39c33befaba9', 'f0ab8ed7-9aa2-5efa-a139-cc86540b7dfd', 'Taj Wayanad Resort and Spa- Tata Power', 'Taj Wayanad Resort and Spa- Tata Power, Padinjarathara, Kerala, India', 11.65763336, 75.96043178, 'India EV Network License', 'LIC-IN-ST621', 500.0, 60.0, true, 'Padinjarathara', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'de91701a-235e-5671-b91a-39c33befaba9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f08ef89f-d48f-5052-8811-9edf1a0e1246', 'de91701a-235e-5671-b91a-39c33befaba9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a7b5ec9b-5a18-5b48-b54d-9dd565cab212', 'de91701a-235e-5671-b91a-39c33befaba9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 622: KVR Dream Vehicles Thalassery - Tata Power (Thalassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('09ab255d-b09d-57d5-b514-3693234fc0a8', '00000000-0000-0000-0000-000000000000', 'st622@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st622@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('09ab255d-b09d-57d5-b514-3693234fc0a8', '09ab255d-b09d-57d5-b514-3693234fc0a8', '{"sub": "09ab255d-b09d-57d5-b514-3693234fc0a8", "email": "st622@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '09ab255d-b09d-57d5-b514-3693234fc0a8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('09ab255d-b09d-57d5-b514-3693234fc0a8', 'admin', 'st622@boss.com', 'Admin KVR Dream Vehicles Thalassery - Tata Power', 'KVR Dream Vehicles Thalassery - Tata Power', 'KVR Dream Vehicles Thalassery - Tata Power, Thalassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('03b614d4-4ef3-545d-9fd5-a1446efcba45', '09ab255d-b09d-57d5-b514-3693234fc0a8', 'KVR Dream Vehicles Thalassery - Tata Power', 'KVR Dream Vehicles Thalassery - Tata Power, Thalassery, Kerala, India', 11.76173425, 75.50906838, 'India EV Network License', 'LIC-IN-ST622', 500.0, 60.0, true, 'Thalassery', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '03b614d4-4ef3-545d-9fd5-a1446efcba45';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('794eca62-73c1-526d-aa1e-2911e4f4d971', '03b614d4-4ef3-545d-9fd5-a1446efcba45', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0af3c55d-8f94-5fc0-bdca-6b86f05cb39d', '03b614d4-4ef3-545d-9fd5-a1446efcba45', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 623: IOCL - MK Petroleum - Tata Power (Thazhe Chovva, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('00b43bd6-c2ca-5cae-ac76-30b7afb481d0', '00000000-0000-0000-0000-000000000000', 'st623@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st623@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('00b43bd6-c2ca-5cae-ac76-30b7afb481d0', '00b43bd6-c2ca-5cae-ac76-30b7afb481d0', '{"sub": "00b43bd6-c2ca-5cae-ac76-30b7afb481d0", "email": "st623@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '00b43bd6-c2ca-5cae-ac76-30b7afb481d0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('00b43bd6-c2ca-5cae-ac76-30b7afb481d0', 'admin', 'st623@boss.com', 'Admin IOCL - MK Petroleum - Tata Power', 'IOCL - MK Petroleum - Tata Power', 'IOCL - MK Petroleum - Tata Power, Thazhe Chovva, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7cd2e8f8-2af2-57f9-938f-305935252d58', '00b43bd6-c2ca-5cae-ac76-30b7afb481d0', 'IOCL - MK Petroleum - Tata Power', 'IOCL - MK Petroleum - Tata Power, Thazhe Chovva, Kerala, India', 11.86015018, 75.41434122, 'India EV Network License', 'LIC-IN-ST623', 500.0, 60.0, true, 'Thazhe Chovva', 'Kerala', 2, 'Tata Power', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7cd2e8f8-2af2-57f9-938f-305935252d58';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b1bb77b0-d2f9-5c7a-956c-e95d2be97cbb', '7cd2e8f8-2af2-57f9-938f-305935252d58', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('273b9b66-5bcb-5904-9ccf-153437490676', '7cd2e8f8-2af2-57f9-938f-305935252d58', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 624: KVR Dream Vehicles Service Centre - Tata Power (Iritty, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1b9f26fa-38ca-50c2-a74f-85032619b459', '00000000-0000-0000-0000-000000000000', 'st624@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st624@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1b9f26fa-38ca-50c2-a74f-85032619b459', '1b9f26fa-38ca-50c2-a74f-85032619b459', '{"sub": "1b9f26fa-38ca-50c2-a74f-85032619b459", "email": "st624@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1b9f26fa-38ca-50c2-a74f-85032619b459')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1b9f26fa-38ca-50c2-a74f-85032619b459', 'admin', 'st624@boss.com', 'Admin KVR Dream Vehicles Service Centre - Tata Power', 'KVR Dream Vehicles Service Centre - Tata Power', 'KVR Dream Vehicles Service Centre - Tata Power, Iritty, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('47d6e989-dfcd-52c3-881c-c52fbb4f2fb9', '1b9f26fa-38ca-50c2-a74f-85032619b459', 'KVR Dream Vehicles Service Centre - Tata Power', 'KVR Dream Vehicles Service Centre - Tata Power, Iritty, Kerala, India', 11.99068592, 75.65802183, 'India EV Network License', 'LIC-IN-ST624', 500.0, 60.0, true, 'Iritty', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '47d6e989-dfcd-52c3-881c-c52fbb4f2fb9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a9b4f50c-bbac-5b75-916f-71c1d121910c', '47d6e989-dfcd-52c3-881c-c52fbb4f2fb9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('48f92684-d4b5-5f52-af82-3c0b22f92621', '47d6e989-dfcd-52c3-881c-c52fbb4f2fb9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 625: KVR Dream Vehicle - Tata Power (Nadal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eaff6259-dbec-5639-9b68-0dd3d2cfcef7', '00000000-0000-0000-0000-000000000000', 'st625@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st625@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eaff6259-dbec-5639-9b68-0dd3d2cfcef7', 'eaff6259-dbec-5639-9b68-0dd3d2cfcef7', '{"sub": "eaff6259-dbec-5639-9b68-0dd3d2cfcef7", "email": "st625@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eaff6259-dbec-5639-9b68-0dd3d2cfcef7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eaff6259-dbec-5639-9b68-0dd3d2cfcef7', 'admin', 'st625@boss.com', 'Admin KVR Dream Vehicle - Tata Power', 'KVR Dream Vehicle - Tata Power', 'KVR Dream Vehicle - Tata Power, Nadal, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('defef5fa-94c7-5ccf-be02-76acf26be043', 'eaff6259-dbec-5639-9b68-0dd3d2cfcef7', 'KVR Dream Vehicle - Tata Power', 'KVR Dream Vehicle - Tata Power, Nadal, Kerala, India', 11.83285672, 75.4264417, 'India EV Network License', 'LIC-IN-ST625', 500.0, 60.0, true, 'Nadal', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'defef5fa-94c7-5ccf-be02-76acf26be043';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5ec207fd-c609-5ae5-89fa-e9462b4cbb6a', 'defef5fa-94c7-5ccf-be02-76acf26be043', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e86180cc-548b-513a-8e73-13698e99e2d9', 'defef5fa-94c7-5ccf-be02-76acf26be043', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 626: Tata.ev KVR Dreams Kannur - Tata Power (Kannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5b5a830d-7dc4-55d0-9af8-3d7457a75d8f', '00000000-0000-0000-0000-000000000000', 'st626@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st626@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5b5a830d-7dc4-55d0-9af8-3d7457a75d8f', '5b5a830d-7dc4-55d0-9af8-3d7457a75d8f', '{"sub": "5b5a830d-7dc4-55d0-9af8-3d7457a75d8f", "email": "st626@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5b5a830d-7dc4-55d0-9af8-3d7457a75d8f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5b5a830d-7dc4-55d0-9af8-3d7457a75d8f', 'admin', 'st626@boss.com', 'Admin Tata.ev KVR Dreams Kannur - Tata Power', 'Tata.ev KVR Dreams Kannur - Tata Power', 'Tata.ev KVR Dreams Kannur - Tata Power, Kannur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7bf2568d-00a7-55ad-bc05-d8aec1811fdb', '5b5a830d-7dc4-55d0-9af8-3d7457a75d8f', 'Tata.ev KVR Dreams Kannur - Tata Power', 'Tata.ev KVR Dreams Kannur - Tata Power, Kannur, Kerala, India', 11.86083034, 75.41186778, 'India EV Network License', 'LIC-IN-ST626', 500.0, 60.0, true, 'Kannur', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7bf2568d-00a7-55ad-bc05-d8aec1811fdb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e05550dc-6900-5c2b-95f4-3fa899985efb', '7bf2568d-00a7-55ad-bc05-d8aec1811fdb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e64b5243-3f76-5697-bda2-23e152454431', '7bf2568d-00a7-55ad-bc05-d8aec1811fdb', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 627: KVR Dream Vehicles Service Center - Tata Power (Payyanur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('753737b8-579f-5771-bae7-be8e3216e1bd', '00000000-0000-0000-0000-000000000000', 'st627@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st627@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('753737b8-579f-5771-bae7-be8e3216e1bd', '753737b8-579f-5771-bae7-be8e3216e1bd', '{"sub": "753737b8-579f-5771-bae7-be8e3216e1bd", "email": "st627@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '753737b8-579f-5771-bae7-be8e3216e1bd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('753737b8-579f-5771-bae7-be8e3216e1bd', 'admin', 'st627@boss.com', 'Admin KVR Dream Vehicles Service Center - Tata Power', 'KVR Dream Vehicles Service Center - Tata Power', 'KVR Dream Vehicles Service Center - Tata Power, Payyanur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b79a4206-9f31-5e38-9520-dd02dfaa76db', '753737b8-579f-5771-bae7-be8e3216e1bd', 'KVR Dream Vehicles Service Center - Tata Power', 'KVR Dream Vehicles Service Center - Tata Power, Payyanur, Kerala, India', 12.12000326, 75.21755451, 'India EV Network License', 'LIC-IN-ST627', 500.0, 60.0, true, 'Payyanur', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b79a4206-9f31-5e38-9520-dd02dfaa76db';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('92ff7360-7f93-5f25-a824-b76ca0214f4f', 'b79a4206-9f31-5e38-9520-dd02dfaa76db', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bfeb349e-bab9-571c-a237-677f1b819331', 'b79a4206-9f31-5e38-9520-dd02dfaa76db', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 628: V-Net Shopping Complex - Tata Power (Payyannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f21659e5-3e75-5ec1-8ee3-a7102ebfdbb3', '00000000-0000-0000-0000-000000000000', 'st628@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st628@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f21659e5-3e75-5ec1-8ee3-a7102ebfdbb3', 'f21659e5-3e75-5ec1-8ee3-a7102ebfdbb3', '{"sub": "f21659e5-3e75-5ec1-8ee3-a7102ebfdbb3", "email": "st628@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f21659e5-3e75-5ec1-8ee3-a7102ebfdbb3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f21659e5-3e75-5ec1-8ee3-a7102ebfdbb3', 'admin', 'st628@boss.com', 'Admin V-Net Shopping Complex - Tata Power', 'V-Net Shopping Complex - Tata Power', 'V-Net Shopping Complex - Tata Power, Payyannur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('df9baa2d-5fa4-5707-88e2-446f563edb61', 'f21659e5-3e75-5ec1-8ee3-a7102ebfdbb3', 'V-Net Shopping Complex - Tata Power', 'V-Net Shopping Complex - Tata Power, Payyannur, Kerala, India', 12.17504848, 75.19343333, 'India EV Network License', 'LIC-IN-ST628', 500.0, 60.0, true, 'Payyannur', 'Kerala', 2, 'Tata Power', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'df9baa2d-5fa4-5707-88e2-446f563edb61';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b7e92998-3a83-5cf7-9c53-1d017b9712ce', 'df9baa2d-5fa4-5707-88e2-446f563edb61', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('da5249ad-7a21-556d-b26d-bc611e51a57b', 'df9baa2d-5fa4-5707-88e2-446f563edb61', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 629: Taj Bekkal - Tata Power (Bekkal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ea87fcde-16c2-5010-98fc-cfe9c2e1f280', '00000000-0000-0000-0000-000000000000', 'st629@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st629@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ea87fcde-16c2-5010-98fc-cfe9c2e1f280', 'ea87fcde-16c2-5010-98fc-cfe9c2e1f280', '{"sub": "ea87fcde-16c2-5010-98fc-cfe9c2e1f280", "email": "st629@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ea87fcde-16c2-5010-98fc-cfe9c2e1f280')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ea87fcde-16c2-5010-98fc-cfe9c2e1f280', 'admin', 'st629@boss.com', 'Admin Taj Bekkal - Tata Power', 'Taj Bekkal - Tata Power', 'Taj Bekkal - Tata Power, Bekkal, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6916b199-4ae5-5159-b979-65fbdd9d2583', 'ea87fcde-16c2-5010-98fc-cfe9c2e1f280', 'Taj Bekkal - Tata Power', 'Taj Bekkal - Tata Power, Bekkal, Kerala, India', 12.42338328, 75.0147548, 'India EV Network License', 'LIC-IN-ST629', 500.0, 60.0, true, 'Bekkal', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6916b199-4ae5-5159-b979-65fbdd9d2583';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ace2ac1c-a311-50b3-b7d2-0b2e66a4e343', '6916b199-4ae5-5159-b979-65fbdd9d2583', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3021da03-0e73-5b7f-a2e9-c534318d9faa', '6916b199-4ae5-5159-b979-65fbdd9d2583', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 630: TML KVR Dream Vehicles EVCS - Tata Power (Kasaragod, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('25a0adfa-c3a6-5201-b8cc-78234a33028d', '00000000-0000-0000-0000-000000000000', 'st630@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st630@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('25a0adfa-c3a6-5201-b8cc-78234a33028d', '25a0adfa-c3a6-5201-b8cc-78234a33028d', '{"sub": "25a0adfa-c3a6-5201-b8cc-78234a33028d", "email": "st630@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '25a0adfa-c3a6-5201-b8cc-78234a33028d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('25a0adfa-c3a6-5201-b8cc-78234a33028d', 'admin', 'st630@boss.com', 'Admin TML KVR Dream Vehicles EVCS - Tata Power', 'TML KVR Dream Vehicles EVCS - Tata Power', 'TML KVR Dream Vehicles EVCS - Tata Power, Kasaragod, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('10b88ee2-eda5-58c1-894a-41f27410848e', '25a0adfa-c3a6-5201-b8cc-78234a33028d', 'TML KVR Dream Vehicles EVCS - Tata Power', 'TML KVR Dream Vehicles EVCS - Tata Power, Kasaragod, Kerala, India', 12.51345441, 75.02712294, 'India EV Network License', 'LIC-IN-ST630', 500.0, 60.0, true, 'Kasaragod', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '10b88ee2-eda5-58c1-894a-41f27410848e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f36b5a43-93c9-5034-a01f-a4629101d0c2', '10b88ee2-eda5-58c1-894a-41f27410848e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cd887110-a4f0-5467-a87a-a88a34325840', '10b88ee2-eda5-58c1-894a-41f27410848e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 631: IOCL Top Fuels Karanthakkad Charging Station - Tata Power (Kasaragod, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b0dbc7e3-9018-567f-a096-cb8c66250f7c', '00000000-0000-0000-0000-000000000000', 'st631@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st631@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b0dbc7e3-9018-567f-a096-cb8c66250f7c', 'b0dbc7e3-9018-567f-a096-cb8c66250f7c', '{"sub": "b0dbc7e3-9018-567f-a096-cb8c66250f7c", "email": "st631@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b0dbc7e3-9018-567f-a096-cb8c66250f7c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b0dbc7e3-9018-567f-a096-cb8c66250f7c', 'admin', 'st631@boss.com', 'Admin IOCL Top Fuels Karanthakkad Charging Station - Tata Power', 'IOCL Top Fuels Karanthakkad Charging Station - Tata Power', 'IOCL Top Fuels Karanthakkad Charging Station - Tata Power, Kasaragod, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('40869433-ed4c-5f63-92c4-cbbd16fd11e2', 'b0dbc7e3-9018-567f-a096-cb8c66250f7c', 'IOCL Top Fuels Karanthakkad Charging Station - Tata Power', 'IOCL Top Fuels Karanthakkad Charging Station - Tata Power, Kasaragod, Kerala, India', 12.5094079, 74.98611114, 'India EV Network License', 'LIC-IN-ST631', 500.0, 60.0, true, 'Kasaragod', 'Kerala', 2, 'Tata Power', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '40869433-ed4c-5f63-92c4-cbbd16fd11e2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f6f5a3d1-58f8-5b6e-ab79-9a19aa426712', '40869433-ed4c-5f63-92c4-cbbd16fd11e2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6efb5534-8cdf-5f18-9c64-ebc9862e3ae3', '40869433-ed4c-5f63-92c4-cbbd16fd11e2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 632: Eco Charge Hub - GO EC (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('49cc6fbb-9640-562e-9349-225edaf0f1de', '00000000-0000-0000-0000-000000000000', 'st632@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st632@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('49cc6fbb-9640-562e-9349-225edaf0f1de', '49cc6fbb-9640-562e-9349-225edaf0f1de', '{"sub": "49cc6fbb-9640-562e-9349-225edaf0f1de", "email": "st632@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '49cc6fbb-9640-562e-9349-225edaf0f1de')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('49cc6fbb-9640-562e-9349-225edaf0f1de', 'admin', 'st632@boss.com', 'Admin Eco Charge Hub - GO EC', 'Eco Charge Hub - GO EC', 'Eco Charge Hub - GO EC, Thiruvananthapuram, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ad5bde7b-31b4-5e39-a2d0-62d85d5cc6dd', '49cc6fbb-9640-562e-9349-225edaf0f1de', 'Eco Charge Hub - GO EC', 'Eco Charge Hub - GO EC, Thiruvananthapuram, Kerala, India', 8.353208648, 77.05379012, 'India EV Network License', 'LIC-IN-ST632', 500.0, 30.0, true, 'Thiruvananthapuram', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ad5bde7b-31b4-5e39-a2d0-62d85d5cc6dd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4dc6202c-7d6c-5bcf-b95b-636cd4bdf80a', 'ad5bde7b-31b4-5e39-a2d0-62d85d5cc6dd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('34123be5-5d5a-51dc-b495-9acc521f91c4', 'ad5bde7b-31b4-5e39-a2d0-62d85d5cc6dd', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 633: Rajco EVCS - GO EC (Neyyattinkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9a82a7bc-d326-57e3-bd3a-7921aa58ee9a', '00000000-0000-0000-0000-000000000000', 'st633@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st633@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9a82a7bc-d326-57e3-bd3a-7921aa58ee9a', '9a82a7bc-d326-57e3-bd3a-7921aa58ee9a', '{"sub": "9a82a7bc-d326-57e3-bd3a-7921aa58ee9a", "email": "st633@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9a82a7bc-d326-57e3-bd3a-7921aa58ee9a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9a82a7bc-d326-57e3-bd3a-7921aa58ee9a', 'admin', 'st633@boss.com', 'Admin Rajco EVCS - GO EC', 'Rajco EVCS - GO EC', 'Rajco EVCS - GO EC, Neyyattinkara, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9e23f050-419c-592f-b530-19a0383a5295', '9a82a7bc-d326-57e3-bd3a-7921aa58ee9a', 'Rajco EVCS - GO EC', 'Rajco EVCS - GO EC, Neyyattinkara, Kerala, India', 8.394252775, 77.08872897, 'India EV Network License', 'LIC-IN-ST633', 500.0, 30.0, true, 'Neyyattinkara', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9e23f050-419c-592f-b530-19a0383a5295';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('350f5956-a8a3-51bf-b989-149efcd14d59', '9e23f050-419c-592f-b530-19a0383a5295', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3f4265ef-bb0d-5f33-ac39-697b3bf63d6c', '9e23f050-419c-592f-b530-19a0383a5295', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 634: Appolo Dimora Hotel EVCS - GO EC (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('03e18d46-69d9-5b1a-a7cb-c46dc135a8d8', '00000000-0000-0000-0000-000000000000', 'st634@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st634@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('03e18d46-69d9-5b1a-a7cb-c46dc135a8d8', '03e18d46-69d9-5b1a-a7cb-c46dc135a8d8', '{"sub": "03e18d46-69d9-5b1a-a7cb-c46dc135a8d8", "email": "st634@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '03e18d46-69d9-5b1a-a7cb-c46dc135a8d8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('03e18d46-69d9-5b1a-a7cb-c46dc135a8d8', 'admin', 'st634@boss.com', 'Admin Appolo Dimora Hotel EVCS - GO EC', 'Appolo Dimora Hotel EVCS - GO EC', 'Appolo Dimora Hotel EVCS - GO EC, Thiruvananthapuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('11ef0d87-102b-5f73-b21d-e1697a763254', '03e18d46-69d9-5b1a-a7cb-c46dc135a8d8', 'Appolo Dimora Hotel EVCS - GO EC', 'Appolo Dimora Hotel EVCS - GO EC, Thiruvananthapuram, Kerala, India', 8.488661007, 76.95075167, 'India EV Network License', 'LIC-IN-ST634', 500.0, 30.0, true, 'Thiruvananthapuram', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '11ef0d87-102b-5f73-b21d-e1697a763254';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('edae59b4-9176-5655-96b3-92fde6c6add1', '11ef0d87-102b-5f73-b21d-e1697a763254', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c876a008-d02c-506c-9905-80d6b36ca5ea', '11ef0d87-102b-5f73-b21d-e1697a763254', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 635: Lulu International Mall EVCS - GO EC (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a38bde56-7f78-504e-adf3-f56a0daf9d88', '00000000-0000-0000-0000-000000000000', 'st635@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st635@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a38bde56-7f78-504e-adf3-f56a0daf9d88', 'a38bde56-7f78-504e-adf3-f56a0daf9d88', '{"sub": "a38bde56-7f78-504e-adf3-f56a0daf9d88", "email": "st635@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a38bde56-7f78-504e-adf3-f56a0daf9d88')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a38bde56-7f78-504e-adf3-f56a0daf9d88', 'admin', 'st635@boss.com', 'Admin Lulu International Mall EVCS - GO EC', 'Lulu International Mall EVCS - GO EC', 'Lulu International Mall EVCS - GO EC, Thiruvananthapuram, Kerala, India', 500.0, 11, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('92ec7fa4-2fee-5d1a-a3a0-04d1956bf232', 'a38bde56-7f78-504e-adf3-f56a0daf9d88', 'Lulu International Mall EVCS - GO EC', 'Lulu International Mall EVCS - GO EC, Thiruvananthapuram, Kerala, India', 8.515262882, 76.89815844, 'India EV Network License', 'LIC-IN-ST635', 500.0, 30.0, true, 'Thiruvananthapuram', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '92ec7fa4-2fee-5d1a-a3a0-04d1956bf232';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f0c40741-9ef8-58ea-ad7d-c002c700c8d1', '92ec7fa4-2fee-5d1a-a3a0-04d1956bf232', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ab3999ba-c8e3-531d-bce4-300868280c12', '92ec7fa4-2fee-5d1a-a3a0-04d1956bf232', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 636: Trivandrum UST Campus EVCS - GO EC (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('48ef1c0b-3ea5-5ccf-a898-6bf696d42259', '00000000-0000-0000-0000-000000000000', 'st636@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st636@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('48ef1c0b-3ea5-5ccf-a898-6bf696d42259', '48ef1c0b-3ea5-5ccf-a898-6bf696d42259', '{"sub": "48ef1c0b-3ea5-5ccf-a898-6bf696d42259", "email": "st636@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '48ef1c0b-3ea5-5ccf-a898-6bf696d42259')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('48ef1c0b-3ea5-5ccf-a898-6bf696d42259', 'admin', 'st636@boss.com', 'Admin Trivandrum UST Campus EVCS - GO EC', 'Trivandrum UST Campus EVCS - GO EC', 'Trivandrum UST Campus EVCS - GO EC, Thiruvananthapuram, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('69626f94-6d9b-50b6-a6bc-5cd6d6473b39', '48ef1c0b-3ea5-5ccf-a898-6bf696d42259', 'Trivandrum UST Campus EVCS - GO EC', 'Trivandrum UST Campus EVCS - GO EC, Thiruvananthapuram, Kerala, India', 8.539993048, 76.884425, 'India EV Network License', 'LIC-IN-ST636', 500.0, 30.0, true, 'Thiruvananthapuram', 'Kerala', 2, 'GO EC (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '69626f94-6d9b-50b6-a6bc-5cd6d6473b39';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('047cf323-5935-589f-a687-8ca3b18d7697', '69626f94-6d9b-50b6-a6bc-5cd6d6473b39', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6cd86959-74b5-5442-a7a2-f127b4533795', '69626f94-6d9b-50b6-a6bc-5cd6d6473b39', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 637: Karthika Residency Hotel EVCS - GO EC (Karette, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('59bf858f-120e-5704-ace9-a73e4ee3edd1', '00000000-0000-0000-0000-000000000000', 'st637@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st637@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('59bf858f-120e-5704-ace9-a73e4ee3edd1', '59bf858f-120e-5704-ace9-a73e4ee3edd1', '{"sub": "59bf858f-120e-5704-ace9-a73e4ee3edd1", "email": "st637@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '59bf858f-120e-5704-ace9-a73e4ee3edd1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('59bf858f-120e-5704-ace9-a73e4ee3edd1', 'admin', 'st637@boss.com', 'Admin Karthika Residency Hotel EVCS - GO EC', 'Karthika Residency Hotel EVCS - GO EC', 'Karthika Residency Hotel EVCS - GO EC, Karette, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fcd08a7b-fb10-5987-9b8f-9daeb01080fb', '59bf858f-120e-5704-ace9-a73e4ee3edd1', 'Karthika Residency Hotel EVCS - GO EC', 'Karthika Residency Hotel EVCS - GO EC, Karette, Kerala, India', 8.728845866, 76.89844751, 'India EV Network License', 'LIC-IN-ST637', 500.0, 30.0, true, 'Karette', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fcd08a7b-fb10-5987-9b8f-9daeb01080fb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4432da89-dec9-5e19-b775-7871c0ef46bf', 'fcd08a7b-fb10-5987-9b8f-9daeb01080fb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('34ace735-d51c-5053-a14a-2256505ab1bd', 'fcd08a7b-fb10-5987-9b8f-9daeb01080fb', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 638: KKP Renewables EVCS - GO EC (Karette, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('17942fe9-565b-5701-bd03-b41ca4307b74', '00000000-0000-0000-0000-000000000000', 'st638@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st638@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('17942fe9-565b-5701-bd03-b41ca4307b74', '17942fe9-565b-5701-bd03-b41ca4307b74', '{"sub": "17942fe9-565b-5701-bd03-b41ca4307b74", "email": "st638@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '17942fe9-565b-5701-bd03-b41ca4307b74')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('17942fe9-565b-5701-bd03-b41ca4307b74', 'admin', 'st638@boss.com', 'Admin KKP Renewables EVCS - GO EC', 'KKP Renewables EVCS - GO EC', 'KKP Renewables EVCS - GO EC, Karette, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('65fb3f82-d696-53f1-99a4-18b18315be8f', '17942fe9-565b-5701-bd03-b41ca4307b74', 'KKP Renewables EVCS - GO EC', 'KKP Renewables EVCS - GO EC, Karette, Kerala, India', 8.734523378, 76.89801647, 'India EV Network License', 'LIC-IN-ST638', 500.0, 30.0, true, 'Karette', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '65fb3f82-d696-53f1-99a4-18b18315be8f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('63e85c41-9048-555f-85c9-610e4be886bf', '65fb3f82-d696-53f1-99a4-18b18315be8f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5502573-463a-52ef-ad0c-762a28f8fc48', '65fb3f82-d696-53f1-99a4-18b18315be8f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 639: Aeron EVCS - GO EC (Attingal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0bc70ecc-1de3-562a-9917-e5e7285b242e', '00000000-0000-0000-0000-000000000000', 'st639@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st639@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0bc70ecc-1de3-562a-9917-e5e7285b242e', '0bc70ecc-1de3-562a-9917-e5e7285b242e', '{"sub": "0bc70ecc-1de3-562a-9917-e5e7285b242e", "email": "st639@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0bc70ecc-1de3-562a-9917-e5e7285b242e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0bc70ecc-1de3-562a-9917-e5e7285b242e', 'admin', 'st639@boss.com', 'Admin Aeron EVCS - GO EC', 'Aeron EVCS - GO EC', 'Aeron EVCS - GO EC, Attingal, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('938e6ca2-1dff-5ca8-9fc5-b19ed86ff559', '0bc70ecc-1de3-562a-9917-e5e7285b242e', 'Aeron EVCS - GO EC', 'Aeron EVCS - GO EC, Attingal, Kerala, India', 8.686808046, 76.82402233, 'India EV Network License', 'LIC-IN-ST639', 500.0, 30.0, true, 'Attingal', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '938e6ca2-1dff-5ca8-9fc5-b19ed86ff559';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('86dff7f8-b614-5fc1-b933-eb39af8fb56f', '938e6ca2-1dff-5ca8-9fc5-b19ed86ff559', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b00bf9c8-b34d-59e7-9022-9bc3d840f128', '938e6ca2-1dff-5ca8-9fc5-b19ed86ff559', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 640: Zenith EVCS - GO EC (Attingal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e3242346-ecb8-5aa6-b052-fec4e895face', '00000000-0000-0000-0000-000000000000', 'st640@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st640@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e3242346-ecb8-5aa6-b052-fec4e895face', 'e3242346-ecb8-5aa6-b052-fec4e895face', '{"sub": "e3242346-ecb8-5aa6-b052-fec4e895face", "email": "st640@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e3242346-ecb8-5aa6-b052-fec4e895face')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e3242346-ecb8-5aa6-b052-fec4e895face', 'admin', 'st640@boss.com', 'Admin Zenith EVCS - GO EC', 'Zenith EVCS - GO EC', 'Zenith EVCS - GO EC, Attingal, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b9bd6fe7-94d2-5fc6-9b84-0cb638517763', 'e3242346-ecb8-5aa6-b052-fec4e895face', 'Zenith EVCS - GO EC', 'Zenith EVCS - GO EC, Attingal, Kerala, India', 8.733067659, 76.81064655, 'India EV Network License', 'LIC-IN-ST640', 500.0, 30.0, true, 'Attingal', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b9bd6fe7-94d2-5fc6-9b84-0cb638517763';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('02f02403-c7e2-559c-a957-a8003934e3f9', 'b9bd6fe7-94d2-5fc6-9b84-0cb638517763', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ebd0c152-87c4-57b5-8bb2-c736b4bf046f', 'b9bd6fe7-94d2-5fc6-9b84-0cb638517763', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 641: Orion Plaza EVCS - GO EC (Chadayamangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('96679242-99ee-5288-b58b-7c970a8348ec', '00000000-0000-0000-0000-000000000000', 'st641@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st641@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('96679242-99ee-5288-b58b-7c970a8348ec', '96679242-99ee-5288-b58b-7c970a8348ec', '{"sub": "96679242-99ee-5288-b58b-7c970a8348ec", "email": "st641@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '96679242-99ee-5288-b58b-7c970a8348ec')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('96679242-99ee-5288-b58b-7c970a8348ec', 'admin', 'st641@boss.com', 'Admin Orion Plaza EVCS - GO EC', 'Orion Plaza EVCS - GO EC', 'Orion Plaza EVCS - GO EC, Chadayamangalam, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4702d10a-2117-5086-ae2a-9fe4693be26b', '96679242-99ee-5288-b58b-7c970a8348ec', 'Orion Plaza EVCS - GO EC', 'Orion Plaza EVCS - GO EC, Chadayamangalam, Kerala, India', 8.86342699, 76.87120784, 'India EV Network License', 'LIC-IN-ST641', 500.0, 30.0, true, 'Chadayamangalam', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4702d10a-2117-5086-ae2a-9fe4693be26b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ccfb74c8-0706-5738-9b8b-a98d2c97288f', '4702d10a-2117-5086-ae2a-9fe4693be26b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2267104c-0b7a-5a26-9c03-cc9d54a29f77', '4702d10a-2117-5086-ae2a-9fe4693be26b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 642: Power Up EVCS - GO EC (Varkala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d629b6fd-56b8-5046-9f9e-23895ae693a2', '00000000-0000-0000-0000-000000000000', 'st642@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st642@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d629b6fd-56b8-5046-9f9e-23895ae693a2', 'd629b6fd-56b8-5046-9f9e-23895ae693a2', '{"sub": "d629b6fd-56b8-5046-9f9e-23895ae693a2", "email": "st642@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd629b6fd-56b8-5046-9f9e-23895ae693a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d629b6fd-56b8-5046-9f9e-23895ae693a2', 'admin', 'st642@boss.com', 'Admin Power Up EVCS - GO EC', 'Power Up EVCS - GO EC', 'Power Up EVCS - GO EC, Varkala, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ff74213c-6051-53ef-a2c6-42b8302641d2', 'd629b6fd-56b8-5046-9f9e-23895ae693a2', 'Power Up EVCS - GO EC', 'Power Up EVCS - GO EC, Varkala, Kerala, India', 8.74908605, 76.70581859, 'India EV Network License', 'LIC-IN-ST642', 500.0, 30.0, true, 'Varkala', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ff74213c-6051-53ef-a2c6-42b8302641d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('94af4211-9729-5ae0-a84b-e3b4319bb57a', 'ff74213c-6051-53ef-a2c6-42b8302641d2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('887053ce-ff8e-5eef-85af-dc1428059897', 'ff74213c-6051-53ef-a2c6-42b8302641d2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 643: Green Planet EVCS - GO EC (Kottarakkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3f2e9691-f6e8-5cdd-857a-6faa6e601b14', '00000000-0000-0000-0000-000000000000', 'st643@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st643@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3f2e9691-f6e8-5cdd-857a-6faa6e601b14', '3f2e9691-f6e8-5cdd-857a-6faa6e601b14', '{"sub": "3f2e9691-f6e8-5cdd-857a-6faa6e601b14", "email": "st643@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3f2e9691-f6e8-5cdd-857a-6faa6e601b14')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3f2e9691-f6e8-5cdd-857a-6faa6e601b14', 'admin', 'st643@boss.com', 'Admin Green Planet EVCS - GO EC', 'Green Planet EVCS - GO EC', 'Green Planet EVCS - GO EC, Kottarakkara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('28fdf8bb-155e-5f2a-9348-a34a9699e6ac', '3f2e9691-f6e8-5cdd-857a-6faa6e601b14', 'Green Planet EVCS - GO EC', 'Green Planet EVCS - GO EC, Kottarakkara, Kerala, India', 8.982143341, 76.80932966, 'India EV Network License', 'LIC-IN-ST643', 500.0, 30.0, true, 'Kottarakkara', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '28fdf8bb-155e-5f2a-9348-a34a9699e6ac';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8f72cd6c-5050-5ab5-b292-3f6b8df86a04', '28fdf8bb-155e-5f2a-9348-a34a9699e6ac', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('568b6ac6-326b-5f97-9448-2be9162283db', '28fdf8bb-155e-5f2a-9348-a34a9699e6ac', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 644: RK EVCS - GO EC (Kundara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('05b61227-dc66-5e91-b766-f709d393de75', '00000000-0000-0000-0000-000000000000', 'st644@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st644@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('05b61227-dc66-5e91-b766-f709d393de75', '05b61227-dc66-5e91-b766-f709d393de75', '{"sub": "05b61227-dc66-5e91-b766-f709d393de75", "email": "st644@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '05b61227-dc66-5e91-b766-f709d393de75')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('05b61227-dc66-5e91-b766-f709d393de75', 'admin', 'st644@boss.com', 'Admin RK EVCS - GO EC', 'RK EVCS - GO EC', 'RK EVCS - GO EC, Kundara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3c9959e2-b6b9-51cf-b030-1417d9b85576', '05b61227-dc66-5e91-b766-f709d393de75', 'RK EVCS - GO EC', 'RK EVCS - GO EC, Kundara, Kerala, India', 8.948246626, 76.64624714, 'India EV Network License', 'LIC-IN-ST644', 500.0, 30.0, true, 'Kundara', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3c9959e2-b6b9-51cf-b030-1417d9b85576';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d5e044db-f2e0-55f5-b948-6a9e5bc69477', '3c9959e2-b6b9-51cf-b030-1417d9b85576', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2b7e354b-96ec-5cb4-8047-f18ce181f43a', '3c9959e2-b6b9-51cf-b030-1417d9b85576', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 645: SK EVCS - GO EC (Pathanapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3c6337e3-228a-5517-b24a-f417b8e9a3ef', '00000000-0000-0000-0000-000000000000', 'st645@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st645@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3c6337e3-228a-5517-b24a-f417b8e9a3ef', '3c6337e3-228a-5517-b24a-f417b8e9a3ef', '{"sub": "3c6337e3-228a-5517-b24a-f417b8e9a3ef", "email": "st645@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3c6337e3-228a-5517-b24a-f417b8e9a3ef')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3c6337e3-228a-5517-b24a-f417b8e9a3ef', 'admin', 'st645@boss.com', 'Admin SK EVCS - GO EC', 'SK EVCS - GO EC', 'SK EVCS - GO EC, Pathanapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b234c28d-7500-5c66-a351-9af9b37ff4ba', '3c6337e3-228a-5517-b24a-f417b8e9a3ef', 'SK EVCS - GO EC', 'SK EVCS - GO EC, Pathanapuram, Kerala, India', 9.070991646, 76.85631123, 'India EV Network License', 'LIC-IN-ST645', 500.0, 30.0, true, 'Pathanapuram', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b234c28d-7500-5c66-a351-9af9b37ff4ba';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('55afa7ce-8ccd-57f7-87fe-ffe7fd25e331', 'b234c28d-7500-5c66-a351-9af9b37ff4ba', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c23a7d8e-81ec-5c38-8b98-7bf5d7a89453', 'b234c28d-7500-5c66-a351-9af9b37ff4ba', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 646: Erathu Motors EVCS - GO EC (Puthoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f4edf25f-6519-55ed-8ed0-a35e480c79ac', '00000000-0000-0000-0000-000000000000', 'st646@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st646@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f4edf25f-6519-55ed-8ed0-a35e480c79ac', 'f4edf25f-6519-55ed-8ed0-a35e480c79ac', '{"sub": "f4edf25f-6519-55ed-8ed0-a35e480c79ac", "email": "st646@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f4edf25f-6519-55ed-8ed0-a35e480c79ac')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f4edf25f-6519-55ed-8ed0-a35e480c79ac', 'admin', 'st646@boss.com', 'Admin Erathu Motors EVCS - GO EC', 'Erathu Motors EVCS - GO EC', 'Erathu Motors EVCS - GO EC, Puthoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('14f195a1-3310-512f-8bb1-49795b9d352a', 'f4edf25f-6519-55ed-8ed0-a35e480c79ac', 'Erathu Motors EVCS - GO EC', 'Erathu Motors EVCS - GO EC, Puthoor, Kerala, India', 9.051367403, 76.70324696, 'India EV Network License', 'LIC-IN-ST646', 500.0, 30.0, true, 'Puthoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '14f195a1-3310-512f-8bb1-49795b9d352a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ab618d93-be91-54c2-bd3a-00b9ab6e60a1', '14f195a1-3310-512f-8bb1-49795b9d352a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('678c2e26-4389-50d8-9d28-392e681a1a1a', '14f195a1-3310-512f-8bb1-49795b9d352a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 647: Vrindavan EVCS - GO EC (Inchakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ce8f654c-b53d-54ae-916c-ca6a2987b7b7', '00000000-0000-0000-0000-000000000000', 'st647@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st647@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ce8f654c-b53d-54ae-916c-ca6a2987b7b7', 'ce8f654c-b53d-54ae-916c-ca6a2987b7b7', '{"sub": "ce8f654c-b53d-54ae-916c-ca6a2987b7b7", "email": "st647@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ce8f654c-b53d-54ae-916c-ca6a2987b7b7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ce8f654c-b53d-54ae-916c-ca6a2987b7b7', 'admin', 'st647@boss.com', 'Admin Vrindavan EVCS - GO EC', 'Vrindavan EVCS - GO EC', 'Vrindavan EVCS - GO EC, Inchakkad, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('59484277-974c-5bfc-bff8-3a02b3511bad', 'ce8f654c-b53d-54ae-916c-ca6a2987b7b7', 'Vrindavan EVCS - GO EC', 'Vrindavan EVCS - GO EC, Inchakkad, Kerala, India', 9.045128433, 76.77360004, 'India EV Network License', 'LIC-IN-ST647', 500.0, 30.0, true, 'Inchakkad', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '59484277-974c-5bfc-bff8-3a02b3511bad';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ee8a2417-66fd-5dde-bf00-e4db0820c316', '59484277-974c-5bfc-bff8-3a02b3511bad', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('706ff9c7-10ba-5cc1-9b10-faae6772f763', '59484277-974c-5bfc-bff8-3a02b3511bad', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 648: JB Power EVCS - GO EC (Adoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6f3ae026-73b5-5bdf-96f9-2b3a94f2d006', '00000000-0000-0000-0000-000000000000', 'st648@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st648@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6f3ae026-73b5-5bdf-96f9-2b3a94f2d006', '6f3ae026-73b5-5bdf-96f9-2b3a94f2d006', '{"sub": "6f3ae026-73b5-5bdf-96f9-2b3a94f2d006", "email": "st648@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6f3ae026-73b5-5bdf-96f9-2b3a94f2d006')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6f3ae026-73b5-5bdf-96f9-2b3a94f2d006', 'admin', 'st648@boss.com', 'Admin JB Power EVCS - GO EC', 'JB Power EVCS - GO EC', 'JB Power EVCS - GO EC, Adoor, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0bb578ff-e5fe-5fbc-916a-593be5c0ea87', '6f3ae026-73b5-5bdf-96f9-2b3a94f2d006', 'JB Power EVCS - GO EC', 'JB Power EVCS - GO EC, Adoor, Kerala, India', 9.116847049, 76.74511188, 'India EV Network License', 'LIC-IN-ST648', 500.0, 30.0, true, 'Adoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0bb578ff-e5fe-5fbc-916a-593be5c0ea87';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('01eec593-ac44-5e03-8c78-03db4e7f8c9b', '0bb578ff-e5fe-5fbc-916a-593be5c0ea87', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('847ed5f9-e0a6-5dca-98b1-3e82a9c4fafa', '0bb578ff-e5fe-5fbc-916a-593be5c0ea87', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 649: Peninsula Park Residency EVCS - GO EC (Adoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fd72b0fb-1a3e-5591-8559-66ee11d27560', '00000000-0000-0000-0000-000000000000', 'st649@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st649@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fd72b0fb-1a3e-5591-8559-66ee11d27560', 'fd72b0fb-1a3e-5591-8559-66ee11d27560', '{"sub": "fd72b0fb-1a3e-5591-8559-66ee11d27560", "email": "st649@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fd72b0fb-1a3e-5591-8559-66ee11d27560')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fd72b0fb-1a3e-5591-8559-66ee11d27560', 'admin', 'st649@boss.com', 'Admin Peninsula Park Residency EVCS - GO EC', 'Peninsula Park Residency EVCS - GO EC', 'Peninsula Park Residency EVCS - GO EC, Adoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('03a1a0f3-7d06-585b-a940-e74d6da9f8b5', 'fd72b0fb-1a3e-5591-8559-66ee11d27560', 'Peninsula Park Residency EVCS - GO EC', 'Peninsula Park Residency EVCS - GO EC, Adoor, Kerala, India', 9.145305964, 76.76585839, 'India EV Network License', 'LIC-IN-ST649', 500.0, 30.0, true, 'Adoor', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '03a1a0f3-7d06-585b-a940-e74d6da9f8b5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1d96d797-b55f-5902-8024-eaa67e929c39', '03a1a0f3-7d06-585b-a940-e74d6da9f8b5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4b9926af-cdc4-527f-ae67-129d3c32334e', '03a1a0f3-7d06-585b-a940-e74d6da9f8b5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 650: Green Earth - GO EC (Adoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c3082c4e-3e58-5959-b6cd-fd04ce53feb7', '00000000-0000-0000-0000-000000000000', 'st650@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st650@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c3082c4e-3e58-5959-b6cd-fd04ce53feb7', 'c3082c4e-3e58-5959-b6cd-fd04ce53feb7', '{"sub": "c3082c4e-3e58-5959-b6cd-fd04ce53feb7", "email": "st650@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c3082c4e-3e58-5959-b6cd-fd04ce53feb7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c3082c4e-3e58-5959-b6cd-fd04ce53feb7', 'admin', 'st650@boss.com', 'Admin Green Earth - GO EC', 'Green Earth - GO EC', 'Green Earth - GO EC, Adoor, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1f812a7d-8a19-52b4-afba-ba16ea2a86de', 'c3082c4e-3e58-5959-b6cd-fd04ce53feb7', 'Green Earth - GO EC', 'Green Earth - GO EC, Adoor, Kerala, India', 9.153564154, 76.73554436, 'India EV Network License', 'LIC-IN-ST650', 500.0, 30.0, true, 'Adoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1f812a7d-8a19-52b4-afba-ba16ea2a86de';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('08feae4e-c14a-5d0e-b674-1b953203fa72', '1f812a7d-8a19-52b4-afba-ba16ea2a86de', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4610034d-0f9d-5605-b287-d68b433710b3', '1f812a7d-8a19-52b4-afba-ba16ea2a86de', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 651: Sparkzone EVCS - GO EC (Kayamkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('16510ddb-34c0-5eee-808e-8893450c2d65', '00000000-0000-0000-0000-000000000000', 'st651@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st651@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('16510ddb-34c0-5eee-808e-8893450c2d65', '16510ddb-34c0-5eee-808e-8893450c2d65', '{"sub": "16510ddb-34c0-5eee-808e-8893450c2d65", "email": "st651@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '16510ddb-34c0-5eee-808e-8893450c2d65')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('16510ddb-34c0-5eee-808e-8893450c2d65', 'admin', 'st651@boss.com', 'Admin Sparkzone EVCS - GO EC', 'Sparkzone EVCS - GO EC', 'Sparkzone EVCS - GO EC, Kayamkulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('df4b5f8f-8cfb-558d-aa15-b023e5000b4e', '16510ddb-34c0-5eee-808e-8893450c2d65', 'Sparkzone EVCS - GO EC', 'Sparkzone EVCS - GO EC, Kayamkulam, Kerala, India', 9.145794596, 76.45936322, 'India EV Network License', 'LIC-IN-ST651', 500.0, 30.0, true, 'Kayamkulam', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'df4b5f8f-8cfb-558d-aa15-b023e5000b4e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cb3b29ec-3566-5327-bfa8-46cc1804e414', 'df4b5f8f-8cfb-558d-aa15-b023e5000b4e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eaeb0376-b5b1-5257-8d9b-0b6d9061620a', 'df4b5f8f-8cfb-558d-aa15-b023e5000b4e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 652: Zufo EVCS (Karunagappalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2f75cc10-e4c3-54a4-9b1f-6190ae8c9a91', '00000000-0000-0000-0000-000000000000', 'st652@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st652@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2f75cc10-e4c3-54a4-9b1f-6190ae8c9a91', '2f75cc10-e4c3-54a4-9b1f-6190ae8c9a91', '{"sub": "2f75cc10-e4c3-54a4-9b1f-6190ae8c9a91", "email": "st652@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2f75cc10-e4c3-54a4-9b1f-6190ae8c9a91')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2f75cc10-e4c3-54a4-9b1f-6190ae8c9a91', 'admin', 'st652@boss.com', 'Admin Zufo EVCS', 'Zufo EVCS', 'Zufo EVCS, Karunagappalli, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ecbac925-43fa-5a4b-9dd1-f55865a56260', '2f75cc10-e4c3-54a4-9b1f-6190ae8c9a91', 'Zufo EVCS', 'Zufo EVCS, Karunagappalli, Kerala, India', 9.132307411, 76.51385829, 'India EV Network License', 'LIC-IN-ST652', 500.0, 7.4, true, 'Karunagappalli', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ecbac925-43fa-5a4b-9dd1-f55865a56260';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9f050d73-6f28-5cfd-9510-20f1bc15f559', 'ecbac925-43fa-5a4b-9dd1-f55865a56260', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 653: Cartist - GO EC (Kayamkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0e4b4dc4-93ac-52f8-b15d-464412f370a1', '00000000-0000-0000-0000-000000000000', 'st653@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st653@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0e4b4dc4-93ac-52f8-b15d-464412f370a1', '0e4b4dc4-93ac-52f8-b15d-464412f370a1', '{"sub": "0e4b4dc4-93ac-52f8-b15d-464412f370a1", "email": "st653@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0e4b4dc4-93ac-52f8-b15d-464412f370a1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0e4b4dc4-93ac-52f8-b15d-464412f370a1', 'admin', 'st653@boss.com', 'Admin Cartist - GO EC', 'Cartist - GO EC', 'Cartist - GO EC, Kayamkulam, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6d5947df-60c0-506d-81a9-13af512249a0', '0e4b4dc4-93ac-52f8-b15d-464412f370a1', 'Cartist - GO EC', 'Cartist - GO EC, Kayamkulam, Kerala, India', 9.184739729, 76.49029684, 'India EV Network License', 'LIC-IN-ST653', 500.0, 30.0, true, 'Kayamkulam', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6d5947df-60c0-506d-81a9-13af512249a0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('93ba02e4-7aaa-5330-937c-95ffc0b9f232', '6d5947df-60c0-506d-81a9-13af512249a0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('df39599e-908a-5f16-adf6-d965fe72a43d', '6d5947df-60c0-506d-81a9-13af512249a0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 654: V Volte EVCS - GO EC (Haripad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('085364d8-b5c1-5d3b-803d-e278296e700c', '00000000-0000-0000-0000-000000000000', 'st654@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st654@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('085364d8-b5c1-5d3b-803d-e278296e700c', '085364d8-b5c1-5d3b-803d-e278296e700c', '{"sub": "085364d8-b5c1-5d3b-803d-e278296e700c", "email": "st654@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '085364d8-b5c1-5d3b-803d-e278296e700c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('085364d8-b5c1-5d3b-803d-e278296e700c', 'admin', 'st654@boss.com', 'Admin V Volte EVCS - GO EC', 'V Volte EVCS - GO EC', 'V Volte EVCS - GO EC, Haripad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('307fba60-d9c6-52be-9e97-870a25ba1bda', '085364d8-b5c1-5d3b-803d-e278296e700c', 'V Volte EVCS - GO EC', 'V Volte EVCS - GO EC, Haripad, Kerala, India', 9.289000834, 76.45653569, 'India EV Network License', 'LIC-IN-ST654', 500.0, 30.0, true, 'Haripad', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '307fba60-d9c6-52be-9e97-870a25ba1bda';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e5b06a34-f64c-5407-a406-da8012df2e98', '307fba60-d9c6-52be-9e97-870a25ba1bda', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('482a8a98-cddd-548e-b720-204781aa3df8', '307fba60-d9c6-52be-9e97-870a25ba1bda', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 655: Anjaly EVCS - GO EC (Omallor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('02f426e8-07e0-562c-be4a-e4d0983cb39a', '00000000-0000-0000-0000-000000000000', 'st655@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st655@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('02f426e8-07e0-562c-be4a-e4d0983cb39a', '02f426e8-07e0-562c-be4a-e4d0983cb39a', '{"sub": "02f426e8-07e0-562c-be4a-e4d0983cb39a", "email": "st655@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '02f426e8-07e0-562c-be4a-e4d0983cb39a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('02f426e8-07e0-562c-be4a-e4d0983cb39a', 'admin', 'st655@boss.com', 'Admin Anjaly EVCS - GO EC', 'Anjaly EVCS - GO EC', 'Anjaly EVCS - GO EC, Omallor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2ba7bcb2-b36b-5cf8-8c15-de823f044541', '02f426e8-07e0-562c-be4a-e4d0983cb39a', 'Anjaly EVCS - GO EC', 'Anjaly EVCS - GO EC, Omallor, Kerala, India', 9.246935402, 76.75730779, 'India EV Network License', 'LIC-IN-ST655', 500.0, 30.0, true, 'Omallor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2ba7bcb2-b36b-5cf8-8c15-de823f044541';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3f02bf40-6066-55cd-a667-b7c64b8371bf', '2ba7bcb2-b36b-5cf8-8c15-de823f044541', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9f67e5f3-be0b-5f51-bd01-59b9cec62799', '2ba7bcb2-b36b-5cf8-8c15-de823f044541', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 656: Evergreen Continental EVCS - GO EC (Pathanamthitta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eccc821c-4aa0-56c6-acf9-3ae5b114efa3', '00000000-0000-0000-0000-000000000000', 'st656@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st656@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eccc821c-4aa0-56c6-acf9-3ae5b114efa3', 'eccc821c-4aa0-56c6-acf9-3ae5b114efa3', '{"sub": "eccc821c-4aa0-56c6-acf9-3ae5b114efa3", "email": "st656@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eccc821c-4aa0-56c6-acf9-3ae5b114efa3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eccc821c-4aa0-56c6-acf9-3ae5b114efa3', 'admin', 'st656@boss.com', 'Admin Evergreen Continental EVCS - GO EC', 'Evergreen Continental EVCS - GO EC', 'Evergreen Continental EVCS - GO EC, Pathanamthitta, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('318bebe9-f551-5218-a064-ed22b6ca9f23', 'eccc821c-4aa0-56c6-acf9-3ae5b114efa3', 'Evergreen Continental EVCS - GO EC', 'Evergreen Continental EVCS - GO EC, Pathanamthitta, Kerala, India', 9.263776809, 76.7854353, 'India EV Network License', 'LIC-IN-ST656', 500.0, 30.0, true, 'Pathanamthitta', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '318bebe9-f551-5218-a064-ed22b6ca9f23';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd018d68-1ec7-5328-a14a-0e1f70781acd', '318bebe9-f551-5218-a064-ed22b6ca9f23', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('235dc3b8-7a54-520e-b52e-84c33e7b4fa9', '318bebe9-f551-5218-a064-ed22b6ca9f23', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 657: Quik Energy EVCS - GO EC (Chengannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f9a4008b-4188-52f0-86d1-eb12079092a8', '00000000-0000-0000-0000-000000000000', 'st657@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st657@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f9a4008b-4188-52f0-86d1-eb12079092a8', 'f9a4008b-4188-52f0-86d1-eb12079092a8', '{"sub": "f9a4008b-4188-52f0-86d1-eb12079092a8", "email": "st657@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f9a4008b-4188-52f0-86d1-eb12079092a8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f9a4008b-4188-52f0-86d1-eb12079092a8', 'admin', 'st657@boss.com', 'Admin Quik Energy EVCS - GO EC', 'Quik Energy EVCS - GO EC', 'Quik Energy EVCS - GO EC, Chengannur, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('142a5fba-ce30-52c8-ba2f-fdc40e4a7a8a', 'f9a4008b-4188-52f0-86d1-eb12079092a8', 'Quik Energy EVCS - GO EC', 'Quik Energy EVCS - GO EC, Chengannur, Kerala, India', 9.311533027, 76.62272053, 'India EV Network License', 'LIC-IN-ST657', 500.0, 30.0, true, 'Chengannur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '142a5fba-ce30-52c8-ba2f-fdc40e4a7a8a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c25ede04-7896-503e-8674-9e396584a912', '142a5fba-ce30-52c8-ba2f-fdc40e4a7a8a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('da6d7c81-e3fe-5f67-96c8-f720d6424c94', '142a5fba-ce30-52c8-ba2f-fdc40e4a7a8a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 658: Amrutham Auto Care EVCS - GO EC (Chengannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0996b12c-d012-5ee6-adaa-dafa42d0285d', '00000000-0000-0000-0000-000000000000', 'st658@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st658@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0996b12c-d012-5ee6-adaa-dafa42d0285d', '0996b12c-d012-5ee6-adaa-dafa42d0285d', '{"sub": "0996b12c-d012-5ee6-adaa-dafa42d0285d", "email": "st658@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0996b12c-d012-5ee6-adaa-dafa42d0285d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0996b12c-d012-5ee6-adaa-dafa42d0285d', 'admin', 'st658@boss.com', 'Admin Amrutham Auto Care EVCS - GO EC', 'Amrutham Auto Care EVCS - GO EC', 'Amrutham Auto Care EVCS - GO EC, Chengannur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2f9e8237-c89a-5bc8-90de-0e849007d563', '0996b12c-d012-5ee6-adaa-dafa42d0285d', 'Amrutham Auto Care EVCS - GO EC', 'Amrutham Auto Care EVCS - GO EC, Chengannur, Kerala, India', 9.342144723, 76.59848784, 'India EV Network License', 'LIC-IN-ST658', 500.0, 30.0, true, 'Chengannur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2f9e8237-c89a-5bc8-90de-0e849007d563';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b97dbf7f-b20b-565c-ac82-f4c3eceda35c', '2f9e8237-c89a-5bc8-90de-0e849007d563', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c8209e45-989d-5d1d-ab43-c8e2d400d41c', '2f9e8237-c89a-5bc8-90de-0e849007d563', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 659: Changanassery Immaculate Mary EVCS (Changanassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('041131ef-15f0-529a-9fab-0b42d2c3217c', '00000000-0000-0000-0000-000000000000', 'st659@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st659@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('041131ef-15f0-529a-9fab-0b42d2c3217c', '041131ef-15f0-529a-9fab-0b42d2c3217c', '{"sub": "041131ef-15f0-529a-9fab-0b42d2c3217c", "email": "st659@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '041131ef-15f0-529a-9fab-0b42d2c3217c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('041131ef-15f0-529a-9fab-0b42d2c3217c', 'admin', 'st659@boss.com', 'Admin Changanassery Immaculate Mary EVCS', 'Changanassery Immaculate Mary EVCS', 'Changanassery Immaculate Mary EVCS, Changanassery, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('57631064-543e-5bc7-86e7-a78d3248e0ff', '041131ef-15f0-529a-9fab-0b42d2c3217c', 'Changanassery Immaculate Mary EVCS', 'Changanassery Immaculate Mary EVCS, Changanassery, Kerala, India', 9.459860218, 76.55518359, 'India EV Network License', 'LIC-IN-ST659', 500.0, 7.4, true, 'Changanassery', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '57631064-543e-5bc7-86e7-a78d3248e0ff';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('abf493ce-bdd8-56b4-858f-82402db58b27', '57631064-543e-5bc7-86e7-a78d3248e0ff', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 660: Calvarymount Jerry Plaza (Alliyar, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('44aa2c88-0408-5802-9c3d-90256f28268d', '00000000-0000-0000-0000-000000000000', 'st660@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st660@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('44aa2c88-0408-5802-9c3d-90256f28268d', '44aa2c88-0408-5802-9c3d-90256f28268d', '{"sub": "44aa2c88-0408-5802-9c3d-90256f28268d", "email": "st660@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '44aa2c88-0408-5802-9c3d-90256f28268d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('44aa2c88-0408-5802-9c3d-90256f28268d', 'admin', 'st660@boss.com', 'Admin Calvarymount Jerry Plaza', 'Calvarymount Jerry Plaza', 'Calvarymount Jerry Plaza, Alliyar, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3b8021a2-da78-55ad-b985-0e52ec1189af', '44aa2c88-0408-5802-9c3d-90256f28268d', 'Calvarymount Jerry Plaza', 'Calvarymount Jerry Plaza, Alliyar, Kerala, India', 9.806942489, 77.04794026, 'India EV Network License', 'LIC-IN-ST660', 500.0, 7.4, true, 'Alliyar', 'Kerala', 1, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3b8021a2-da78-55ad-b985-0e52ec1189af';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2ab3312d-e467-5d89-b8a0-fe29f5b3fd5e', '3b8021a2-da78-55ad-b985-0e52ec1189af', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 661: Westgate Inn EVCS - GO EC (Kattappana, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2de40b35-dcbd-53ba-97fc-59b143e10786', '00000000-0000-0000-0000-000000000000', 'st661@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st661@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2de40b35-dcbd-53ba-97fc-59b143e10786', '2de40b35-dcbd-53ba-97fc-59b143e10786', '{"sub": "2de40b35-dcbd-53ba-97fc-59b143e10786", "email": "st661@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2de40b35-dcbd-53ba-97fc-59b143e10786')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2de40b35-dcbd-53ba-97fc-59b143e10786', 'admin', 'st661@boss.com', 'Admin Westgate Inn EVCS - GO EC', 'Westgate Inn EVCS - GO EC', 'Westgate Inn EVCS - GO EC, Kattappana, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ddb63299-c0dd-5a15-be99-c4a5353e27f1', '2de40b35-dcbd-53ba-97fc-59b143e10786', 'Westgate Inn EVCS - GO EC', 'Westgate Inn EVCS - GO EC, Kattappana, Kerala, India', 9.747617293, 77.1054177, 'India EV Network License', 'LIC-IN-ST661', 500.0, 30.0, true, 'Kattappana', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ddb63299-c0dd-5a15-be99-c4a5353e27f1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('977c2155-14a0-5217-af69-dd1055671625', 'ddb63299-c0dd-5a15-be99-c4a5353e27f1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cb1f550a-2d5e-57d8-8f93-cdfa3590187f', 'ddb63299-c0dd-5a15-be99-c4a5353e27f1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 662: GO EC Charging Station (Idukki, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c2b3188c-25f7-51fe-881c-00a857c81e63', '00000000-0000-0000-0000-000000000000', 'st662@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st662@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c2b3188c-25f7-51fe-881c-00a857c81e63', 'c2b3188c-25f7-51fe-881c-00a857c81e63', '{"sub": "c2b3188c-25f7-51fe-881c-00a857c81e63", "email": "st662@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c2b3188c-25f7-51fe-881c-00a857c81e63')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c2b3188c-25f7-51fe-881c-00a857c81e63', 'admin', 'st662@boss.com', 'Admin GO EC Charging Station', 'GO EC Charging Station', 'GO EC Charging Station, Idukki, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('95cfba11-c799-5915-bddc-b88db4a118c6', 'c2b3188c-25f7-51fe-881c-00a857c81e63', 'GO EC Charging Station', 'GO EC Charging Station, Idukki, Kerala, India', 9.66539882, 77.16084695, 'India EV Network License', 'LIC-IN-ST662', 500.0, 30.0, true, 'Idukki', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '95cfba11-c799-5915-bddc-b88db4a118c6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d74ae65d-3d2c-57e7-bcec-ec0689fc0f4d', '95cfba11-c799-5915-bddc-b88db4a118c6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b78eb866-23e7-5ad9-9ac5-19f742b8e63a', '95cfba11-c799-5915-bddc-b88db4a118c6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 663: Sora EVCS - GO EC (Kumali, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('28224642-4b6d-5a25-83a4-7860541946e4', '00000000-0000-0000-0000-000000000000', 'st663@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st663@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('28224642-4b6d-5a25-83a4-7860541946e4', '28224642-4b6d-5a25-83a4-7860541946e4', '{"sub": "28224642-4b6d-5a25-83a4-7860541946e4", "email": "st663@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '28224642-4b6d-5a25-83a4-7860541946e4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('28224642-4b6d-5a25-83a4-7860541946e4', 'admin', 'st663@boss.com', 'Admin Sora EVCS - GO EC', 'Sora EVCS - GO EC', 'Sora EVCS - GO EC, Kumali, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('30e9c2a7-05e4-59a0-ab12-31bf953714d2', '28224642-4b6d-5a25-83a4-7860541946e4', 'Sora EVCS - GO EC', 'Sora EVCS - GO EC, Kumali, Kerala, India', 9.614445835, 77.15390991, 'India EV Network License', 'LIC-IN-ST663', 500.0, 30.0, true, 'Kumali', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '30e9c2a7-05e4-59a0-ab12-31bf953714d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('10bb7a54-f321-54ac-a1bb-204b4bd1a173', '30e9c2a7-05e4-59a0-ab12-31bf953714d2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ba28b4e7-8b22-5362-9c43-24005ebc7325', '30e9c2a7-05e4-59a0-ab12-31bf953714d2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 664: Open Kitchen EVCS - GO EC (Kuttikkanam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5e20a566-74a7-5b3c-81a0-f000075bbdd0', '00000000-0000-0000-0000-000000000000', 'st664@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st664@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5e20a566-74a7-5b3c-81a0-f000075bbdd0', '5e20a566-74a7-5b3c-81a0-f000075bbdd0', '{"sub": "5e20a566-74a7-5b3c-81a0-f000075bbdd0", "email": "st664@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5e20a566-74a7-5b3c-81a0-f000075bbdd0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5e20a566-74a7-5b3c-81a0-f000075bbdd0', 'admin', 'st664@boss.com', 'Admin Open Kitchen EVCS - GO EC', 'Open Kitchen EVCS - GO EC', 'Open Kitchen EVCS - GO EC, Kuttikkanam, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('63057446-e459-5220-9b2c-58b4bcc42c1f', '5e20a566-74a7-5b3c-81a0-f000075bbdd0', 'Open Kitchen EVCS - GO EC', 'Open Kitchen EVCS - GO EC, Kuttikkanam, Kerala, India', 9.580204298, 76.97061173, 'India EV Network License', 'LIC-IN-ST664', 500.0, 30.0, true, 'Kuttikkanam', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '63057446-e459-5220-9b2c-58b4bcc42c1f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('13bdefda-d344-550a-8d72-7ea989b76602', '63057446-e459-5220-9b2c-58b4bcc42c1f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b746718-39e2-5836-b814-f276a7e97614', '63057446-e459-5220-9b2c-58b4bcc42c1f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 665: Nandanam EVCS - GO EC (Kodungoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eb30f252-1bc0-53bc-a47a-ecec494e113e', '00000000-0000-0000-0000-000000000000', 'st665@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st665@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eb30f252-1bc0-53bc-a47a-ecec494e113e', 'eb30f252-1bc0-53bc-a47a-ecec494e113e', '{"sub": "eb30f252-1bc0-53bc-a47a-ecec494e113e", "email": "st665@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eb30f252-1bc0-53bc-a47a-ecec494e113e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eb30f252-1bc0-53bc-a47a-ecec494e113e', 'admin', 'st665@boss.com', 'Admin Nandanam EVCS - GO EC', 'Nandanam EVCS - GO EC', 'Nandanam EVCS - GO EC, Kodungoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3dcff4b5-daa8-5043-9e41-1725f40936f4', 'eb30f252-1bc0-53bc-a47a-ecec494e113e', 'Nandanam EVCS - GO EC', 'Nandanam EVCS - GO EC, Kodungoor, Kerala, India', 9.567074729, 76.70609404, 'India EV Network License', 'LIC-IN-ST665', 500.0, 30.0, true, 'Kodungoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3dcff4b5-daa8-5043-9e41-1725f40936f4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1ccefa64-468c-5ace-ba69-001815de5ecc', '3dcff4b5-daa8-5043-9e41-1725f40936f4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ac2f7dff-76f9-5d24-b96e-cc4e5693c68d', '3dcff4b5-daa8-5043-9e41-1725f40936f4', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 666: Clay Art Cafe - GO EC (Ponkunnam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('29c13993-01e7-5de3-b7b2-bde9b84c4952', '00000000-0000-0000-0000-000000000000', 'st666@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st666@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('29c13993-01e7-5de3-b7b2-bde9b84c4952', '29c13993-01e7-5de3-b7b2-bde9b84c4952', '{"sub": "29c13993-01e7-5de3-b7b2-bde9b84c4952", "email": "st666@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '29c13993-01e7-5de3-b7b2-bde9b84c4952')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('29c13993-01e7-5de3-b7b2-bde9b84c4952', 'admin', 'st666@boss.com', 'Admin Clay Art Cafe - GO EC', 'Clay Art Cafe - GO EC', 'Clay Art Cafe - GO EC, Ponkunnam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bc53ef98-f692-5270-8666-d661be714424', '29c13993-01e7-5de3-b7b2-bde9b84c4952', 'Clay Art Cafe - GO EC', 'Clay Art Cafe - GO EC, Ponkunnam, Kerala, India', 9.566378512, 76.74160751, 'India EV Network License', 'LIC-IN-ST666', 500.0, 30.0, true, 'Ponkunnam', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bc53ef98-f692-5270-8666-d661be714424';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a30be954-4980-5777-90b9-474c0f43c6c5', 'bc53ef98-f692-5270-8666-d661be714424', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c7b0edd3-a4af-5d72-8963-4ade92ce7d0a', 'bc53ef98-f692-5270-8666-d661be714424', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 667: GO Green EVCS (Anthikkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a763c7a4-753f-5dd3-bba0-85e85db39ca8', '00000000-0000-0000-0000-000000000000', 'st667@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st667@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a763c7a4-753f-5dd3-bba0-85e85db39ca8', 'a763c7a4-753f-5dd3-bba0-85e85db39ca8', '{"sub": "a763c7a4-753f-5dd3-bba0-85e85db39ca8", "email": "st667@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a763c7a4-753f-5dd3-bba0-85e85db39ca8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a763c7a4-753f-5dd3-bba0-85e85db39ca8', 'admin', 'st667@boss.com', 'Admin GO Green EVCS', 'GO Green EVCS', 'GO Green EVCS, Anthikkad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('34dd1d4e-db2f-59a3-a156-682062af91d2', 'a763c7a4-753f-5dd3-bba0-85e85db39ca8', 'GO Green EVCS', 'GO Green EVCS, Anthikkad, Kerala, India', 9.753999722, 76.70127896, 'India EV Network License', 'LIC-IN-ST667', 500.0, 7.4, true, 'Anthikkad', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '34dd1d4e-db2f-59a3-a156-682062af91d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('808ba8d8-acb4-52a1-b010-97d81750727e', '34dd1d4e-db2f-59a3-a156-682062af91d2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 668: Nila's Magestic Arcade (Kidangoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('94ef6482-8d4d-5e8e-b605-5b3b860d751e', '00000000-0000-0000-0000-000000000000', 'st668@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st668@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('94ef6482-8d4d-5e8e-b605-5b3b860d751e', '94ef6482-8d4d-5e8e-b605-5b3b860d751e', '{"sub": "94ef6482-8d4d-5e8e-b605-5b3b860d751e", "email": "st668@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '94ef6482-8d4d-5e8e-b605-5b3b860d751e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('94ef6482-8d4d-5e8e-b605-5b3b860d751e', 'admin', 'st668@boss.com', 'Admin Nila''s Magestic Arcade', 'Nila''s Magestic Arcade', 'Nila''s Magestic Arcade, Kidangoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, created_at)
VALUES ('1d56fca7-f299-5071-8598-7c6c3f4ee054', '94ef6482-8d4d-5e8e-b605-5b3b860d751e', 'Nila''s Magestic Arcade', 'Nila''s Magestic Arcade, Kidangoor, Kerala, India', 9.683248151, 76.60975357, 'India EV Network License', 'LIC-IN-ST668', 500.0, 24.0, true, 'Kidangoor', 'Kerala', 1, 'GO EC (IN)', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('79b479aa-8caa-54a6-b905-6d29b7e5f08c', '1d56fca7-f299-5071-8598-7c6c3f4ee054', 'Port A', 50, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO NOTHING;

-- Station 669: Ettumanur Skylight EVCS - GO EC (Ettumanoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('307c55dc-1f60-5b31-a90c-b404435c004e', '00000000-0000-0000-0000-000000000000', 'st669@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st669@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('307c55dc-1f60-5b31-a90c-b404435c004e', '307c55dc-1f60-5b31-a90c-b404435c004e', '{"sub": "307c55dc-1f60-5b31-a90c-b404435c004e", "email": "st669@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '307c55dc-1f60-5b31-a90c-b404435c004e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('307c55dc-1f60-5b31-a90c-b404435c004e', 'admin', 'st669@boss.com', 'Admin Ettumanur Skylight EVCS - GO EC', 'Ettumanur Skylight EVCS - GO EC', 'Ettumanur Skylight EVCS - GO EC, Ettumanoor, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8cf2d33a-fe33-52ad-8dc7-55f193d865c3', '307c55dc-1f60-5b31-a90c-b404435c004e', 'Ettumanur Skylight EVCS - GO EC', 'Ettumanur Skylight EVCS - GO EC, Ettumanoor, Kerala, India', 9.668171829, 76.57537882, 'India EV Network License', 'LIC-IN-ST669', 500.0, 30.0, true, 'Ettumanoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8cf2d33a-fe33-52ad-8dc7-55f193d865c3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f3f74a9f-3b29-58cc-823e-23fdef3a29b0', '8cf2d33a-fe33-52ad-8dc7-55f193d865c3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fa78d0cb-62a0-55f9-b7d4-3d950911c4d8', '8cf2d33a-fe33-52ad-8dc7-55f193d865c3', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 670: Chaithanya Hospital EVCS - GO EC (Kuravilangad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0c677100-6cfa-5b45-acf5-bf6beee78367', '00000000-0000-0000-0000-000000000000', 'st670@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st670@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0c677100-6cfa-5b45-acf5-bf6beee78367', '0c677100-6cfa-5b45-acf5-bf6beee78367', '{"sub": "0c677100-6cfa-5b45-acf5-bf6beee78367", "email": "st670@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0c677100-6cfa-5b45-acf5-bf6beee78367')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0c677100-6cfa-5b45-acf5-bf6beee78367', 'admin', 'st670@boss.com', 'Admin Chaithanya Hospital EVCS - GO EC', 'Chaithanya Hospital EVCS - GO EC', 'Chaithanya Hospital EVCS - GO EC, Kuravilangad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('271110f0-a30c-5bfc-848a-63731ab7557c', '0c677100-6cfa-5b45-acf5-bf6beee78367', 'Chaithanya Hospital EVCS - GO EC', 'Chaithanya Hospital EVCS - GO EC, Kuravilangad, Kerala, India', 9.761923841, 76.56472253, 'India EV Network License', 'LIC-IN-ST670', 500.0, 30.0, true, 'Kuravilangad', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hospital)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '271110f0-a30c-5bfc-848a-63731ab7557c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4696ac42-8774-594f-a991-99396e1ce690', '271110f0-a30c-5bfc-848a-63731ab7557c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8848e1ce-b6fc-5d66-bc0c-887f972434aa', '271110f0-a30c-5bfc-848a-63731ab7557c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 671: Manjoor Beeza Clubhouse EVCS - GO EC (Manjoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2eda3a35-4678-52ab-8bab-4b578f500b7c', '00000000-0000-0000-0000-000000000000', 'st671@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st671@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2eda3a35-4678-52ab-8bab-4b578f500b7c', '2eda3a35-4678-52ab-8bab-4b578f500b7c', '{"sub": "2eda3a35-4678-52ab-8bab-4b578f500b7c", "email": "st671@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2eda3a35-4678-52ab-8bab-4b578f500b7c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2eda3a35-4678-52ab-8bab-4b578f500b7c', 'admin', 'st671@boss.com', 'Admin Manjoor Beeza Clubhouse EVCS - GO EC', 'Manjoor Beeza Clubhouse EVCS - GO EC', 'Manjoor Beeza Clubhouse EVCS - GO EC, Manjoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a4400737-a1c0-5a2c-812f-4e2102f35d44', '2eda3a35-4678-52ab-8bab-4b578f500b7c', 'Manjoor Beeza Clubhouse EVCS - GO EC', 'Manjoor Beeza Clubhouse EVCS - GO EC, Manjoor, Kerala, India', 9.727579426, 76.52038777, 'India EV Network License', 'LIC-IN-ST671', 500.0, 30.0, true, 'Manjoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a4400737-a1c0-5a2c-812f-4e2102f35d44';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ef15ad55-06e2-515f-9bfc-ff6c8535f363', 'a4400737-a1c0-5a2c-812f-4e2102f35d44', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0374af9d-c58d-5916-aa92-f1f7be70d6d1', 'a4400737-a1c0-5a2c-812f-4e2102f35d44', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 672: Kalladanthiyil EVCS - GO EC (Neendoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('135e2dbc-2378-57a4-a5a6-e8ed0d8dd226', '00000000-0000-0000-0000-000000000000', 'st672@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st672@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('135e2dbc-2378-57a4-a5a6-e8ed0d8dd226', '135e2dbc-2378-57a4-a5a6-e8ed0d8dd226', '{"sub": "135e2dbc-2378-57a4-a5a6-e8ed0d8dd226", "email": "st672@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '135e2dbc-2378-57a4-a5a6-e8ed0d8dd226')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('135e2dbc-2378-57a4-a5a6-e8ed0d8dd226', 'admin', 'st672@boss.com', 'Admin Kalladanthiyil EVCS - GO EC', 'Kalladanthiyil EVCS - GO EC', 'Kalladanthiyil EVCS - GO EC, Neendoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('54507ae8-5ae0-5479-b415-f0c1c77da99b', '135e2dbc-2378-57a4-a5a6-e8ed0d8dd226', 'Kalladanthiyil EVCS - GO EC', 'Kalladanthiyil EVCS - GO EC, Neendoor, Kerala, India', 9.68333688, 76.50559381, 'India EV Network License', 'LIC-IN-ST672', 500.0, 30.0, true, 'Neendoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '54507ae8-5ae0-5479-b415-f0c1c77da99b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('357c7b0d-3355-59ae-bc48-27a220fc4848', '54507ae8-5ae0-5479-b415-f0c1c77da99b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2de2e186-44b5-554e-9018-a4b73f60ac87', '54507ae8-5ae0-5479-b415-f0c1c77da99b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 673: The Grand Ambassador EVCS (Kottayam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9d42a768-be2f-5a91-b9b9-4ef0aadde6aa', '00000000-0000-0000-0000-000000000000', 'st673@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st673@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9d42a768-be2f-5a91-b9b9-4ef0aadde6aa', '9d42a768-be2f-5a91-b9b9-4ef0aadde6aa', '{"sub": "9d42a768-be2f-5a91-b9b9-4ef0aadde6aa", "email": "st673@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9d42a768-be2f-5a91-b9b9-4ef0aadde6aa')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9d42a768-be2f-5a91-b9b9-4ef0aadde6aa', 'admin', 'st673@boss.com', 'Admin The Grand Ambassador EVCS', 'The Grand Ambassador EVCS', 'The Grand Ambassador EVCS, Kottayam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b9ed7ea0-fcc0-5b72-b3e2-ded9b54a43c9', '9d42a768-be2f-5a91-b9b9-4ef0aadde6aa', 'The Grand Ambassador EVCS', 'The Grand Ambassador EVCS, Kottayam, Kerala, India', 9.589399336, 76.52633053, 'India EV Network License', 'LIC-IN-ST673', 500.0, 7.4, true, 'Kottayam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b9ed7ea0-fcc0-5b72-b3e2-ded9b54a43c9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('383d1961-5bf5-536a-9fc6-5097befd1f11', 'b9ed7ea0-fcc0-5b72-b3e2-ded9b54a43c9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 674: Hotel Athira Residency EVCS - GO EC (Kottayam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eda95bd7-a2ad-556d-a17d-8dd143cd3fd8', '00000000-0000-0000-0000-000000000000', 'st674@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st674@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eda95bd7-a2ad-556d-a17d-8dd143cd3fd8', 'eda95bd7-a2ad-556d-a17d-8dd143cd3fd8', '{"sub": "eda95bd7-a2ad-556d-a17d-8dd143cd3fd8", "email": "st674@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eda95bd7-a2ad-556d-a17d-8dd143cd3fd8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eda95bd7-a2ad-556d-a17d-8dd143cd3fd8', 'admin', 'st674@boss.com', 'Admin Hotel Athira Residency EVCS - GO EC', 'Hotel Athira Residency EVCS - GO EC', 'Hotel Athira Residency EVCS - GO EC, Kottayam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dfc005a5-2bca-5718-8bc9-526a34774e4e', 'eda95bd7-a2ad-556d-a17d-8dd143cd3fd8', 'Hotel Athira Residency EVCS - GO EC', 'Hotel Athira Residency EVCS - GO EC, Kottayam, Kerala, India', 9.578258768, 76.51947056, 'India EV Network License', 'LIC-IN-ST674', 500.0, 30.0, true, 'Kottayam', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dfc005a5-2bca-5718-8bc9-526a34774e4e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a7972f94-cfb0-5da6-be43-c48eb5782b9e', 'dfc005a5-2bca-5718-8bc9-526a34774e4e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e5f5603d-05ca-5fdb-9377-c93dc9a2f988', 'dfc005a5-2bca-5718-8bc9-526a34774e4e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 675: Cassia Regency EVCS - GO EC (Alappuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d2b91734-3d09-54c7-8076-6b5c08080bfb', '00000000-0000-0000-0000-000000000000', 'st675@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st675@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d2b91734-3d09-54c7-8076-6b5c08080bfb', 'd2b91734-3d09-54c7-8076-6b5c08080bfb', '{"sub": "d2b91734-3d09-54c7-8076-6b5c08080bfb", "email": "st675@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd2b91734-3d09-54c7-8076-6b5c08080bfb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d2b91734-3d09-54c7-8076-6b5c08080bfb', 'admin', 'st675@boss.com', 'Admin Cassia Regency EVCS - GO EC', 'Cassia Regency EVCS - GO EC', 'Cassia Regency EVCS - GO EC, Alappuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0127c575-be6f-594b-9960-123f4a2ccc2f', 'd2b91734-3d09-54c7-8076-6b5c08080bfb', 'Cassia Regency EVCS - GO EC', 'Cassia Regency EVCS - GO EC, Alappuzha, Kerala, India', 9.490169817, 76.32073716, 'India EV Network License', 'LIC-IN-ST675', 500.0, 30.0, true, 'Alappuzha', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0127c575-be6f-594b-9960-123f4a2ccc2f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f0722136-1ce1-5795-a604-d8eaf9e54152', '0127c575-be6f-594b-9960-123f4a2ccc2f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d0a9d709-1f6d-5134-84e6-19474988c552', '0127c575-be6f-594b-9960-123f4a2ccc2f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 676: Neo Charge EVCS - GO EC (Alappuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d2dc5ecf-d3dd-5f7c-8e90-518c140005dd', '00000000-0000-0000-0000-000000000000', 'st676@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st676@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d2dc5ecf-d3dd-5f7c-8e90-518c140005dd', 'd2dc5ecf-d3dd-5f7c-8e90-518c140005dd', '{"sub": "d2dc5ecf-d3dd-5f7c-8e90-518c140005dd", "email": "st676@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd2dc5ecf-d3dd-5f7c-8e90-518c140005dd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d2dc5ecf-d3dd-5f7c-8e90-518c140005dd', 'admin', 'st676@boss.com', 'Admin Neo Charge EVCS - GO EC', 'Neo Charge EVCS - GO EC', 'Neo Charge EVCS - GO EC, Alappuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('727999ac-e1a9-5068-b9d4-f6ddfc07cba2', 'd2dc5ecf-d3dd-5f7c-8e90-518c140005dd', 'Neo Charge EVCS - GO EC', 'Neo Charge EVCS - GO EC, Alappuzha, Kerala, India', 9.559497169, 76.32821359, 'India EV Network License', 'LIC-IN-ST676', 500.0, 30.0, true, 'Alappuzha', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '727999ac-e1a9-5068-b9d4-f6ddfc07cba2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('01fc047e-daca-5b3b-81ef-bfce24aa4286', '727999ac-e1a9-5068-b9d4-f6ddfc07cba2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5447d42c-8f1d-5289-b12a-9287b0c633c8', '727999ac-e1a9-5068-b9d4-f6ddfc07cba2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 677: Jason Orchard Inn EVCS - GO EC (Alappuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bca977cc-de95-5c09-9fda-e4e4ec7c1f64', '00000000-0000-0000-0000-000000000000', 'st677@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st677@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bca977cc-de95-5c09-9fda-e4e4ec7c1f64', 'bca977cc-de95-5c09-9fda-e4e4ec7c1f64', '{"sub": "bca977cc-de95-5c09-9fda-e4e4ec7c1f64", "email": "st677@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bca977cc-de95-5c09-9fda-e4e4ec7c1f64')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bca977cc-de95-5c09-9fda-e4e4ec7c1f64', 'admin', 'st677@boss.com', 'Admin Jason Orchard Inn EVCS - GO EC', 'Jason Orchard Inn EVCS - GO EC', 'Jason Orchard Inn EVCS - GO EC, Alappuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d5bc39ae-82b2-50e1-8ebc-17f56e58cf8f', 'bca977cc-de95-5c09-9fda-e4e4ec7c1f64', 'Jason Orchard Inn EVCS - GO EC', 'Jason Orchard Inn EVCS - GO EC, Alappuzha, Kerala, India', 9.562575062, 76.32758403, 'India EV Network License', 'LIC-IN-ST677', 500.0, 30.0, true, 'Alappuzha', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd5bc39ae-82b2-50e1-8ebc-17f56e58cf8f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4ae802b4-0d0f-53c5-b6ca-154081d67a4a', 'd5bc39ae-82b2-50e1-8ebc-17f56e58cf8f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7cfd949e-a229-547a-a673-f01213e750f6', 'd5bc39ae-82b2-50e1-8ebc-17f56e58cf8f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 678: Huts Restaurant EVCS - GO EC (Cherthala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('669bb127-5115-5107-9df6-5d91e4732d57', '00000000-0000-0000-0000-000000000000', 'st678@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st678@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('669bb127-5115-5107-9df6-5d91e4732d57', '669bb127-5115-5107-9df6-5d91e4732d57', '{"sub": "669bb127-5115-5107-9df6-5d91e4732d57", "email": "st678@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '669bb127-5115-5107-9df6-5d91e4732d57')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('669bb127-5115-5107-9df6-5d91e4732d57', 'admin', 'st678@boss.com', 'Admin Huts Restaurant EVCS - GO EC', 'Huts Restaurant EVCS - GO EC', 'Huts Restaurant EVCS - GO EC, Cherthala, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('986333bc-46a1-530b-a49c-f5c47d9b6323', '669bb127-5115-5107-9df6-5d91e4732d57', 'Huts Restaurant EVCS - GO EC', 'Huts Restaurant EVCS - GO EC, Cherthala, Kerala, India', 9.683890802, 76.33358219, 'India EV Network License', 'LIC-IN-ST678', 500.0, 30.0, true, 'Cherthala', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '986333bc-46a1-530b-a49c-f5c47d9b6323';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7382407e-cf85-57d5-a770-36b974e13e82', '986333bc-46a1-530b-a49c-f5c47d9b6323', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f8fd1861-ca5b-5008-a541-0a9056a2ee60', '986333bc-46a1-530b-a49c-f5c47d9b6323', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 679: Vijaya EVCS - GO EC (Kanjiramattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b0ce4fb7-5879-50fc-928b-a0864f6177b9', '00000000-0000-0000-0000-000000000000', 'st679@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st679@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b0ce4fb7-5879-50fc-928b-a0864f6177b9', 'b0ce4fb7-5879-50fc-928b-a0864f6177b9', '{"sub": "b0ce4fb7-5879-50fc-928b-a0864f6177b9", "email": "st679@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b0ce4fb7-5879-50fc-928b-a0864f6177b9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b0ce4fb7-5879-50fc-928b-a0864f6177b9', 'admin', 'st679@boss.com', 'Admin Vijaya EVCS - GO EC', 'Vijaya EVCS - GO EC', 'Vijaya EVCS - GO EC, Kanjiramattom, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cb440fae-013a-54e8-b152-6d01d27a21d9', 'b0ce4fb7-5879-50fc-928b-a0864f6177b9', 'Vijaya EVCS - GO EC', 'Vijaya EVCS - GO EC, Kanjiramattom, Kerala, India', 9.851840438, 76.38938787, 'India EV Network License', 'LIC-IN-ST679', 500.0, 30.0, true, 'Kanjiramattom', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cb440fae-013a-54e8-b152-6d01d27a21d9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a67e3062-ac86-54c3-939b-2b9496c957e4', 'cb440fae-013a-54e8-b152-6d01d27a21d9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('978d2d0c-7798-597c-894e-405d4902e21d', 'cb440fae-013a-54e8-b152-6d01d27a21d9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 680: MPA Tyres EVCS - GO EC (Thrippunithura, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bdd34bc1-757f-5572-b009-82fda7cd3d06', '00000000-0000-0000-0000-000000000000', 'st680@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st680@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bdd34bc1-757f-5572-b009-82fda7cd3d06', 'bdd34bc1-757f-5572-b009-82fda7cd3d06', '{"sub": "bdd34bc1-757f-5572-b009-82fda7cd3d06", "email": "st680@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bdd34bc1-757f-5572-b009-82fda7cd3d06')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bdd34bc1-757f-5572-b009-82fda7cd3d06', 'admin', 'st680@boss.com', 'Admin MPA Tyres EVCS - GO EC', 'MPA Tyres EVCS - GO EC', 'MPA Tyres EVCS - GO EC, Thrippunithura, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0bfa93c2-5173-537e-b70d-3a46bcb02961', 'bdd34bc1-757f-5572-b009-82fda7cd3d06', 'MPA Tyres EVCS - GO EC', 'MPA Tyres EVCS - GO EC, Thrippunithura, Kerala, India', 9.962610268, 76.35800116, 'India EV Network License', 'LIC-IN-ST680', 500.0, 30.0, true, 'Thrippunithura', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0bfa93c2-5173-537e-b70d-3a46bcb02961';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c0c10abe-70b8-5282-b3a2-edffd7076ed4', '0bfa93c2-5173-537e-b70d-3a46bcb02961', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('92a3eb10-f313-5d95-9770-1e20260ea802', '0bfa93c2-5173-537e-b70d-3a46bcb02961', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 681: Central Talkies EVCS - GO EC (Thrippunithura, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5db21185-e2e9-54a0-a959-7aa413656632', '00000000-0000-0000-0000-000000000000', 'st681@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st681@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5db21185-e2e9-54a0-a959-7aa413656632', '5db21185-e2e9-54a0-a959-7aa413656632', '{"sub": "5db21185-e2e9-54a0-a959-7aa413656632", "email": "st681@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5db21185-e2e9-54a0-a959-7aa413656632')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5db21185-e2e9-54a0-a959-7aa413656632', 'admin', 'st681@boss.com', 'Admin Central Talkies EVCS - GO EC', 'Central Talkies EVCS - GO EC', 'Central Talkies EVCS - GO EC, Thrippunithura, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('afe178ec-3593-5508-9c38-c1af4ea5090e', '5db21185-e2e9-54a0-a959-7aa413656632', 'Central Talkies EVCS - GO EC', 'Central Talkies EVCS - GO EC, Thrippunithura, Kerala, India', 9.948953178, 76.34771092, 'India EV Network License', 'LIC-IN-ST681', 500.0, 30.0, true, 'Thrippunithura', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'afe178ec-3593-5508-9c38-c1af4ea5090e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b68df041-d75d-5915-b88e-6d44398d7d3c', 'afe178ec-3593-5508-9c38-c1af4ea5090e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1d9b5853-d7e6-537a-98cd-b052d3a03450', 'afe178ec-3593-5508-9c38-c1af4ea5090e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 682: Tribute Royale EVCS - GO EC (Maradu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('699ea624-14c5-5680-931c-c0e74efae9a5', '00000000-0000-0000-0000-000000000000', 'st682@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st682@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('699ea624-14c5-5680-931c-c0e74efae9a5', '699ea624-14c5-5680-931c-c0e74efae9a5', '{"sub": "699ea624-14c5-5680-931c-c0e74efae9a5", "email": "st682@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '699ea624-14c5-5680-931c-c0e74efae9a5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('699ea624-14c5-5680-931c-c0e74efae9a5', 'admin', 'st682@boss.com', 'Admin Tribute Royale EVCS - GO EC', 'Tribute Royale EVCS - GO EC', 'Tribute Royale EVCS - GO EC, Maradu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3af16460-5095-5458-8f15-fb6995564660', '699ea624-14c5-5680-931c-c0e74efae9a5', 'Tribute Royale EVCS - GO EC', 'Tribute Royale EVCS - GO EC, Maradu, Kerala, India', 9.94775836, 76.31854611, 'India EV Network License', 'LIC-IN-ST682', 500.0, 30.0, true, 'Maradu', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3af16460-5095-5458-8f15-fb6995564660';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c3ce9463-79a3-5117-8443-cc5b93d31cae', '3af16460-5095-5458-8f15-fb6995564660', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9d60f8aa-669d-5320-97cc-ab462fff0ce7', '3af16460-5095-5458-8f15-fb6995564660', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 683: Prithvi EVCS - GO EC (Kadavanthra, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('195f9297-a7ad-59a0-b033-325a52173332', '00000000-0000-0000-0000-000000000000', 'st683@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st683@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('195f9297-a7ad-59a0-b033-325a52173332', '195f9297-a7ad-59a0-b033-325a52173332', '{"sub": "195f9297-a7ad-59a0-b033-325a52173332", "email": "st683@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '195f9297-a7ad-59a0-b033-325a52173332')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('195f9297-a7ad-59a0-b033-325a52173332', 'admin', 'st683@boss.com', 'Admin Prithvi EVCS - GO EC', 'Prithvi EVCS - GO EC', 'Prithvi EVCS - GO EC, Kadavanthra, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('29a045dd-c6f1-5ac3-a767-0a01caa88752', '195f9297-a7ad-59a0-b033-325a52173332', 'Prithvi EVCS - GO EC', 'Prithvi EVCS - GO EC, Kadavanthra, Kerala, India', 9.947451633, 76.30341556, 'India EV Network License', 'LIC-IN-ST683', 500.0, 30.0, true, 'Kadavanthra', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '29a045dd-c6f1-5ac3-a767-0a01caa88752';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f645cc1f-2c18-5a0f-935e-541dfa6ba94e', '29a045dd-c6f1-5ac3-a767-0a01caa88752', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ddeb8180-8acc-5056-9055-529efd776415', '29a045dd-c6f1-5ac3-a767-0a01caa88752', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 684: EC City Centre EVCS - GO EC (Ernakulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0fea6943-cd74-5468-9766-7ed4c129c1b0', '00000000-0000-0000-0000-000000000000', 'st684@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st684@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0fea6943-cd74-5468-9766-7ed4c129c1b0', '0fea6943-cd74-5468-9766-7ed4c129c1b0', '{"sub": "0fea6943-cd74-5468-9766-7ed4c129c1b0", "email": "st684@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0fea6943-cd74-5468-9766-7ed4c129c1b0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0fea6943-cd74-5468-9766-7ed4c129c1b0', 'admin', 'st684@boss.com', 'Admin EC City Centre EVCS - GO EC', 'EC City Centre EVCS - GO EC', 'EC City Centre EVCS - GO EC, Ernakulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8a82d000-a190-5ceb-a8fb-29818502d983', '0fea6943-cd74-5468-9766-7ed4c129c1b0', 'EC City Centre EVCS - GO EC', 'EC City Centre EVCS - GO EC, Ernakulam, Kerala, India', 9.965194492, 76.29662321, 'India EV Network License', 'LIC-IN-ST684', 500.0, 30.0, true, 'Ernakulam', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8a82d000-a190-5ceb-a8fb-29818502d983';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('352f21d9-4449-5404-8edc-e186778c2e7e', '8a82d000-a190-5ceb-a8fb-29818502d983', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2b55d4e8-6fad-528f-9f40-e37af3556703', '8a82d000-a190-5ceb-a8fb-29818502d983', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 685: Monsoon Empress Hotel EVCS (Palarivattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('949cb1ac-a9c7-5b65-ac2f-bd1a599ad7a6', '00000000-0000-0000-0000-000000000000', 'st685@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st685@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('949cb1ac-a9c7-5b65-ac2f-bd1a599ad7a6', '949cb1ac-a9c7-5b65-ac2f-bd1a599ad7a6', '{"sub": "949cb1ac-a9c7-5b65-ac2f-bd1a599ad7a6", "email": "st685@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '949cb1ac-a9c7-5b65-ac2f-bd1a599ad7a6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('949cb1ac-a9c7-5b65-ac2f-bd1a599ad7a6', 'admin', 'st685@boss.com', 'Admin Monsoon Empress Hotel EVCS', 'Monsoon Empress Hotel EVCS', 'Monsoon Empress Hotel EVCS, Palarivattom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9479e690-965c-59e7-b42c-015ba23ccd91', '949cb1ac-a9c7-5b65-ac2f-bd1a599ad7a6', 'Monsoon Empress Hotel EVCS', 'Monsoon Empress Hotel EVCS, Palarivattom, Kerala, India', 9.995959579, 76.31410218, 'India EV Network License', 'LIC-IN-ST685', 500.0, 7.4, true, 'Palarivattom', 'Kerala', 1, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9479e690-965c-59e7-b42c-015ba23ccd91';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0e9614ac-fc9d-5649-b403-56af850c5ed4', '9479e690-965c-59e7-b42c-015ba23ccd91', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 686: Max EVCS - GO EC (Palarivattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b7456b1c-964d-508c-b77a-f69b94df4a53', '00000000-0000-0000-0000-000000000000', 'st686@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st686@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b7456b1c-964d-508c-b77a-f69b94df4a53', 'b7456b1c-964d-508c-b77a-f69b94df4a53', '{"sub": "b7456b1c-964d-508c-b77a-f69b94df4a53", "email": "st686@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b7456b1c-964d-508c-b77a-f69b94df4a53')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b7456b1c-964d-508c-b77a-f69b94df4a53', 'admin', 'st686@boss.com', 'Admin Max EVCS - GO EC', 'Max EVCS - GO EC', 'Max EVCS - GO EC, Palarivattom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ffa25b19-68d8-5f5d-beff-db76d627891e', 'b7456b1c-964d-508c-b77a-f69b94df4a53', 'Max EVCS - GO EC', 'Max EVCS - GO EC, Palarivattom, Kerala, India', 9.998499334, 76.31386096, 'India EV Network License', 'LIC-IN-ST686', 500.0, 30.0, true, 'Palarivattom', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ffa25b19-68d8-5f5d-beff-db76d627891e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('39eff0e3-218d-510d-9f51-5e025d627e9c', 'ffa25b19-68d8-5f5d-beff-db76d627891e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5d69007-8289-52bf-9d3f-30d197281a6e', 'ffa25b19-68d8-5f5d-beff-db76d627891e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 687: Park Residency EVCS - GO EC (Kakkanad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('951f1067-c6cb-539d-8fae-493fd9d163f9', '00000000-0000-0000-0000-000000000000', 'st687@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st687@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('951f1067-c6cb-539d-8fae-493fd9d163f9', '951f1067-c6cb-539d-8fae-493fd9d163f9', '{"sub": "951f1067-c6cb-539d-8fae-493fd9d163f9", "email": "st687@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '951f1067-c6cb-539d-8fae-493fd9d163f9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('951f1067-c6cb-539d-8fae-493fd9d163f9', 'admin', 'st687@boss.com', 'Admin Park Residency EVCS - GO EC', 'Park Residency EVCS - GO EC', 'Park Residency EVCS - GO EC, Kakkanad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('24abde04-12aa-5b8f-947f-b7ce9b7fabb1', '951f1067-c6cb-539d-8fae-493fd9d163f9', 'Park Residency EVCS - GO EC', 'Park Residency EVCS - GO EC, Kakkanad, Kerala, India', 10.01465881, 76.3424006, 'India EV Network License', 'LIC-IN-ST687', 500.0, 30.0, true, 'Kakkanad', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '24abde04-12aa-5b8f-947f-b7ce9b7fabb1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('272ca704-ddfc-5a95-879c-252ca3118291', '24abde04-12aa-5b8f-947f-b7ce9b7fabb1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5be45193-13b7-54d0-8785-d0a776c3c729', '24abde04-12aa-5b8f-947f-b7ce9b7fabb1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 688: EVGO Hub - GO EC (Thrikkakkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('17455138-4b32-529a-a74c-951a8637492b', '00000000-0000-0000-0000-000000000000', 'st688@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st688@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('17455138-4b32-529a-a74c-951a8637492b', '17455138-4b32-529a-a74c-951a8637492b', '{"sub": "17455138-4b32-529a-a74c-951a8637492b", "email": "st688@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '17455138-4b32-529a-a74c-951a8637492b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('17455138-4b32-529a-a74c-951a8637492b', 'admin', 'st688@boss.com', 'Admin EVGO Hub - GO EC', 'EVGO Hub - GO EC', 'EVGO Hub - GO EC, Thrikkakkara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('df80d714-5aa7-5301-8439-43f29618447c', '17455138-4b32-529a-a74c-951a8637492b', 'EVGO Hub - GO EC', 'EVGO Hub - GO EC, Thrikkakkara, Kerala, India', 10.03567399, 76.33644845, 'India EV Network License', 'LIC-IN-ST688', 500.0, 30.0, true, 'Thrikkakkara', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'df80d714-5aa7-5301-8439-43f29618447c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a27d4b50-34fa-5572-9bc1-c2a15e0e7bb7', 'df80d714-5aa7-5301-8439-43f29618447c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b4d2b976-a70b-5a2a-940e-9671b175983d', 'df80d714-5aa7-5301-8439-43f29618447c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 689: Daffodils EVCS - GO EC (Edapally, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('77085e79-02d7-52b6-8e13-e863d721d520', '00000000-0000-0000-0000-000000000000', 'st689@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st689@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('77085e79-02d7-52b6-8e13-e863d721d520', '77085e79-02d7-52b6-8e13-e863d721d520', '{"sub": "77085e79-02d7-52b6-8e13-e863d721d520", "email": "st689@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '77085e79-02d7-52b6-8e13-e863d721d520')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('77085e79-02d7-52b6-8e13-e863d721d520', 'admin', 'st689@boss.com', 'Admin Daffodils EVCS - GO EC', 'Daffodils EVCS - GO EC', 'Daffodils EVCS - GO EC, Edapally, Kerala, India', 500.0, 7, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('eb81e95a-edef-5a4b-9e8f-7768e8aa9ec2', '77085e79-02d7-52b6-8e13-e863d721d520', 'Daffodils EVCS - GO EC', 'Daffodils EVCS - GO EC, Edapally, Kerala, India', 10.03211451, 76.32296046, 'India EV Network License', 'LIC-IN-ST689', 500.0, 30.0, true, 'Edapally', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'eb81e95a-edef-5a4b-9e8f-7768e8aa9ec2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e1f3606f-a327-591c-a99b-fe3b7b27077f', 'eb81e95a-edef-5a4b-9e8f-7768e8aa9ec2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5b867b0a-0077-51bd-a363-6b2601701636', 'eb81e95a-edef-5a4b-9e8f-7768e8aa9ec2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 690: Oberon Mall EVCS - GO EC (Edapally, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c8e92053-6b8e-5dd0-9bd4-4d7bba509665', '00000000-0000-0000-0000-000000000000', 'st690@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st690@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c8e92053-6b8e-5dd0-9bd4-4d7bba509665', 'c8e92053-6b8e-5dd0-9bd4-4d7bba509665', '{"sub": "c8e92053-6b8e-5dd0-9bd4-4d7bba509665", "email": "st690@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c8e92053-6b8e-5dd0-9bd4-4d7bba509665')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c8e92053-6b8e-5dd0-9bd4-4d7bba509665', 'admin', 'st690@boss.com', 'Admin Oberon Mall EVCS - GO EC', 'Oberon Mall EVCS - GO EC', 'Oberon Mall EVCS - GO EC, Edapally, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6dab9013-3bc9-5350-839d-79ea60f1d142', 'c8e92053-6b8e-5dd0-9bd4-4d7bba509665', 'Oberon Mall EVCS - GO EC', 'Oberon Mall EVCS - GO EC, Edapally, Kerala, India', 10.01437332, 76.31253274, 'India EV Network License', 'LIC-IN-ST690', 500.0, 30.0, true, 'Edapally', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6dab9013-3bc9-5350-839d-79ea60f1d142';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('99867682-fd4c-5391-90b3-49486eba242a', '6dab9013-3bc9-5350-839d-79ea60f1d142', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4f041815-5441-5343-9931-5940e700a7bb', '6dab9013-3bc9-5350-839d-79ea60f1d142', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 691: Lulu International Shopping Mall EVCS - GO EC (Edapally, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('21840142-d981-5f65-8407-4cb7acc1569d', '00000000-0000-0000-0000-000000000000', 'st691@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st691@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('21840142-d981-5f65-8407-4cb7acc1569d', '21840142-d981-5f65-8407-4cb7acc1569d', '{"sub": "21840142-d981-5f65-8407-4cb7acc1569d", "email": "st691@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '21840142-d981-5f65-8407-4cb7acc1569d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('21840142-d981-5f65-8407-4cb7acc1569d', 'admin', 'st691@boss.com', 'Admin Lulu International Shopping Mall EVCS - GO EC', 'Lulu International Shopping Mall EVCS - GO EC', 'Lulu International Shopping Mall EVCS - GO EC, Edapally, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fd8acae4-0df5-5c38-9b4d-1e826b5beeb8', '21840142-d981-5f65-8407-4cb7acc1569d', 'Lulu International Shopping Mall EVCS - GO EC', 'Lulu International Shopping Mall EVCS - GO EC, Edapally, Kerala, India', 10.025853, 76.30847988, 'India EV Network License', 'LIC-IN-ST691', 500.0, 30.0, true, 'Edapally', 'Kerala', 2, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fd8acae4-0df5-5c38-9b4d-1e826b5beeb8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3294f4d2-cbe7-50df-a804-ae83b183363f', 'fd8acae4-0df5-5c38-9b4d-1e826b5beeb8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0681955f-1958-57be-8385-2238b5b2a7c5', 'fd8acae4-0df5-5c38-9b4d-1e826b5beeb8', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 692: EcoPlug EVCS - GO EC (Neriyamangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8cbd0865-1fda-572a-b797-18f44891c418', '00000000-0000-0000-0000-000000000000', 'st692@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st692@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8cbd0865-1fda-572a-b797-18f44891c418', '8cbd0865-1fda-572a-b797-18f44891c418', '{"sub": "8cbd0865-1fda-572a-b797-18f44891c418", "email": "st692@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8cbd0865-1fda-572a-b797-18f44891c418')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8cbd0865-1fda-572a-b797-18f44891c418', 'admin', 'st692@boss.com', 'Admin EcoPlug EVCS - GO EC', 'EcoPlug EVCS - GO EC', 'EcoPlug EVCS - GO EC, Neriyamangalam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('708356da-479c-5dfa-9788-7b1fd7903cc6', '8cbd0865-1fda-572a-b797-18f44891c418', 'EcoPlug EVCS - GO EC', 'EcoPlug EVCS - GO EC, Neriyamangalam, Kerala, India', 10.05657909, 76.77664747, 'India EV Network License', 'LIC-IN-ST692', 500.0, 30.0, true, 'Neriyamangalam', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '708356da-479c-5dfa-9788-7b1fd7903cc6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('92860cea-1c29-5e53-910f-fd273d365cc6', '708356da-479c-5dfa-9788-7b1fd7903cc6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cc8b15e9-8266-5974-a5cd-587816f75cc6', '708356da-479c-5dfa-9788-7b1fd7903cc6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 693: Future Clock EVCS - GO EC (Perumbavoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d954467f-518f-5edf-ae12-4750a3cf3968', '00000000-0000-0000-0000-000000000000', 'st693@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st693@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d954467f-518f-5edf-ae12-4750a3cf3968', 'd954467f-518f-5edf-ae12-4750a3cf3968', '{"sub": "d954467f-518f-5edf-ae12-4750a3cf3968", "email": "st693@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd954467f-518f-5edf-ae12-4750a3cf3968')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d954467f-518f-5edf-ae12-4750a3cf3968', 'admin', 'st693@boss.com', 'Admin Future Clock EVCS - GO EC', 'Future Clock EVCS - GO EC', 'Future Clock EVCS - GO EC, Perumbavoor, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fa7561d7-f7bd-5516-a7c8-0056f7f294c0', 'd954467f-518f-5edf-ae12-4750a3cf3968', 'Future Clock EVCS - GO EC', 'Future Clock EVCS - GO EC, Perumbavoor, Kerala, India', 10.08987328, 76.49767034, 'India EV Network License', 'LIC-IN-ST693', 500.0, 30.0, true, 'Perumbavoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fa7561d7-f7bd-5516-a7c8-0056f7f294c0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fc949272-c630-5433-ae6c-8f6496baf49e', 'fa7561d7-f7bd-5516-a7c8-0056f7f294c0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('21baf2fe-31ac-57c0-8ebe-6839a1e427e3', 'fa7561d7-f7bd-5516-a7c8-0056f7f294c0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 694: Prestige EV Super Charging Station - GO EC (Perumbavoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6133db3e-c61a-5045-8500-35028f5f9570', '00000000-0000-0000-0000-000000000000', 'st694@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st694@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6133db3e-c61a-5045-8500-35028f5f9570', '6133db3e-c61a-5045-8500-35028f5f9570', '{"sub": "6133db3e-c61a-5045-8500-35028f5f9570", "email": "st694@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6133db3e-c61a-5045-8500-35028f5f9570')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6133db3e-c61a-5045-8500-35028f5f9570', 'admin', 'st694@boss.com', 'Admin Prestige EV Super Charging Station - GO EC', 'Prestige EV Super Charging Station - GO EC', 'Prestige EV Super Charging Station - GO EC, Perumbavoor, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6e7ef12a-2d19-56d3-9359-6492e639d98a', '6133db3e-c61a-5045-8500-35028f5f9570', 'Prestige EV Super Charging Station - GO EC', 'Prestige EV Super Charging Station - GO EC, Perumbavoor, Kerala, India', 10.11659967, 76.44569941, 'India EV Network License', 'LIC-IN-ST694', 500.0, 30.0, true, 'Perumbavoor', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6e7ef12a-2d19-56d3-9359-6492e639d98a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('33ce72ef-1808-5564-b756-34fd7d54fb4d', '6e7ef12a-2d19-56d3-9359-6492e639d98a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2565ea93-5615-55b5-8ef8-49171574e908', '6e7ef12a-2d19-56d3-9359-6492e639d98a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 695: Innate Convention Centre (Aluva, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8f3989a6-821b-5607-931b-b990713a94a2', '00000000-0000-0000-0000-000000000000', 'st695@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st695@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8f3989a6-821b-5607-931b-b990713a94a2', '8f3989a6-821b-5607-931b-b990713a94a2', '{"sub": "8f3989a6-821b-5607-931b-b990713a94a2", "email": "st695@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8f3989a6-821b-5607-931b-b990713a94a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8f3989a6-821b-5607-931b-b990713a94a2', 'admin', 'st695@boss.com', 'Admin Innate Convention Centre', 'Innate Convention Centre', 'Innate Convention Centre, Aluva, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1f963672-fb31-5496-ab21-63a03a2d7044', '8f3989a6-821b-5607-931b-b990713a94a2', 'Innate Convention Centre', 'Innate Convention Centre, Aluva, Kerala, India', 10.13484738, 76.35454904, 'India EV Network License', 'LIC-IN-ST695', 500.0, 7.4, true, 'Aluva', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1f963672-fb31-5496-ab21-63a03a2d7044';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('99edf3a7-2eac-5f09-8142-30dc80c5e1d7', '1f963672-fb31-5496-ab21-63a03a2d7044', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 696: Athani Energize EVCS (Athani, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d5793e67-392b-5c0b-93f4-5feb891da0cc', '00000000-0000-0000-0000-000000000000', 'st696@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st696@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d5793e67-392b-5c0b-93f4-5feb891da0cc', 'd5793e67-392b-5c0b-93f4-5feb891da0cc', '{"sub": "d5793e67-392b-5c0b-93f4-5feb891da0cc", "email": "st696@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd5793e67-392b-5c0b-93f4-5feb891da0cc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d5793e67-392b-5c0b-93f4-5feb891da0cc', 'admin', 'st696@boss.com', 'Admin Athani Energize EVCS', 'Athani Energize EVCS', 'Athani Energize EVCS, Athani, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('735a489d-ee86-5aed-8b62-b451fec238c9', 'd5793e67-392b-5c0b-93f4-5feb891da0cc', 'Athani Energize EVCS', 'Athani Energize EVCS, Athani, Kerala, India', 10.14144398, 76.35293383, 'India EV Network License', 'LIC-IN-ST696', 500.0, 7.4, true, 'Athani', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '735a489d-ee86-5aed-8b62-b451fec238c9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('65592b15-0217-55ae-b6b5-5998dd119d75', '735a489d-ee86-5aed-8b62-b451fec238c9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 697: Hotel Airlink Castle - GO EC (Athani, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('225827b4-85f6-5fac-8afd-4dcc1ec78c5e', '00000000-0000-0000-0000-000000000000', 'st697@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st697@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('225827b4-85f6-5fac-8afd-4dcc1ec78c5e', '225827b4-85f6-5fac-8afd-4dcc1ec78c5e', '{"sub": "225827b4-85f6-5fac-8afd-4dcc1ec78c5e", "email": "st697@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '225827b4-85f6-5fac-8afd-4dcc1ec78c5e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('225827b4-85f6-5fac-8afd-4dcc1ec78c5e', 'admin', 'st697@boss.com', 'Admin Hotel Airlink Castle - GO EC', 'Hotel Airlink Castle - GO EC', 'Hotel Airlink Castle - GO EC, Athani, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a7600310-d510-5846-9659-72641efe3741', '225827b4-85f6-5fac-8afd-4dcc1ec78c5e', 'Hotel Airlink Castle - GO EC', 'Hotel Airlink Castle - GO EC, Athani, Kerala, India', 10.15505346, 76.35471453, 'India EV Network License', 'LIC-IN-ST697', 500.0, 30.0, true, 'Athani', 'Kerala', 2, 'GO EC (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a7600310-d510-5846-9659-72641efe3741';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('55176442-b9cd-5ee1-b8cb-ae86d13a3390', 'a7600310-d510-5846-9659-72641efe3741', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('200c22f4-f5bf-5955-9528-17f28b4cb431', 'a7600310-d510-5846-9659-72641efe3741', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 698: V-Green EVCS - GO EC (Angamaly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('63148684-722d-5fc7-9746-29bc21747776', '00000000-0000-0000-0000-000000000000', 'st698@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st698@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('63148684-722d-5fc7-9746-29bc21747776', '63148684-722d-5fc7-9746-29bc21747776', '{"sub": "63148684-722d-5fc7-9746-29bc21747776", "email": "st698@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '63148684-722d-5fc7-9746-29bc21747776')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('63148684-722d-5fc7-9746-29bc21747776', 'admin', 'st698@boss.com', 'Admin V-Green EVCS - GO EC', 'V-Green EVCS - GO EC', 'V-Green EVCS - GO EC, Angamaly, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f77b12c4-2660-5b7d-862c-06fbd88209f1', '63148684-722d-5fc7-9746-29bc21747776', 'V-Green EVCS - GO EC', 'V-Green EVCS - GO EC, Angamaly, Kerala, India', 10.20178009, 76.40966162, 'India EV Network License', 'LIC-IN-ST698', 500.0, 30.0, true, 'Angamaly', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f77b12c4-2660-5b7d-862c-06fbd88209f1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dbb0cb44-51c7-5352-bf33-bed3d2b19b4f', 'f77b12c4-2660-5b7d-862c-06fbd88209f1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1cb90433-f080-5753-87db-7449d322a377', 'f77b12c4-2660-5b7d-862c-06fbd88209f1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 699: Power Zone EV Charging Station - GO EC (North Paravur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e62207ea-8a97-5ce7-80c2-9267bc4f114e', '00000000-0000-0000-0000-000000000000', 'st699@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st699@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e62207ea-8a97-5ce7-80c2-9267bc4f114e', 'e62207ea-8a97-5ce7-80c2-9267bc4f114e', '{"sub": "e62207ea-8a97-5ce7-80c2-9267bc4f114e", "email": "st699@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e62207ea-8a97-5ce7-80c2-9267bc4f114e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e62207ea-8a97-5ce7-80c2-9267bc4f114e', 'admin', 'st699@boss.com', 'Admin Power Zone EV Charging Station - GO EC', 'Power Zone EV Charging Station - GO EC', 'Power Zone EV Charging Station - GO EC, North Paravur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a827bb05-6ecb-5b0d-a18f-c538c243beb9', 'e62207ea-8a97-5ce7-80c2-9267bc4f114e', 'Power Zone EV Charging Station - GO EC', 'Power Zone EV Charging Station - GO EC, North Paravur, Kerala, India', 10.14967303, 76.21756419, 'India EV Network License', 'LIC-IN-ST699', 500.0, 30.0, true, 'North Paravur', 'Kerala', 2, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a827bb05-6ecb-5b0d-a18f-c538c243beb9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('72e5f648-223f-5d17-89e2-97207fed3806', 'a827bb05-6ecb-5b0d-a18f-c538c243beb9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('94610427-48d8-5406-bac0-c79816e4bebc', 'a827bb05-6ecb-5b0d-a18f-c538c243beb9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 700: Koratty Chennai Anandabhavan EVCS - GO EC (Koratty, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('34fcfd08-ab67-50ba-9f25-eb38a02052af', '00000000-0000-0000-0000-000000000000', 'st700@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st700@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('34fcfd08-ab67-50ba-9f25-eb38a02052af', '34fcfd08-ab67-50ba-9f25-eb38a02052af', '{"sub": "34fcfd08-ab67-50ba-9f25-eb38a02052af", "email": "st700@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '34fcfd08-ab67-50ba-9f25-eb38a02052af')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('34fcfd08-ab67-50ba-9f25-eb38a02052af', 'admin', 'st700@boss.com', 'Admin Koratty Chennai Anandabhavan EVCS - GO EC', 'Koratty Chennai Anandabhavan EVCS - GO EC', 'Koratty Chennai Anandabhavan EVCS - GO EC, Koratty, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4a58072d-914f-5b8b-9008-85b3e52a34e7', '34fcfd08-ab67-50ba-9f25-eb38a02052af', 'Koratty Chennai Anandabhavan EVCS - GO EC', 'Koratty Chennai Anandabhavan EVCS - GO EC, Koratty, Kerala, India', 10.27724459, 76.34452808, 'India EV Network License', 'LIC-IN-ST700', 500.0, 30.0, true, 'Koratty', 'Kerala', 2, 'GO EC (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4a58072d-914f-5b8b-9008-85b3e52a34e7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('20f29697-6662-5281-838d-9d889bb74845', '4a58072d-914f-5b8b-9008-85b3e52a34e7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('24fe16c9-974c-5100-8bbf-8e73a4aa1ed7', '4a58072d-914f-5b8b-9008-85b3e52a34e7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
