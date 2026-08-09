-- Seed Stations Part 4 (Stations 301 to 400)
BEGIN;

-- Station 301: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b266aac0-ea0c-54a4-838e-afe925da68af', '00000000-0000-0000-0000-000000000000', 'st301@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st301@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b266aac0-ea0c-54a4-838e-afe925da68af', 'b266aac0-ea0c-54a4-838e-afe925da68af', '{"sub": "b266aac0-ea0c-54a4-838e-afe925da68af", "email": "st301@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b266aac0-ea0c-54a4-838e-afe925da68af')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b266aac0-ea0c-54a4-838e-afe925da68af', 'admin', 'st301@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a60cdeb7-0370-508b-bada-4dde59ea0b11', 'b266aac0-ea0c-54a4-838e-afe925da68af', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.799158, 85.664566, 'India EV Network License', 'LIC-IN-ST301', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a60cdeb7-0370-508b-bada-4dde59ea0b11';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ced35ac2-576b-5493-b9c9-7fb537112347', 'a60cdeb7-0370-508b-bada-4dde59ea0b11', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fa72afbb-0f23-57fb-8b46-3b9c9dd71873', 'a60cdeb7-0370-508b-bada-4dde59ea0b11', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 302: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('08e326ea-f44f-51b8-a6bb-fcd7731df0a9', '00000000-0000-0000-0000-000000000000', 'st302@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st302@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('08e326ea-f44f-51b8-a6bb-fcd7731df0a9', '08e326ea-f44f-51b8-a6bb-fcd7731df0a9', '{"sub": "08e326ea-f44f-51b8-a6bb-fcd7731df0a9", "email": "st302@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '08e326ea-f44f-51b8-a6bb-fcd7731df0a9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('08e326ea-f44f-51b8-a6bb-fcd7731df0a9', 'admin', 'st302@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b35cd75c-239f-5a49-9a65-5732b2175186', '08e326ea-f44f-51b8-a6bb-fcd7731df0a9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.71935, 85.5244868, 'India EV Network License', 'LIC-IN-ST302', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b35cd75c-239f-5a49-9a65-5732b2175186';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cd1dcb5f-c61d-592c-8b85-107103dec63c', 'b35cd75c-239f-5a49-9a65-5732b2175186', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9b04ee8d-510a-5634-a384-dcc6f0498213', 'b35cd75c-239f-5a49-9a65-5732b2175186', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 303: Jio-bp pulse Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7a4937ae-0018-515a-a6a9-e534bb878e95', '00000000-0000-0000-0000-000000000000', 'st303@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st303@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7a4937ae-0018-515a-a6a9-e534bb878e95', '7a4937ae-0018-515a-a6a9-e534bb878e95', '{"sub": "7a4937ae-0018-515a-a6a9-e534bb878e95", "email": "st303@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7a4937ae-0018-515a-a6a9-e534bb878e95')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7a4937ae-0018-515a-a6a9-e534bb878e95', 'admin', 'st303@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2e57a010-831b-51c2-bace-59dbfdbe4154', '7a4937ae-0018-515a-a6a9-e534bb878e95', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 19.67855, 85.171409, 'India EV Network License', 'LIC-IN-ST303', 500.0, 60.0, true, 'Balasore', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2e57a010-831b-51c2-bace-59dbfdbe4154';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('764fbf84-8b3c-59f4-a2c1-98a97b5274ce', '2e57a010-831b-51c2-bace-59dbfdbe4154', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5247d6d7-c5de-5148-9a5b-23b21fcdf04b', '2e57a010-831b-51c2-bace-59dbfdbe4154', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8f77056d-c276-5663-9079-ac57a9e7aeed', '2e57a010-831b-51c2-bace-59dbfdbe4154', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 304: Tata Power Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b8b4883e-0eb3-5f1d-94b9-2b7183623909', '00000000-0000-0000-0000-000000000000', 'st304@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st304@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b8b4883e-0eb3-5f1d-94b9-2b7183623909', 'b8b4883e-0eb3-5f1d-94b9-2b7183623909', '{"sub": "b8b4883e-0eb3-5f1d-94b9-2b7183623909", "email": "st304@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b8b4883e-0eb3-5f1d-94b9-2b7183623909')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b8b4883e-0eb3-5f1d-94b9-2b7183623909', 'admin', 'st304@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('da867a88-3c33-5cec-a209-9fee9de0fd54', 'b8b4883e-0eb3-5f1d-94b9-2b7183623909', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.6782474, 85.1714786, 'India EV Network License', 'LIC-IN-ST304', 500.0, 60.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'da867a88-3c33-5cec-a209-9fee9de0fd54';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4df22f31-fd36-513e-bb3a-82bb7dda96e7', 'da867a88-3c33-5cec-a209-9fee9de0fd54', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06d9f842-d128-5107-b21d-1bff86807b1d', 'da867a88-3c33-5cec-a209-9fee9de0fd54', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 305: Adani Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4dfd2982-8ac4-5b32-a38d-7cb6966847c0', '00000000-0000-0000-0000-000000000000', 'st305@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st305@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4dfd2982-8ac4-5b32-a38d-7cb6966847c0', '4dfd2982-8ac4-5b32-a38d-7cb6966847c0', '{"sub": "4dfd2982-8ac4-5b32-a38d-7cb6966847c0", "email": "st305@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4dfd2982-8ac4-5b32-a38d-7cb6966847c0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4dfd2982-8ac4-5b32-a38d-7cb6966847c0', 'admin', 'st305@boss.com', 'Admin Adani Charging Station', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9678fd98-adbb-503d-970a-035ce903a91b', '4dfd2982-8ac4-5b32-a38d-7cb6966847c0', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 19.6331555, 85.1353263, 'India EV Network License', 'LIC-IN-ST305', 500.0, 60.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9678fd98-adbb-503d-970a-035ce903a91b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('86be9f9a-2407-52c3-94ab-031f591920fd', '9678fd98-adbb-503d-970a-035ce903a91b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('76c301c9-70f8-58cd-a1f3-29a6e82bdfa6', '9678fd98-adbb-503d-970a-035ce903a91b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 306: BPCL Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('879fe3b0-03c8-5794-b950-b45b8510b724', '00000000-0000-0000-0000-000000000000', 'st306@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st306@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('879fe3b0-03c8-5794-b950-b45b8510b724', '879fe3b0-03c8-5794-b950-b45b8510b724', '{"sub": "879fe3b0-03c8-5794-b950-b45b8510b724", "email": "st306@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '879fe3b0-03c8-5794-b950-b45b8510b724')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('879fe3b0-03c8-5794-b950-b45b8510b724', 'admin', 'st306@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('182d2fac-d36d-5327-96d6-f23be8b9035f', '879fe3b0-03c8-5794-b950-b45b8510b724', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.749316, 85.207598, 'India EV Network License', 'LIC-IN-ST306', 500.0, 30.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '182d2fac-d36d-5327-96d6-f23be8b9035f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fd5d5684-259e-5367-b5fb-3b85333e0744', '182d2fac-d36d-5327-96d6-f23be8b9035f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('59004f70-72ff-5e31-9b83-32d1f90af0e8', '182d2fac-d36d-5327-96d6-f23be8b9035f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 307: Jio-bp (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('144890e8-c048-546e-8f4f-0375ccfddab0', '00000000-0000-0000-0000-000000000000', 'st307@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st307@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('144890e8-c048-546e-8f4f-0375ccfddab0', '144890e8-c048-546e-8f4f-0375ccfddab0', '{"sub": "144890e8-c048-546e-8f4f-0375ccfddab0", "email": "st307@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '144890e8-c048-546e-8f4f-0375ccfddab0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('144890e8-c048-546e-8f4f-0375ccfddab0', 'admin', 'st307@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('204a0bbc-6185-5af6-81df-f1c7dcf8271b', '144890e8-c048-546e-8f4f-0375ccfddab0', 'Jio-bp', 'Jio-bp, Odisha, India', 19.731375, 83.479141, 'India EV Network License', 'LIC-IN-ST307', 500.0, 50.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '204a0bbc-6185-5af6-81df-f1c7dcf8271b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('acb04fee-79eb-5b3e-9d54-2cda308b07c0', '204a0bbc-6185-5af6-81df-f1c7dcf8271b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('354c147a-135e-5c50-a33c-05876d5fb82b', '204a0bbc-6185-5af6-81df-f1c7dcf8271b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 308: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6d3afaed-2cc0-564d-b158-0de6cff88b93', '00000000-0000-0000-0000-000000000000', 'st308@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st308@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6d3afaed-2cc0-564d-b158-0de6cff88b93', '6d3afaed-2cc0-564d-b158-0de6cff88b93', '{"sub": "6d3afaed-2cc0-564d-b158-0de6cff88b93", "email": "st308@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6d3afaed-2cc0-564d-b158-0de6cff88b93')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6d3afaed-2cc0-564d-b158-0de6cff88b93', 'admin', 'st308@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d2060eff-2d8f-58c8-8065-90d47ab1a0d2', '6d3afaed-2cc0-564d-b158-0de6cff88b93', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.652453, 82.225619, 'India EV Network License', 'LIC-IN-ST308', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd2060eff-2d8f-58c8-8065-90d47ab1a0d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('03870e80-d9ca-5a5d-ac51-203846ee65cd', 'd2060eff-2d8f-58c8-8065-90d47ab1a0d2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('20ea142a-f96c-57ab-8384-6c3e04e7b0a2', 'd2060eff-2d8f-58c8-8065-90d47ab1a0d2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 309: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5356b34e-7041-59c5-b864-63bae0889c7e', '00000000-0000-0000-0000-000000000000', 'st309@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st309@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5356b34e-7041-59c5-b864-63bae0889c7e', '5356b34e-7041-59c5-b864-63bae0889c7e', '{"sub": "5356b34e-7041-59c5-b864-63bae0889c7e", "email": "st309@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5356b34e-7041-59c5-b864-63bae0889c7e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5356b34e-7041-59c5-b864-63bae0889c7e', 'admin', 'st309@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ad559741-8ee3-5f16-91fe-72aa57723ddf', '5356b34e-7041-59c5-b864-63bae0889c7e', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.31151, 84.83354, 'India EV Network License', 'LIC-IN-ST309', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ad559741-8ee3-5f16-91fe-72aa57723ddf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('13f0e39f-60fd-5c9b-9573-3596e9120c88', 'ad559741-8ee3-5f16-91fe-72aa57723ddf', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('370e97ff-ba43-5e7c-a48e-98ac6bf8ee9f', 'ad559741-8ee3-5f16-91fe-72aa57723ddf', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 310: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('db7be764-410c-5a45-95a3-710ac8e5eaed', '00000000-0000-0000-0000-000000000000', 'st310@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st310@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('db7be764-410c-5a45-95a3-710ac8e5eaed', 'db7be764-410c-5a45-95a3-710ac8e5eaed', '{"sub": "db7be764-410c-5a45-95a3-710ac8e5eaed", "email": "st310@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'db7be764-410c-5a45-95a3-710ac8e5eaed')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('db7be764-410c-5a45-95a3-710ac8e5eaed', 'admin', 'st310@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2ff41f7c-2c26-556b-890c-1c2e4cccc014', 'db7be764-410c-5a45-95a3-710ac8e5eaed', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.34123, 84.76845, 'India EV Network License', 'LIC-IN-ST310', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2ff41f7c-2c26-556b-890c-1c2e4cccc014';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cfd79529-ace2-5cde-83b4-d79c225252ad', '2ff41f7c-2c26-556b-890c-1c2e4cccc014', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4a27b92d-df40-5b9b-8a5c-bb23ab2f36b1', '2ff41f7c-2c26-556b-890c-1c2e4cccc014', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 311: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('52ad11a7-a360-5588-a8b2-43390d608080', '00000000-0000-0000-0000-000000000000', 'st311@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st311@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('52ad11a7-a360-5588-a8b2-43390d608080', '52ad11a7-a360-5588-a8b2-43390d608080', '{"sub": "52ad11a7-a360-5588-a8b2-43390d608080", "email": "st311@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '52ad11a7-a360-5588-a8b2-43390d608080')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('52ad11a7-a360-5588-a8b2-43390d608080', 'admin', 'st311@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d45ac7f7-a33b-5d31-8bfe-98dfc5da546d', '52ad11a7-a360-5588-a8b2-43390d608080', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.324255, 84.87503, 'India EV Network License', 'LIC-IN-ST311', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd45ac7f7-a33b-5d31-8bfe-98dfc5da546d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('404be645-4727-54db-bbe3-1fdfb3577725', 'd45ac7f7-a33b-5d31-8bfe-98dfc5da546d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('59028a7e-7124-568e-9535-bce3c0639d6d', 'd45ac7f7-a33b-5d31-8bfe-98dfc5da546d', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 312: Electric Vehicle Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bc3ed877-345c-5298-a7b4-3ed12f701ad9', '00000000-0000-0000-0000-000000000000', 'st312@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st312@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bc3ed877-345c-5298-a7b4-3ed12f701ad9', 'bc3ed877-345c-5298-a7b4-3ed12f701ad9', '{"sub": "bc3ed877-345c-5298-a7b4-3ed12f701ad9", "email": "st312@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bc3ed877-345c-5298-a7b4-3ed12f701ad9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bc3ed877-345c-5298-a7b4-3ed12f701ad9', 'admin', 'st312@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e382a281-e3e6-5467-afe3-12119cfcf486', 'bc3ed877-345c-5298-a7b4-3ed12f701ad9', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3171717, 84.7772474, 'India EV Network License', 'LIC-IN-ST312', 500.0, 25.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e382a281-e3e6-5467-afe3-12119cfcf486';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('65647b6a-521e-5ac4-8131-423f8563e55b', 'e382a281-e3e6-5467-afe3-12119cfcf486', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6cb1e906-d62f-5c59-9797-c544dfc08ceb', 'e382a281-e3e6-5467-afe3-12119cfcf486', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 313: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6216dfad-e065-5e56-aaca-ef5140b62644', '00000000-0000-0000-0000-000000000000', 'st313@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st313@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6216dfad-e065-5e56-aaca-ef5140b62644', '6216dfad-e065-5e56-aaca-ef5140b62644', '{"sub": "6216dfad-e065-5e56-aaca-ef5140b62644", "email": "st313@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6216dfad-e065-5e56-aaca-ef5140b62644')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6216dfad-e065-5e56-aaca-ef5140b62644', 'admin', 'st313@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ef0b41c5-9e9e-51d8-8f42-4df4d2b491e5', '6216dfad-e065-5e56-aaca-ef5140b62644', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3071386, 84.8292277, 'India EV Network License', 'LIC-IN-ST313', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ef0b41c5-9e9e-51d8-8f42-4df4d2b491e5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d40e7c99-9a37-561b-92b6-65f0ff9d45cf', 'ef0b41c5-9e9e-51d8-8f42-4df4d2b491e5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('90a6426e-5169-58fc-a2f6-ba784e7489c4', 'ef0b41c5-9e9e-51d8-8f42-4df4d2b491e5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 314: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('358ec315-5c28-53f4-a4ae-3be668461d16', '00000000-0000-0000-0000-000000000000', 'st314@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st314@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('358ec315-5c28-53f4-a4ae-3be668461d16', '358ec315-5c28-53f4-a4ae-3be668461d16', '{"sub": "358ec315-5c28-53f4-a4ae-3be668461d16", "email": "st314@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '358ec315-5c28-53f4-a4ae-3be668461d16')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('358ec315-5c28-53f4-a4ae-3be668461d16', 'admin', 'st314@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d64e4b94-c03d-5439-8f89-078eb2410387', '358ec315-5c28-53f4-a4ae-3be668461d16', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3194175, 84.7844863, 'India EV Network License', 'LIC-IN-ST314', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd64e4b94-c03d-5439-8f89-078eb2410387';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9a1206bc-3226-5a28-b846-faebb8f5469c', 'd64e4b94-c03d-5439-8f89-078eb2410387', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e1f7818b-85d2-55c8-a499-d8c16193150b', 'd64e4b94-c03d-5439-8f89-078eb2410387', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 315: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('51678db9-f977-5f7c-a48e-4473144a614a', '00000000-0000-0000-0000-000000000000', 'st315@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st315@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('51678db9-f977-5f7c-a48e-4473144a614a', '51678db9-f977-5f7c-a48e-4473144a614a', '{"sub": "51678db9-f977-5f7c-a48e-4473144a614a", "email": "st315@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '51678db9-f977-5f7c-a48e-4473144a614a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('51678db9-f977-5f7c-a48e-4473144a614a', 'admin', 'st315@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6c97828b-773f-5f95-85c8-ad2045a77ef0', '51678db9-f977-5f7c-a48e-4473144a614a', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.308462, 84.77319, 'India EV Network License', 'LIC-IN-ST315', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6c97828b-773f-5f95-85c8-ad2045a77ef0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('66de856f-cd04-54dd-b6bd-90f1f7a1d420', '6c97828b-773f-5f95-85c8-ad2045a77ef0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('98d7c3e3-de68-5d18-9ba0-d5a32a12b10e', '6c97828b-773f-5f95-85c8-ad2045a77ef0', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 316: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('957ad652-cf64-5c6b-a192-8aa503412e76', '00000000-0000-0000-0000-000000000000', 'st316@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st316@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('957ad652-cf64-5c6b-a192-8aa503412e76', '957ad652-cf64-5c6b-a192-8aa503412e76', '{"sub": "957ad652-cf64-5c6b-a192-8aa503412e76", "email": "st316@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '957ad652-cf64-5c6b-a192-8aa503412e76')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('957ad652-cf64-5c6b-a192-8aa503412e76', 'admin', 'st316@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e46ce2e1-6edf-580d-a216-040d2961913d', '957ad652-cf64-5c6b-a192-8aa503412e76', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.301504, 84.83013, 'India EV Network License', 'LIC-IN-ST316', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e46ce2e1-6edf-580d-a216-040d2961913d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('99494f0c-1947-5422-9b0f-3d1188acdd1f', 'e46ce2e1-6edf-580d-a216-040d2961913d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5fec7af8-3130-5a6e-a59b-a7e7bc062756', 'e46ce2e1-6edf-580d-a216-040d2961913d', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 317: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c55e4e8b-30c1-5222-8cb3-d533276d9c79', '00000000-0000-0000-0000-000000000000', 'st317@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st317@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c55e4e8b-30c1-5222-8cb3-d533276d9c79', 'c55e4e8b-30c1-5222-8cb3-d533276d9c79', '{"sub": "c55e4e8b-30c1-5222-8cb3-d533276d9c79", "email": "st317@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c55e4e8b-30c1-5222-8cb3-d533276d9c79')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c55e4e8b-30c1-5222-8cb3-d533276d9c79', 'admin', 'st317@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('670477d6-cd04-596a-92ff-be5dca115126', 'c55e4e8b-30c1-5222-8cb3-d533276d9c79', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.306038, 84.78173, 'India EV Network License', 'LIC-IN-ST317', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '670477d6-cd04-596a-92ff-be5dca115126';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('29705d48-537f-5d91-a31c-74fdcb779fda', '670477d6-cd04-596a-92ff-be5dca115126', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fa2b10d0-ab79-5d87-84f7-167f8abe4a60', '670477d6-cd04-596a-92ff-be5dca115126', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 318: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b26b8f5a-be2e-519d-89db-da56a62948b7', '00000000-0000-0000-0000-000000000000', 'st318@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st318@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b26b8f5a-be2e-519d-89db-da56a62948b7', 'b26b8f5a-be2e-519d-89db-da56a62948b7', '{"sub": "b26b8f5a-be2e-519d-89db-da56a62948b7", "email": "st318@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b26b8f5a-be2e-519d-89db-da56a62948b7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b26b8f5a-be2e-519d-89db-da56a62948b7', 'admin', 'st318@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7e9f488d-2a0d-51f3-912a-48ff388e432e', 'b26b8f5a-be2e-519d-89db-da56a62948b7', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.315211, 84.858144, 'India EV Network License', 'LIC-IN-ST318', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7e9f488d-2a0d-51f3-912a-48ff388e432e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('481665af-0346-5316-a73d-ce82bb19f4cd', '7e9f488d-2a0d-51f3-912a-48ff388e432e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b9efb0dd-ca5e-5bdc-ac30-0b49cf74b7bf', '7e9f488d-2a0d-51f3-912a-48ff388e432e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 319: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('37f3e52b-505d-5b9a-8439-8dea868ef7fa', '00000000-0000-0000-0000-000000000000', 'st319@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st319@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('37f3e52b-505d-5b9a-8439-8dea868ef7fa', '37f3e52b-505d-5b9a-8439-8dea868ef7fa', '{"sub": "37f3e52b-505d-5b9a-8439-8dea868ef7fa", "email": "st319@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '37f3e52b-505d-5b9a-8439-8dea868ef7fa')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('37f3e52b-505d-5b9a-8439-8dea868ef7fa', 'admin', 'st319@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7192fa22-2326-5665-8889-38219ef3fb9a', '37f3e52b-505d-5b9a-8439-8dea868ef7fa', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.31608, 84.85278, 'India EV Network License', 'LIC-IN-ST319', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7192fa22-2326-5665-8889-38219ef3fb9a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0eed9917-0884-5c73-a3c2-025882a2b8f3', '7192fa22-2326-5665-8889-38219ef3fb9a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('390bd241-47bf-5a45-9daf-c1179cfd3f8e', '7192fa22-2326-5665-8889-38219ef3fb9a', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 320: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf8c5b00-20c0-544f-9134-ed109637503f', '00000000-0000-0000-0000-000000000000', 'st320@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st320@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf8c5b00-20c0-544f-9134-ed109637503f', 'cf8c5b00-20c0-544f-9134-ed109637503f', '{"sub": "cf8c5b00-20c0-544f-9134-ed109637503f", "email": "st320@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf8c5b00-20c0-544f-9134-ed109637503f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf8c5b00-20c0-544f-9134-ed109637503f', 'admin', 'st320@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e0501987-187d-59c8-8a0b-e2cc71aeb47d', 'cf8c5b00-20c0-544f-9134-ed109637503f', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.30744, 84.81665, 'India EV Network License', 'LIC-IN-ST320', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e0501987-187d-59c8-8a0b-e2cc71aeb47d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('da6a5af1-1d92-5a13-835b-16935c749652', 'e0501987-187d-59c8-8a0b-e2cc71aeb47d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8753128d-0750-5da1-973c-f04886fa7484', 'e0501987-187d-59c8-8a0b-e2cc71aeb47d', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 321: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('200ceefe-04bd-551f-8456-fa752ef074de', '00000000-0000-0000-0000-000000000000', 'st321@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st321@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('200ceefe-04bd-551f-8456-fa752ef074de', '200ceefe-04bd-551f-8456-fa752ef074de', '{"sub": "200ceefe-04bd-551f-8456-fa752ef074de", "email": "st321@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '200ceefe-04bd-551f-8456-fa752ef074de')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('200ceefe-04bd-551f-8456-fa752ef074de', 'admin', 'st321@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('46331a85-fd71-553a-8a1c-1cac50a4f8ec', '200ceefe-04bd-551f-8456-fa752ef074de', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3176997, 84.7905836, 'India EV Network License', 'LIC-IN-ST321', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '46331a85-fd71-553a-8a1c-1cac50a4f8ec';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b016e9ed-f360-506f-a22c-897e2e009ff4', '46331a85-fd71-553a-8a1c-1cac50a4f8ec', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e4d4fb32-0169-5d36-b141-984687baa060', '46331a85-fd71-553a-8a1c-1cac50a4f8ec', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 322: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('717690f7-57e4-5a4d-a58d-cb767ba3aab9', '00000000-0000-0000-0000-000000000000', 'st322@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st322@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('717690f7-57e4-5a4d-a58d-cb767ba3aab9', '717690f7-57e4-5a4d-a58d-cb767ba3aab9', '{"sub": "717690f7-57e4-5a4d-a58d-cb767ba3aab9", "email": "st322@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '717690f7-57e4-5a4d-a58d-cb767ba3aab9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('717690f7-57e4-5a4d-a58d-cb767ba3aab9', 'admin', 'st322@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('94e236b9-8503-5baf-a46e-396fb38348cf', '717690f7-57e4-5a4d-a58d-cb767ba3aab9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.32163, 84.86715, 'India EV Network License', 'LIC-IN-ST322', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '94e236b9-8503-5baf-a46e-396fb38348cf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f4f27346-c53c-56a9-813e-b59c96e9a650', '94e236b9-8503-5baf-a46e-396fb38348cf', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('83ab616a-00c7-52e9-a06f-27429bfa96a4', '94e236b9-8503-5baf-a46e-396fb38348cf', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 323: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('18b2e6bf-d9dd-5d77-ab64-fc14b2762309', '00000000-0000-0000-0000-000000000000', 'st323@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st323@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('18b2e6bf-d9dd-5d77-ab64-fc14b2762309', '18b2e6bf-d9dd-5d77-ab64-fc14b2762309', '{"sub": "18b2e6bf-d9dd-5d77-ab64-fc14b2762309", "email": "st323@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '18b2e6bf-d9dd-5d77-ab64-fc14b2762309')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('18b2e6bf-d9dd-5d77-ab64-fc14b2762309', 'admin', 'st323@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cf04861e-b793-5d98-9e8b-a3006a543b41', '18b2e6bf-d9dd-5d77-ab64-fc14b2762309', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.319885, 84.78113, 'India EV Network License', 'LIC-IN-ST323', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cf04861e-b793-5d98-9e8b-a3006a543b41';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8c330edc-3c2e-5138-9af0-a0642d4de337', 'cf04861e-b793-5d98-9e8b-a3006a543b41', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d17c1d79-6d71-504e-9f07-e6fbddf59ff0', 'cf04861e-b793-5d98-9e8b-a3006a543b41', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 324: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b8a6c135-bc52-59dc-9b07-5d468e0f7bd4', '00000000-0000-0000-0000-000000000000', 'st324@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st324@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b8a6c135-bc52-59dc-9b07-5d468e0f7bd4', 'b8a6c135-bc52-59dc-9b07-5d468e0f7bd4', '{"sub": "b8a6c135-bc52-59dc-9b07-5d468e0f7bd4", "email": "st324@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b8a6c135-bc52-59dc-9b07-5d468e0f7bd4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b8a6c135-bc52-59dc-9b07-5d468e0f7bd4', 'admin', 'st324@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('541e82be-2c10-53fa-93b2-52a2c3df79a0', 'b8a6c135-bc52-59dc-9b07-5d468e0f7bd4', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.2956471, 84.8195658, 'India EV Network License', 'LIC-IN-ST324', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '541e82be-2c10-53fa-93b2-52a2c3df79a0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fff618d3-6c42-51c0-b20a-f7a90994d358', '541e82be-2c10-53fa-93b2-52a2c3df79a0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ef4b6c1d-6ab9-55fb-9a62-9045e2bf9cc1', '541e82be-2c10-53fa-93b2-52a2c3df79a0', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 325: BPCL Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d1cc5087-2cf1-518c-b9ed-0a47cfe1f81a', '00000000-0000-0000-0000-000000000000', 'st325@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st325@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d1cc5087-2cf1-518c-b9ed-0a47cfe1f81a', 'd1cc5087-2cf1-518c-b9ed-0a47cfe1f81a', '{"sub": "d1cc5087-2cf1-518c-b9ed-0a47cfe1f81a", "email": "st325@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd1cc5087-2cf1-518c-b9ed-0a47cfe1f81a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d1cc5087-2cf1-518c-b9ed-0a47cfe1f81a', 'admin', 'st325@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('661761f4-6494-50b2-860d-0fc28ed3bacd', 'd1cc5087-2cf1-518c-b9ed-0a47cfe1f81a', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.334627, 84.768619, 'India EV Network License', 'LIC-IN-ST325', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '661761f4-6494-50b2-860d-0fc28ed3bacd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3880ad97-797f-54ab-a6f7-d8145bad0139', '661761f4-6494-50b2-860d-0fc28ed3bacd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4e3941fe-b7f0-5279-8b5a-563da5995f68', '661761f4-6494-50b2-860d-0fc28ed3bacd', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 326: Ather Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c38f4e99-1a55-5cce-ab05-e2c10bc5df09', '00000000-0000-0000-0000-000000000000', 'st326@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st326@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c38f4e99-1a55-5cce-ab05-e2c10bc5df09', 'c38f4e99-1a55-5cce-ab05-e2c10bc5df09', '{"sub": "c38f4e99-1a55-5cce-ab05-e2c10bc5df09", "email": "st326@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c38f4e99-1a55-5cce-ab05-e2c10bc5df09')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c38f4e99-1a55-5cce-ab05-e2c10bc5df09', 'admin', 'st326@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6dff17d1-6064-50f7-9ca9-2902c28835c9', 'c38f4e99-1a55-5cce-ab05-e2c10bc5df09', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 19.3057277, 84.7817268, 'India EV Network License', 'LIC-IN-ST326', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6dff17d1-6064-50f7-9ca9-2902c28835c9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('263e14da-81c9-5f7c-8a40-a4f3dc47d99a', '6dff17d1-6064-50f7-9ca9-2902c28835c9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('951ad327-aeaa-52a2-a149-b732d3d90d20', '6dff17d1-6064-50f7-9ca9-2902c28835c9', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 327: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('48e47db1-a642-52f8-8a55-ce401b93a5a2', '00000000-0000-0000-0000-000000000000', 'st327@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st327@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('48e47db1-a642-52f8-8a55-ce401b93a5a2', '48e47db1-a642-52f8-8a55-ce401b93a5a2', '{"sub": "48e47db1-a642-52f8-8a55-ce401b93a5a2", "email": "st327@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '48e47db1-a642-52f8-8a55-ce401b93a5a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('48e47db1-a642-52f8-8a55-ce401b93a5a2', 'admin', 'st327@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('89e10140-84f7-591a-a9f4-518f7ba80c83', '48e47db1-a642-52f8-8a55-ce401b93a5a2', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.303381, 84.795044, 'India EV Network License', 'LIC-IN-ST327', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '89e10140-84f7-591a-a9f4-518f7ba80c83';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('521dc2df-e332-528d-8e72-0f157ee93a14', '89e10140-84f7-591a-a9f4-518f7ba80c83', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('da770c57-e4da-551f-accf-2c92945443a5', '89e10140-84f7-591a-a9f4-518f7ba80c83', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 328: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('230584bb-2412-5fb5-9330-10157d7ebdd6', '00000000-0000-0000-0000-000000000000', 'st328@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st328@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('230584bb-2412-5fb5-9330-10157d7ebdd6', '230584bb-2412-5fb5-9330-10157d7ebdd6', '{"sub": "230584bb-2412-5fb5-9330-10157d7ebdd6", "email": "st328@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '230584bb-2412-5fb5-9330-10157d7ebdd6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('230584bb-2412-5fb5-9330-10157d7ebdd6', 'admin', 'st328@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9104e809-eb3e-50c0-80b1-6f1151230b8b', '230584bb-2412-5fb5-9330-10157d7ebdd6', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.2991714, 84.8317631, 'India EV Network License', 'LIC-IN-ST328', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9104e809-eb3e-50c0-80b1-6f1151230b8b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ecf5c731-b293-53b3-b3d0-3ba644da5dfc', '9104e809-eb3e-50c0-80b1-6f1151230b8b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d09dd6ba-d500-5d56-a4ab-f3ea1d9f3676', '9104e809-eb3e-50c0-80b1-6f1151230b8b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 329: Maa Tara Tarini Tour And Travels (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('14f8b5d1-a138-5630-b1b1-d87942c40f9c', '00000000-0000-0000-0000-000000000000', 'st329@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st329@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('14f8b5d1-a138-5630-b1b1-d87942c40f9c', '14f8b5d1-a138-5630-b1b1-d87942c40f9c', '{"sub": "14f8b5d1-a138-5630-b1b1-d87942c40f9c", "email": "st329@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '14f8b5d1-a138-5630-b1b1-d87942c40f9c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('14f8b5d1-a138-5630-b1b1-d87942c40f9c', 'admin', 'st329@boss.com', 'Admin Maa Tara Tarini Tour And Travels', 'Maa Tara Tarini Tour And Travels', 'Maa Tara Tarini Tour And Travels, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5421f3bc-d12f-5d05-9a33-9d61c1bdf94a', '14f8b5d1-a138-5630-b1b1-d87942c40f9c', 'Maa Tara Tarini Tour And Travels', 'Maa Tara Tarini Tour And Travels, Odisha, India', 19.447535, 84.591458, 'India EV Network License', 'LIC-IN-ST329', 500.0, 7.4, true, 'Khordha', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5421f3bc-d12f-5d05-9a33-9d61c1bdf94a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('645422bc-fd74-558e-b2aa-4447960533e8', '5421f3bc-d12f-5d05-9a33-9d61c1bdf94a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 330: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e88fb4b6-7c1c-5151-b746-02bb9c214f0e', '00000000-0000-0000-0000-000000000000', 'st330@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st330@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e88fb4b6-7c1c-5151-b746-02bb9c214f0e', 'e88fb4b6-7c1c-5151-b746-02bb9c214f0e', '{"sub": "e88fb4b6-7c1c-5151-b746-02bb9c214f0e", "email": "st330@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e88fb4b6-7c1c-5151-b746-02bb9c214f0e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e88fb4b6-7c1c-5151-b746-02bb9c214f0e', 'admin', 'st330@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('666dde58-dc66-5de8-a2c8-964951eb37d6', 'e88fb4b6-7c1c-5151-b746-02bb9c214f0e', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.180776, 84.725327, 'India EV Network License', 'LIC-IN-ST330', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '666dde58-dc66-5de8-a2c8-964951eb37d6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bb08660e-399d-5283-976d-a772f9e8a53e', '666dde58-dc66-5de8-a2c8-964951eb37d6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('70ef9960-1123-5d8f-8957-a5b4832e3a83', '666dde58-dc66-5de8-a2c8-964951eb37d6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 331: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ee13ff25-828f-5194-8c83-cd6c8d735112', '00000000-0000-0000-0000-000000000000', 'st331@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st331@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ee13ff25-828f-5194-8c83-cd6c8d735112', 'ee13ff25-828f-5194-8c83-cd6c8d735112', '{"sub": "ee13ff25-828f-5194-8c83-cd6c8d735112", "email": "st331@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ee13ff25-828f-5194-8c83-cd6c8d735112')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ee13ff25-828f-5194-8c83-cd6c8d735112', 'admin', 'st331@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('16f0ae4d-9ed1-5434-8f23-5e6ca9ac8d9b', 'ee13ff25-828f-5194-8c83-cd6c8d735112', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.26892, 84.77745, 'India EV Network License', 'LIC-IN-ST331', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '16f0ae4d-9ed1-5434-8f23-5e6ca9ac8d9b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('21b6fe64-900b-54e9-b974-b38ba29c1cf8', '16f0ae4d-9ed1-5434-8f23-5e6ca9ac8d9b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fa308aea-58a8-51a7-a323-34ab2168f3e9', '16f0ae4d-9ed1-5434-8f23-5e6ca9ac8d9b', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 332: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fbb6d64a-be76-5427-a895-042e33fa69c5', '00000000-0000-0000-0000-000000000000', 'st332@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st332@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fbb6d64a-be76-5427-a895-042e33fa69c5', 'fbb6d64a-be76-5427-a895-042e33fa69c5', '{"sub": "fbb6d64a-be76-5427-a895-042e33fa69c5", "email": "st332@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fbb6d64a-be76-5427-a895-042e33fa69c5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fbb6d64a-be76-5427-a895-042e33fa69c5', 'admin', 'st332@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5871afa4-a422-5bfc-a391-6392b2fc3923', 'fbb6d64a-be76-5427-a895-042e33fa69c5', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.183324, 84.727616, 'India EV Network License', 'LIC-IN-ST332', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5871afa4-a422-5bfc-a391-6392b2fc3923';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4a896758-1ac5-51a0-be62-ffc355570bfa', '5871afa4-a422-5bfc-a391-6392b2fc3923', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e76f7396-2ff4-5601-83be-21edc01e68ce', '5871afa4-a422-5bfc-a391-6392b2fc3923', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 333: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c6c5910c-313d-5dd0-a947-6e15f88436a9', '00000000-0000-0000-0000-000000000000', 'st333@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st333@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c6c5910c-313d-5dd0-a947-6e15f88436a9', 'c6c5910c-313d-5dd0-a947-6e15f88436a9', '{"sub": "c6c5910c-313d-5dd0-a947-6e15f88436a9", "email": "st333@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c6c5910c-313d-5dd0-a947-6e15f88436a9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c6c5910c-313d-5dd0-a947-6e15f88436a9', 'admin', 'st333@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8e79ec40-7d4e-5948-acba-cffb6e19600e', 'c6c5910c-313d-5dd0-a947-6e15f88436a9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.194212, 84.61756, 'India EV Network License', 'LIC-IN-ST333', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8e79ec40-7d4e-5948-acba-cffb6e19600e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d50ad916-a80b-51ad-9678-caadc9a4592e', '8e79ec40-7d4e-5948-acba-cffb6e19600e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('56efd8c7-9a4b-55dd-8fd6-b4033b221013', '8e79ec40-7d4e-5948-acba-cffb6e19600e', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 334: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('29bd37a5-f7c0-5181-bf4d-7b80265e4066', '00000000-0000-0000-0000-000000000000', 'st334@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st334@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('29bd37a5-f7c0-5181-bf4d-7b80265e4066', '29bd37a5-f7c0-5181-bf4d-7b80265e4066', '{"sub": "29bd37a5-f7c0-5181-bf4d-7b80265e4066", "email": "st334@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '29bd37a5-f7c0-5181-bf4d-7b80265e4066')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('29bd37a5-f7c0-5181-bf4d-7b80265e4066', 'admin', 'st334@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('28579601-8c15-5481-ba36-fd134e9ea594', '29bd37a5-f7c0-5181-bf4d-7b80265e4066', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.845465, 84.5031, 'India EV Network License', 'LIC-IN-ST334', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '28579601-8c15-5481-ba36-fd134e9ea594';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('876ee9c4-4fcb-57db-9e0d-955ccf9e894f', '28579601-8c15-5481-ba36-fd134e9ea594', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3e32490a-1221-52a2-9c86-65675c938f9a', '28579601-8c15-5481-ba36-fd134e9ea594', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 335: DIMILI VILLAGE (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c80b0ccf-57ff-50c6-a3d5-e13e474cfae6', '00000000-0000-0000-0000-000000000000', 'st335@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st335@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c80b0ccf-57ff-50c6-a3d5-e13e474cfae6', 'c80b0ccf-57ff-50c6-a3d5-e13e474cfae6', '{"sub": "c80b0ccf-57ff-50c6-a3d5-e13e474cfae6", "email": "st335@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c80b0ccf-57ff-50c6-a3d5-e13e474cfae6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c80b0ccf-57ff-50c6-a3d5-e13e474cfae6', 'admin', 'st335@boss.com', 'Admin DIMILI VILLAGE', 'DIMILI VILLAGE', 'DIMILI VILLAGE, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c7f70bf3-20fd-518c-ad56-9fd26fc9215a', 'c80b0ccf-57ff-50c6-a3d5-e13e474cfae6', 'DIMILI VILLAGE', 'DIMILI VILLAGE, Odisha, India', 18.8020625, 83.9918125, 'India EV Network License', 'LIC-IN-ST335', 500.0, 7.4, true, 'Cuttack', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c7f70bf3-20fd-518c-ad56-9fd26fc9215a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f7d7627c-9592-5052-812c-45448b03c357', 'c7f70bf3-20fd-518c-ad56-9fd26fc9215a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 336: Electric Vehicle Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eec201d9-d57d-5cb3-bb84-513e6ae676bd', '00000000-0000-0000-0000-000000000000', 'st336@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st336@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eec201d9-d57d-5cb3-bb84-513e6ae676bd', 'eec201d9-d57d-5cb3-bb84-513e6ae676bd', '{"sub": "eec201d9-d57d-5cb3-bb84-513e6ae676bd", "email": "st336@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eec201d9-d57d-5cb3-bb84-513e6ae676bd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eec201d9-d57d-5cb3-bb84-513e6ae676bd', 'admin', 'st336@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('490e209b-c924-578a-9193-5cef503834fc', 'eec201d9-d57d-5cb3-bb84-513e6ae676bd', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.7689167, 83.4215387, 'India EV Network License', 'LIC-IN-ST336', 500.0, 25.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '490e209b-c924-578a-9193-5cef503834fc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('854c88e7-ec71-5ffa-8374-5477c21c65a9', '490e209b-c924-578a-9193-5cef503834fc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e9947b02-8791-50cb-8bca-649c9ff1cd21', '490e209b-c924-578a-9193-5cef503834fc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 337: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9bba9012-b065-57b0-8ecd-5a5ec16c825f', '00000000-0000-0000-0000-000000000000', 'st337@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st337@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9bba9012-b065-57b0-8ecd-5a5ec16c825f', '9bba9012-b065-57b0-8ecd-5a5ec16c825f', '{"sub": "9bba9012-b065-57b0-8ecd-5a5ec16c825f", "email": "st337@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9bba9012-b065-57b0-8ecd-5a5ec16c825f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9bba9012-b065-57b0-8ecd-5a5ec16c825f', 'admin', 'st337@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('27b7e1e2-e7eb-5ead-ae0d-ff2d5a9f8295', '9bba9012-b065-57b0-8ecd-5a5ec16c825f', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.8582131, 82.5899051, 'India EV Network License', 'LIC-IN-ST337', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '27b7e1e2-e7eb-5ead-ae0d-ff2d5a9f8295';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2e8849da-9288-546f-9aa1-dc7b29bd2706', '27b7e1e2-e7eb-5ead-ae0d-ff2d5a9f8295', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('febdc5a9-155c-57a4-bcbe-68670b9b47c8', '27b7e1e2-e7eb-5ead-ae0d-ff2d5a9f8295', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 338: BPCL Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a8d5a0d5-cc0d-5909-95fb-dbd7254c5b26', '00000000-0000-0000-0000-000000000000', 'st338@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st338@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a8d5a0d5-cc0d-5909-95fb-dbd7254c5b26', 'a8d5a0d5-cc0d-5909-95fb-dbd7254c5b26', '{"sub": "a8d5a0d5-cc0d-5909-95fb-dbd7254c5b26", "email": "st338@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a8d5a0d5-cc0d-5909-95fb-dbd7254c5b26')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a8d5a0d5-cc0d-5909-95fb-dbd7254c5b26', 'admin', 'st338@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('81803011-1d65-5278-8a55-33c3ce75686a', 'a8d5a0d5-cc0d-5909-95fb-dbd7254c5b26', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 18.84732, 82.565171, 'India EV Network License', 'LIC-IN-ST338', 500.0, 30.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '81803011-1d65-5278-8a55-33c3ce75686a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bfb3ed45-5c0d-5478-91d5-e7aa8031880e', '81803011-1d65-5278-8a55-33c3ce75686a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('68aa5ae4-67a9-5b76-bfe4-c29d71a25c74', '81803011-1d65-5278-8a55-33c3ce75686a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 339: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('51b629d7-ab13-52a6-a2ed-1463b77fa1f5', '00000000-0000-0000-0000-000000000000', 'st339@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st339@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('51b629d7-ab13-52a6-a2ed-1463b77fa1f5', '51b629d7-ab13-52a6-a2ed-1463b77fa1f5', '{"sub": "51b629d7-ab13-52a6-a2ed-1463b77fa1f5", "email": "st339@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '51b629d7-ab13-52a6-a2ed-1463b77fa1f5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('51b629d7-ab13-52a6-a2ed-1463b77fa1f5', 'admin', 'st339@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e0aa6c58-4fe6-5b44-b0dc-b1fcfc645638', '51b629d7-ab13-52a6-a2ed-1463b77fa1f5', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.606024, 84.229915, 'India EV Network License', 'LIC-IN-ST339', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e0aa6c58-4fe6-5b44-b0dc-b1fcfc645638';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c1a9d841-fa03-5106-9967-30f7e0be3fab', 'e0aa6c58-4fe6-5b44-b0dc-b1fcfc645638', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b2da6167-3934-50b6-b349-557be3d1f73d', 'e0aa6c58-4fe6-5b44-b0dc-b1fcfc645638', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 340: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('639707ce-9d67-5a92-8d97-67f7c3497aba', '00000000-0000-0000-0000-000000000000', 'st340@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st340@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('639707ce-9d67-5a92-8d97-67f7c3497aba', '639707ce-9d67-5a92-8d97-67f7c3497aba', '{"sub": "639707ce-9d67-5a92-8d97-67f7c3497aba", "email": "st340@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '639707ce-9d67-5a92-8d97-67f7c3497aba')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('639707ce-9d67-5a92-8d97-67f7c3497aba', 'admin', 'st340@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d5afc619-d478-5bf8-87e0-b9fa4d7dc4c6', '639707ce-9d67-5a92-8d97-67f7c3497aba', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.534753, 83.651339, 'India EV Network License', 'LIC-IN-ST340', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd5afc619-d478-5bf8-87e0-b9fa4d7dc4c6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6491b64a-36a0-5a47-a1fa-69f7dac1d5cc', 'd5afc619-d478-5bf8-87e0-b9fa4d7dc4c6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17f3d773-0a48-51e0-9e75-85a409b93aad', 'd5afc619-d478-5bf8-87e0-b9fa4d7dc4c6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 341: okinawa electric scooter (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('78d852f1-fe51-56b2-994b-a16c4f8010a0', '00000000-0000-0000-0000-000000000000', 'st341@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st341@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('78d852f1-fe51-56b2-994b-a16c4f8010a0', '78d852f1-fe51-56b2-994b-a16c4f8010a0', '{"sub": "78d852f1-fe51-56b2-994b-a16c4f8010a0", "email": "st341@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '78d852f1-fe51-56b2-994b-a16c4f8010a0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('78d852f1-fe51-56b2-994b-a16c4f8010a0', 'admin', 'st341@boss.com', 'Admin okinawa electric scooter', 'okinawa electric scooter', 'okinawa electric scooter, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('57c38929-63b3-5065-a455-2c6949a7442d', '78d852f1-fe51-56b2-994b-a16c4f8010a0', 'okinawa electric scooter', 'okinawa electric scooter, Odisha, India', 18.5970465, 83.7640945, 'India EV Network License', 'LIC-IN-ST341', 500.0, 3.3, true, 'Balasore', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '57c38929-63b3-5065-a455-2c6949a7442d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b896f894-2698-56a9-a8db-4af0560fdd5c', '57c38929-63b3-5065-a455-2c6949a7442d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 342: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('279b9882-68f2-59a7-8800-2e363f38588c', '00000000-0000-0000-0000-000000000000', 'st342@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st342@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('279b9882-68f2-59a7-8800-2e363f38588c', '279b9882-68f2-59a7-8800-2e363f38588c', '{"sub": "279b9882-68f2-59a7-8800-2e363f38588c", "email": "st342@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '279b9882-68f2-59a7-8800-2e363f38588c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('279b9882-68f2-59a7-8800-2e363f38588c', 'admin', 'st342@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2d562ca0-8e2c-5edf-b4d4-a084833642d9', '279b9882-68f2-59a7-8800-2e363f38588c', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.6104394, 83.3992285, 'India EV Network License', 'LIC-IN-ST342', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2d562ca0-8e2c-5edf-b4d4-a084833642d9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('715e4b8e-edb8-5d09-b1e6-337af4acd05a', '2d562ca0-8e2c-5edf-b4d4-a084833642d9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0f5d4858-d6e7-50d8-8b1a-d6de06cc1ed3', '2d562ca0-8e2c-5edf-b4d4-a084833642d9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 343: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('673883fb-9046-51ae-b2e4-f01b94432a40', '00000000-0000-0000-0000-000000000000', 'st343@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st343@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('673883fb-9046-51ae-b2e4-f01b94432a40', '673883fb-9046-51ae-b2e4-f01b94432a40', '{"sub": "673883fb-9046-51ae-b2e4-f01b94432a40", "email": "st343@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '673883fb-9046-51ae-b2e4-f01b94432a40')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('673883fb-9046-51ae-b2e4-f01b94432a40', 'admin', 'st343@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dd577cb2-61bc-5633-ac96-35d7dd610768', '673883fb-9046-51ae-b2e4-f01b94432a40', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.5035093, 83.2469705, 'India EV Network License', 'LIC-IN-ST343', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dd577cb2-61bc-5633-ac96-35d7dd610768';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a0444f5e-c119-5506-9f2b-1e1eb3ebbcfc', 'dd577cb2-61bc-5633-ac96-35d7dd610768', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('01bec332-ffdc-539f-be55-f54eec6cc3b7', 'dd577cb2-61bc-5633-ac96-35d7dd610768', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 344: Jio-bp (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4007db01-c1f4-5f31-93a6-2fe993bde70d', '00000000-0000-0000-0000-000000000000', 'st344@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st344@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4007db01-c1f4-5f31-93a6-2fe993bde70d', '4007db01-c1f4-5f31-93a6-2fe993bde70d', '{"sub": "4007db01-c1f4-5f31-93a6-2fe993bde70d", "email": "st344@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4007db01-c1f4-5f31-93a6-2fe993bde70d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4007db01-c1f4-5f31-93a6-2fe993bde70d', 'admin', 'st344@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f3926599-e1cc-592d-a936-b2f5d67cf158', '4007db01-c1f4-5f31-93a6-2fe993bde70d', 'Jio-bp', 'Jio-bp, Odisha, India', 18.7012078, 82.879837, 'India EV Network License', 'LIC-IN-ST344', 500.0, 50.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f3926599-e1cc-592d-a936-b2f5d67cf158';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dc1202e9-c88a-529b-ad43-c66a1a59d6e0', 'f3926599-e1cc-592d-a936-b2f5d67cf158', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('762794d9-74ef-5ee7-84b1-68ac81a525ea', 'f3926599-e1cc-592d-a936-b2f5d67cf158', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 345: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8b4b0fce-459a-5a83-92a8-141be243078b', '00000000-0000-0000-0000-000000000000', 'st345@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st345@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8b4b0fce-459a-5a83-92a8-141be243078b', '8b4b0fce-459a-5a83-92a8-141be243078b', '{"sub": "8b4b0fce-459a-5a83-92a8-141be243078b", "email": "st345@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8b4b0fce-459a-5a83-92a8-141be243078b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8b4b0fce-459a-5a83-92a8-141be243078b', 'admin', 'st345@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8233061c-06db-5940-a8a3-6ebfa917f1e9', '8b4b0fce-459a-5a83-92a8-141be243078b', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.295933, 83.893148, 'India EV Network License', 'LIC-IN-ST345', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8233061c-06db-5940-a8a3-6ebfa917f1e9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7274287f-c255-5808-a79c-b48736bb3ef2', '8233061c-06db-5940-a8a3-6ebfa917f1e9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06c05afc-2233-5981-a47f-4e0ee457eaa6', '8233061c-06db-5940-a8a3-6ebfa917f1e9', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 346: Jio-bp pulse Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('64348345-6c52-5aca-8794-85fff8de0e9e', '00000000-0000-0000-0000-000000000000', 'st346@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st346@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('64348345-6c52-5aca-8794-85fff8de0e9e', '64348345-6c52-5aca-8794-85fff8de0e9e', '{"sub": "64348345-6c52-5aca-8794-85fff8de0e9e", "email": "st346@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '64348345-6c52-5aca-8794-85fff8de0e9e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('64348345-6c52-5aca-8794-85fff8de0e9e', 'admin', 'st346@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7fa130fc-7a0e-5062-9222-8de9e01cf08b', '64348345-6c52-5aca-8794-85fff8de0e9e', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 18.3262791, 83.941268, 'India EV Network License', 'LIC-IN-ST346', 500.0, 60.0, true, 'Cuttack', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7fa130fc-7a0e-5062-9222-8de9e01cf08b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b2f4dee0-f7cd-5e91-98b6-c895341919ae', '7fa130fc-7a0e-5062-9222-8de9e01cf08b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1699356c-fe77-55f1-b405-48d78eace7ae', '7fa130fc-7a0e-5062-9222-8de9e01cf08b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('52c73f7d-58bf-53c3-b15a-67a067962ce6', '7fa130fc-7a0e-5062-9222-8de9e01cf08b', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 347: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dc90544a-f702-5916-82e5-6e9df1979a1e', '00000000-0000-0000-0000-000000000000', 'st347@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st347@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dc90544a-f702-5916-82e5-6e9df1979a1e', 'dc90544a-f702-5916-82e5-6e9df1979a1e', '{"sub": "dc90544a-f702-5916-82e5-6e9df1979a1e", "email": "st347@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dc90544a-f702-5916-82e5-6e9df1979a1e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dc90544a-f702-5916-82e5-6e9df1979a1e', 'admin', 'st347@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bfd430bd-0434-5aea-8a7c-0bbae07a0340', 'dc90544a-f702-5916-82e5-6e9df1979a1e', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.3243588, 83.9391102, 'India EV Network License', 'LIC-IN-ST347', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bfd430bd-0434-5aea-8a7c-0bbae07a0340';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f53c19e7-9522-5d87-9676-e34e79ec1d28', 'bfd430bd-0434-5aea-8a7c-0bbae07a0340', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3202a2b7-684c-55b9-9ddf-14c5b46ad8aa', 'bfd430bd-0434-5aea-8a7c-0bbae07a0340', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 348: DK MOTORS (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3115083d-b608-5c61-8807-ef64ddae18c9', '00000000-0000-0000-0000-000000000000', 'st348@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st348@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3115083d-b608-5c61-8807-ef64ddae18c9', '3115083d-b608-5c61-8807-ef64ddae18c9', '{"sub": "3115083d-b608-5c61-8807-ef64ddae18c9", "email": "st348@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3115083d-b608-5c61-8807-ef64ddae18c9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3115083d-b608-5c61-8807-ef64ddae18c9', 'admin', 'st348@boss.com', 'Admin DK MOTORS', 'DK MOTORS', 'DK MOTORS, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f8a81ed0-9178-5280-bc1f-dc321c8f4419', '3115083d-b608-5c61-8807-ef64ddae18c9', 'DK MOTORS', 'DK MOTORS, Odisha, India', 18.3226736, 83.893722, 'India EV Network License', 'LIC-IN-ST348', 500.0, 7.4, true, 'Sambalpur', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f8a81ed0-9178-5280-bc1f-dc321c8f4419';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('641528a7-43b3-57ac-a7cf-7dcb66c4301a', 'f8a81ed0-9178-5280-bc1f-dc321c8f4419', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 349: Urzza Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8241c6d0-06ce-5149-9b14-f2f32079349b', '00000000-0000-0000-0000-000000000000', 'st349@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st349@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8241c6d0-06ce-5149-9b14-f2f32079349b', '8241c6d0-06ce-5149-9b14-f2f32079349b', '{"sub": "8241c6d0-06ce-5149-9b14-f2f32079349b", "email": "st349@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8241c6d0-06ce-5149-9b14-f2f32079349b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8241c6d0-06ce-5149-9b14-f2f32079349b', 'admin', 'st349@boss.com', 'Admin Urzza Charging Station', 'Urzza Charging Station', 'Urzza Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0a67986a-65f8-5c3e-9e7e-e9521e7a2a5d', '8241c6d0-06ce-5149-9b14-f2f32079349b', 'Urzza Charging Station', 'Urzza Charging Station, Odisha, India', 18.4243285, 84.0480246, 'India EV Network License', 'LIC-IN-ST349', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0a67986a-65f8-5c3e-9e7e-e9521e7a2a5d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f16ecb3b-07be-5894-9e47-396ddfe5d079', '0a67986a-65f8-5c3e-9e7e-e9521e7a2a5d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 350: Ather Energy Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d5700e0c-709c-5538-ad5a-96361963df61', '00000000-0000-0000-0000-000000000000', 'st350@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st350@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d5700e0c-709c-5538-ad5a-96361963df61', 'd5700e0c-709c-5538-ad5a-96361963df61', '{"sub": "d5700e0c-709c-5538-ad5a-96361963df61", "email": "st350@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd5700e0c-709c-5538-ad5a-96361963df61')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d5700e0c-709c-5538-ad5a-96361963df61', 'admin', 'st350@boss.com', 'Admin Ather Energy Charging Station', 'Ather Energy Charging Station', 'Ather Energy Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('151b23a7-d7c9-5163-af07-1911b81eefb4', 'd5700e0c-709c-5538-ad5a-96361963df61', 'Ather Energy Charging Station', 'Ather Energy Charging Station, Odisha, India', 18.309546, 83.91882, 'India EV Network License', 'LIC-IN-ST350', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '151b23a7-d7c9-5163-af07-1911b81eefb4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b8704f80-b557-5d39-8b77-a3dc16a636ba', '151b23a7-d7c9-5163-af07-1911b81eefb4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5bc1a42e-94f1-5841-9f12-e8aaaead3f1d', '151b23a7-d7c9-5163-af07-1911b81eefb4', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 351: Voltran Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('74718f33-e683-524f-a0fc-59652fee2acf', '00000000-0000-0000-0000-000000000000', 'st351@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st351@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('74718f33-e683-524f-a0fc-59652fee2acf', '74718f33-e683-524f-a0fc-59652fee2acf', '{"sub": "74718f33-e683-524f-a0fc-59652fee2acf", "email": "st351@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '74718f33-e683-524f-a0fc-59652fee2acf')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('74718f33-e683-524f-a0fc-59652fee2acf', 'admin', 'st351@boss.com', 'Admin Voltran Charging Station', 'Voltran Charging Station', 'Voltran Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8d02f5f4-651b-5705-9e40-907fda6938a3', '74718f33-e683-524f-a0fc-59652fee2acf', 'Voltran Charging Station', 'Voltran Charging Station, Odisha, India', 18.3004408, 83.8711628, 'India EV Network License', 'LIC-IN-ST351', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8d02f5f4-651b-5705-9e40-907fda6938a3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ad02aeb0-7d09-5dca-9f2d-22f64c6f8741', '8d02f5f4-651b-5705-9e40-907fda6938a3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 352: Jio-bp (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7f766fe0-131b-5542-9162-b70933185dcd', '00000000-0000-0000-0000-000000000000', 'st352@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st352@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7f766fe0-131b-5542-9162-b70933185dcd', '7f766fe0-131b-5542-9162-b70933185dcd', '{"sub": "7f766fe0-131b-5542-9162-b70933185dcd", "email": "st352@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7f766fe0-131b-5542-9162-b70933185dcd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7f766fe0-131b-5542-9162-b70933185dcd', 'admin', 'st352@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0084e7bf-842a-5e80-9f6b-30a26fd4a1d2', '7f766fe0-131b-5542-9162-b70933185dcd', 'Jio-bp', 'Jio-bp, Odisha, India', 18.289378, 83.914594, 'India EV Network License', 'LIC-IN-ST352', 500.0, 50.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0084e7bf-842a-5e80-9f6b-30a26fd4a1d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('be76b475-7594-55c0-9635-00cf2a3ddb2e', '0084e7bf-842a-5e80-9f6b-30a26fd4a1d2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('adc2739a-4560-566d-ac2b-872b695d9a3d', '0084e7bf-842a-5e80-9f6b-30a26fd4a1d2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 353: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2efdbc4e-4e16-52a6-a101-4b58e1a0df70', '00000000-0000-0000-0000-000000000000', 'st353@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st353@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2efdbc4e-4e16-52a6-a101-4b58e1a0df70', '2efdbc4e-4e16-52a6-a101-4b58e1a0df70', '{"sub": "2efdbc4e-4e16-52a6-a101-4b58e1a0df70", "email": "st353@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2efdbc4e-4e16-52a6-a101-4b58e1a0df70')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2efdbc4e-4e16-52a6-a101-4b58e1a0df70', 'admin', 'st353@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6f8f1247-b6ac-542b-b984-df218c2c5dde', '2efdbc4e-4e16-52a6-a101-4b58e1a0df70', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.2791756, 83.5261386, 'India EV Network License', 'LIC-IN-ST353', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6f8f1247-b6ac-542b-b984-df218c2c5dde';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('feec0f9c-1e5f-5455-b63a-cc1c07fb89b2', '6f8f1247-b6ac-542b-b984-df218c2c5dde', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3aa689a5-0a43-5454-97aa-5e8af8e6a018', '6f8f1247-b6ac-542b-b984-df218c2c5dde', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 354: AtherGrid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2f1cb722-1d77-5eae-9621-7256727c44ac', '00000000-0000-0000-0000-000000000000', 'st354@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st354@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2f1cb722-1d77-5eae-9621-7256727c44ac', '2f1cb722-1d77-5eae-9621-7256727c44ac', '{"sub": "2f1cb722-1d77-5eae-9621-7256727c44ac", "email": "st354@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2f1cb722-1d77-5eae-9621-7256727c44ac')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2f1cb722-1d77-5eae-9621-7256727c44ac', 'admin', 'st354@boss.com', 'Admin AtherGrid Charging Station', 'AtherGrid Charging Station', 'AtherGrid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a786666d-43f0-5543-8b1e-9b7627c18b88', '2f1cb722-1d77-5eae-9621-7256727c44ac', 'AtherGrid Charging Station', 'AtherGrid Charging Station, Odisha, India', 18.3372038, 82.8779255, 'India EV Network License', 'LIC-IN-ST354', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a786666d-43f0-5543-8b1e-9b7627c18b88';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('44aa9ba8-9ccd-5bc9-9b82-03a6a6e575e0', 'a786666d-43f0-5543-8b1e-9b7627c18b88', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd112ead-d118-57b0-b7c5-c7d772a742ba', 'a786666d-43f0-5543-8b1e-9b7627c18b88', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 355: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('347c3b5b-327c-599d-a1f6-dc3f594ec6ae', '00000000-0000-0000-0000-000000000000', 'st355@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st355@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('347c3b5b-327c-599d-a1f6-dc3f594ec6ae', '347c3b5b-327c-599d-a1f6-dc3f594ec6ae', '{"sub": "347c3b5b-327c-599d-a1f6-dc3f594ec6ae", "email": "st355@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '347c3b5b-327c-599d-a1f6-dc3f594ec6ae')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('347c3b5b-327c-599d-a1f6-dc3f594ec6ae', 'admin', 'st355@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a623f66a-105e-5b31-ae10-621bd6f21e00', '347c3b5b-327c-599d-a1f6-dc3f594ec6ae', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.3225938, 82.8776518, 'India EV Network License', 'LIC-IN-ST355', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a623f66a-105e-5b31-ae10-621bd6f21e00';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('574e0092-f1c9-544e-8ea2-cf4a023f6cac', 'a623f66a-105e-5b31-ae10-621bd6f21e00', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('414e3512-3b5f-5efe-a594-d79e539a368a', 'a623f66a-105e-5b31-ae10-621bd6f21e00', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 356: Charzer Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('770177bc-407a-5121-8824-4043a10cc03d', '00000000-0000-0000-0000-000000000000', 'st356@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st356@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('770177bc-407a-5121-8824-4043a10cc03d', '770177bc-407a-5121-8824-4043a10cc03d', '{"sub": "770177bc-407a-5121-8824-4043a10cc03d", "email": "st356@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '770177bc-407a-5121-8824-4043a10cc03d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('770177bc-407a-5121-8824-4043a10cc03d', 'admin', 'st356@boss.com', 'Admin Charzer Charging Station', 'Charzer Charging Station', 'Charzer Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fcc65c7c-26a0-53b9-93ca-499a0f7cc961', '770177bc-407a-5121-8824-4043a10cc03d', 'Charzer Charging Station', 'Charzer Charging Station, Odisha, India', 18.2958652, 82.9144748, 'India EV Network License', 'LIC-IN-ST356', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fcc65c7c-26a0-53b9-93ca-499a0f7cc961';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('756c7c5f-b5ca-5f32-a5a5-ddca91f4d0f2', 'fcc65c7c-26a0-53b9-93ca-499a0f7cc961', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 357: Electric Vehicle Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4aec8c84-8f5e-5690-8773-f558e1e927d9', '00000000-0000-0000-0000-000000000000', 'st357@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st357@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4aec8c84-8f5e-5690-8773-f558e1e927d9', '4aec8c84-8f5e-5690-8773-f558e1e927d9', '{"sub": "4aec8c84-8f5e-5690-8773-f558e1e927d9", "email": "st357@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4aec8c84-8f5e-5690-8773-f558e1e927d9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4aec8c84-8f5e-5690-8773-f558e1e927d9', 'admin', 'st357@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bd9f1708-cfdd-51d8-8f3a-1d397ec089c4', '4aec8c84-8f5e-5690-8773-f558e1e927d9', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.3137141, 82.8937424, 'India EV Network License', 'LIC-IN-ST357', 500.0, 25.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bd9f1708-cfdd-51d8-8f3a-1d397ec089c4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ecdb6edb-2979-5e3f-993c-1df3231d195b', 'bd9f1708-cfdd-51d8-8f3a-1d397ec089c4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b60aba71-55f1-5b5b-bcc2-6533975cebc5', 'bd9f1708-cfdd-51d8-8f3a-1d397ec089c4', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 358: Tata Power Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5fcc8526-6fc4-5b34-962e-291e87fb054c', '00000000-0000-0000-0000-000000000000', 'st358@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st358@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5fcc8526-6fc4-5b34-962e-291e87fb054c', '5fcc8526-6fc4-5b34-962e-291e87fb054c', '{"sub": "5fcc8526-6fc4-5b34-962e-291e87fb054c", "email": "st358@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5fcc8526-6fc4-5b34-962e-291e87fb054c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5fcc8526-6fc4-5b34-962e-291e87fb054c', 'admin', 'st358@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8d9a454f-c4bc-52b9-b195-c60ce79d177f', '5fcc8526-6fc4-5b34-962e-291e87fb054c', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.139519, 83.617595, 'India EV Network License', 'LIC-IN-ST358', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8d9a454f-c4bc-52b9-b195-c60ce79d177f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e1b7d51a-a407-543a-b6f3-963be07c2292', '8d9a454f-c4bc-52b9-b195-c60ce79d177f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ef21426d-b325-5023-a5d1-a2ee7d210fbc', '8d9a454f-c4bc-52b9-b195-c60ce79d177f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 359: Jio-bp pulse Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('13cfe6e6-4147-574f-b45c-623e4ac38e43', '00000000-0000-0000-0000-000000000000', 'st359@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st359@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('13cfe6e6-4147-574f-b45c-623e4ac38e43', '13cfe6e6-4147-574f-b45c-623e4ac38e43', '{"sub": "13cfe6e6-4147-574f-b45c-623e4ac38e43", "email": "st359@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '13cfe6e6-4147-574f-b45c-623e4ac38e43')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('13cfe6e6-4147-574f-b45c-623e4ac38e43', 'admin', 'st359@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3d7fad18-b650-5ac1-b074-d5feb09f3507', '13cfe6e6-4147-574f-b45c-623e4ac38e43', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 18.1499177, 83.6353106, 'India EV Network License', 'LIC-IN-ST359', 500.0, 60.0, true, 'Cuttack', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3d7fad18-b650-5ac1-b074-d5feb09f3507';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('26a24f48-ec79-5e2f-ab01-2d0864441642', '3d7fad18-b650-5ac1-b074-d5feb09f3507', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('81fa9cbe-9b4a-50bc-83be-2c2050aaddb7', '3d7fad18-b650-5ac1-b074-d5feb09f3507', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c6b08efa-89a7-572e-b1c2-a987dac3e0bb', '3d7fad18-b650-5ac1-b074-d5feb09f3507', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 360: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('34b0a82a-389c-597e-a826-69b5723843c3', '00000000-0000-0000-0000-000000000000', 'st360@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st360@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('34b0a82a-389c-597e-a826-69b5723843c3', '34b0a82a-389c-597e-a826-69b5723843c3', '{"sub": "34b0a82a-389c-597e-a826-69b5723843c3", "email": "st360@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '34b0a82a-389c-597e-a826-69b5723843c3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('34b0a82a-389c-597e-a826-69b5723843c3', 'admin', 'st360@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('67b2226d-af39-5444-8236-f97416a086c2', '34b0a82a-389c-597e-a826-69b5723843c3', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.173032, 83.676949, 'India EV Network License', 'LIC-IN-ST360', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '67b2226d-af39-5444-8236-f97416a086c2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6688e263-c788-53e0-92f5-817ef3b06dec', '67b2226d-af39-5444-8236-f97416a086c2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('02bb49af-a44f-5830-b15c-2fb5e6e4a274', '67b2226d-af39-5444-8236-f97416a086c2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 361: JoulePoint Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b029b5e6-0f30-5d4f-a01b-c3d142a2c3ca', '00000000-0000-0000-0000-000000000000', 'st361@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st361@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b029b5e6-0f30-5d4f-a01b-c3d142a2c3ca', 'b029b5e6-0f30-5d4f-a01b-c3d142a2c3ca', '{"sub": "b029b5e6-0f30-5d4f-a01b-c3d142a2c3ca", "email": "st361@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b029b5e6-0f30-5d4f-a01b-c3d142a2c3ca')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b029b5e6-0f30-5d4f-a01b-c3d142a2c3ca', 'admin', 'st361@boss.com', 'Admin JoulePoint Charging Station', 'JoulePoint Charging Station', 'JoulePoint Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('186c1345-5adc-5a3e-a80a-944d11e830fd', 'b029b5e6-0f30-5d4f-a01b-c3d142a2c3ca', 'JoulePoint Charging Station', 'JoulePoint Charging Station, Odisha, India', 18.0418515, 83.5097221, 'India EV Network License', 'LIC-IN-ST361', 500.0, 7.4, true, 'Cuttack', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '186c1345-5adc-5a3e-a80a-944d11e830fd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('94a544c3-96e4-562a-bd76-f9a821e016ee', '186c1345-5adc-5a3e-a80a-944d11e830fd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 362: Bolt.Earth Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e55f0bce-a3ac-5f0e-b03d-bcc5154a2214', '00000000-0000-0000-0000-000000000000', 'st362@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st362@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e55f0bce-a3ac-5f0e-b03d-bcc5154a2214', 'e55f0bce-a3ac-5f0e-b03d-bcc5154a2214', '{"sub": "e55f0bce-a3ac-5f0e-b03d-bcc5154a2214", "email": "st362@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e55f0bce-a3ac-5f0e-b03d-bcc5154a2214')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e55f0bce-a3ac-5f0e-b03d-bcc5154a2214', 'admin', 'st362@boss.com', 'Admin Bolt.Earth Charging Station', 'Bolt.Earth Charging Station', 'Bolt.Earth Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6dae4cd7-61ad-551a-8e2f-b86a0926b072', 'e55f0bce-a3ac-5f0e-b03d-bcc5154a2214', 'Bolt.Earth Charging Station', 'Bolt.Earth Charging Station, Odisha, India', 18.0203857, 83.4020948, 'India EV Network License', 'LIC-IN-ST362', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6dae4cd7-61ad-551a-8e2f-b86a0926b072';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5c4f738-26c3-5fb7-9fbb-3ff46abb1d67', '6dae4cd7-61ad-551a-8e2f-b86a0926b072', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2329262f-76f9-5033-be2b-322962d24099', '6dae4cd7-61ad-551a-8e2f-b86a0926b072', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 363: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a911e9e6-9e5d-59b5-a395-26180940b764', '00000000-0000-0000-0000-000000000000', 'st363@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st363@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a911e9e6-9e5d-59b5-a395-26180940b764', 'a911e9e6-9e5d-59b5-a395-26180940b764', '{"sub": "a911e9e6-9e5d-59b5-a395-26180940b764", "email": "st363@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a911e9e6-9e5d-59b5-a395-26180940b764')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a911e9e6-9e5d-59b5-a395-26180940b764', 'admin', 'st363@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8c193700-c2b5-5f46-9052-9d19e839f793', 'a911e9e6-9e5d-59b5-a395-26180940b764', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.0565007, 83.3971128, 'India EV Network License', 'LIC-IN-ST363', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8c193700-c2b5-5f46-9052-9d19e839f793';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a0671418-4970-568b-9191-f9f69770c65b', '8c193700-c2b5-5f46-9052-9d19e839f793', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b8a9e72-609b-5b2d-904f-c76db593b2bb', '8c193700-c2b5-5f46-9052-9d19e839f793', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 364: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dfbdb3e1-29b3-506f-858d-c1e80e2efded', '00000000-0000-0000-0000-000000000000', 'st364@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st364@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dfbdb3e1-29b3-506f-858d-c1e80e2efded', 'dfbdb3e1-29b3-506f-858d-c1e80e2efded', '{"sub": "dfbdb3e1-29b3-506f-858d-c1e80e2efded", "email": "st364@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dfbdb3e1-29b3-506f-858d-c1e80e2efded')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dfbdb3e1-29b3-506f-858d-c1e80e2efded', 'admin', 'st364@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d5d86335-d2f5-5883-aef5-3aac9a859f9a', 'dfbdb3e1-29b3-506f-858d-c1e80e2efded', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.0570972, 83.3971881, 'India EV Network License', 'LIC-IN-ST364', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd5d86335-d2f5-5883-aef5-3aac9a859f9a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3b827660-5afa-502e-93e8-3af55bbee021', 'd5d86335-d2f5-5883-aef5-3aac9a859f9a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b62b22b1-f636-59fa-be4d-d2b460abaac0', 'd5d86335-d2f5-5883-aef5-3aac9a859f9a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 365: ParkNConnect Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e5c43ec6-2b4f-5ed9-84cc-18196b41f25c', '00000000-0000-0000-0000-000000000000', 'st365@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st365@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e5c43ec6-2b4f-5ed9-84cc-18196b41f25c', 'e5c43ec6-2b4f-5ed9-84cc-18196b41f25c', '{"sub": "e5c43ec6-2b4f-5ed9-84cc-18196b41f25c", "email": "st365@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e5c43ec6-2b4f-5ed9-84cc-18196b41f25c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e5c43ec6-2b4f-5ed9-84cc-18196b41f25c', 'admin', 'st365@boss.com', 'Admin ParkNConnect Charging Station', 'ParkNConnect Charging Station', 'ParkNConnect Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5986c415-6223-5948-96d6-28e47ff43546', 'e5c43ec6-2b4f-5ed9-84cc-18196b41f25c', 'ParkNConnect Charging Station', 'ParkNConnect Charging Station, Odisha, India', 18.0928016, 83.3884047, 'India EV Network License', 'LIC-IN-ST365', 500.0, 7.4, true, 'Sambalpur', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5986c415-6223-5948-96d6-28e47ff43546';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7f1d2122-b0ba-50ca-84f5-f22f354ca48e', '5986c415-6223-5948-96d6-28e47ff43546', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 366: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9a440356-c61b-59f8-ae86-02df3c2f6c8a', '00000000-0000-0000-0000-000000000000', 'st366@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st366@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9a440356-c61b-59f8-ae86-02df3c2f6c8a', '9a440356-c61b-59f8-ae86-02df3c2f6c8a', '{"sub": "9a440356-c61b-59f8-ae86-02df3c2f6c8a", "email": "st366@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9a440356-c61b-59f8-ae86-02df3c2f6c8a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9a440356-c61b-59f8-ae86-02df3c2f6c8a', 'admin', 'st366@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cfd10318-fda0-50e5-99a8-69cf1ccf51d7', '9a440356-c61b-59f8-ae86-02df3c2f6c8a', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.080786, 83.38528, 'India EV Network License', 'LIC-IN-ST366', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cfd10318-fda0-50e5-99a8-69cf1ccf51d7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e2b527f0-016a-5225-983f-80422e9284cb', 'cfd10318-fda0-50e5-99a8-69cf1ccf51d7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9ca1e74e-eb2d-535d-8aef-eec341979a2e', 'cfd10318-fda0-50e5-99a8-69cf1ccf51d7', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 367: Hindustan Petroleum Corporation Limited Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('566b4900-4322-5cd5-9a7b-d8a46a720ee6', '00000000-0000-0000-0000-000000000000', 'st367@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st367@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('566b4900-4322-5cd5-9a7b-d8a46a720ee6', '566b4900-4322-5cd5-9a7b-d8a46a720ee6', '{"sub": "566b4900-4322-5cd5-9a7b-d8a46a720ee6", "email": "st367@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '566b4900-4322-5cd5-9a7b-d8a46a720ee6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('566b4900-4322-5cd5-9a7b-d8a46a720ee6', 'admin', 'st367@boss.com', 'Admin Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('152da08c-9a16-563d-bfe1-8c437ad0f54d', '566b4900-4322-5cd5-9a7b-d8a46a720ee6', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 17.9524227, 83.4163581, 'India EV Network License', 'LIC-IN-ST367', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '152da08c-9a16-563d-bfe1-8c437ad0f54d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b56fc200-38bc-5bd4-b9cb-fe97ae2aedb3', '152da08c-9a16-563d-bfe1-8c437ad0f54d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cea1edcc-f61f-5373-abec-81184f34dc07', '152da08c-9a16-563d-bfe1-8c437ad0f54d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 368: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('be5267bd-419d-5501-9e1c-94a9534bbcb1', '00000000-0000-0000-0000-000000000000', 'st368@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st368@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('be5267bd-419d-5501-9e1c-94a9534bbcb1', 'be5267bd-419d-5501-9e1c-94a9534bbcb1', '{"sub": "be5267bd-419d-5501-9e1c-94a9534bbcb1", "email": "st368@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'be5267bd-419d-5501-9e1c-94a9534bbcb1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('be5267bd-419d-5501-9e1c-94a9534bbcb1', 'admin', 'st368@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6bbfa8e1-17d4-5e1a-ae84-34c6dc9c8ea7', 'be5267bd-419d-5501-9e1c-94a9534bbcb1', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.0801438, 83.3853509, 'India EV Network License', 'LIC-IN-ST368', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6bbfa8e1-17d4-5e1a-ae84-34c6dc9c8ea7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c65fd31f-9288-53c4-9e11-e04adabb1c31', '6bbfa8e1-17d4-5e1a-ae84-34c6dc9c8ea7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a40e57cb-a3bd-5866-b93a-8d7f7a35d100', '6bbfa8e1-17d4-5e1a-ae84-34c6dc9c8ea7', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 369: Hindustan Petroleum Corporation Limited (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9413d512-20b3-500d-a65f-8d8d84ab5ffc', '00000000-0000-0000-0000-000000000000', 'st369@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st369@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9413d512-20b3-500d-a65f-8d8d84ab5ffc', '9413d512-20b3-500d-a65f-8d8d84ab5ffc', '{"sub": "9413d512-20b3-500d-a65f-8d8d84ab5ffc", "email": "st369@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9413d512-20b3-500d-a65f-8d8d84ab5ffc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9413d512-20b3-500d-a65f-8d8d84ab5ffc', 'admin', 'st369@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b4ebf263-c7e2-5911-8b74-aa74e2ba98a2', '9413d512-20b3-500d-a65f-8d8d84ab5ffc', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 17.952421, 83.416311, 'India EV Network License', 'LIC-IN-ST369', 500.0, 30.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b4ebf263-c7e2-5911-8b74-aa74e2ba98a2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0dc2b013-29e2-56dc-b762-4433eab7f611', 'b4ebf263-c7e2-5911-8b74-aa74e2ba98a2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2e72b60f-4dd9-5fa4-9166-c990d69e0236', 'b4ebf263-c7e2-5911-8b74-aa74e2ba98a2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 370: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2efcd7a5-57ce-50ae-90fb-bf7275adc10f', '00000000-0000-0000-0000-000000000000', 'st370@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st370@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2efcd7a5-57ce-50ae-90fb-bf7275adc10f', '2efcd7a5-57ce-50ae-90fb-bf7275adc10f', '{"sub": "2efcd7a5-57ce-50ae-90fb-bf7275adc10f", "email": "st370@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2efcd7a5-57ce-50ae-90fb-bf7275adc10f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2efcd7a5-57ce-50ae-90fb-bf7275adc10f', 'admin', 'st370@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('60c65cca-df6b-5034-88fd-baee58ac6a41', '2efcd7a5-57ce-50ae-90fb-bf7275adc10f', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 17.9577677, 83.1773604, 'India EV Network License', 'LIC-IN-ST370', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '60c65cca-df6b-5034-88fd-baee58ac6a41';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7ff39615-1dc7-526f-bdf9-64d08ab3495b', '60c65cca-df6b-5034-88fd-baee58ac6a41', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c2cda3e4-992f-5326-b75b-1808e631fefb', '60c65cca-df6b-5034-88fd-baee58ac6a41', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 371: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0a9ca045-d947-5ff4-8445-1596f77e3642', '00000000-0000-0000-0000-000000000000', 'st371@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st371@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0a9ca045-d947-5ff4-8445-1596f77e3642', '0a9ca045-d947-5ff4-8445-1596f77e3642', '{"sub": "0a9ca045-d947-5ff4-8445-1596f77e3642", "email": "st371@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0a9ca045-d947-5ff4-8445-1596f77e3642')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0a9ca045-d947-5ff4-8445-1596f77e3642', 'admin', 'st371@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ee80c1ec-dd32-5226-baf6-e6839beec35c', '0a9ca045-d947-5ff4-8445-1596f77e3642', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.116682, 83.13772, 'India EV Network License', 'LIC-IN-ST371', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ee80c1ec-dd32-5226-baf6-e6839beec35c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a38307c0-848c-5c4d-a664-587cfb5f6dd7', 'ee80c1ec-dd32-5226-baf6-e6839beec35c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4a4b0d91-07b7-50d7-ae7a-924706abc957', 'ee80c1ec-dd32-5226-baf6-e6839beec35c', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 372: Jio-bp (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5fe2bacf-c965-5450-a104-700684e35270', '00000000-0000-0000-0000-000000000000', 'st372@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st372@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5fe2bacf-c965-5450-a104-700684e35270', '5fe2bacf-c965-5450-a104-700684e35270', '{"sub": "5fe2bacf-c965-5450-a104-700684e35270", "email": "st372@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5fe2bacf-c965-5450-a104-700684e35270')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5fe2bacf-c965-5450-a104-700684e35270', 'admin', 'st372@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('22d39a4c-ed0f-5d20-917d-7d7b2e1a8430', '5fe2bacf-c965-5450-a104-700684e35270', 'Jio-bp', 'Jio-bp, Odisha, India', 18.289378, 83.914594, 'India EV Network License', 'LIC-IN-ST372', 500.0, 50.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '22d39a4c-ed0f-5d20-917d-7d7b2e1a8430';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('814e29b7-c0e7-5970-afe0-fad04002552e', '22d39a4c-ed0f-5d20-917d-7d7b2e1a8430', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('050573a8-8381-5acc-8915-d77aa754ea61', '22d39a4c-ed0f-5d20-917d-7d7b2e1a8430', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 373: Royal Drive EVCS (Venpalavattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('59fec112-2ba1-5152-aac9-f9df8f8fb13d', '00000000-0000-0000-0000-000000000000', 'st373@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st373@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('59fec112-2ba1-5152-aac9-f9df8f8fb13d', '59fec112-2ba1-5152-aac9-f9df8f8fb13d', '{"sub": "59fec112-2ba1-5152-aac9-f9df8f8fb13d", "email": "st373@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '59fec112-2ba1-5152-aac9-f9df8f8fb13d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('59fec112-2ba1-5152-aac9-f9df8f8fb13d', 'admin', 'st373@boss.com', 'Admin Royal Drive EVCS', 'Royal Drive EVCS', 'Royal Drive EVCS, Venpalavattom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('06ba07bf-c9a3-5926-a6bf-65734f2b2027', '59fec112-2ba1-5152-aac9-f9df8f8fb13d', 'Royal Drive EVCS', 'Royal Drive EVCS, Venpalavattom, Kerala, India', 8.50349548, 76.91166164, 'India EV Network License', 'LIC-IN-ST373', 500.0, 7.4, true, 'Venpalavattom', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '06ba07bf-c9a3-5926-a6bf-65734f2b2027';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eb51da9e-ec1c-5559-b725-03c4733d85a6', '06ba07bf-c9a3-5926-a6bf-65734f2b2027', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 374: Poovar PNT EVCS (Kulathoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d4d0802a-d2e9-5b00-bab6-e81346817fd6', '00000000-0000-0000-0000-000000000000', 'st374@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st374@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d4d0802a-d2e9-5b00-bab6-e81346817fd6', 'd4d0802a-d2e9-5b00-bab6-e81346817fd6', '{"sub": "d4d0802a-d2e9-5b00-bab6-e81346817fd6", "email": "st374@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd4d0802a-d2e9-5b00-bab6-e81346817fd6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d4d0802a-d2e9-5b00-bab6-e81346817fd6', 'admin', 'st374@boss.com', 'Admin Poovar PNT EVCS', 'Poovar PNT EVCS', 'Poovar PNT EVCS, Kulathoor, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f1363bb0-f926-5354-a917-3d14d56c4255', 'd4d0802a-d2e9-5b00-bab6-e81346817fd6', 'Poovar PNT EVCS', 'Poovar PNT EVCS, Kulathoor, Kerala, India', 8.315968833, 77.09035465, 'India EV Network License', 'LIC-IN-ST374', 500.0, 7.4, true, 'Kulathoor', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f1363bb0-f926-5354-a917-3d14d56c4255';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('614d4f30-ae0f-5b12-82ef-73df18bb3544', 'f1363bb0-f926-5354-a917-3d14d56c4255', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 375: Ayyappa EVCS (Erumely, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3a7f910b-713b-5f2d-8bad-ebd3bcce0ca7', '00000000-0000-0000-0000-000000000000', 'st375@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st375@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3a7f910b-713b-5f2d-8bad-ebd3bcce0ca7', '3a7f910b-713b-5f2d-8bad-ebd3bcce0ca7', '{"sub": "3a7f910b-713b-5f2d-8bad-ebd3bcce0ca7", "email": "st375@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3a7f910b-713b-5f2d-8bad-ebd3bcce0ca7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3a7f910b-713b-5f2d-8bad-ebd3bcce0ca7', 'admin', 'st375@boss.com', 'Admin Ayyappa EVCS', 'Ayyappa EVCS', 'Ayyappa EVCS, Erumely, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1ca17761-5952-5c3b-ad80-bb4c1b67345c', '3a7f910b-713b-5f2d-8bad-ebd3bcce0ca7', 'Ayyappa EVCS', 'Ayyappa EVCS, Erumely, Kerala, India', 9.478662772, 76.84487199, 'India EV Network License', 'LIC-IN-ST375', 500.0, 7.4, true, 'Erumely', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1ca17761-5952-5c3b-ad80-bb4c1b67345c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e20e6488-a52c-58b1-af96-75e7e4d84db8', '1ca17761-5952-5c3b-ad80-bb4c1b67345c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 376: Adimali Rangers (Adimali, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('aa2df5b9-224e-560a-a858-9d844e63280f', '00000000-0000-0000-0000-000000000000', 'st376@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st376@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('aa2df5b9-224e-560a-a858-9d844e63280f', 'aa2df5b9-224e-560a-a858-9d844e63280f', '{"sub": "aa2df5b9-224e-560a-a858-9d844e63280f", "email": "st376@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'aa2df5b9-224e-560a-a858-9d844e63280f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('aa2df5b9-224e-560a-a858-9d844e63280f', 'admin', 'st376@boss.com', 'Admin Adimali Rangers', 'Adimali Rangers', 'Adimali Rangers, Adimali, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('77a80184-5edb-5313-be30-32be4a132454', 'aa2df5b9-224e-560a-a858-9d844e63280f', 'Adimali Rangers', 'Adimali Rangers, Adimali, Kerala, India', 10.0141442, 76.94382997, 'India EV Network License', 'LIC-IN-ST376', 500.0, 7.4, true, 'Adimali', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '77a80184-5edb-5313-be30-32be4a132454';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('583dfe0b-b1e3-5720-bf43-3a4bc1fed8e0', '77a80184-5edb-5313-be30-32be4a132454', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 377: Hill View EVCS (Munnar, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3466ba04-4ee1-5a4d-9743-72fe985a2ad1', '00000000-0000-0000-0000-000000000000', 'st377@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st377@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3466ba04-4ee1-5a4d-9743-72fe985a2ad1', '3466ba04-4ee1-5a4d-9743-72fe985a2ad1', '{"sub": "3466ba04-4ee1-5a4d-9743-72fe985a2ad1", "email": "st377@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3466ba04-4ee1-5a4d-9743-72fe985a2ad1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3466ba04-4ee1-5a4d-9743-72fe985a2ad1', 'admin', 'st377@boss.com', 'Admin Hill View EVCS', 'Hill View EVCS', 'Hill View EVCS, Munnar, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('358683f3-e0e2-5304-aa2d-c972d354e302', '3466ba04-4ee1-5a4d-9743-72fe985a2ad1', 'Hill View EVCS', 'Hill View EVCS, Munnar, Kerala, India', 10.06993665, 77.06094194, 'India EV Network License', 'LIC-IN-ST377', 500.0, 7.4, true, 'Munnar', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '358683f3-e0e2-5304-aa2d-c972d354e302';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('16bc82c1-b554-56c4-9ae1-b885e70b69e6', '358683f3-e0e2-5304-aa2d-c972d354e302', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 378: Cargo Auto Hub EVCS (Bharananganam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4b140a7f-ea8f-5eab-b183-e639ce14d589', '00000000-0000-0000-0000-000000000000', 'st378@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st378@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4b140a7f-ea8f-5eab-b183-e639ce14d589', '4b140a7f-ea8f-5eab-b183-e639ce14d589', '{"sub": "4b140a7f-ea8f-5eab-b183-e639ce14d589", "email": "st378@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4b140a7f-ea8f-5eab-b183-e639ce14d589')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4b140a7f-ea8f-5eab-b183-e639ce14d589', 'admin', 'st378@boss.com', 'Admin Cargo Auto Hub EVCS', 'Cargo Auto Hub EVCS', 'Cargo Auto Hub EVCS, Bharananganam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f3ea1be4-57d3-52ae-b67b-8101bdcab28b', '4b140a7f-ea8f-5eab-b183-e639ce14d589', 'Cargo Auto Hub EVCS', 'Cargo Auto Hub EVCS, Bharananganam, Kerala, India', 9.702761975, 76.72119375, 'India EV Network License', 'LIC-IN-ST378', 500.0, 7.4, true, 'Bharananganam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f3ea1be4-57d3-52ae-b67b-8101bdcab28b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('84befaf1-d70d-5c9b-9e7c-fd5c87ff48d6', 'f3ea1be4-57d3-52ae-b67b-8101bdcab28b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 379: Minerva EVCS (Ettumanoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ffabe320-fd55-5a90-8706-9721bf079d90', '00000000-0000-0000-0000-000000000000', 'st379@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st379@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ffabe320-fd55-5a90-8706-9721bf079d90', 'ffabe320-fd55-5a90-8706-9721bf079d90', '{"sub": "ffabe320-fd55-5a90-8706-9721bf079d90", "email": "st379@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ffabe320-fd55-5a90-8706-9721bf079d90')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ffabe320-fd55-5a90-8706-9721bf079d90', 'admin', 'st379@boss.com', 'Admin Minerva EVCS', 'Minerva EVCS', 'Minerva EVCS, Ettumanoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('39464399-e2cc-55e0-89e4-d0b856309765', 'ffabe320-fd55-5a90-8706-9721bf079d90', 'Minerva EVCS', 'Minerva EVCS, Ettumanoor, Kerala, India', 9.692576429, 76.55969005, 'India EV Network License', 'LIC-IN-ST379', 500.0, 7.4, true, 'Ettumanoor', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '39464399-e2cc-55e0-89e4-d0b856309765';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0a2a5d71-5d68-5271-9656-3183d27c9d12', '39464399-e2cc-55e0-89e4-d0b856309765', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 380: Savoi Complex EVCS (Koothattukulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('565c4a4c-31a4-5ea4-8f3a-d9063b9b117e', '00000000-0000-0000-0000-000000000000', 'st380@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st380@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('565c4a4c-31a4-5ea4-8f3a-d9063b9b117e', '565c4a4c-31a4-5ea4-8f3a-d9063b9b117e', '{"sub": "565c4a4c-31a4-5ea4-8f3a-d9063b9b117e", "email": "st380@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '565c4a4c-31a4-5ea4-8f3a-d9063b9b117e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('565c4a4c-31a4-5ea4-8f3a-d9063b9b117e', 'admin', 'st380@boss.com', 'Admin Savoi Complex EVCS', 'Savoi Complex EVCS', 'Savoi Complex EVCS, Koothattukulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8032e740-370e-59f0-a24d-3a88512b77df', '565c4a4c-31a4-5ea4-8f3a-d9063b9b117e', 'Savoi Complex EVCS', 'Savoi Complex EVCS, Koothattukulam, Kerala, India', 9.861340746, 76.59599011, 'India EV Network License', 'LIC-IN-ST380', 500.0, 7.4, true, 'Koothattukulam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8032e740-370e-59f0-a24d-3a88512b77df';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f266025d-aa80-51f4-a0f3-7c1c9164dec9', '8032e740-370e-59f0-a24d-3a88512b77df', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 381: Haridwar EVCS (Koothattukulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5ed88836-0223-5906-9582-acd891855634', '00000000-0000-0000-0000-000000000000', 'st381@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st381@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5ed88836-0223-5906-9582-acd891855634', '5ed88836-0223-5906-9582-acd891855634', '{"sub": "5ed88836-0223-5906-9582-acd891855634", "email": "st381@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5ed88836-0223-5906-9582-acd891855634')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5ed88836-0223-5906-9582-acd891855634', 'admin', 'st381@boss.com', 'Admin Haridwar EVCS', 'Haridwar EVCS', 'Haridwar EVCS, Koothattukulam, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b7e25418-90ce-5fe7-bf01-481f0f492bb1', '5ed88836-0223-5906-9582-acd891855634', 'Haridwar EVCS', 'Haridwar EVCS, Koothattukulam, Kerala, India', 9.872065277, 76.59611459, 'India EV Network License', 'LIC-IN-ST381', 500.0, 7.4, true, 'Koothattukulam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b7e25418-90ce-5fe7-bf01-481f0f492bb1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6e4acc1e-5781-517f-838b-2826b491cbfb', 'b7e25418-90ce-5fe7-bf01-481f0f492bb1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 382: Pattakulam EV Super Charging Station (Kothamangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('77c6bc6a-8072-5602-9c54-cc4652720043', '00000000-0000-0000-0000-000000000000', 'st382@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st382@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('77c6bc6a-8072-5602-9c54-cc4652720043', '77c6bc6a-8072-5602-9c54-cc4652720043', '{"sub": "77c6bc6a-8072-5602-9c54-cc4652720043", "email": "st382@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '77c6bc6a-8072-5602-9c54-cc4652720043')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('77c6bc6a-8072-5602-9c54-cc4652720043', 'admin', 'st382@boss.com', 'Admin Pattakulam EV Super Charging Station', 'Pattakulam EV Super Charging Station', 'Pattakulam EV Super Charging Station, Kothamangalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('33d7c9a9-dca7-5816-a792-9c544710ba05', '77c6bc6a-8072-5602-9c54-cc4652720043', 'Pattakulam EV Super Charging Station', 'Pattakulam EV Super Charging Station, Kothamangalam, Kerala, India', 10.05863762, 76.65237792, 'India EV Network License', 'LIC-IN-ST382', 500.0, 7.4, true, 'Kothamangalam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '33d7c9a9-dca7-5816-a792-9c544710ba05';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7a99a9b2-d83e-5524-b536-6d157762a770', '33d7c9a9-dca7-5816-a792-9c544710ba05', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 383: Eco Park EVCS (Pukkattupady, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e766655b-db97-504e-936a-e3c614dcf288', '00000000-0000-0000-0000-000000000000', 'st383@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st383@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e766655b-db97-504e-936a-e3c614dcf288', 'e766655b-db97-504e-936a-e3c614dcf288', '{"sub": "e766655b-db97-504e-936a-e3c614dcf288", "email": "st383@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e766655b-db97-504e-936a-e3c614dcf288')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e766655b-db97-504e-936a-e3c614dcf288', 'admin', 'st383@boss.com', 'Admin Eco Park EVCS', 'Eco Park EVCS', 'Eco Park EVCS, Pukkattupady, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('23ced51b-3951-5505-a03c-106b54763edd', 'e766655b-db97-504e-936a-e3c614dcf288', 'Eco Park EVCS', 'Eco Park EVCS, Pukkattupady, Kerala, India', 10.06823616, 76.38681353, 'India EV Network License', 'LIC-IN-ST383', 500.0, 7.4, true, 'Pukkattupady', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '23ced51b-3951-5505-a03c-106b54763edd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fe0c36fa-45a3-5e83-8b90-f3c69a34cee0', '23ced51b-3951-5505-a03c-106b54763edd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 384: Yash Square EVCS (Aluva, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('83e2829e-1f89-530a-b595-eefce0c35511', '00000000-0000-0000-0000-000000000000', 'st384@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st384@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('83e2829e-1f89-530a-b595-eefce0c35511', '83e2829e-1f89-530a-b595-eefce0c35511', '{"sub": "83e2829e-1f89-530a-b595-eefce0c35511", "email": "st384@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '83e2829e-1f89-530a-b595-eefce0c35511')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('83e2829e-1f89-530a-b595-eefce0c35511', 'admin', 'st384@boss.com', 'Admin Yash Square EVCS', 'Yash Square EVCS', 'Yash Square EVCS, Aluva, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('57fc1097-d0a9-567b-95a6-75dfe15538e8', '83e2829e-1f89-530a-b595-eefce0c35511', 'Yash Square EVCS', 'Yash Square EVCS, Aluva, Kerala, India', 10.11057497, 76.37287274, 'India EV Network License', 'LIC-IN-ST384', 500.0, 7.4, true, 'Aluva', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '57fc1097-d0a9-567b-95a6-75dfe15538e8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6d7e3106-7b7e-5a99-8ad5-33d049fa197d', '57fc1097-d0a9-567b-95a6-75dfe15538e8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 385: Ie.On EVCS (Vazhakkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('16705c96-1efb-5135-95f1-a3a0c0aae764', '00000000-0000-0000-0000-000000000000', 'st385@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st385@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('16705c96-1efb-5135-95f1-a3a0c0aae764', '16705c96-1efb-5135-95f1-a3a0c0aae764', '{"sub": "16705c96-1efb-5135-95f1-a3a0c0aae764", "email": "st385@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '16705c96-1efb-5135-95f1-a3a0c0aae764')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('16705c96-1efb-5135-95f1-a3a0c0aae764', 'admin', 'st385@boss.com', 'Admin Ie.On EVCS', 'Ie.On EVCS', 'Ie.On EVCS, Vazhakkulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('22773a53-fdb4-5e55-89dd-ec9cb936d2d9', '16705c96-1efb-5135-95f1-a3a0c0aae764', 'Ie.On EVCS', 'Ie.On EVCS, Vazhakkulam, Kerala, India', 10.08867027, 76.42441988, 'India EV Network License', 'LIC-IN-ST385', 500.0, 7.4, true, 'Vazhakkulam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '22773a53-fdb4-5e55-89dd-ec9cb936d2d9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eedc961b-d344-5f14-8c25-09ff0cd04f02', '22773a53-fdb4-5e55-89dd-ec9cb936d2d9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 386: JP Complex EVCS (Perumbavoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('09a3db4b-ee40-5ebc-b404-19b8d1325e1f', '00000000-0000-0000-0000-000000000000', 'st386@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st386@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('09a3db4b-ee40-5ebc-b404-19b8d1325e1f', '09a3db4b-ee40-5ebc-b404-19b8d1325e1f', '{"sub": "09a3db4b-ee40-5ebc-b404-19b8d1325e1f", "email": "st386@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '09a3db4b-ee40-5ebc-b404-19b8d1325e1f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('09a3db4b-ee40-5ebc-b404-19b8d1325e1f', 'admin', 'st386@boss.com', 'Admin JP Complex EVCS', 'JP Complex EVCS', 'JP Complex EVCS, Perumbavoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('85e6527b-d135-5cee-9fc8-b30fed42e6a5', '09a3db4b-ee40-5ebc-b404-19b8d1325e1f', 'JP Complex EVCS', 'JP Complex EVCS, Perumbavoor, Kerala, India', 10.11154054, 76.47892757, 'India EV Network License', 'LIC-IN-ST386', 500.0, 7.4, true, 'Perumbavoor', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '85e6527b-d135-5cee-9fc8-b30fed42e6a5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6b756b65-67e2-5381-b25f-ea3bced2c724', '85e6527b-d135-5cee-9fc8-b30fed42e6a5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 387: Electro Spark EVCS (Perumbavoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('04d16bef-4176-51f1-85b6-91261e1c1815', '00000000-0000-0000-0000-000000000000', 'st387@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st387@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('04d16bef-4176-51f1-85b6-91261e1c1815', '04d16bef-4176-51f1-85b6-91261e1c1815', '{"sub": "04d16bef-4176-51f1-85b6-91261e1c1815", "email": "st387@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '04d16bef-4176-51f1-85b6-91261e1c1815')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('04d16bef-4176-51f1-85b6-91261e1c1815', 'admin', 'st387@boss.com', 'Admin Electro Spark EVCS', 'Electro Spark EVCS', 'Electro Spark EVCS, Perumbavoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3c60190b-5974-508f-806c-406027e4b084', '04d16bef-4176-51f1-85b6-91261e1c1815', 'Electro Spark EVCS', 'Electro Spark EVCS, Perumbavoor, Kerala, India', 10.16308064, 76.48721725, 'India EV Network License', 'LIC-IN-ST387', 500.0, 7.4, true, 'Perumbavoor', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3c60190b-5974-508f-806c-406027e4b084';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9df7c0ee-874b-58cd-9d64-ccdb846c52b7', '3c60190b-5974-508f-806c-406027e4b084', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 388: Smartvolt EVCS (Kalady, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('24ff7430-0e5a-5edb-902e-bc9566183387', '00000000-0000-0000-0000-000000000000', 'st388@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st388@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('24ff7430-0e5a-5edb-902e-bc9566183387', '24ff7430-0e5a-5edb-902e-bc9566183387', '{"sub": "24ff7430-0e5a-5edb-902e-bc9566183387", "email": "st388@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '24ff7430-0e5a-5edb-902e-bc9566183387')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('24ff7430-0e5a-5edb-902e-bc9566183387', 'admin', 'st388@boss.com', 'Admin Smartvolt EVCS', 'Smartvolt EVCS', 'Smartvolt EVCS, Kalady, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8e708b43-7f03-56e1-a487-0cae5fe11b83', '24ff7430-0e5a-5edb-902e-bc9566183387', 'Smartvolt EVCS', 'Smartvolt EVCS, Kalady, Kerala, India', 10.16879256, 76.43474413, 'India EV Network License', 'LIC-IN-ST388', 500.0, 7.4, true, 'Kalady', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8e708b43-7f03-56e1-a487-0cae5fe11b83';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('46729c1c-3f96-5011-af32-9e9708ba26b2', '8e708b43-7f03-56e1-a487-0cae5fe11b83', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 389: Chendamangalam Combined Energy (Chendamangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('070e1d20-b523-5647-85b3-bb56a4a3ca84', '00000000-0000-0000-0000-000000000000', 'st389@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st389@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('070e1d20-b523-5647-85b3-bb56a4a3ca84', '070e1d20-b523-5647-85b3-bb56a4a3ca84', '{"sub": "070e1d20-b523-5647-85b3-bb56a4a3ca84", "email": "st389@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '070e1d20-b523-5647-85b3-bb56a4a3ca84')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('070e1d20-b523-5647-85b3-bb56a4a3ca84', 'admin', 'st389@boss.com', 'Admin Chendamangalam Combined Energy', 'Chendamangalam Combined Energy', 'Chendamangalam Combined Energy, Chendamangalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ac8c1ca2-c038-5d08-8e8c-cd3fdfd50906', '070e1d20-b523-5647-85b3-bb56a4a3ca84', 'Chendamangalam Combined Energy', 'Chendamangalam Combined Energy, Chendamangalam, Kerala, India', 10.16452076, 76.23328993, 'India EV Network License', 'LIC-IN-ST389', 500.0, 7.4, true, 'Chendamangalam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ac8c1ca2-c038-5d08-8e8c-cd3fdfd50906';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d979ba4a-fa57-51e6-b2dc-3c9deb0d654c', 'ac8c1ca2-c038-5d08-8e8c-cd3fdfd50906', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 390: Ideal EV Super Charging Station (North Paravur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('add6a8ab-cd44-5d81-859e-ab2ba07962ff', '00000000-0000-0000-0000-000000000000', 'st390@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st390@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('add6a8ab-cd44-5d81-859e-ab2ba07962ff', 'add6a8ab-cd44-5d81-859e-ab2ba07962ff', '{"sub": "add6a8ab-cd44-5d81-859e-ab2ba07962ff", "email": "st390@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'add6a8ab-cd44-5d81-859e-ab2ba07962ff')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('add6a8ab-cd44-5d81-859e-ab2ba07962ff', 'admin', 'st390@boss.com', 'Admin Ideal EV Super Charging Station', 'Ideal EV Super Charging Station', 'Ideal EV Super Charging Station, North Paravur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('68d552ee-0e5a-5140-9197-61534135d6c5', 'add6a8ab-cd44-5d81-859e-ab2ba07962ff', 'Ideal EV Super Charging Station', 'Ideal EV Super Charging Station, North Paravur, Kerala, India', 10.14922378, 76.2265059, 'India EV Network License', 'LIC-IN-ST390', 500.0, 7.4, true, 'North Paravur', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '68d552ee-0e5a-5140-9197-61534135d6c5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('68d43d80-4d0c-5df0-89ea-b24371bf335d', '68d552ee-0e5a-5140-9197-61534135d6c5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 391: rajeEVam EVCS (Kodungallur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d48e17ff-2c85-5855-b651-ede2f681ee02', '00000000-0000-0000-0000-000000000000', 'st391@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st391@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d48e17ff-2c85-5855-b651-ede2f681ee02', 'd48e17ff-2c85-5855-b651-ede2f681ee02', '{"sub": "d48e17ff-2c85-5855-b651-ede2f681ee02", "email": "st391@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd48e17ff-2c85-5855-b651-ede2f681ee02')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d48e17ff-2c85-5855-b651-ede2f681ee02', 'admin', 'st391@boss.com', 'Admin rajeEVam EVCS', 'rajeEVam EVCS', 'rajeEVam EVCS, Kodungallur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f87ed964-ffe9-5280-aec1-6842de03e2f6', 'd48e17ff-2c85-5855-b651-ede2f681ee02', 'rajeEVam EVCS', 'rajeEVam EVCS, Kodungallur, Kerala, India', 10.20314126, 76.20040095, 'India EV Network License', 'LIC-IN-ST391', 500.0, 7.4, true, 'Kodungallur', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f87ed964-ffe9-5280-aec1-6842de03e2f6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6c80b50d-5b57-5fc5-896d-94e4e9b06b0c', 'f87ed964-ffe9-5280-aec1-6842de03e2f6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 392: Nellikkunnu Snopcap EVCS (Nellikkunnu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('747a4bbb-68c8-5b5f-bbcb-8d4e29f94bf1', '00000000-0000-0000-0000-000000000000', 'st392@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st392@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('747a4bbb-68c8-5b5f-bbcb-8d4e29f94bf1', '747a4bbb-68c8-5b5f-bbcb-8d4e29f94bf1', '{"sub": "747a4bbb-68c8-5b5f-bbcb-8d4e29f94bf1", "email": "st392@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '747a4bbb-68c8-5b5f-bbcb-8d4e29f94bf1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('747a4bbb-68c8-5b5f-bbcb-8d4e29f94bf1', 'admin', 'st392@boss.com', 'Admin Nellikkunnu Snopcap EVCS', 'Nellikkunnu Snopcap EVCS', 'Nellikkunnu Snopcap EVCS, Nellikkunnu, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3bf98b2c-23ae-5627-b17f-cba2728985b0', '747a4bbb-68c8-5b5f-bbcb-8d4e29f94bf1', 'Nellikkunnu Snopcap EVCS', 'Nellikkunnu Snopcap EVCS, Nellikkunnu, Kerala, India', 10.5121401, 76.24889621, 'India EV Network License', 'LIC-IN-ST392', 500.0, 7.4, true, 'Nellikkunnu', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3bf98b2c-23ae-5627-b17f-cba2728985b0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('91827650-1da2-5905-bf70-ffa1b523b578', '3bf98b2c-23ae-5627-b17f-cba2728985b0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 393: Chavakkad Golden Tower EVCS (Punnayur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c6a91557-0ea3-589f-a08c-697e67a62df9', '00000000-0000-0000-0000-000000000000', 'st393@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st393@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c6a91557-0ea3-589f-a08c-697e67a62df9', 'c6a91557-0ea3-589f-a08c-697e67a62df9', '{"sub": "c6a91557-0ea3-589f-a08c-697e67a62df9", "email": "st393@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c6a91557-0ea3-589f-a08c-697e67a62df9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c6a91557-0ea3-589f-a08c-697e67a62df9', 'admin', 'st393@boss.com', 'Admin Chavakkad Golden Tower EVCS', 'Chavakkad Golden Tower EVCS', 'Chavakkad Golden Tower EVCS, Punnayur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('63eb5a30-fb33-5ba3-9d3f-8938b3e8b76d', 'c6a91557-0ea3-589f-a08c-697e67a62df9', 'Chavakkad Golden Tower EVCS', 'Chavakkad Golden Tower EVCS, Punnayur, Kerala, India', 10.6429724, 75.98558048, 'India EV Network License', 'LIC-IN-ST393', 500.0, 7.4, true, 'Punnayur', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '63eb5a30-fb33-5ba3-9d3f-8938b3e8b76d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6e1bba62-6bbc-5672-b3ea-2cb2ef30eab8', '63eb5a30-fb33-5ba3-9d3f-8938b3e8b76d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 394: Guruvayoor Sreeja EVCS (Guruvayur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a53ab771-5b07-5094-aaeb-864d9e8d304d', '00000000-0000-0000-0000-000000000000', 'st394@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st394@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a53ab771-5b07-5094-aaeb-864d9e8d304d', 'a53ab771-5b07-5094-aaeb-864d9e8d304d', '{"sub": "a53ab771-5b07-5094-aaeb-864d9e8d304d", "email": "st394@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a53ab771-5b07-5094-aaeb-864d9e8d304d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a53ab771-5b07-5094-aaeb-864d9e8d304d', 'admin', 'st394@boss.com', 'Admin Guruvayoor Sreeja EVCS', 'Guruvayoor Sreeja EVCS', 'Guruvayoor Sreeja EVCS, Guruvayur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8366254b-9d27-5fdc-8f8c-c83383a4d267', 'a53ab771-5b07-5094-aaeb-864d9e8d304d', 'Guruvayoor Sreeja EVCS', 'Guruvayoor Sreeja EVCS, Guruvayur, Kerala, India', 10.59330983, 76.03739688, 'India EV Network License', 'LIC-IN-ST394', 500.0, 7.4, true, 'Guruvayur', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8366254b-9d27-5fdc-8f8c-c83383a4d267';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d1f59e4e-bb90-5e32-8e9c-d6008f702090', '8366254b-9d27-5fdc-8f8c-c83383a4d267', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 395: Swathi EVCS (Kollengode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c5779299-7fd4-5f34-a4c5-b32e9b7abcb0', '00000000-0000-0000-0000-000000000000', 'st395@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st395@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c5779299-7fd4-5f34-a4c5-b32e9b7abcb0', 'c5779299-7fd4-5f34-a4c5-b32e9b7abcb0', '{"sub": "c5779299-7fd4-5f34-a4c5-b32e9b7abcb0", "email": "st395@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c5779299-7fd4-5f34-a4c5-b32e9b7abcb0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c5779299-7fd4-5f34-a4c5-b32e9b7abcb0', 'admin', 'st395@boss.com', 'Admin Swathi EVCS', 'Swathi EVCS', 'Swathi EVCS, Kollengode, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('512f6be4-14fb-5b85-87c7-3c92114e2a89', 'c5779299-7fd4-5f34-a4c5-b32e9b7abcb0', 'Swathi EVCS', 'Swathi EVCS, Kollengode, Kerala, India', 10.61186018, 76.68416479, 'India EV Network License', 'LIC-IN-ST395', 500.0, 7.4, true, 'Kollengode', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '512f6be4-14fb-5b85-87c7-3c92114e2a89';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d39e6e19-279a-5743-8ff0-2e252679c8cd', '512f6be4-14fb-5b85-87c7-3c92114e2a89', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 396: Hi - Span EVCS (Pampampallam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a645c4a2-0c91-542c-846b-b767b3fecfb7', '00000000-0000-0000-0000-000000000000', 'st396@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st396@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a645c4a2-0c91-542c-846b-b767b3fecfb7', 'a645c4a2-0c91-542c-846b-b767b3fecfb7', '{"sub": "a645c4a2-0c91-542c-846b-b767b3fecfb7", "email": "st396@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a645c4a2-0c91-542c-846b-b767b3fecfb7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a645c4a2-0c91-542c-846b-b767b3fecfb7', 'admin', 'st396@boss.com', 'Admin Hi - Span EVCS', 'Hi - Span EVCS', 'Hi - Span EVCS, Pampampallam, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ad5a54c9-fc18-5064-b56c-afa450dcc866', 'a645c4a2-0c91-542c-846b-b767b3fecfb7', 'Hi - Span EVCS', 'Hi - Span EVCS, Pampampallam, Kerala, India', 10.81963572, 76.81019691, 'India EV Network License', 'LIC-IN-ST396', 500.0, 7.4, true, 'Pampampallam', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ad5a54c9-fc18-5064-b56c-afa450dcc866';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e7cc236a-b6bc-5a17-a003-25dfc37534ca', 'ad5a54c9-fc18-5064-b56c-afa450dcc866', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 397: Page EVCS (Tirur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6373ada2-6ebb-5098-9027-95afba537ec4', '00000000-0000-0000-0000-000000000000', 'st397@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st397@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6373ada2-6ebb-5098-9027-95afba537ec4', '6373ada2-6ebb-5098-9027-95afba537ec4', '{"sub": "6373ada2-6ebb-5098-9027-95afba537ec4", "email": "st397@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6373ada2-6ebb-5098-9027-95afba537ec4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6373ada2-6ebb-5098-9027-95afba537ec4', 'admin', 'st397@boss.com', 'Admin Page EVCS', 'Page EVCS', 'Page EVCS, Tirur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('50fd9b28-7f60-5cde-a555-92b5bf4566ee', '6373ada2-6ebb-5098-9027-95afba537ec4', 'Page EVCS', 'Page EVCS, Tirur, Kerala, India', 10.90122132, 75.92541639, 'India EV Network License', 'LIC-IN-ST397', 500.0, 7.4, true, 'Tirur', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '50fd9b28-7f60-5cde-a555-92b5bf4566ee';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7f02b1a5-9ca4-5def-9650-62f42a2a9065', '50fd9b28-7f60-5cde-a555-92b5bf4566ee', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 398: Dilkush EVCS (Ramanattukara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0f10c3bb-0723-5a9e-83df-2a51da15bd49', '00000000-0000-0000-0000-000000000000', 'st398@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st398@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0f10c3bb-0723-5a9e-83df-2a51da15bd49', '0f10c3bb-0723-5a9e-83df-2a51da15bd49', '{"sub": "0f10c3bb-0723-5a9e-83df-2a51da15bd49", "email": "st398@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0f10c3bb-0723-5a9e-83df-2a51da15bd49')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0f10c3bb-0723-5a9e-83df-2a51da15bd49', 'admin', 'st398@boss.com', 'Admin Dilkush EVCS', 'Dilkush EVCS', 'Dilkush EVCS, Ramanattukara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('90b9cfce-6280-5ad1-9be7-c5e3d4a9d33f', '0f10c3bb-0723-5a9e-83df-2a51da15bd49', 'Dilkush EVCS', 'Dilkush EVCS, Ramanattukara, Kerala, India', 11.17979194, 75.87213471, 'India EV Network License', 'LIC-IN-ST398', 500.0, 7.4, true, 'Ramanattukara', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '90b9cfce-6280-5ad1-9be7-c5e3d4a9d33f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('30dd897e-b529-533a-9463-97037c12e83a', '90b9cfce-6280-5ad1-9be7-c5e3d4a9d33f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 399: Calicut Malabar Gold HQ EVCS (Peruvayal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d93a195d-446c-547f-be0f-0d68063bb540', '00000000-0000-0000-0000-000000000000', 'st399@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st399@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d93a195d-446c-547f-be0f-0d68063bb540', 'd93a195d-446c-547f-be0f-0d68063bb540', '{"sub": "d93a195d-446c-547f-be0f-0d68063bb540", "email": "st399@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd93a195d-446c-547f-be0f-0d68063bb540')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d93a195d-446c-547f-be0f-0d68063bb540', 'admin', 'st399@boss.com', 'Admin Calicut Malabar Gold HQ EVCS', 'Calicut Malabar Gold HQ EVCS', 'Calicut Malabar Gold HQ EVCS, Peruvayal, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ee6ec4e3-c6d4-5882-80be-050082fb6074', 'd93a195d-446c-547f-be0f-0d68063bb540', 'Calicut Malabar Gold HQ EVCS', 'Calicut Malabar Gold HQ EVCS, Peruvayal, Kerala, India', 11.28048199, 75.87910483, 'India EV Network License', 'LIC-IN-ST399', 500.0, 7.4, true, 'Peruvayal', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ee6ec4e3-c6d4-5882-80be-050082fb6074';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9bd3d548-db7c-53a8-bf6f-4910509651bf', 'ee6ec4e3-c6d4-5882-80be-050082fb6074', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 400: Kunnamangalam Little Flower EVCS (Chelavoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ff5f272c-5813-5268-8389-0af1fa1b7606', '00000000-0000-0000-0000-000000000000', 'st400@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st400@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ff5f272c-5813-5268-8389-0af1fa1b7606', 'ff5f272c-5813-5268-8389-0af1fa1b7606', '{"sub": "ff5f272c-5813-5268-8389-0af1fa1b7606", "email": "st400@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ff5f272c-5813-5268-8389-0af1fa1b7606')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ff5f272c-5813-5268-8389-0af1fa1b7606', 'admin', 'st400@boss.com', 'Admin Kunnamangalam Little Flower EVCS', 'Kunnamangalam Little Flower EVCS', 'Kunnamangalam Little Flower EVCS, Chelavoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5e72d767-2322-597c-9eec-2a45a551a292', 'ff5f272c-5813-5268-8389-0af1fa1b7606', 'Kunnamangalam Little Flower EVCS', 'Kunnamangalam Little Flower EVCS, Chelavoor, Kerala, India', 11.29802224, 75.85300039, 'India EV Network License', 'LIC-IN-ST400', 500.0, 7.4, true, 'Chelavoor', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5e72d767-2322-597c-9eec-2a45a551a292';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dad20821-effa-5d6d-b663-3f14c7633a8b', '5e72d767-2322-597c-9eec-2a45a551a292', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
