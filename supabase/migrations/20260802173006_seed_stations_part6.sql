-- Seed Stations Part 6 (Stations 501 to 600)
BEGIN;

-- Station 501: Zap N Go (Kuttanadu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c7c76bda-f88e-5a28-a89a-7a5bdaa210e0', '00000000-0000-0000-0000-000000000000', 'st501@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st501@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c7c76bda-f88e-5a28-a89a-7a5bdaa210e0', 'c7c76bda-f88e-5a28-a89a-7a5bdaa210e0', '{"sub": "c7c76bda-f88e-5a28-a89a-7a5bdaa210e0", "email": "st501@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c7c76bda-f88e-5a28-a89a-7a5bdaa210e0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c7c76bda-f88e-5a28-a89a-7a5bdaa210e0', 'admin', 'st501@boss.com', 'Admin Zap N Go', 'Zap N Go', 'Zap N Go, Kuttanadu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1e1d9094-69ef-5cc0-9495-3cb78ecc37e1', 'c7c76bda-f88e-5a28-a89a-7a5bdaa210e0', 'Zap N Go', 'Zap N Go, Kuttanadu, Kerala, India', 9.41770524, 76.48812051, 'India EV Network License', 'LIC-IN-ST501', 500.0, 7.4, true, 'Kuttanadu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1e1d9094-69ef-5cc0-9495-3cb78ecc37e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7873373b-a040-57d4-9c4d-269593652d6c', '1e1d9094-69ef-5cc0-9495-3cb78ecc37e1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 502: EVOK Charging Station | Thiruvalla (Thiruvalla, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ed676789-3614-5333-883a-a7a9a29ba8ff', '00000000-0000-0000-0000-000000000000', 'st502@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st502@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ed676789-3614-5333-883a-a7a9a29ba8ff', 'ed676789-3614-5333-883a-a7a9a29ba8ff', '{"sub": "ed676789-3614-5333-883a-a7a9a29ba8ff", "email": "st502@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ed676789-3614-5333-883a-a7a9a29ba8ff')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ed676789-3614-5333-883a-a7a9a29ba8ff', 'admin', 'st502@boss.com', 'Admin EVOK Charging Station | Thiruvalla', 'EVOK Charging Station | Thiruvalla', 'EVOK Charging Station | Thiruvalla, Thiruvalla, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('487e019e-3b08-51e7-ade3-ec0bd532b0ff', 'ed676789-3614-5333-883a-a7a9a29ba8ff', 'EVOK Charging Station | Thiruvalla', 'EVOK Charging Station | Thiruvalla, Thiruvalla, Kerala, India', 9.357343562, 76.59062445, 'India EV Network License', 'LIC-IN-ST502', 500.0, 30.0, true, 'Thiruvalla', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '487e019e-3b08-51e7-ade3-ec0bd532b0ff';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cd95f7c0-89cb-5a72-8bbb-a2d984eac6b2', '487e019e-3b08-51e7-ade3-ec0bd532b0ff', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('68b61ea9-decc-5795-8a06-a72e970c59a9', '487e019e-3b08-51e7-ade3-ec0bd532b0ff', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 503: Anupama EVCS | Pathiyoor (Pathiyoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cabd5edb-8296-5b6c-9241-c17d3e4e4e0d', '00000000-0000-0000-0000-000000000000', 'st503@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st503@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cabd5edb-8296-5b6c-9241-c17d3e4e4e0d', 'cabd5edb-8296-5b6c-9241-c17d3e4e4e0d', '{"sub": "cabd5edb-8296-5b6c-9241-c17d3e4e4e0d", "email": "st503@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cabd5edb-8296-5b6c-9241-c17d3e4e4e0d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cabd5edb-8296-5b6c-9241-c17d3e4e4e0d', 'admin', 'st503@boss.com', 'Admin Anupama EVCS | Pathiyoor', 'Anupama EVCS | Pathiyoor', 'Anupama EVCS | Pathiyoor, Pathiyoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0081af2e-a3a8-5252-852e-408a4b5f2b24', 'cabd5edb-8296-5b6c-9241-c17d3e4e4e0d', 'Anupama EVCS | Pathiyoor', 'Anupama EVCS | Pathiyoor, Pathiyoor, Kerala, India', 9.21101914, 76.50314274, 'India EV Network License', 'LIC-IN-ST503', 500.0, 7.4, true, 'Pathiyoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0081af2e-a3a8-5252-852e-408a4b5f2b24';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5a0c9651-dc43-56e4-a032-ee2d5624c4b4', '0081af2e-a3a8-5252-852e-408a4b5f2b24', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 504: EQ Kalayil EVCS | Adoor (Adoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d97b14bf-8622-59bc-a579-579f0fd60820', '00000000-0000-0000-0000-000000000000', 'st504@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st504@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d97b14bf-8622-59bc-a579-579f0fd60820', 'd97b14bf-8622-59bc-a579-579f0fd60820', '{"sub": "d97b14bf-8622-59bc-a579-579f0fd60820", "email": "st504@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd97b14bf-8622-59bc-a579-579f0fd60820')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d97b14bf-8622-59bc-a579-579f0fd60820', 'admin', 'st504@boss.com', 'Admin EQ Kalayil EVCS | Adoor', 'EQ Kalayil EVCS | Adoor', 'EQ Kalayil EVCS | Adoor, Adoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('36824925-d621-50db-8a65-4ac66c8baa52', 'd97b14bf-8622-59bc-a579-579f0fd60820', 'EQ Kalayil EVCS | Adoor', 'EQ Kalayil EVCS | Adoor, Adoor, Kerala, India', 9.147193176, 76.73240139, 'India EV Network License', 'LIC-IN-ST504', 500.0, 7.4, true, 'Adoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '36824925-d621-50db-8a65-4ac66c8baa52';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ec46de99-9f6d-5a9f-83ea-ce7246131fd6', '36824925-d621-50db-8a65-4ac66c8baa52', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 505: Throw In Foodcourt | Karunagappalli (Karunagappalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b95c7702-26f0-5592-8ded-1e2fc5da9ce7', '00000000-0000-0000-0000-000000000000', 'st505@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st505@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b95c7702-26f0-5592-8ded-1e2fc5da9ce7', 'b95c7702-26f0-5592-8ded-1e2fc5da9ce7', '{"sub": "b95c7702-26f0-5592-8ded-1e2fc5da9ce7", "email": "st505@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b95c7702-26f0-5592-8ded-1e2fc5da9ce7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b95c7702-26f0-5592-8ded-1e2fc5da9ce7', 'admin', 'st505@boss.com', 'Admin Throw In Foodcourt | Karunagappalli', 'Throw In Foodcourt | Karunagappalli', 'Throw In Foodcourt | Karunagappalli, Karunagappalli, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('678d1a80-c4c2-5004-89c4-6174a7953c9c', 'b95c7702-26f0-5592-8ded-1e2fc5da9ce7', 'Throw In Foodcourt | Karunagappalli', 'Throw In Foodcourt | Karunagappalli, Karunagappalli, Kerala, India', 9.067236462, 76.53588535, 'India EV Network License', 'LIC-IN-ST505', 500.0, 7.4, true, 'Karunagappalli', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '678d1a80-c4c2-5004-89c4-6174a7953c9c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4b4e6a1d-d1f2-5ea1-95da-22832bfc0046', '678d1a80-c4c2-5004-89c4-6174a7953c9c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 506: Best EVCS | Karunagappalli (Karunagapally, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('06605a8f-1ee0-5f2c-9e51-8c7bc79c5412', '00000000-0000-0000-0000-000000000000', 'st506@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st506@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('06605a8f-1ee0-5f2c-9e51-8c7bc79c5412', '06605a8f-1ee0-5f2c-9e51-8c7bc79c5412', '{"sub": "06605a8f-1ee0-5f2c-9e51-8c7bc79c5412", "email": "st506@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '06605a8f-1ee0-5f2c-9e51-8c7bc79c5412')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('06605a8f-1ee0-5f2c-9e51-8c7bc79c5412', 'admin', 'st506@boss.com', 'Admin Best EVCS | Karunagappalli', 'Best EVCS | Karunagappalli', 'Best EVCS | Karunagappalli, Karunagapally, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b966a84a-5ca0-5b37-a5e0-d1b12762e0a9', '06605a8f-1ee0-5f2c-9e51-8c7bc79c5412', 'Best EVCS | Karunagappalli', 'Best EVCS | Karunagappalli, Karunagapally, Kerala, India', 9.046108946, 76.53668394, 'India EV Network License', 'LIC-IN-ST506', 500.0, 7.4, true, 'Karunagapally', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b966a84a-5ca0-5b37-a5e0-d1b12762e0a9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('36b50fd1-15b4-587c-bd5b-a6fe59a2f7ff', 'b966a84a-5ca0-5b37-a5e0-d1b12762e0a9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 507: Panamthodil Bakers | Chavara (Chavara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8b895b45-e09d-59c9-b60b-6f30f815ed9e', '00000000-0000-0000-0000-000000000000', 'st507@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st507@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8b895b45-e09d-59c9-b60b-6f30f815ed9e', '8b895b45-e09d-59c9-b60b-6f30f815ed9e', '{"sub": "8b895b45-e09d-59c9-b60b-6f30f815ed9e", "email": "st507@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8b895b45-e09d-59c9-b60b-6f30f815ed9e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8b895b45-e09d-59c9-b60b-6f30f815ed9e', 'admin', 'st507@boss.com', 'Admin Panamthodil Bakers | Chavara', 'Panamthodil Bakers | Chavara', 'Panamthodil Bakers | Chavara, Chavara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1d7f4c5b-4141-5ca3-8ecb-c53092646058', '8b895b45-e09d-59c9-b60b-6f30f815ed9e', 'Panamthodil Bakers | Chavara', 'Panamthodil Bakers | Chavara, Chavara, Kerala, India', 8.983229975, 76.5347704, 'India EV Network License', 'LIC-IN-ST507', 500.0, 7.4, true, 'Chavara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1d7f4c5b-4141-5ca3-8ecb-c53092646058';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5be27922-d1ab-5c9a-8eb3-4297846b2344', '1d7f4c5b-4141-5ca3-8ecb-c53092646058', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 508: Panamthodil Bakers | Chavara (Chavara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d346bf20-85d2-5b13-aa0c-deb05f4629c4', '00000000-0000-0000-0000-000000000000', 'st508@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st508@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d346bf20-85d2-5b13-aa0c-deb05f4629c4', 'd346bf20-85d2-5b13-aa0c-deb05f4629c4', '{"sub": "d346bf20-85d2-5b13-aa0c-deb05f4629c4", "email": "st508@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd346bf20-85d2-5b13-aa0c-deb05f4629c4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d346bf20-85d2-5b13-aa0c-deb05f4629c4', 'admin', 'st508@boss.com', 'Admin Panamthodil Bakers | Chavara', 'Panamthodil Bakers | Chavara', 'Panamthodil Bakers | Chavara, Chavara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('87831d89-8785-53b1-b00f-22a49803d6e1', 'd346bf20-85d2-5b13-aa0c-deb05f4629c4', 'Panamthodil Bakers | Chavara', 'Panamthodil Bakers | Chavara, Chavara, Kerala, India', 8.983229975, 76.5347704, 'India EV Network License', 'LIC-IN-ST508', 500.0, 7.4, true, 'Chavara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '87831d89-8785-53b1-b00f-22a49803d6e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1ed2a35c-ccf5-5aac-83f8-23115c00b071', '87831d89-8785-53b1-b00f-22a49803d6e1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 509: Pontoor EVCS | Fill Nxt | Kunnicode (Kunnicode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('96b564be-5d7c-5775-a519-9366b8d1f552', '00000000-0000-0000-0000-000000000000', 'st509@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st509@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('96b564be-5d7c-5775-a519-9366b8d1f552', '96b564be-5d7c-5775-a519-9366b8d1f552', '{"sub": "96b564be-5d7c-5775-a519-9366b8d1f552", "email": "st509@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '96b564be-5d7c-5775-a519-9366b8d1f552')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('96b564be-5d7c-5775-a519-9366b8d1f552', 'admin', 'st509@boss.com', 'Admin Pontoor EVCS | Fill Nxt | Kunnicode', 'Pontoor EVCS | Fill Nxt | Kunnicode', 'Pontoor EVCS | Fill Nxt | Kunnicode, Kunnicode, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('91a6d82f-2b30-5c77-8405-1470810290be', '96b564be-5d7c-5775-a519-9366b8d1f552', 'Pontoor EVCS | Fill Nxt | Kunnicode', 'Pontoor EVCS | Fill Nxt | Kunnicode, Kunnicode, Kerala, India', 9.026472181, 76.85190109, 'India EV Network License', 'LIC-IN-ST509', 500.0, 7.4, true, 'Kunnicode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '91a6d82f-2b30-5c77-8405-1470810290be';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6b3558aa-ac45-5a82-8a88-92d80ffa8c9e', '91a6d82f-2b30-5c77-8405-1470810290be', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 510: Gilgal EVCS | Fill Nxt | Valakom (Valakom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7411a695-af86-5771-95bb-fdb04bb0ab32', '00000000-0000-0000-0000-000000000000', 'st510@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st510@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7411a695-af86-5771-95bb-fdb04bb0ab32', '7411a695-af86-5771-95bb-fdb04bb0ab32', '{"sub": "7411a695-af86-5771-95bb-fdb04bb0ab32", "email": "st510@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7411a695-af86-5771-95bb-fdb04bb0ab32')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7411a695-af86-5771-95bb-fdb04bb0ab32', 'admin', 'st510@boss.com', 'Admin Gilgal EVCS | Fill Nxt | Valakom', 'Gilgal EVCS | Fill Nxt | Valakom', 'Gilgal EVCS | Fill Nxt | Valakom, Valakom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b3273fff-840d-5a1c-af18-3897a14e2e05', '7411a695-af86-5771-95bb-fdb04bb0ab32', 'Gilgal EVCS | Fill Nxt | Valakom', 'Gilgal EVCS | Fill Nxt | Valakom, Valakom, Kerala, India', 8.962957683, 76.83555764, 'India EV Network License', 'LIC-IN-ST510', 500.0, 7.4, true, 'Valakom', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b3273fff-840d-5a1c-af18-3897a14e2e05';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ae09c98e-dda9-5222-ae96-f6132cf92d4d', 'b3273fff-840d-5a1c-af18-3897a14e2e05', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 511: M Square EVOK | Kureepuzha (Kollam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f6fdf043-06dd-58f3-a5fc-e46dd408a552', '00000000-0000-0000-0000-000000000000', 'st511@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st511@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f6fdf043-06dd-58f3-a5fc-e46dd408a552', 'f6fdf043-06dd-58f3-a5fc-e46dd408a552', '{"sub": "f6fdf043-06dd-58f3-a5fc-e46dd408a552", "email": "st511@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f6fdf043-06dd-58f3-a5fc-e46dd408a552')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f6fdf043-06dd-58f3-a5fc-e46dd408a552', 'admin', 'st511@boss.com', 'Admin M Square EVOK | Kureepuzha', 'M Square EVOK | Kureepuzha', 'M Square EVOK | Kureepuzha, Kollam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dbdc3cdf-3c96-5c04-86b9-3d0871786d4a', 'f6fdf043-06dd-58f3-a5fc-e46dd408a552', 'M Square EVOK | Kureepuzha', 'M Square EVOK | Kureepuzha, Kollam, Kerala, India', 8.921314625, 76.57636971, 'India EV Network License', 'LIC-IN-ST511', 500.0, 30.0, true, 'Kollam', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dbdc3cdf-3c96-5c04-86b9-3d0871786d4a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e9805b06-a198-5c4e-b7bd-cf6250c9c94d', 'dbdc3cdf-3c96-5c04-86b9-3d0871786d4a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3bf7043f-080e-59bc-80b0-ba562a9d67df', 'dbdc3cdf-3c96-5c04-86b9-3d0871786d4a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 512: AR Square EVCS | Kavalayoor (Kavalayur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d7247c95-aa85-5ead-8a8e-f0221ca443bb', '00000000-0000-0000-0000-000000000000', 'st512@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st512@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d7247c95-aa85-5ead-8a8e-f0221ca443bb', 'd7247c95-aa85-5ead-8a8e-f0221ca443bb', '{"sub": "d7247c95-aa85-5ead-8a8e-f0221ca443bb", "email": "st512@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd7247c95-aa85-5ead-8a8e-f0221ca443bb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d7247c95-aa85-5ead-8a8e-f0221ca443bb', 'admin', 'st512@boss.com', 'Admin AR Square EVCS | Kavalayoor', 'AR Square EVCS | Kavalayoor', 'AR Square EVCS | Kavalayoor, Kavalayur, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9234baf7-78d4-51fe-aba8-66248fcdbdcc', 'd7247c95-aa85-5ead-8a8e-f0221ca443bb', 'AR Square EVCS | Kavalayoor', 'AR Square EVCS | Kavalayoor, Kavalayur, India', 8.713974179, 76.77971907, 'India EV Network License', 'LIC-IN-ST512', 500.0, 7.4, true, 'Kavalayur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9234baf7-78d4-51fe-aba8-66248fcdbdcc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2131b2b5-d211-583d-a652-fd83b862943a', '9234baf7-78d4-51fe-aba8-66248fcdbdcc', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 513: JKV Powern Hub EVCS | Palayam (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ab78dcec-f1db-5c5d-a722-4264e74a8385', '00000000-0000-0000-0000-000000000000', 'st513@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st513@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ab78dcec-f1db-5c5d-a722-4264e74a8385', 'ab78dcec-f1db-5c5d-a722-4264e74a8385', '{"sub": "ab78dcec-f1db-5c5d-a722-4264e74a8385", "email": "st513@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ab78dcec-f1db-5c5d-a722-4264e74a8385')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ab78dcec-f1db-5c5d-a722-4264e74a8385', 'admin', 'st513@boss.com', 'Admin JKV Powern Hub EVCS | Palayam', 'JKV Powern Hub EVCS | Palayam', 'JKV Powern Hub EVCS | Palayam, Thiruvananthapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('aabbf7d2-2ce5-5169-8251-beff845f5a30', 'ab78dcec-f1db-5c5d-a722-4264e74a8385', 'JKV Powern Hub EVCS | Palayam', 'JKV Powern Hub EVCS | Palayam, Thiruvananthapuram, Kerala, India', 8.500476045, 76.95228964, 'India EV Network License', 'LIC-IN-ST513', 500.0, 7.4, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'aabbf7d2-2ce5-5169-8251-beff845f5a30';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8457e645-5033-5b3d-8adb-fe18cebf44cd', 'aabbf7d2-2ce5-5169-8251-beff845f5a30', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 514: JKV Powern Hub EVCS | Palayam (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1031ca5a-a3b5-5941-b4fc-91668c9b72c0', '00000000-0000-0000-0000-000000000000', 'st514@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st514@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1031ca5a-a3b5-5941-b4fc-91668c9b72c0', '1031ca5a-a3b5-5941-b4fc-91668c9b72c0', '{"sub": "1031ca5a-a3b5-5941-b4fc-91668c9b72c0", "email": "st514@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1031ca5a-a3b5-5941-b4fc-91668c9b72c0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1031ca5a-a3b5-5941-b4fc-91668c9b72c0', 'admin', 'st514@boss.com', 'Admin JKV Powern Hub EVCS | Palayam', 'JKV Powern Hub EVCS | Palayam', 'JKV Powern Hub EVCS | Palayam, Thiruvananthapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6d6b3660-8bb0-52ca-be3e-118902a73513', '1031ca5a-a3b5-5941-b4fc-91668c9b72c0', 'JKV Powern Hub EVCS | Palayam', 'JKV Powern Hub EVCS | Palayam, Thiruvananthapuram, Kerala, India', 8.500476045, 76.95228964, 'India EV Network License', 'LIC-IN-ST514', 500.0, 7.4, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6d6b3660-8bb0-52ca-be3e-118902a73513';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3583ae93-8d8c-52a5-9e1f-38f36b18f126', '6d6b3660-8bb0-52ca-be3e-118902a73513', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 515: Chandra EVCS | Pettah (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4f952bac-ea5f-561a-a9ac-e293ee031157', '00000000-0000-0000-0000-000000000000', 'st515@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st515@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4f952bac-ea5f-561a-a9ac-e293ee031157', '4f952bac-ea5f-561a-a9ac-e293ee031157', '{"sub": "4f952bac-ea5f-561a-a9ac-e293ee031157", "email": "st515@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4f952bac-ea5f-561a-a9ac-e293ee031157')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4f952bac-ea5f-561a-a9ac-e293ee031157', 'admin', 'st515@boss.com', 'Admin Chandra EVCS | Pettah', 'Chandra EVCS | Pettah', 'Chandra EVCS | Pettah, Thiruvananthapuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ffb03183-9ba1-58aa-b8b7-470f9cfc4070', '4f952bac-ea5f-561a-a9ac-e293ee031157', 'Chandra EVCS | Pettah', 'Chandra EVCS | Pettah, Thiruvananthapuram, Kerala, India', 8.494429797, 76.93007271, 'India EV Network License', 'LIC-IN-ST515', 500.0, 7.4, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ffb03183-9ba1-58aa-b8b7-470f9cfc4070';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0caf1e6e-4923-54c7-a221-6df3da49cf30', 'ffb03183-9ba1-58aa-b8b7-470f9cfc4070', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 516: Illam Chacka (Thriuvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c73a24c0-dcda-530f-b64f-94b2f810bdb8', '00000000-0000-0000-0000-000000000000', 'st516@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st516@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c73a24c0-dcda-530f-b64f-94b2f810bdb8', 'c73a24c0-dcda-530f-b64f-94b2f810bdb8', '{"sub": "c73a24c0-dcda-530f-b64f-94b2f810bdb8", "email": "st516@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c73a24c0-dcda-530f-b64f-94b2f810bdb8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c73a24c0-dcda-530f-b64f-94b2f810bdb8', 'admin', 'st516@boss.com', 'Admin Illam Chacka', 'Illam Chacka', 'Illam Chacka, Thriuvananthapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b1877e12-f024-56f9-8797-5a0543f79387', 'c73a24c0-dcda-530f-b64f-94b2f810bdb8', 'Illam Chacka', 'Illam Chacka, Thriuvananthapuram, Kerala, India', 8.491842864, 76.9201682, 'India EV Network License', 'LIC-IN-ST516', 500.0, 7.4, true, 'Thriuvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b1877e12-f024-56f9-8797-5a0543f79387';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6a3456f9-36da-5d9a-8419-1e0f5bd4b4af', 'b1877e12-f024-56f9-8797-5a0543f79387', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 517: EV Park ECVS Kazhakkoottam | Karthika Park Hotel (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4ec9d42b-071d-5a60-a8ac-cfe51cc4b9c1', '00000000-0000-0000-0000-000000000000', 'st517@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st517@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4ec9d42b-071d-5a60-a8ac-cfe51cc4b9c1', '4ec9d42b-071d-5a60-a8ac-cfe51cc4b9c1', '{"sub": "4ec9d42b-071d-5a60-a8ac-cfe51cc4b9c1", "email": "st517@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4ec9d42b-071d-5a60-a8ac-cfe51cc4b9c1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4ec9d42b-071d-5a60-a8ac-cfe51cc4b9c1', 'admin', 'st517@boss.com', 'Admin EV Park ECVS Kazhakkoottam | Karthika Park Hotel', 'EV Park ECVS Kazhakkoottam | Karthika Park Hotel', 'EV Park ECVS Kazhakkoottam | Karthika Park Hotel, Thiruvananthapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('015e2ed0-008d-59fa-833c-eb557073d0c1', '4ec9d42b-071d-5a60-a8ac-cfe51cc4b9c1', 'EV Park ECVS Kazhakkoottam | Karthika Park Hotel', 'EV Park ECVS Kazhakkoottam | Karthika Park Hotel, Thiruvananthapuram, Kerala, India', 8.572651965, 76.87040126, 'India EV Network License', 'LIC-IN-ST517', 500.0, 7.4, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '015e2ed0-008d-59fa-833c-eb557073d0c1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a5b52a4d-2cb2-579c-b3b9-b3d37c400e41', '015e2ed0-008d-59fa-833c-eb557073d0c1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 518: EQ Future Mobility Thakkaram (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2334bc4a-476e-5498-b08d-14df1bd7b348', '00000000-0000-0000-0000-000000000000', 'st518@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st518@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2334bc4a-476e-5498-b08d-14df1bd7b348', '2334bc4a-476e-5498-b08d-14df1bd7b348', '{"sub": "2334bc4a-476e-5498-b08d-14df1bd7b348", "email": "st518@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2334bc4a-476e-5498-b08d-14df1bd7b348')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2334bc4a-476e-5498-b08d-14df1bd7b348', 'admin', 'st518@boss.com', 'Admin EQ Future Mobility Thakkaram', 'EQ Future Mobility Thakkaram', 'EQ Future Mobility Thakkaram, Thiruvananthapuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f87c458a-8fc1-5937-b5e4-bd87219cb4a0', '2334bc4a-476e-5498-b08d-14df1bd7b348', 'EQ Future Mobility Thakkaram', 'EQ Future Mobility Thakkaram, Thiruvananthapuram, Kerala, India', 8.57858553, 76.86647625, 'India EV Network License', 'LIC-IN-ST518', 500.0, 7.4, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f87c458a-8fc1-5937-b5e4-bd87219cb4a0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('480156b2-c462-57ae-9d40-47813c905737', 'f87c458a-8fc1-5937-b5e4-bd87219cb4a0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 519: Rest Area Mumbai - Vadodara Expressway (Saraswani, Gujarat)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('16c38002-f89e-54c1-9dd7-3074393c8348', '00000000-0000-0000-0000-000000000000', 'st519@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st519@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('16c38002-f89e-54c1-9dd7-3074393c8348', '16c38002-f89e-54c1-9dd7-3074393c8348', '{"sub": "16c38002-f89e-54c1-9dd7-3074393c8348", "email": "st519@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '16c38002-f89e-54c1-9dd7-3074393c8348')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('16c38002-f89e-54c1-9dd7-3074393c8348', 'admin', 'st519@boss.com', 'Admin Rest Area Mumbai - Vadodara Expressway', 'Rest Area Mumbai - Vadodara Expressway', 'Rest Area Mumbai - Vadodara Expressway, Saraswani, Gujarat, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('997dbbcd-5c43-52fd-a2e9-1fb6debb57d3', '16c38002-f89e-54c1-9dd7-3074393c8348', 'Rest Area Mumbai - Vadodara Expressway', 'Rest Area Mumbai - Vadodara Expressway, Saraswani, Gujarat, India', 22.17015606, 73.08761282, 'India EV Network License', 'LIC-IN-ST519', 500.0, 7.4, true, 'Saraswani', 'Gujarat', 1, 'eDrive BPCL (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '997dbbcd-5c43-52fd-a2e9-1fb6debb57d3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e62c985e-45bc-57f2-8253-75dd459b72e8', '997dbbcd-5c43-52fd-a2e9-1fb6debb57d3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 520: NE4 Eest Area Saraswani (Saraswani, Gujarat)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4d2edad3-b754-5cae-bc67-4864000287fb', '00000000-0000-0000-0000-000000000000', 'st520@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st520@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4d2edad3-b754-5cae-bc67-4864000287fb', '4d2edad3-b754-5cae-bc67-4864000287fb', '{"sub": "4d2edad3-b754-5cae-bc67-4864000287fb", "email": "st520@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4d2edad3-b754-5cae-bc67-4864000287fb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4d2edad3-b754-5cae-bc67-4864000287fb', 'admin', 'st520@boss.com', 'Admin NE4 Eest Area Saraswani', 'NE4 Eest Area Saraswani', 'NE4 Eest Area Saraswani, Saraswani, Gujarat, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9f0edecc-77c2-5fa6-baa4-64b82e4a5bb8', '4d2edad3-b754-5cae-bc67-4864000287fb', 'NE4 Eest Area Saraswani', 'NE4 Eest Area Saraswani, Saraswani, Gujarat, India', 22.18022593, 73.08990858, 'India EV Network License', 'LIC-IN-ST520', 500.0, 7.4, true, 'Saraswani', 'Gujarat', 1, 'eDrive BPCL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9f0edecc-77c2-5fa6-baa4-64b82e4a5bb8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b7267e5-7ab6-5dd5-9dbe-1ec78828a434', '9f0edecc-77c2-5fa6-baa4-64b82e4a5bb8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 521: Hotel Empire ChargeZone (Chikhli, Gujarat)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('97d48240-a2d4-51c7-a309-9cc0306f1390', '00000000-0000-0000-0000-000000000000', 'st521@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st521@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('97d48240-a2d4-51c7-a309-9cc0306f1390', '97d48240-a2d4-51c7-a309-9cc0306f1390', '{"sub": "97d48240-a2d4-51c7-a309-9cc0306f1390", "email": "st521@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '97d48240-a2d4-51c7-a309-9cc0306f1390')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('97d48240-a2d4-51c7-a309-9cc0306f1390', 'admin', 'st521@boss.com', 'Admin Hotel Empire ChargeZone', 'Hotel Empire ChargeZone', 'Hotel Empire ChargeZone, Chikhli, Gujarat, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a1c6af09-5eec-5569-81a6-5c8d82afa80f', '97d48240-a2d4-51c7-a309-9cc0306f1390', 'Hotel Empire ChargeZone', 'Hotel Empire ChargeZone, Chikhli, Gujarat, India', 20.74067296, 73.0356012, 'India EV Network License', 'LIC-IN-ST521', 500.0, 60.0, true, 'Chikhli', 'Gujarat', 2, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a1c6af09-5eec-5569-81a6-5c8d82afa80f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('de2ce8c7-f9a4-5ceb-b0cc-00ffafb94ca0', 'a1c6af09-5eec-5569-81a6-5c8d82afa80f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d54ac24c-6b72-5ee0-a1c6-60111f402c78', 'a1c6af09-5eec-5569-81a6-5c8d82afa80f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 522: Home (Hailakandi, Assam)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('55772d2d-fa42-519d-9f11-fe80a61ac519', '00000000-0000-0000-0000-000000000000', 'st522@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st522@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('55772d2d-fa42-519d-9f11-fe80a61ac519', '55772d2d-fa42-519d-9f11-fe80a61ac519', '{"sub": "55772d2d-fa42-519d-9f11-fe80a61ac519", "email": "st522@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '55772d2d-fa42-519d-9f11-fe80a61ac519')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('55772d2d-fa42-519d-9f11-fe80a61ac519', 'admin', 'st522@boss.com', 'Admin Home', 'Home', 'Home, Hailakandi, Assam, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('64107e6c-ac8e-56e7-a5ab-3c0505af06c8', '55772d2d-fa42-519d-9f11-fe80a61ac519', 'Home', 'Home, Hailakandi, Assam, India', 26.6975, 91.8512, 'India EV Network License', 'LIC-IN-ST522', 500.0, 7.4, true, 'Hailakandi', 'Assam', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '64107e6c-ac8e-56e7-a5ab-3c0505af06c8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17242153-73d1-5802-899d-be081671cea2', '64107e6c-ac8e-56e7-a5ab-3c0505af06c8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 523: Viraj Junction EFill EVCS (NH48, Karnataka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d17ee419-4157-53f9-b1c2-9ec29bebdcd2', '00000000-0000-0000-0000-000000000000', 'st523@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st523@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d17ee419-4157-53f9-b1c2-9ec29bebdcd2', 'd17ee419-4157-53f9-b1c2-9ec29bebdcd2', '{"sub": "d17ee419-4157-53f9-b1c2-9ec29bebdcd2", "email": "st523@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd17ee419-4157-53f9-b1c2-9ec29bebdcd2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d17ee419-4157-53f9-b1c2-9ec29bebdcd2', 'admin', 'st523@boss.com', 'Admin Viraj Junction EFill EVCS', 'Viraj Junction EFill EVCS', 'Viraj Junction EFill EVCS, NH48, Karnataka, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fe493e39-035d-588b-94ac-c985ef38f43f', 'd17ee419-4157-53f9-b1c2-9ec29bebdcd2', 'Viraj Junction EFill EVCS', 'Viraj Junction EFill EVCS, NH48, Karnataka, India', 16.53666679, 74.31995764, 'India EV Network License', 'LIC-IN-ST523', 500.0, 7.4, true, 'NH48', 'Karnataka', 1, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fe493e39-035d-588b-94ac-c985ef38f43f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('10028f09-fc3b-5779-a278-3b91968ecc8f', 'fe493e39-035d-588b-94ac-c985ef38f43f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 524: Tata Power Hotel Elite (Lucknow, Uttar Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('37927f2c-51b3-567e-ade5-924ca336738c', '00000000-0000-0000-0000-000000000000', 'st524@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st524@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('37927f2c-51b3-567e-ade5-924ca336738c', '37927f2c-51b3-567e-ade5-924ca336738c', '{"sub": "37927f2c-51b3-567e-ade5-924ca336738c", "email": "st524@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '37927f2c-51b3-567e-ade5-924ca336738c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('37927f2c-51b3-567e-ade5-924ca336738c', 'admin', 'st524@boss.com', 'Admin Tata Power Hotel Elite', 'Tata Power Hotel Elite', 'Tata Power Hotel Elite, Lucknow, Uttar Pradesh, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2571b551-1956-5124-82ec-cc3a05fa8584', '37927f2c-51b3-567e-ade5-924ca336738c', 'Tata Power Hotel Elite', 'Tata Power Hotel Elite, Lucknow, Uttar Pradesh, India', 26.83827057, 80.85377711, 'India EV Network License', 'LIC-IN-ST524', 500.0, 60.0, true, 'Lucknow', 'Uttar Pradesh', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2571b551-1956-5124-82ec-cc3a05fa8584';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a3732003-c603-5301-9fcc-330ce391cec9', '2571b551-1956-5124-82ec-cc3a05fa8584', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5512f5a-8963-514e-80be-5b580a63b464', '2571b551-1956-5124-82ec-cc3a05fa8584', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 525: Hotel Annapura (Piplod, Gujarat)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf6177a0-e35a-55e5-9cc0-03b8593023d6', '00000000-0000-0000-0000-000000000000', 'st525@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st525@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf6177a0-e35a-55e5-9cc0-03b8593023d6', 'cf6177a0-e35a-55e5-9cc0-03b8593023d6', '{"sub": "cf6177a0-e35a-55e5-9cc0-03b8593023d6", "email": "st525@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf6177a0-e35a-55e5-9cc0-03b8593023d6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf6177a0-e35a-55e5-9cc0-03b8593023d6', 'admin', 'st525@boss.com', 'Admin Hotel Annapura', 'Hotel Annapura', 'Hotel Annapura, Piplod, Gujarat, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b87313fd-27cb-578a-afc5-61d5b1c066af', 'cf6177a0-e35a-55e5-9cc0-03b8593023d6', 'Hotel Annapura', 'Hotel Annapura, Piplod, Gujarat, India', 22.79423449, 73.85882626, 'India EV Network License', 'LIC-IN-ST525', 500.0, 7.4, true, 'Piplod', 'Gujarat', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b87313fd-27cb-578a-afc5-61d5b1c066af';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('299048a0-b05d-58b1-a987-70cbee8fcde3', 'b87313fd-27cb-578a-afc5-61d5b1c066af', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 526: Shree Kanha International Chargezone (Ratlam, Madhya Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('17883cf1-4c87-57dd-a1e0-4bba83640b81', '00000000-0000-0000-0000-000000000000', 'st526@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st526@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('17883cf1-4c87-57dd-a1e0-4bba83640b81', '17883cf1-4c87-57dd-a1e0-4bba83640b81', '{"sub": "17883cf1-4c87-57dd-a1e0-4bba83640b81", "email": "st526@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '17883cf1-4c87-57dd-a1e0-4bba83640b81')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('17883cf1-4c87-57dd-a1e0-4bba83640b81', 'admin', 'st526@boss.com', 'Admin Shree Kanha International Chargezone', 'Shree Kanha International Chargezone', 'Shree Kanha International Chargezone, Ratlam, Madhya Pradesh, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('683be215-749a-5a3a-a18f-4535ce589f40', '17883cf1-4c87-57dd-a1e0-4bba83640b81', 'Shree Kanha International Chargezone', 'Shree Kanha International Chargezone, Ratlam, Madhya Pradesh, India', 23.38651332, 75.05985128, 'India EV Network License', 'LIC-IN-ST526', 500.0, 60.0, true, 'Ratlam', 'Madhya Pradesh', 2, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '683be215-749a-5a3a-a18f-4535ce589f40';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5fbf07d7-45e3-5222-8679-dbbd70da167f', '683be215-749a-5a3a-a18f-4535ce589f40', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cba53ab0-8424-55b3-847b-857c3d30c4e7', '683be215-749a-5a3a-a18f-4535ce589f40', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 527: KR RESORT (Ganganagar, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8cfb3d0b-1575-5465-badb-43e5435a2337', '00000000-0000-0000-0000-000000000000', 'st527@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st527@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8cfb3d0b-1575-5465-badb-43e5435a2337', '8cfb3d0b-1575-5465-badb-43e5435a2337', '{"sub": "8cfb3d0b-1575-5465-badb-43e5435a2337", "email": "st527@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8cfb3d0b-1575-5465-badb-43e5435a2337')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8cfb3d0b-1575-5465-badb-43e5435a2337', 'admin', 'st527@boss.com', 'Admin KR RESORT', 'KR RESORT', 'KR RESORT, Ganganagar, Rajasthan, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('55b79052-1ede-53de-8af8-e917f88ba4ba', '8cfb3d0b-1575-5465-badb-43e5435a2337', 'KR RESORT', 'KR RESORT, Ganganagar, Rajasthan, India', 29.88678759, 73.92823039, 'India EV Network License', 'LIC-IN-ST527', 500.0, 7.4, true, 'Ganganagar', 'Rajasthan', 1, 'Unknown', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '55b79052-1ede-53de-8af8-e917f88ba4ba';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d752c854-3cc6-52a6-b421-0a18a9690530', '55b79052-1ede-53de-8af8-e917f88ba4ba', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 528: Tata PowerYamuna Expressway Mathura RHS (Yamuna Expressway, Uttar Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9f0426b2-8574-5fce-98df-09ba96401522', '00000000-0000-0000-0000-000000000000', 'st528@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st528@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9f0426b2-8574-5fce-98df-09ba96401522', '9f0426b2-8574-5fce-98df-09ba96401522', '{"sub": "9f0426b2-8574-5fce-98df-09ba96401522", "email": "st528@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9f0426b2-8574-5fce-98df-09ba96401522')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9f0426b2-8574-5fce-98df-09ba96401522', 'admin', 'st528@boss.com', 'Admin Tata PowerYamuna Expressway Mathura RHS', 'Tata PowerYamuna Expressway Mathura RHS', 'Tata PowerYamuna Expressway Mathura RHS, Yamuna Expressway, Uttar Pradesh, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4d240e0f-2bdd-52d6-9f0d-86c2213c227c', '9f0426b2-8574-5fce-98df-09ba96401522', 'Tata PowerYamuna Expressway Mathura RHS', 'Tata PowerYamuna Expressway Mathura RHS, Yamuna Expressway, Uttar Pradesh, India', 27.61204701, 77.74185073, 'India EV Network License', 'LIC-IN-ST528', 500.0, 60.0, true, 'Yamuna Expressway', 'Uttar Pradesh', 2, 'Tata Power', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4d240e0f-2bdd-52d6-9f0d-86c2213c227c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8ab9a77a-f539-5085-b8c1-6b80d15c8dd4', '4d240e0f-2bdd-52d6-9f0d-86c2213c227c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17d22d97-0534-5b87-94a8-c8f6d4be0a6d', '4d240e0f-2bdd-52d6-9f0d-86c2213c227c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 529: Tata Power Yamuna Expressway Mathura Exit LHS (Yamuna Expressway, Uttar Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a101ac01-5408-5416-aa58-6add5bb9617e', '00000000-0000-0000-0000-000000000000', 'st529@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st529@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a101ac01-5408-5416-aa58-6add5bb9617e', 'a101ac01-5408-5416-aa58-6add5bb9617e', '{"sub": "a101ac01-5408-5416-aa58-6add5bb9617e", "email": "st529@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a101ac01-5408-5416-aa58-6add5bb9617e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a101ac01-5408-5416-aa58-6add5bb9617e', 'admin', 'st529@boss.com', 'Admin Tata Power Yamuna Expressway Mathura Exit LHS', 'Tata Power Yamuna Expressway Mathura Exit LHS', 'Tata Power Yamuna Expressway Mathura Exit LHS, Yamuna Expressway, Uttar Pradesh, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('97b02ee2-650d-59b9-b608-e9d1bbcb4590', 'a101ac01-5408-5416-aa58-6add5bb9617e', 'Tata Power Yamuna Expressway Mathura Exit LHS', 'Tata Power Yamuna Expressway Mathura Exit LHS, Yamuna Expressway, Uttar Pradesh, India', 27.55039597, 77.75506264, 'India EV Network License', 'LIC-IN-ST529', 500.0, 60.0, true, 'Yamuna Expressway', 'Uttar Pradesh', 2, 'Tata Power', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '97b02ee2-650d-59b9-b608-e9d1bbcb4590';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9f560fd6-2d80-5647-8098-0586a7ea3996', '97b02ee2-650d-59b9-b608-e9d1bbcb4590', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4ee6c969-35bc-5438-a289-40c90913d652', '97b02ee2-650d-59b9-b608-e9d1bbcb4590', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 530: Statiq Jaypee Agra (Agra, Uttar Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e5db897b-49fc-59a1-a50b-34a4f917d112', '00000000-0000-0000-0000-000000000000', 'st530@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st530@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e5db897b-49fc-59a1-a50b-34a4f917d112', 'e5db897b-49fc-59a1-a50b-34a4f917d112', '{"sub": "e5db897b-49fc-59a1-a50b-34a4f917d112", "email": "st530@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e5db897b-49fc-59a1-a50b-34a4f917d112')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e5db897b-49fc-59a1-a50b-34a4f917d112', 'admin', 'st530@boss.com', 'Admin Statiq Jaypee Agra', 'Statiq Jaypee Agra', 'Statiq Jaypee Agra, Agra, Uttar Pradesh, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('162b412a-5793-5531-a47b-c034d1c75c56', 'e5db897b-49fc-59a1-a50b-34a4f917d112', 'Statiq Jaypee Agra', 'Statiq Jaypee Agra, Agra, Uttar Pradesh, India', 27.15340534, 78.07073593, 'India EV Network License', 'LIC-IN-ST530', 500.0, 30.0, true, 'Agra', 'Uttar Pradesh', 2, 'Statiq (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '162b412a-5793-5531-a47b-c034d1c75c56';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('60d38eec-787b-52c3-958a-3bc24fc5139f', '162b412a-5793-5531-a47b-c034d1c75c56', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b0a6ddd0-683a-5932-8419-a85d25ec814e', '162b412a-5793-5531-a47b-c034d1c75c56', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 531: KR RESORT (Ganganagar, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('aaa96d04-9ba0-5ef4-bb4a-5843a4b5d569', '00000000-0000-0000-0000-000000000000', 'st531@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st531@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('aaa96d04-9ba0-5ef4-bb4a-5843a4b5d569', 'aaa96d04-9ba0-5ef4-bb4a-5843a4b5d569', '{"sub": "aaa96d04-9ba0-5ef4-bb4a-5843a4b5d569", "email": "st531@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'aaa96d04-9ba0-5ef4-bb4a-5843a4b5d569')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('aaa96d04-9ba0-5ef4-bb4a-5843a4b5d569', 'admin', 'st531@boss.com', 'Admin KR RESORT', 'KR RESORT', 'KR RESORT, Ganganagar, Rajasthan, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3b901b0e-38dd-5656-a377-380d8ae2d005', 'aaa96d04-9ba0-5ef4-bb4a-5843a4b5d569', 'KR RESORT', 'KR RESORT, Ganganagar, Rajasthan, India', 29.88699156, 73.92473793, 'India EV Network License', 'LIC-IN-ST531', 500.0, 7.4, true, 'Ganganagar', 'Rajasthan', 1, 'Unknown', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3b901b0e-38dd-5656-a377-380d8ae2d005';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d08d786a-5526-5eae-8ee9-810988958d72', '3b901b0e-38dd-5656-a377-380d8ae2d005', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 532: ev (COIMBATORE, TAMILNADU)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ead913e3-b348-56bf-9028-75ecb4e12be9', '00000000-0000-0000-0000-000000000000', 'st532@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st532@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ead913e3-b348-56bf-9028-75ecb4e12be9', 'ead913e3-b348-56bf-9028-75ecb4e12be9', '{"sub": "ead913e3-b348-56bf-9028-75ecb4e12be9", "email": "st532@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ead913e3-b348-56bf-9028-75ecb4e12be9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ead913e3-b348-56bf-9028-75ecb4e12be9', 'admin', 'st532@boss.com', 'Admin ev', 'ev', 'ev, COIMBATORE, TAMILNADU, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('66c8bff5-e8f7-5a9a-b257-5da3c412a4b6', 'ead913e3-b348-56bf-9028-75ecb4e12be9', 'ev', 'ev, COIMBATORE, TAMILNADU, India', 11.04640756, 77.07956128, 'India EV Network License', 'LIC-IN-ST532', 500.0, 7.4, true, 'COIMBATORE', 'TAMILNADU', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '66c8bff5-e8f7-5a9a-b257-5da3c412a4b6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ddc7618e-a30d-5fc2-bbab-04e1b82ea2f9', '66c8bff5-e8f7-5a9a-b257-5da3c412a4b6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 533: Charging station (Hubballi-Dharwad, Karnataka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('55006fd6-eb94-59d4-87fa-8b92984bd6e3', '00000000-0000-0000-0000-000000000000', 'st533@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st533@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('55006fd6-eb94-59d4-87fa-8b92984bd6e3', '55006fd6-eb94-59d4-87fa-8b92984bd6e3', '{"sub": "55006fd6-eb94-59d4-87fa-8b92984bd6e3", "email": "st533@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '55006fd6-eb94-59d4-87fa-8b92984bd6e3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('55006fd6-eb94-59d4-87fa-8b92984bd6e3', 'admin', 'st533@boss.com', 'Admin Charging station', 'Charging station', 'Charging station, Karnataka, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('32e86ef6-550c-5043-95b9-a28d6a668121', '55006fd6-eb94-59d4-87fa-8b92984bd6e3', 'Charging station', 'Charging station, Karnataka, India', 12.96085047, 77.58182474, 'India EV Network License', 'LIC-IN-ST533', 500.0, 7.4, true, 'Hubballi-Dharwad', 'Karnataka', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '32e86ef6-550c-5043-95b9-a28d6a668121';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e58c95b3-cd8a-5f20-82ec-3f7b4123f884', '32e86ef6-550c-5043-95b9-a28d6a668121', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 534: Midway Treat Khushi Inn Sakadehi Betul Hotel (Sagar, Madhya Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('488bbe20-cbcc-5dbb-a883-d9d144d790c6', '00000000-0000-0000-0000-000000000000', 'st534@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st534@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('488bbe20-cbcc-5dbb-a883-d9d144d790c6', '488bbe20-cbcc-5dbb-a883-d9d144d790c6', '{"sub": "488bbe20-cbcc-5dbb-a883-d9d144d790c6", "email": "st534@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '488bbe20-cbcc-5dbb-a883-d9d144d790c6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('488bbe20-cbcc-5dbb-a883-d9d144d790c6', 'admin', 'st534@boss.com', 'Admin Midway Treat Khushi Inn Sakadehi Betul Hotel', 'Midway Treat Khushi Inn Sakadehi Betul Hotel', 'Midway Treat Khushi Inn Sakadehi Betul Hotel, Madhya Pradesh, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c954f25b-acc1-5bc9-b8da-e86d091719e5', '488bbe20-cbcc-5dbb-a883-d9d144d790c6', 'Midway Treat Khushi Inn Sakadehi Betul Hotel', 'Midway Treat Khushi Inn Sakadehi Betul Hotel, Madhya Pradesh, India', 21.99778595, 77.86538183, 'India EV Network License', 'LIC-IN-ST534', 500.0, 7.4, true, 'Sagar', 'Madhya Pradesh', 1, 'Tryk (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c954f25b-acc1-5bc9-b8da-e86d091719e5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('78ed63aa-5d4d-5009-a052-5041491a69b9', 'c954f25b-acc1-5bc9-b8da-e86d091719e5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 535: Rest Area Jio BP  RHS (Bonli, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0f04b7f8-402d-5002-9e98-e2fd1ded8503', '00000000-0000-0000-0000-000000000000', 'st535@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st535@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0f04b7f8-402d-5002-9e98-e2fd1ded8503', '0f04b7f8-402d-5002-9e98-e2fd1ded8503', '{"sub": "0f04b7f8-402d-5002-9e98-e2fd1ded8503", "email": "st535@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0f04b7f8-402d-5002-9e98-e2fd1ded8503')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0f04b7f8-402d-5002-9e98-e2fd1ded8503', 'admin', 'st535@boss.com', 'Admin Rest Area Jio BP  RHS', 'Rest Area Jio BP  RHS', 'Rest Area Jio BP  RHS, Bonli, Rajasthan, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, created_at)
VALUES ('df970735-0c14-57b0-ab52-ddbf42d85349', '0f04b7f8-402d-5002-9e98-e2fd1ded8503', 'Rest Area Jio BP  RHS', 'Rest Area Jio BP  RHS, Bonli, Rajasthan, India', 26.37854418, 76.25327631, 'India EV Network License', 'LIC-IN-ST535', 500.0, 24.0, true, 'Bonli', 'Rajasthan', 1, 'JIO BP Pulse (India)', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e05a8f6d-f767-50f1-b2ab-48352d27d67b', 'df970735-0c14-57b0-ab52-ddbf42d85349', 'Port A', 50, 'available', 0, 'GB/T', now())
ON CONFLICT (id) DO NOTHING;

-- Station 536: Lakshya Water Park (Kota District, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fd09318a-1b82-5eaf-99a4-42c36b25456f', '00000000-0000-0000-0000-000000000000', 'st536@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st536@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fd09318a-1b82-5eaf-99a4-42c36b25456f', 'fd09318a-1b82-5eaf-99a4-42c36b25456f', '{"sub": "fd09318a-1b82-5eaf-99a4-42c36b25456f", "email": "st536@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fd09318a-1b82-5eaf-99a4-42c36b25456f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fd09318a-1b82-5eaf-99a4-42c36b25456f', 'admin', 'st536@boss.com', 'Admin Lakshya Water Park', 'Lakshya Water Park', 'Lakshya Water Park, Kota District, Rajasthan, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4d729c86-d453-5b7f-8b39-53e394885440', 'fd09318a-1b82-5eaf-99a4-42c36b25456f', 'Lakshya Water Park', 'Lakshya Water Park, Kota District, Rajasthan, India', 25.16222567, 76.16636008, 'India EV Network License', 'LIC-IN-ST536', 500.0, 7.4, true, 'Kota District', 'Rajasthan', 1, 'Xobolt (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4d729c86-d453-5b7f-8b39-53e394885440';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('73a12166-9be4-5a3a-bac8-453966b7eab0', '4d729c86-d453-5b7f-8b39-53e394885440', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 537: Chargezone Hotel Rangoli (Navsari, GJ)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bd6b48de-89d8-567a-855a-5b10d1f892ad', '00000000-0000-0000-0000-000000000000', 'st537@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st537@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bd6b48de-89d8-567a-855a-5b10d1f892ad', 'bd6b48de-89d8-567a-855a-5b10d1f892ad', '{"sub": "bd6b48de-89d8-567a-855a-5b10d1f892ad", "email": "st537@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bd6b48de-89d8-567a-855a-5b10d1f892ad')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bd6b48de-89d8-567a-855a-5b10d1f892ad', 'admin', 'st537@boss.com', 'Admin Chargezone Hotel Rangoli', 'Chargezone Hotel Rangoli', 'Chargezone Hotel Rangoli, Navsari, GJ, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4161ab02-066d-523d-8f12-c3d7c1cf04a7', 'bd6b48de-89d8-567a-855a-5b10d1f892ad', 'Chargezone Hotel Rangoli', 'Chargezone Hotel Rangoli, Navsari, GJ, India', 21.03897578, 72.97526541, 'India EV Network License', 'LIC-IN-ST537', 500.0, 60.0, true, 'Navsari', 'GJ', 2, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4161ab02-066d-523d-8f12-c3d7c1cf04a7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('01fd2ac9-1ccb-5520-9167-f2a6a423fa80', '4161ab02-066d-523d-8f12-c3d7c1cf04a7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1cd4beb6-25d8-5fe5-9de5-5e5d8fd9fce8', '4161ab02-066d-523d-8f12-c3d7c1cf04a7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 538: DME Bonli Jio BP LHS (Bonli, RJ)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a1df9562-4e92-5d8e-845b-cf36a1395e76', '00000000-0000-0000-0000-000000000000', 'st538@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st538@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a1df9562-4e92-5d8e-845b-cf36a1395e76', 'a1df9562-4e92-5d8e-845b-cf36a1395e76', '{"sub": "a1df9562-4e92-5d8e-845b-cf36a1395e76", "email": "st538@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a1df9562-4e92-5d8e-845b-cf36a1395e76')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a1df9562-4e92-5d8e-845b-cf36a1395e76', 'admin', 'st538@boss.com', 'Admin DME Bonli Jio BP LHS', 'DME Bonli Jio BP LHS', 'DME Bonli Jio BP LHS, Bonli, RJ, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d02f81d5-53c2-5739-9d68-7fa242d77ea2', 'a1df9562-4e92-5d8e-845b-cf36a1395e76', 'DME Bonli Jio BP LHS', 'DME Bonli Jio BP LHS, Bonli, RJ, India', 26.37735802, 76.25375667, 'India EV Network License', 'LIC-IN-ST538', 500.0, 7.4, true, 'Bonli', 'RJ', 1, 'JIO BP Pulse (India)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd02f81d5-53c2-5739-9d68-7fa242d77ea2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cee4c8fd-9af6-58dd-8bd1-559b97df24d3', 'd02f81d5-53c2-5739-9d68-7fa242d77ea2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 539: DME Garoth Rest Area RHS (Garoth, MP)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('66be5a39-9f71-5d95-8c14-661782b236a3', '00000000-0000-0000-0000-000000000000', 'st539@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st539@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('66be5a39-9f71-5d95-8c14-661782b236a3', '66be5a39-9f71-5d95-8c14-661782b236a3', '{"sub": "66be5a39-9f71-5d95-8c14-661782b236a3", "email": "st539@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '66be5a39-9f71-5d95-8c14-661782b236a3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('66be5a39-9f71-5d95-8c14-661782b236a3', 'admin', 'st539@boss.com', 'Admin DME Garoth Rest Area RHS', 'DME Garoth Rest Area RHS', 'DME Garoth Rest Area RHS, Garoth, MP, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6b109cb5-2875-5f4e-854f-61c2e06e60d3', '66be5a39-9f71-5d95-8c14-661782b236a3', 'DME Garoth Rest Area RHS', 'DME Garoth Rest Area RHS, Garoth, MP, India', 24.34526163, 75.6783233, 'India EV Network License', 'LIC-IN-ST539', 500.0, 7.4, true, 'Garoth', 'MP', 1, 'Volttic (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6b109cb5-2875-5f4e-854f-61c2e06e60d3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2dd861b5-a494-5f90-b5f0-6f93148533f9', '6b109cb5-2875-5f4e-854f-61c2e06e60d3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 540: Volttic Delhi Mumbai Expressway LHS Garoth (Garoth, MP)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('181695c7-f46d-5fdd-877c-fbe298c916e1', '00000000-0000-0000-0000-000000000000', 'st540@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st540@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('181695c7-f46d-5fdd-877c-fbe298c916e1', '181695c7-f46d-5fdd-877c-fbe298c916e1', '{"sub": "181695c7-f46d-5fdd-877c-fbe298c916e1", "email": "st540@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '181695c7-f46d-5fdd-877c-fbe298c916e1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('181695c7-f46d-5fdd-877c-fbe298c916e1', 'admin', 'st540@boss.com', 'Admin Volttic Delhi Mumbai Expressway LHS Garoth', 'Volttic Delhi Mumbai Expressway LHS Garoth', 'Volttic Delhi Mumbai Expressway LHS Garoth, Garoth, MP, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('04c379af-c35e-540d-9bd7-19d9c18300cd', '181695c7-f46d-5fdd-877c-fbe298c916e1', 'Volttic Delhi Mumbai Expressway LHS Garoth', 'Volttic Delhi Mumbai Expressway LHS Garoth, Garoth, MP, India', 24.34687561, 75.68155966, 'India EV Network License', 'LIC-IN-ST540', 500.0, 7.4, true, 'Garoth', 'MP', 1, 'Volttic (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '04c379af-c35e-540d-9bd7-19d9c18300cd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6aeef19f-d9c8-5d99-b198-22aa31b006ec', '04c379af-c35e-540d-9bd7-19d9c18300cd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 541: K2 Highway Treat & Resort (Guna, Madhya Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e0c2f2f8-3960-5c3c-83a0-6c26e5cbd086', '00000000-0000-0000-0000-000000000000', 'st541@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st541@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e0c2f2f8-3960-5c3c-83a0-6c26e5cbd086', 'e0c2f2f8-3960-5c3c-83a0-6c26e5cbd086', '{"sub": "e0c2f2f8-3960-5c3c-83a0-6c26e5cbd086", "email": "st541@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e0c2f2f8-3960-5c3c-83a0-6c26e5cbd086')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e0c2f2f8-3960-5c3c-83a0-6c26e5cbd086', 'admin', 'st541@boss.com', 'Admin K2 Highway Treat & Resort', 'K2 Highway Treat & Resort', 'K2 Highway Treat & Resort, Guna, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7b29de34-e7ed-500c-ba41-fa9055b69b06', 'e0c2f2f8-3960-5c3c-83a0-6c26e5cbd086', 'K2 Highway Treat & Resort', 'K2 Highway Treat & Resort, Guna, India', 24.68468468, 77.33737149, 'India EV Network License', 'LIC-IN-ST541', 500.0, 7.4, true, 'Guna', 'Madhya Pradesh', 1, 'Chargezone (India)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7b29de34-e7ed-500c-ba41-fa9055b69b06';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('23231c97-ceee-5975-af12-ae4eea444a8c', '7b29de34-e7ed-500c-ba41-fa9055b69b06', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 542: Green Mountain Resort (Guna, Madhya Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fce05b9a-be14-5623-9c26-06e39d1db53e', '00000000-0000-0000-0000-000000000000', 'st542@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st542@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fce05b9a-be14-5623-9c26-06e39d1db53e', 'fce05b9a-be14-5623-9c26-06e39d1db53e', '{"sub": "fce05b9a-be14-5623-9c26-06e39d1db53e", "email": "st542@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fce05b9a-be14-5623-9c26-06e39d1db53e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fce05b9a-be14-5623-9c26-06e39d1db53e', 'admin', 'st542@boss.com', 'Admin Green Mountain Resort', 'Green Mountain Resort', 'Green Mountain Resort, Guna, Madhya Pradesh, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('89b2c7d0-c066-58eb-b9c5-4a5b63fb9ef3', 'fce05b9a-be14-5623-9c26-06e39d1db53e', 'Green Mountain Resort', 'Green Mountain Resort, Guna, Madhya Pradesh, India', 24.54054054, 77.20867784, 'India EV Network License', 'LIC-IN-ST542', 500.0, 7.4, true, 'Guna', 'Madhya Pradesh', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '89b2c7d0-c066-58eb-b9c5-4a5b63fb9ef3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('84c6a715-6b19-5f50-8ece-965a70e7e784', '89b2c7d0-c066-58eb-b9c5-4a5b63fb9ef3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 543: Hotel Shivani (Biora, Madhya Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5633cca0-66b7-50f6-a296-a5c31bb9170a', '00000000-0000-0000-0000-000000000000', 'st543@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st543@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5633cca0-66b7-50f6-a296-a5c31bb9170a', '5633cca0-66b7-50f6-a296-a5c31bb9170a', '{"sub": "5633cca0-66b7-50f6-a296-a5c31bb9170a", "email": "st543@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5633cca0-66b7-50f6-a296-a5c31bb9170a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5633cca0-66b7-50f6-a296-a5c31bb9170a', 'admin', 'st543@boss.com', 'Admin Hotel Shivani', 'Hotel Shivani', 'Hotel Shivani, Biora, Madhya Pradesh, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('91105b5f-ac5d-5a38-956a-4a4796fad67c', '5633cca0-66b7-50f6-a296-a5c31bb9170a', 'Hotel Shivani', 'Hotel Shivani, Biora, Madhya Pradesh, India', 23.96396396, 76.93830403, 'India EV Network License', 'LIC-IN-ST543', 500.0, 7.4, true, 'Biora', 'Madhya Pradesh', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '91105b5f-ac5d-5a38-956a-4a4796fad67c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('abca9531-cd84-50bd-91a0-e61cf8466e06', '91105b5f-ac5d-5a38-956a-4a4796fad67c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 544: 160kW GREEN ENERGY EV CHARGING STATION (Changanassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b80e0fe1-391b-5156-a694-8854b796690e', '00000000-0000-0000-0000-000000000000', 'st544@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st544@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b80e0fe1-391b-5156-a694-8854b796690e', 'b80e0fe1-391b-5156-a694-8854b796690e', '{"sub": "b80e0fe1-391b-5156-a694-8854b796690e", "email": "st544@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b80e0fe1-391b-5156-a694-8854b796690e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b80e0fe1-391b-5156-a694-8854b796690e', 'admin', 'st544@boss.com', 'Admin 160kW GREEN ENERGY EV CHARGING STATION', '160kW GREEN ENERGY EV CHARGING STATION', '160kW GREEN ENERGY EV CHARGING STATION, Changanassery, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('21bf5165-4fe6-505e-9db7-eaf88bcbece8', 'b80e0fe1-391b-5156-a694-8854b796690e', '160kW GREEN ENERGY EV CHARGING STATION', '160kW GREEN ENERGY EV CHARGING STATION, Changanassery, Kerala, India', 9.437442172, 76.5420092, 'India EV Network License', 'LIC-IN-ST544', 500.0, 7.4, true, 'Changanassery', 'Kerala', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '21bf5165-4fe6-505e-9db7-eaf88bcbece8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('57c4614c-89ee-5f90-a9e9-fd0aaa6a9193', '21bf5165-4fe6-505e-9db7-eaf88bcbece8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 545: RK Mess & Restaurant (Manmangalam, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('25ef3fdf-8ce7-5f0d-9293-97661a2d6657', '00000000-0000-0000-0000-000000000000', 'st545@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st545@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('25ef3fdf-8ce7-5f0d-9293-97661a2d6657', '25ef3fdf-8ce7-5f0d-9293-97661a2d6657', '{"sub": "25ef3fdf-8ce7-5f0d-9293-97661a2d6657", "email": "st545@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '25ef3fdf-8ce7-5f0d-9293-97661a2d6657')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('25ef3fdf-8ce7-5f0d-9293-97661a2d6657', 'admin', 'st545@boss.com', 'Admin RK Mess & Restaurant', 'RK Mess & Restaurant', 'RK Mess & Restaurant, Manmangalam, Tamil Nadu, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8f79abcf-565f-5c8f-ad72-503c77a31213', '25ef3fdf-8ce7-5f0d-9293-97661a2d6657', 'RK Mess & Restaurant', 'RK Mess & Restaurant, Manmangalam, Tamil Nadu, India', 11.044939, 78.055861, 'India EV Network License', 'LIC-IN-ST545', 500.0, 7.4, true, 'Manmangalam', 'Tamil Nadu', 1, 'Statiq (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8f79abcf-565f-5c8f-ad72-503c77a31213';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('df9e3067-f2df-55fc-ba36-d7aa74bf0a41', '8f79abcf-565f-5c8f-ad72-503c77a31213', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 546: Aravai Aanandas (Karur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4677c521-2ba3-5829-b6ae-ce34665b6240', '00000000-0000-0000-0000-000000000000', 'st546@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st546@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4677c521-2ba3-5829-b6ae-ce34665b6240', '4677c521-2ba3-5829-b6ae-ce34665b6240', '{"sub": "4677c521-2ba3-5829-b6ae-ce34665b6240", "email": "st546@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4677c521-2ba3-5829-b6ae-ce34665b6240')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4677c521-2ba3-5829-b6ae-ce34665b6240', 'admin', 'st546@boss.com', 'Admin Aravai Aanandas', 'Aravai Aanandas', 'Aravai Aanandas, Karur, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d6fb1804-47eb-526d-8beb-fdce9eedbc7f', '4677c521-2ba3-5829-b6ae-ce34665b6240', 'Aravai Aanandas', 'Aravai Aanandas, Karur, Tamil Nadu, India', 10.777439, 77.920825, 'India EV Network License', 'LIC-IN-ST546', 500.0, 7.4, true, 'Karur', 'Tamil Nadu', 1, 'Hydra Charging (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd6fb1804-47eb-526d-8beb-fdce9eedbc7f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('426549f3-0ba5-5a83-83db-138a7b96c86b', 'd6fb1804-47eb-526d-8beb-fdce9eedbc7f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 547: VSB Auto Care (Karur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f286f26d-81e3-5ac2-b1d2-0ff109088ccf', '00000000-0000-0000-0000-000000000000', 'st547@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st547@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f286f26d-81e3-5ac2-b1d2-0ff109088ccf', 'f286f26d-81e3-5ac2-b1d2-0ff109088ccf', '{"sub": "f286f26d-81e3-5ac2-b1d2-0ff109088ccf", "email": "st547@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f286f26d-81e3-5ac2-b1d2-0ff109088ccf')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f286f26d-81e3-5ac2-b1d2-0ff109088ccf', 'admin', 'st547@boss.com', 'Admin VSB Auto Care', 'VSB Auto Care', 'VSB Auto Care, Karur, Tamil Nadu, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('efc04d34-68cb-5759-a23f-b3fd0844d4f2', 'f286f26d-81e3-5ac2-b1d2-0ff109088ccf', 'VSB Auto Care', 'VSB Auto Care, Karur, Tamil Nadu, India', 10.9642143, 78.04655561, 'India EV Network License', 'LIC-IN-ST547', 500.0, 7.4, true, 'Karur', 'Tamil Nadu', 1, 'Relux Electric (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'efc04d34-68cb-5759-a23f-b3fd0844d4f2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8471b473-f692-532d-b88f-7783bd1203ad', 'efc04d34-68cb-5759-a23f-b3fd0844d4f2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 548: AKR Textiles (Karur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('548e8054-1afd-54bc-b908-e65071ba0a13', '00000000-0000-0000-0000-000000000000', 'st548@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st548@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('548e8054-1afd-54bc-b908-e65071ba0a13', '548e8054-1afd-54bc-b908-e65071ba0a13', '{"sub": "548e8054-1afd-54bc-b908-e65071ba0a13", "email": "st548@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '548e8054-1afd-54bc-b908-e65071ba0a13')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('548e8054-1afd-54bc-b908-e65071ba0a13', 'admin', 'st548@boss.com', 'Admin AKR Textiles', 'AKR Textiles', 'AKR Textiles, Karur, Tamil Nadu, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e7f5a8b4-b474-502c-8d70-4dc900d947e0', '548e8054-1afd-54bc-b908-e65071ba0a13', 'AKR Textiles', 'AKR Textiles, Karur, Tamil Nadu, India', 10.96396171, 78.04804205, 'India EV Network License', 'LIC-IN-ST548', 500.0, 7.4, true, 'Karur', 'Tamil Nadu', 1, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e7f5a8b4-b474-502c-8d70-4dc900d947e0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4ce695f0-37cd-5fc5-b4c7-11d62f656110', 'e7f5a8b4-b474-502c-8d70-4dc900d947e0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 549: Volttic LHS DME (Rajpura, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('96898add-8051-53a0-975f-987c572bf7bf', '00000000-0000-0000-0000-000000000000', 'st549@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st549@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('96898add-8051-53a0-975f-987c572bf7bf', '96898add-8051-53a0-975f-987c572bf7bf', '{"sub": "96898add-8051-53a0-975f-987c572bf7bf", "email": "st549@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '96898add-8051-53a0-975f-987c572bf7bf')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('96898add-8051-53a0-975f-987c572bf7bf', 'admin', 'st549@boss.com', 'Admin Volttic LHS DME', 'Volttic LHS DME', 'Volttic LHS DME, Rajpura, Rajasthan, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f1c195ba-674d-5a66-92f9-35225dfa52c8', '96898add-8051-53a0-975f-987c572bf7bf', 'Volttic LHS DME', 'Volttic LHS DME, Rajpura, Rajasthan, India', 27.28713106, 76.77469481, 'India EV Network License', 'LIC-IN-ST549', 500.0, 7.4, true, 'Rajpura', 'Rajasthan', 1, 'Volttic (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f1c195ba-674d-5a66-92f9-35225dfa52c8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('23b3d357-f2ea-5e48-a9a7-605221369d66', 'f1c195ba-674d-5a66-92f9-35225dfa52c8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 550: Avantika Resort EV Cosmos (Dahod, Gujarat)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('27ca8f98-0f6a-5143-9218-ac04aeb86950', '00000000-0000-0000-0000-000000000000', 'st550@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st550@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('27ca8f98-0f6a-5143-9218-ac04aeb86950', '27ca8f98-0f6a-5143-9218-ac04aeb86950', '{"sub": "27ca8f98-0f6a-5143-9218-ac04aeb86950", "email": "st550@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '27ca8f98-0f6a-5143-9218-ac04aeb86950')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('27ca8f98-0f6a-5143-9218-ac04aeb86950', 'admin', 'st550@boss.com', 'Admin Avantika Resort EV Cosmos', 'Avantika Resort EV Cosmos', 'Avantika Resort EV Cosmos, Dahod, Gujarat, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4cbd8bea-7514-5dcc-95a4-64e83f95c42b', '27ca8f98-0f6a-5143-9218-ac04aeb86950', 'Avantika Resort EV Cosmos', 'Avantika Resort EV Cosmos, Dahod, Gujarat, India', 22.81045962, 74.30068522, 'India EV Network License', 'LIC-IN-ST550', 500.0, 7.4, true, 'Dahod', 'Gujarat', 1, 'JIO BP Pulse (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4cbd8bea-7514-5dcc-95a4-64e83f95c42b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8fafad6f-d92b-50fc-bccc-49926cdad45d', '4cbd8bea-7514-5dcc-95a4-64e83f95c42b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 551: Regenta Fairlark (Vadodara, Gujarat)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('193d564b-e938-5870-98fd-595591a7767d', '00000000-0000-0000-0000-000000000000', 'st551@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st551@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('193d564b-e938-5870-98fd-595591a7767d', '193d564b-e938-5870-98fd-595591a7767d', '{"sub": "193d564b-e938-5870-98fd-595591a7767d", "email": "st551@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '193d564b-e938-5870-98fd-595591a7767d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('193d564b-e938-5870-98fd-595591a7767d', 'admin', 'st551@boss.com', 'Admin Regenta Fairlark', 'Regenta Fairlark', 'Regenta Fairlark, Vadodara, Gujarat, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ed6d8ee4-f177-5aec-8ffa-5efb365c6f99', '193d564b-e938-5870-98fd-595591a7767d', 'Regenta Fairlark', 'Regenta Fairlark, Vadodara, Gujarat, India', 22.28764515, 73.13222579, 'India EV Network License', 'LIC-IN-ST551', 500.0, 7.4, true, 'Vadodara', 'Gujarat', 1, 'JIO BP Pulse (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ed6d8ee4-f177-5aec-8ffa-5efb365c6f99';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5bf1c1a9-b55f-5d87-9518-d38466f285cc', 'ed6d8ee4-f177-5aec-8ffa-5efb365c6f99', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 552: EESL - Devinder Collections (New Delhi``, New Dehi)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('445f04a5-44c7-5a15-a7fa-50cd186c0721', '00000000-0000-0000-0000-000000000000', 'st552@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st552@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('445f04a5-44c7-5a15-a7fa-50cd186c0721', '445f04a5-44c7-5a15-a7fa-50cd186c0721', '{"sub": "445f04a5-44c7-5a15-a7fa-50cd186c0721", "email": "st552@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '445f04a5-44c7-5a15-a7fa-50cd186c0721')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('445f04a5-44c7-5a15-a7fa-50cd186c0721', 'admin', 'st552@boss.com', 'Admin EESL - Devinder Collections', 'EESL - Devinder Collections', 'EESL - Devinder Collections, New Delhi``, New Dehi, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3948cc8a-0291-5f2d-9c13-d11aa9a8923e', '445f04a5-44c7-5a15-a7fa-50cd186c0721', 'EESL - Devinder Collections', 'EESL - Devinder Collections, New Delhi``, New Dehi, India', 28.63324209, 77.22494621, 'India EV Network License', 'LIC-IN-ST552', 500.0, 15.0, true, 'New Delhi``', 'New Dehi', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3948cc8a-0291-5f2d-9c13-d11aa9a8923e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('813ffee2-0fee-56d1-b4d5-2adf3d9ad916', '3948cc8a-0291-5f2d-9c13-d11aa9a8923e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d19b1898-b399-5d9d-8107-faccd096d6cf', '3948cc8a-0291-5f2d-9c13-d11aa9a8923e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 553: Regenta Fairlark Jio (Vadodara, GJ)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('85085cea-c470-5c79-b1b7-273ce0db48fd', '00000000-0000-0000-0000-000000000000', 'st553@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st553@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('85085cea-c470-5c79-b1b7-273ce0db48fd', '85085cea-c470-5c79-b1b7-273ce0db48fd', '{"sub": "85085cea-c470-5c79-b1b7-273ce0db48fd", "email": "st553@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '85085cea-c470-5c79-b1b7-273ce0db48fd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('85085cea-c470-5c79-b1b7-273ce0db48fd', 'admin', 'st553@boss.com', 'Admin Regenta Fairlark Jio', 'Regenta Fairlark Jio', 'Regenta Fairlark Jio, Vadodara, GJ, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bba882c2-8913-51aa-bb81-53e933a53752', '85085cea-c470-5c79-b1b7-273ce0db48fd', 'Regenta Fairlark Jio', 'Regenta Fairlark Jio, Vadodara, GJ, India', 22.28852323, 73.13209856, 'India EV Network License', 'LIC-IN-ST553', 500.0, 7.4, true, 'Vadodara', 'GJ', 1, 'JIO BP Pulse (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bba882c2-8913-51aa-bb81-53e933a53752';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bf8c837a-9898-5d4e-8147-1d4ce1a780d4', 'bba882c2-8913-51aa-bb81-53e933a53752', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 554: Hyundai EV Chg Stn Manor (Manor, MH)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6effa0ff-fa0c-50d6-9190-0f57d4f23f80', '00000000-0000-0000-0000-000000000000', 'st554@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st554@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6effa0ff-fa0c-50d6-9190-0f57d4f23f80', '6effa0ff-fa0c-50d6-9190-0f57d4f23f80', '{"sub": "6effa0ff-fa0c-50d6-9190-0f57d4f23f80", "email": "st554@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6effa0ff-fa0c-50d6-9190-0f57d4f23f80')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6effa0ff-fa0c-50d6-9190-0f57d4f23f80', 'admin', 'st554@boss.com', 'Admin Hyundai EV Chg Stn Manor', 'Hyundai EV Chg Stn Manor', 'Hyundai EV Chg Stn Manor, Manor, MH, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d70a702b-4671-5aac-84dd-a25953e0a1ec', '6effa0ff-fa0c-50d6-9190-0f57d4f23f80', 'Hyundai EV Chg Stn Manor', 'Hyundai EV Chg Stn Manor, Manor, MH, India', 19.67794066, 72.90804617, 'India EV Network License', 'LIC-IN-ST554', 500.0, 7.4, true, 'Manor', 'MH', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd70a702b-4671-5aac-84dd-a25953e0a1ec';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('44e1937d-f585-56b2-aff2-0f2216b44ec8', 'd70a702b-4671-5aac-84dd-a25953e0a1ec', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 555: Shree Bihariji Filling Station (Haldwani, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e0c04baf-e771-5c0c-8c22-5d9e89f07344', '00000000-0000-0000-0000-000000000000', 'st555@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st555@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e0c04baf-e771-5c0c-8c22-5d9e89f07344', 'e0c04baf-e771-5c0c-8c22-5d9e89f07344', '{"sub": "e0c04baf-e771-5c0c-8c22-5d9e89f07344", "email": "st555@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e0c04baf-e771-5c0c-8c22-5d9e89f07344')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e0c04baf-e771-5c0c-8c22-5d9e89f07344', 'admin', 'st555@boss.com', 'Admin Shree Bihariji Filling Station', 'Shree Bihariji Filling Station', 'Shree Bihariji Filling Station, Haldwani, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('90effc16-5a98-5fda-86d7-fd078c46dc5d', 'e0c04baf-e771-5c0c-8c22-5d9e89f07344', 'Shree Bihariji Filling Station', 'Shree Bihariji Filling Station, Haldwani, Uttarakhand, India', 29.17643652, 79.49640946, 'India EV Network License', 'LIC-IN-ST555', 500.0, 7.4, true, 'Haldwani', 'Uttarakhand', 1, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '90effc16-5a98-5fda-86d7-fd078c46dc5d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('acc0b5d5-4daf-54b6-a50b-345a928acf8b', '90effc16-5a98-5fda-86d7-fd078c46dc5d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 556: BPCL Royal Fuel Station (Haldwani, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ad6a2d03-9de7-51d6-ac4c-84b2740e995d', '00000000-0000-0000-0000-000000000000', 'st556@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st556@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ad6a2d03-9de7-51d6-ac4c-84b2740e995d', 'ad6a2d03-9de7-51d6-ac4c-84b2740e995d', '{"sub": "ad6a2d03-9de7-51d6-ac4c-84b2740e995d", "email": "st556@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ad6a2d03-9de7-51d6-ac4c-84b2740e995d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ad6a2d03-9de7-51d6-ac4c-84b2740e995d', 'admin', 'st556@boss.com', 'Admin BPCL Royal Fuel Station', 'BPCL Royal Fuel Station', 'BPCL Royal Fuel Station, Haldwani, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0a49fd8f-48eb-5722-b419-0c85f18f2b06', 'ad6a2d03-9de7-51d6-ac4c-84b2740e995d', 'BPCL Royal Fuel Station', 'BPCL Royal Fuel Station, Haldwani, Uttarakhand, India', 29.22417745, 79.50104337, 'India EV Network License', 'LIC-IN-ST556', 500.0, 30.0, true, 'Haldwani', 'Uttarakhand', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0a49fd8f-48eb-5722-b419-0c85f18f2b06';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1b791bdc-8e88-55eb-a796-dbdf68f66035', '0a49fd8f-48eb-5722-b419-0c85f18f2b06', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('224478e4-e40a-5ed6-90e5-39bb3701c55b', '0a49fd8f-48eb-5722-b419-0c85f18f2b06', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 557: Fortune Walkway Mall (Haldwani, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dccdf4ba-22e6-5c79-9b69-fde31d84e1c7', '00000000-0000-0000-0000-000000000000', 'st557@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st557@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dccdf4ba-22e6-5c79-9b69-fde31d84e1c7', 'dccdf4ba-22e6-5c79-9b69-fde31d84e1c7', '{"sub": "dccdf4ba-22e6-5c79-9b69-fde31d84e1c7", "email": "st557@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dccdf4ba-22e6-5c79-9b69-fde31d84e1c7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dccdf4ba-22e6-5c79-9b69-fde31d84e1c7', 'admin', 'st557@boss.com', 'Admin Fortune Walkway Mall', 'Fortune Walkway Mall', 'Fortune Walkway Mall, Haldwani, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('947a1f6a-f733-57a7-ba03-e1ea4aa6c79e', 'dccdf4ba-22e6-5c79-9b69-fde31d84e1c7', 'Fortune Walkway Mall', 'Fortune Walkway Mall, Haldwani, Uttarakhand, India', 29.24538972, 79.53597171, 'India EV Network License', 'LIC-IN-ST557', 500.0, 7.4, true, 'Haldwani', 'Uttarakhand', 1, 'Chargezone (India)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '947a1f6a-f733-57a7-ba03-e1ea4aa6c79e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c6265f25-2aa0-56f6-9b7a-3ea637b36730', '947a1f6a-f733-57a7-ba03-e1ea4aa6c79e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 558: Bikanerwala Sweets Haldwani (Aargo) (Haldwani, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('aef349ec-f243-5892-aff2-4dc68702087d', '00000000-0000-0000-0000-000000000000', 'st558@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st558@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('aef349ec-f243-5892-aff2-4dc68702087d', 'aef349ec-f243-5892-aff2-4dc68702087d', '{"sub": "aef349ec-f243-5892-aff2-4dc68702087d", "email": "st558@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'aef349ec-f243-5892-aff2-4dc68702087d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('aef349ec-f243-5892-aff2-4dc68702087d', 'admin', 'st558@boss.com', 'Admin Bikanerwala Sweets Haldwani (Aargo)', 'Bikanerwala Sweets Haldwani (Aargo)', 'Bikanerwala Sweets Haldwani (Aargo), Haldwani, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('39991765-280b-575b-a31a-98c25ff961e0', 'aef349ec-f243-5892-aff2-4dc68702087d', 'Bikanerwala Sweets Haldwani (Aargo)', 'Bikanerwala Sweets Haldwani (Aargo), Haldwani, Uttarakhand, India', 29.21491941, 79.52798466, 'India EV Network License', 'LIC-IN-ST558', 500.0, 7.4, true, 'Haldwani', 'Uttarakhand', 1, 'Unknown', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '39991765-280b-575b-a31a-98c25ff961e0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fabd68e8-19ae-5549-a422-635c920c1f88', '39991765-280b-575b-a31a-98c25ff961e0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 559: Bharat Petroleum - Janta Petrol Pump (Haldwani, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c6dbad0e-b5e9-58eb-99b3-cfa474208abc', '00000000-0000-0000-0000-000000000000', 'st559@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st559@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c6dbad0e-b5e9-58eb-99b3-cfa474208abc', 'c6dbad0e-b5e9-58eb-99b3-cfa474208abc', '{"sub": "c6dbad0e-b5e9-58eb-99b3-cfa474208abc", "email": "st559@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c6dbad0e-b5e9-58eb-99b3-cfa474208abc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c6dbad0e-b5e9-58eb-99b3-cfa474208abc', 'admin', 'st559@boss.com', 'Admin Bharat Petroleum - Janta Petrol Pump', 'Bharat Petroleum - Janta Petrol Pump', 'Bharat Petroleum - Janta Petrol Pump, Haldwani, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('04f28884-062f-5c63-81fe-c71434140947', 'c6dbad0e-b5e9-58eb-99b3-cfa474208abc', 'Bharat Petroleum - Janta Petrol Pump', 'Bharat Petroleum - Janta Petrol Pump, Haldwani, Uttarakhand, India', 29.18654206, 79.52084263, 'India EV Network License', 'LIC-IN-ST559', 500.0, 7.4, true, 'Haldwani', 'Uttarakhand', 1, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '04f28884-062f-5c63-81fe-c71434140947';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fd6b20e6-0838-508c-84f6-fd407876d185', '04f28884-062f-5c63-81fe-c71434140947', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 560: Tata Power- Ginger Hotel Pantnagar (Rudrapur, Uttarakhnad)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('51c50b39-b80e-50e9-b817-d269657ed5a2', '00000000-0000-0000-0000-000000000000', 'st560@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st560@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('51c50b39-b80e-50e9-b817-d269657ed5a2', '51c50b39-b80e-50e9-b817-d269657ed5a2', '{"sub": "51c50b39-b80e-50e9-b817-d269657ed5a2", "email": "st560@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '51c50b39-b80e-50e9-b817-d269657ed5a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('51c50b39-b80e-50e9-b817-d269657ed5a2', 'admin', 'st560@boss.com', 'Admin Tata Power- Ginger Hotel Pantnagar', 'Tata Power- Ginger Hotel Pantnagar', 'Tata Power- Ginger Hotel Pantnagar, Rudrapur, Uttarakhnad, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d29a3ab4-c538-5205-a677-3cd915b77fa1', '51c50b39-b80e-50e9-b817-d269657ed5a2', 'Tata Power- Ginger Hotel Pantnagar', 'Tata Power- Ginger Hotel Pantnagar, Rudrapur, Uttarakhnad, India', 28.99816711, 79.41578576, 'India EV Network License', 'LIC-IN-ST560', 500.0, 60.0, true, 'Rudrapur', 'Uttarakhnad', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd29a3ab4-c538-5205-a677-3cd915b77fa1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f4e34ac5-043d-50f7-ac25-7dd565667cd2', 'd29a3ab4-c538-5205-a677-3cd915b77fa1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5c698eb4-6d90-5538-ad30-91edd36949e0', 'd29a3ab4-c538-5205-a677-3cd915b77fa1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 561: Ecoplug Radisson Blu Hotel (Rudrapur, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8e63db60-4dbd-5335-9e68-e255a30ff532', '00000000-0000-0000-0000-000000000000', 'st561@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st561@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8e63db60-4dbd-5335-9e68-e255a30ff532', '8e63db60-4dbd-5335-9e68-e255a30ff532', '{"sub": "8e63db60-4dbd-5335-9e68-e255a30ff532", "email": "st561@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8e63db60-4dbd-5335-9e68-e255a30ff532')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8e63db60-4dbd-5335-9e68-e255a30ff532', 'admin', 'st561@boss.com', 'Admin Ecoplug Radisson Blu Hotel', 'Ecoplug Radisson Blu Hotel', 'Ecoplug Radisson Blu Hotel, Rudrapur, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('358c5fd8-812a-50ed-9de4-6c8f98b2faf9', '8e63db60-4dbd-5335-9e68-e255a30ff532', 'Ecoplug Radisson Blu Hotel', 'Ecoplug Radisson Blu Hotel, Rudrapur, Uttarakhand, India', 29.00038213, 79.39987738, 'India EV Network License', 'LIC-IN-ST561', 500.0, 7.4, true, 'Rudrapur', 'Uttarakhand', 1, 'Ecoplug', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '358c5fd8-812a-50ed-9de4-6c8f98b2faf9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fd421a2d-3878-527b-8d4e-dc35568017bd', '358c5fd8-812a-50ed-9de4-6c8f98b2faf9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 562: BP-RUDRAPUR (Rudrapur, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f24094a6-642a-50c6-a1f5-076e5e97ab21', '00000000-0000-0000-0000-000000000000', 'st562@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st562@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f24094a6-642a-50c6-a1f5-076e5e97ab21', 'f24094a6-642a-50c6-a1f5-076e5e97ab21', '{"sub": "f24094a6-642a-50c6-a1f5-076e5e97ab21", "email": "st562@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f24094a6-642a-50c6-a1f5-076e5e97ab21')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f24094a6-642a-50c6-a1f5-076e5e97ab21', 'admin', 'st562@boss.com', 'Admin BP-RUDRAPUR', 'BP-RUDRAPUR', 'BP-RUDRAPUR, Rudrapur, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('20813627-69f0-55f3-a728-e5a91a268a43', 'f24094a6-642a-50c6-a1f5-076e5e97ab21', 'BP-RUDRAPUR', 'BP-RUDRAPUR, Rudrapur, Uttarakhand, India', 28.99484157, 79.40068625, 'India EV Network License', 'LIC-IN-ST562', 500.0, 7.4, true, 'Rudrapur', 'Uttarakhand', 1, 'Statiq (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '20813627-69f0-55f3-a728-e5a91a268a43';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6e9bc940-23a1-551b-946c-897da8a983d0', '20813627-69f0-55f3-a728-e5a91a268a43', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 563: PREM SINGH & SONS (BPCL Charging Station) (Rudrapur, Uttarakhnad)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c39a7da3-617b-5b28-983c-2d758d792bd2', '00000000-0000-0000-0000-000000000000', 'st563@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st563@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c39a7da3-617b-5b28-983c-2d758d792bd2', 'c39a7da3-617b-5b28-983c-2d758d792bd2', '{"sub": "c39a7da3-617b-5b28-983c-2d758d792bd2", "email": "st563@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c39a7da3-617b-5b28-983c-2d758d792bd2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c39a7da3-617b-5b28-983c-2d758d792bd2', 'admin', 'st563@boss.com', 'Admin PREM SINGH & SONS (BPCL Charging Station)', 'PREM SINGH & SONS (BPCL Charging Station)', 'PREM SINGH & SONS (BPCL Charging Station), Rudrapur, Uttarakhnad, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('62cde0af-25fe-538b-9d89-a483aea1e948', 'c39a7da3-617b-5b28-983c-2d758d792bd2', 'PREM SINGH & SONS (BPCL Charging Station)', 'PREM SINGH & SONS (BPCL Charging Station), Rudrapur, Uttarakhnad, India', 28.97859682, 79.40045317, 'India EV Network License', 'LIC-IN-ST563', 500.0, 30.0, true, 'Rudrapur', 'Uttarakhnad', 2, 'Statiq (IN)', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '62cde0af-25fe-538b-9d89-a483aea1e948';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2d0b2891-e769-53e7-94ab-4ae3b9b4d346', '62cde0af-25fe-538b-9d89-a483aea1e948', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('896fbd54-9b37-55ab-a5e1-7edaa6c33fbb', '62cde0af-25fe-538b-9d89-a483aea1e948', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 564: Rudra Continental (Rudrapur, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5054b8e4-95e9-5e3d-b218-e240455a168f', '00000000-0000-0000-0000-000000000000', 'st564@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st564@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5054b8e4-95e9-5e3d-b218-e240455a168f', '5054b8e4-95e9-5e3d-b218-e240455a168f', '{"sub": "5054b8e4-95e9-5e3d-b218-e240455a168f", "email": "st564@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5054b8e4-95e9-5e3d-b218-e240455a168f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5054b8e4-95e9-5e3d-b218-e240455a168f', 'admin', 'st564@boss.com', 'Admin Rudra Continental', 'Rudra Continental', 'Rudra Continental, Rudrapur, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b3e12206-6599-5470-a182-d88c3cee1df3', '5054b8e4-95e9-5e3d-b218-e240455a168f', 'Rudra Continental', 'Rudra Continental, Rudrapur, Uttarakhand, India', 28.97584854, 79.38954231, 'India EV Network License', 'LIC-IN-ST564', 500.0, 7.4, true, 'Rudrapur', 'Uttarakhand', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b3e12206-6599-5470-a182-d88c3cee1df3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d2ba0d09-33d6-53de-b209-c1e909ac5a13', 'b3e12206-6599-5470-a182-d88c3cee1df3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 565: Sagar Tranport Company (Kichha, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('33d5fbf8-4290-5637-90f0-3fbf161090d7', '00000000-0000-0000-0000-000000000000', 'st565@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st565@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('33d5fbf8-4290-5637-90f0-3fbf161090d7', '33d5fbf8-4290-5637-90f0-3fbf161090d7', '{"sub": "33d5fbf8-4290-5637-90f0-3fbf161090d7", "email": "st565@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '33d5fbf8-4290-5637-90f0-3fbf161090d7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('33d5fbf8-4290-5637-90f0-3fbf161090d7', 'admin', 'st565@boss.com', 'Admin Sagar Tranport Company', 'Sagar Tranport Company', 'Sagar Tranport Company, Kichha, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f09c1541-0bfe-59b0-9dbd-640d22e8bf23', '33d5fbf8-4290-5637-90f0-3fbf161090d7', 'Sagar Tranport Company', 'Sagar Tranport Company, Kichha, Uttarakhand, India', 28.93121649, 79.51703689, 'India EV Network License', 'LIC-IN-ST565', 500.0, 7.4, true, 'Kichha', 'Uttarakhand', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f09c1541-0bfe-59b0-9dbd-640d22e8bf23';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('743b1bdc-95d7-50ec-a25f-9623e58d9d14', 'f09c1541-0bfe-59b0-9dbd-640d22e8bf23', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 566: Yash Filling Station (Kichha, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ce096e90-aaa7-515e-98d0-9b3cfa6a48db', '00000000-0000-0000-0000-000000000000', 'st566@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st566@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ce096e90-aaa7-515e-98d0-9b3cfa6a48db', 'ce096e90-aaa7-515e-98d0-9b3cfa6a48db', '{"sub": "ce096e90-aaa7-515e-98d0-9b3cfa6a48db", "email": "st566@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ce096e90-aaa7-515e-98d0-9b3cfa6a48db')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ce096e90-aaa7-515e-98d0-9b3cfa6a48db', 'admin', 'st566@boss.com', 'Admin Yash Filling Station', 'Yash Filling Station', 'Yash Filling Station, Kichha, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cf0774f6-d87d-5481-ba6a-a2ac917081e2', 'ce096e90-aaa7-515e-98d0-9b3cfa6a48db', 'Yash Filling Station', 'Yash Filling Station, Kichha, Uttarakhand, India', 28.87083364, 79.51648005, 'India EV Network License', 'LIC-IN-ST566', 500.0, 7.4, true, 'Kichha', 'Uttarakhand', 1, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cf0774f6-d87d-5481-ba6a-a2ac917081e2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8b001bcd-b24e-592a-b442-d92c327c4f5c', 'cf0774f6-d87d-5481-ba6a-a2ac917081e2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 567: 2012531-PRAKASH PETROLEUM (Kichha, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('da203620-945b-5145-b890-8733d3304cf2', '00000000-0000-0000-0000-000000000000', 'st567@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st567@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('da203620-945b-5145-b890-8733d3304cf2', 'da203620-945b-5145-b890-8733d3304cf2', '{"sub": "da203620-945b-5145-b890-8733d3304cf2", "email": "st567@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'da203620-945b-5145-b890-8733d3304cf2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('da203620-945b-5145-b890-8733d3304cf2', 'admin', 'st567@boss.com', 'Admin 2012531-PRAKASH PETROLEUM', '2012531-PRAKASH PETROLEUM', '2012531-PRAKASH PETROLEUM, Kichha, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9f08261d-bb30-5fe1-8867-a075ce32eac8', 'da203620-945b-5145-b890-8733d3304cf2', '2012531-PRAKASH PETROLEUM', '2012531-PRAKASH PETROLEUM, Kichha, Uttarakhand, India', 28.89269395, 79.5095637, 'India EV Network License', 'LIC-IN-ST567', 500.0, 7.4, true, 'Kichha', 'Uttarakhand', 1, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9f08261d-bb30-5fe1-8867-a075ce32eac8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('94ed05bb-3030-5026-af96-fa38eb1e8fe8', '9f08261d-bb30-5fe1-8867-a075ce32eac8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 568: GLIDA JANESHWAR MISHRA PARK (LUCKNOW, UTTAR PRADESH)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ae4982f8-3c48-5d20-b5fe-9e85957482ec', '00000000-0000-0000-0000-000000000000', 'st568@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st568@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ae4982f8-3c48-5d20-b5fe-9e85957482ec', 'ae4982f8-3c48-5d20-b5fe-9e85957482ec', '{"sub": "ae4982f8-3c48-5d20-b5fe-9e85957482ec", "email": "st568@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ae4982f8-3c48-5d20-b5fe-9e85957482ec')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ae4982f8-3c48-5d20-b5fe-9e85957482ec', 'admin', 'st568@boss.com', 'Admin GLIDA JANESHWAR MISHRA PARK', 'GLIDA JANESHWAR MISHRA PARK', 'GLIDA JANESHWAR MISHRA PARK, LUCKNOW, UTTAR PRADESH, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('07866095-1219-5e69-8596-7564e34ff309', 'ae4982f8-3c48-5d20-b5fe-9e85957482ec', 'GLIDA JANESHWAR MISHRA PARK', 'GLIDA JANESHWAR MISHRA PARK, LUCKNOW, UTTAR PRADESH, India', 26.83799922, 80.98672704, 'India EV Network License', 'LIC-IN-ST568', 500.0, 7.4, true, 'LUCKNOW', 'UTTAR PRADESH', 1, 'GE WattStation (No longer active)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '07866095-1219-5e69-8596-7564e34ff309';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2b24eb4d-43b0-5ccb-8152-b76e773bf04e', '07866095-1219-5e69-8596-7564e34ff309', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 569: GLIDA LOHIA PARK (LUCKNOW, UTTAR PRADESH)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f58ee380-b08e-5643-af8a-0b633ff4024e', '00000000-0000-0000-0000-000000000000', 'st569@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st569@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f58ee380-b08e-5643-af8a-0b633ff4024e', 'f58ee380-b08e-5643-af8a-0b633ff4024e', '{"sub": "f58ee380-b08e-5643-af8a-0b633ff4024e", "email": "st569@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f58ee380-b08e-5643-af8a-0b633ff4024e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f58ee380-b08e-5643-af8a-0b633ff4024e', 'admin', 'st569@boss.com', 'Admin GLIDA LOHIA PARK', 'GLIDA LOHIA PARK', 'GLIDA LOHIA PARK, LUCKNOW, UTTAR PRADESH, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e6c6df32-f847-5835-86e2-eaf694f292e5', 'f58ee380-b08e-5643-af8a-0b633ff4024e', 'GLIDA LOHIA PARK', 'GLIDA LOHIA PARK, LUCKNOW, UTTAR PRADESH, India', 26.85721069, 80.98223515, 'India EV Network License', 'LIC-IN-ST569', 500.0, 7.4, true, 'LUCKNOW', 'UTTAR PRADESH', 1, 'GE WattStation (No longer active)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e6c6df32-f847-5835-86e2-eaf694f292e5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c74c5909-d4c5-54a4-be73-672e59075bc2', 'e6c6df32-f847-5835-86e2-eaf694f292e5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 570: Khajuraho Airport (Khajuraho, MP)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9fc08672-dd86-56be-bbde-38bc60a45748', '00000000-0000-0000-0000-000000000000', 'st570@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st570@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9fc08672-dd86-56be-bbde-38bc60a45748', '9fc08672-dd86-56be-bbde-38bc60a45748', '{"sub": "9fc08672-dd86-56be-bbde-38bc60a45748", "email": "st570@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9fc08672-dd86-56be-bbde-38bc60a45748')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9fc08672-dd86-56be-bbde-38bc60a45748', 'admin', 'st570@boss.com', 'Admin Khajuraho Airport', 'Khajuraho Airport', 'Khajuraho Airport, Khajuraho, MP, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5f391618-de3e-57cc-ac9e-2d9a5c708890', '9fc08672-dd86-56be-bbde-38bc60a45748', 'Khajuraho Airport', 'Khajuraho Airport, Khajuraho, MP, India', 24.81017906, 79.91151232, 'India EV Network License', 'LIC-IN-ST570', 500.0, 7.4, true, 'Khajuraho', 'MP', 1, 'Adani Gas-EV (TR)', '24 Hours (Airport)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5f391618-de3e-57cc-ac9e-2d9a5c708890';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('35845611-cba7-5c42-aac1-c5f0ddc63b53', '5f391618-de3e-57cc-ac9e-2d9a5c708890', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 571: Hotel Bundela (Khajuraho, MP)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('62fc3ce0-f08e-52e0-8639-c17bacbe8fb2', '00000000-0000-0000-0000-000000000000', 'st571@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st571@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('62fc3ce0-f08e-52e0-8639-c17bacbe8fb2', '62fc3ce0-f08e-52e0-8639-c17bacbe8fb2', '{"sub": "62fc3ce0-f08e-52e0-8639-c17bacbe8fb2", "email": "st571@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '62fc3ce0-f08e-52e0-8639-c17bacbe8fb2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('62fc3ce0-f08e-52e0-8639-c17bacbe8fb2', 'admin', 'st571@boss.com', 'Admin Hotel Bundela', 'Hotel Bundela', 'Hotel Bundela, Khajuraho, MP, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5c3419d4-f0be-53ff-9f67-fae321c66c27', '62fc3ce0-f08e-52e0-8639-c17bacbe8fb2', 'Hotel Bundela', 'Hotel Bundela, Khajuraho, MP, India', 24.841218, 79.9209553, 'India EV Network License', 'LIC-IN-ST571', 500.0, 7.4, true, 'Khajuraho', 'MP', 1, 'Adani Gas-EV (TR)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5c3419d4-f0be-53ff-9f67-fae321c66c27';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c38e7916-0ce0-5649-b228-d0bec15d8f0b', '5c3419d4-f0be-53ff-9f67-fae321c66c27', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 572: Cube Stop NH-44 (Mohgaon, MP)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f625cd6d-d6ca-5b88-a1a9-d645fea221fe', '00000000-0000-0000-0000-000000000000', 'st572@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st572@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f625cd6d-d6ca-5b88-a1a9-d645fea221fe', 'f625cd6d-d6ca-5b88-a1a9-d645fea221fe', '{"sub": "f625cd6d-d6ca-5b88-a1a9-d645fea221fe", "email": "st572@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f625cd6d-d6ca-5b88-a1a9-d645fea221fe')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f625cd6d-d6ca-5b88-a1a9-d645fea221fe', 'admin', 'st572@boss.com', 'Admin Cube Stop NH-44', 'Cube Stop NH-44', 'Cube Stop NH-44, Mohgaon, MP, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('323028da-4861-5e6e-9783-0a19af0340bf', 'f625cd6d-d6ca-5b88-a1a9-d645fea221fe', 'Cube Stop NH-44', 'Cube Stop NH-44, Mohgaon, MP, India', 21.9142364, 79.52636659, 'India EV Network License', 'LIC-IN-ST572', 500.0, 7.4, true, 'Mohgaon', 'MP', 1, 'Statiq (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '323028da-4861-5e6e-9783-0a19af0340bf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('703123d2-4123-52d9-a4b9-a10788a3580b', '323028da-4861-5e6e-9783-0a19af0340bf', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 573: Shashtri Nagar (Pune, Maharashtra)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cfe9af83-2623-5949-ad25-aea84ff1b4a0', '00000000-0000-0000-0000-000000000000', 'st573@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st573@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cfe9af83-2623-5949-ad25-aea84ff1b4a0', 'cfe9af83-2623-5949-ad25-aea84ff1b4a0', '{"sub": "cfe9af83-2623-5949-ad25-aea84ff1b4a0", "email": "st573@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cfe9af83-2623-5949-ad25-aea84ff1b4a0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cfe9af83-2623-5949-ad25-aea84ff1b4a0', 'admin', 'st573@boss.com', 'Admin Shashtri Nagar', 'Shashtri Nagar', 'Shashtri Nagar, Pune, Maharashtra, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8367e633-92fd-5923-809b-8f9b6ac7916e', 'cfe9af83-2623-5949-ad25-aea84ff1b4a0', 'Shashtri Nagar', 'Shashtri Nagar, Pune, Maharashtra, India', 18.50392578, 73.80373433, 'India EV Network License', 'LIC-IN-ST573', 500.0, 7.4, true, 'Pune', 'Maharashtra', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8367e633-92fd-5923-809b-8f9b6ac7916e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('233e0121-297a-5574-8e51-a25e89c6cd14', '8367e633-92fd-5923-809b-8f9b6ac7916e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 574: Tata Power - Electric Vehicle Charging Station (Haldwani, Uttarakhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3022879f-9402-51cf-8f8f-710e4a954ab7', '00000000-0000-0000-0000-000000000000', 'st574@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st574@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3022879f-9402-51cf-8f8f-710e4a954ab7', '3022879f-9402-51cf-8f8f-710e4a954ab7', '{"sub": "3022879f-9402-51cf-8f8f-710e4a954ab7", "email": "st574@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3022879f-9402-51cf-8f8f-710e4a954ab7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3022879f-9402-51cf-8f8f-710e4a954ab7', 'admin', 'st574@boss.com', 'Admin Tata Power - Electric Vehicle Charging Station', 'Tata Power - Electric Vehicle Charging Station', 'Tata Power - Electric Vehicle Charging Station, Haldwani, Uttarakhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8a6b408d-8fbc-551e-a0ba-afcaed319087', '3022879f-9402-51cf-8f8f-710e4a954ab7', 'Tata Power - Electric Vehicle Charging Station', 'Tata Power - Electric Vehicle Charging Station, Haldwani, Uttarakhand, India', 29.163755, 79.522706, 'India EV Network License', 'LIC-IN-ST574', 500.0, 60.0, true, 'Haldwani', 'Uttarakhand', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8a6b408d-8fbc-551e-a0ba-afcaed319087';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8334cd4d-3774-57f3-ab18-ab5a5c64ccf1', '8a6b408d-8fbc-551e-a0ba-afcaed319087', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('11a1788c-3611-5643-921e-6ca595676c26', '8a6b408d-8fbc-551e-a0ba-afcaed319087', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 575: FC - TataPower - TMSC Chandrani Enterprises (Asansol, West Bengal)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0a0899a6-979d-5ffa-bb56-05d6d1170b64', '00000000-0000-0000-0000-000000000000', 'st575@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st575@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0a0899a6-979d-5ffa-bb56-05d6d1170b64', '0a0899a6-979d-5ffa-bb56-05d6d1170b64', '{"sub": "0a0899a6-979d-5ffa-bb56-05d6d1170b64", "email": "st575@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0a0899a6-979d-5ffa-bb56-05d6d1170b64')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0a0899a6-979d-5ffa-bb56-05d6d1170b64', 'admin', 'st575@boss.com', 'Admin FC - TataPower - TMSC Chandrani Enterprises', 'FC - TataPower - TMSC Chandrani Enterprises', 'FC - TataPower - TMSC Chandrani Enterprises, Asansol, West Bengal, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c3d776ea-5301-55a3-8b57-5dffea8bdb32', '0a0899a6-979d-5ffa-bb56-05d6d1170b64', 'FC - TataPower - TMSC Chandrani Enterprises', 'FC - TataPower - TMSC Chandrani Enterprises, Asansol, West Bengal, India', 23.66383145, 87.05782811, 'India EV Network License', 'LIC-IN-ST575', 500.0, 60.0, true, 'Asansol', 'West Bengal', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c3d776ea-5301-55a3-8b57-5dffea8bdb32';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5b3b20c-673b-5627-99e8-4ff70c31499a', 'c3d776ea-5301-55a3-8b57-5dffea8bdb32', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a9e336c1-8545-5bec-ac63-b1e0647c6b66', 'c3d776ea-5301-55a3-8b57-5dffea8bdb32', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 576: FC - TataPower - Hotel Sumandeep (Dhanbad, Jharkhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4f91aae0-e692-57dc-a73e-119494cc6872', '00000000-0000-0000-0000-000000000000', 'st576@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st576@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4f91aae0-e692-57dc-a73e-119494cc6872', '4f91aae0-e692-57dc-a73e-119494cc6872', '{"sub": "4f91aae0-e692-57dc-a73e-119494cc6872", "email": "st576@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4f91aae0-e692-57dc-a73e-119494cc6872')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4f91aae0-e692-57dc-a73e-119494cc6872', 'admin', 'st576@boss.com', 'Admin FC - TataPower - Hotel Sumandeep', 'FC - TataPower - Hotel Sumandeep', 'FC - TataPower - Hotel Sumandeep, Dhanbad, Jharkhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('907da799-828a-50d1-8dd7-9ff13f816a52', '4f91aae0-e692-57dc-a73e-119494cc6872', 'FC - TataPower - Hotel Sumandeep', 'FC - TataPower - Hotel Sumandeep, Dhanbad, Jharkhand, India', 23.76517328, 86.80574019, 'India EV Network License', 'LIC-IN-ST576', 500.0, 60.0, true, 'Dhanbad', 'Jharkhand', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '907da799-828a-50d1-8dd7-9ff13f816a52';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5fdefc4-02a1-5a55-ac49-3c5411d22035', '907da799-828a-50d1-8dd7-9ff13f816a52', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('764bab0c-b98c-58f1-989b-329b735415c8', '907da799-828a-50d1-8dd7-9ff13f816a52', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 577: D N R Fuel Point (Thane, Maharashtra)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('60a32943-e357-5402-80e3-875498d3aeee', '00000000-0000-0000-0000-000000000000', 'st577@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st577@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('60a32943-e357-5402-80e3-875498d3aeee', '60a32943-e357-5402-80e3-875498d3aeee', '{"sub": "60a32943-e357-5402-80e3-875498d3aeee", "email": "st577@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '60a32943-e357-5402-80e3-875498d3aeee')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('60a32943-e357-5402-80e3-875498d3aeee', 'admin', 'st577@boss.com', 'Admin D N R Fuel Point', 'D N R Fuel Point', 'D N R Fuel Point, Maharashtra, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('67fef001-839b-5677-a6bc-d684d174e072', '60a32943-e357-5402-80e3-875498d3aeee', 'D N R Fuel Point', 'D N R Fuel Point, Maharashtra, India', 20.6342695, 78.92731552, 'India EV Network License', 'LIC-IN-ST577', 500.0, 7.4, true, 'Thane', 'Maharashtra', 1, 'eDrive BPCL (IN)', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '67fef001-839b-5677-a6bc-d684d174e072';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('04a6cae5-1fbb-53c7-8c92-246eab579908', '67fef001-839b-5677-a6bc-d684d174e072', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 578: Green Garden Family Restaurant (Dumri, Jharkhand)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e23da158-7ed9-5a05-bb37-7ed982030922', '00000000-0000-0000-0000-000000000000', 'st578@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st578@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e23da158-7ed9-5a05-bb37-7ed982030922', 'e23da158-7ed9-5a05-bb37-7ed982030922', '{"sub": "e23da158-7ed9-5a05-bb37-7ed982030922", "email": "st578@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e23da158-7ed9-5a05-bb37-7ed982030922')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e23da158-7ed9-5a05-bb37-7ed982030922', 'admin', 'st578@boss.com', 'Admin Green Garden Family Restaurant', 'Green Garden Family Restaurant', 'Green Garden Family Restaurant, Dumri, Jharkhand, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('184889a2-ca42-5ff1-b9ee-17c82c3dacf0', 'e23da158-7ed9-5a05-bb37-7ed982030922', 'Green Garden Family Restaurant', 'Green Garden Family Restaurant, Dumri, Jharkhand, India', 24.01218983, 86.03378566, 'India EV Network License', 'LIC-IN-ST578', 500.0, 7.4, true, 'Dumri', 'Jharkhand', 1, 'Tata Power', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '184889a2-ca42-5ff1-b9ee-17c82c3dacf0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('670eeead-d36d-5962-b008-84b0a60e30f6', '184889a2-ca42-5ff1-b9ee-17c82c3dacf0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 579: Hotel Kantara Dine (Solur, Karnataka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('687ac665-b3bb-5a2d-aa98-711a5157ca95', '00000000-0000-0000-0000-000000000000', 'st579@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st579@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('687ac665-b3bb-5a2d-aa98-711a5157ca95', '687ac665-b3bb-5a2d-aa98-711a5157ca95', '{"sub": "687ac665-b3bb-5a2d-aa98-711a5157ca95", "email": "st579@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '687ac665-b3bb-5a2d-aa98-711a5157ca95')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('687ac665-b3bb-5a2d-aa98-711a5157ca95', 'admin', 'st579@boss.com', 'Admin Hotel Kantara Dine', 'Hotel Kantara Dine', 'Hotel Kantara Dine, Solur, Karnataka, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('85f13fd2-df46-5475-adce-a20c1158602c', '687ac665-b3bb-5a2d-aa98-711a5157ca95', 'Hotel Kantara Dine', 'Hotel Kantara Dine, Solur, Karnataka, India', 13.06457377, 77.25712516, 'India EV Network License', 'LIC-IN-ST579', 500.0, 7.4, true, 'Solur', 'Karnataka', 1, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '85f13fd2-df46-5475-adce-a20c1158602c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('96c284db-5492-5f2a-8999-848f1481b659', '85f13fd2-df46-5475-adce-a20c1158602c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 580: Burger King (Udayapura, Karnataka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('87b2326e-d88a-59cd-b52f-5b11f54e6c53', '00000000-0000-0000-0000-000000000000', 'st580@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st580@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('87b2326e-d88a-59cd-b52f-5b11f54e6c53', '87b2326e-d88a-59cd-b52f-5b11f54e6c53', '{"sub": "87b2326e-d88a-59cd-b52f-5b11f54e6c53", "email": "st580@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '87b2326e-d88a-59cd-b52f-5b11f54e6c53')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('87b2326e-d88a-59cd-b52f-5b11f54e6c53', 'admin', 'st580@boss.com', 'Admin Burger King', 'Burger King', 'Burger King, Udayapura, Karnataka, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a7ccacf0-0009-5358-9e03-537182b6204f', '87b2326e-d88a-59cd-b52f-5b11f54e6c53', 'Burger King', 'Burger King, Udayapura, Karnataka, India', 12.96013446, 76.33023906, 'India EV Network License', 'LIC-IN-ST580', 500.0, 7.4, true, 'Udayapura', 'Karnataka', 1, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a7ccacf0-0009-5358-9e03-537182b6204f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('82fa0ba3-835a-54cd-a6f7-38abf6fde074', 'a7ccacf0-0009-5358-9e03-537182b6204f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 581: Konnagar (Kolkata, west bengal)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9cbd7242-7bbf-54c3-be6d-75e5d5a31886', '00000000-0000-0000-0000-000000000000', 'st581@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st581@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9cbd7242-7bbf-54c3-be6d-75e5d5a31886', '9cbd7242-7bbf-54c3-be6d-75e5d5a31886', '{"sub": "9cbd7242-7bbf-54c3-be6d-75e5d5a31886", "email": "st581@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9cbd7242-7bbf-54c3-be6d-75e5d5a31886')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9cbd7242-7bbf-54c3-be6d-75e5d5a31886', 'admin', 'st581@boss.com', 'Admin Konnagar', 'Konnagar', 'Konnagar, Kolkata, west bengal, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4f1c76e6-1c18-5660-b005-8970c0346244', '9cbd7242-7bbf-54c3-be6d-75e5d5a31886', 'Konnagar', 'Konnagar, Kolkata, west bengal, India', 21.65144351, 87.65139955, 'India EV Network License', 'LIC-IN-ST581', 500.0, 7.4, true, 'Kolkata', 'west bengal', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4f1c76e6-1c18-5660-b005-8970c0346244';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('85472798-0074-5aa7-a6b5-a2ee7e87d397', '4f1c76e6-1c18-5660-b005-8970c0346244', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 582: Jio-BP Pulse (Yellagallahalli, Karnataka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e7966391-849c-5383-88a4-00cfedbb8b1b', '00000000-0000-0000-0000-000000000000', 'st582@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st582@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e7966391-849c-5383-88a4-00cfedbb8b1b', 'e7966391-849c-5383-88a4-00cfedbb8b1b', '{"sub": "e7966391-849c-5383-88a4-00cfedbb8b1b", "email": "st582@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e7966391-849c-5383-88a4-00cfedbb8b1b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e7966391-849c-5383-88a4-00cfedbb8b1b', 'admin', 'st582@boss.com', 'Admin Jio-BP Pulse', 'Jio-BP Pulse', 'Jio-BP Pulse, Yellagallahalli, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7ca05c3d-4953-5ebc-b45a-25bf28255236', 'e7966391-849c-5383-88a4-00cfedbb8b1b', 'Jio-BP Pulse', 'Jio-BP Pulse, Yellagallahalli, India', 13.6062729, 77.7872747, 'India EV Network License', 'LIC-IN-ST582', 500.0, 60.0, true, 'Yellagallahalli', 'Karnataka', 3, 'JIO BP Pulse (India)', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7ca05c3d-4953-5ebc-b45a-25bf28255236';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('03bb82a0-508f-5db6-93ed-8438254e5e57', '7ca05c3d-4953-5ebc-b45a-25bf28255236', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9a660577-5803-5b0d-a2b0-10f6ef4c0299', '7ca05c3d-4953-5ebc-b45a-25bf28255236', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('64c6f267-cf69-5a7e-a242-512e48190183', '7ca05c3d-4953-5ebc-b45a-25bf28255236', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 583: Tata.ev Luxon Motors - Tata Power (Edappally, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5b4751cd-9e9e-59cc-b444-9d1f913d018a', '00000000-0000-0000-0000-000000000000', 'st583@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st583@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5b4751cd-9e9e-59cc-b444-9d1f913d018a', '5b4751cd-9e9e-59cc-b444-9d1f913d018a', '{"sub": "5b4751cd-9e9e-59cc-b444-9d1f913d018a", "email": "st583@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5b4751cd-9e9e-59cc-b444-9d1f913d018a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5b4751cd-9e9e-59cc-b444-9d1f913d018a', 'admin', 'st583@boss.com', 'Admin Tata.ev Luxon Motors - Tata Power', 'Tata.ev Luxon Motors - Tata Power', 'Tata.ev Luxon Motors - Tata Power, Edappally, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0401556e-7b07-5fa1-a5be-f9880f794989', '5b4751cd-9e9e-59cc-b444-9d1f913d018a', 'Tata.ev Luxon Motors - Tata Power', 'Tata.ev Luxon Motors - Tata Power, Edappally, Kerala, India', 10.01148474, 76.3113875, 'India EV Network License', 'LIC-IN-ST583', 500.0, 60.0, true, 'Edappally', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0401556e-7b07-5fa1-a5be-f9880f794989';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ccaf00c0-d104-51f8-ad69-05668665b0c3', '0401556e-7b07-5fa1-a5be-f9880f794989', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eb29c998-ef31-56d1-9f34-8bace878d978', '0401556e-7b07-5fa1-a5be-f9880f794989', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 584: TML Sree Gokulam Motors - Tata Power (Edappally, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('809d6864-c663-5eb7-9a05-19b7fafa1374', '00000000-0000-0000-0000-000000000000', 'st584@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st584@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('809d6864-c663-5eb7-9a05-19b7fafa1374', '809d6864-c663-5eb7-9a05-19b7fafa1374', '{"sub": "809d6864-c663-5eb7-9a05-19b7fafa1374", "email": "st584@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '809d6864-c663-5eb7-9a05-19b7fafa1374')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('809d6864-c663-5eb7-9a05-19b7fafa1374', 'admin', 'st584@boss.com', 'Admin TML Sree Gokulam Motors - Tata Power', 'TML Sree Gokulam Motors - Tata Power', 'TML Sree Gokulam Motors - Tata Power, Edappally, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('49f706a4-3293-569d-8068-90e15549789d', '809d6864-c663-5eb7-9a05-19b7fafa1374', 'TML Sree Gokulam Motors - Tata Power', 'TML Sree Gokulam Motors - Tata Power, Edappally, Kerala, India', 10.03915497, 76.31555881, 'India EV Network License', 'LIC-IN-ST584', 500.0, 60.0, true, 'Edappally', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '49f706a4-3293-569d-8068-90e15549789d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d0538949-b084-52da-bb24-6927981b8770', '49f706a4-3293-569d-8068-90e15549789d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('866d8633-585a-5a2a-9aaf-24a1353e17c4', '49f706a4-3293-569d-8068-90e15549789d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 585: Tata.ev Gokulam Motors - Tata Power (Choornikkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5c5cd135-8075-5947-bcc8-2b46bb227672', '00000000-0000-0000-0000-000000000000', 'st585@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st585@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5c5cd135-8075-5947-bcc8-2b46bb227672', '5c5cd135-8075-5947-bcc8-2b46bb227672', '{"sub": "5c5cd135-8075-5947-bcc8-2b46bb227672", "email": "st585@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5c5cd135-8075-5947-bcc8-2b46bb227672')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5c5cd135-8075-5947-bcc8-2b46bb227672', 'admin', 'st585@boss.com', 'Admin Tata.ev Gokulam Motors - Tata Power', 'Tata.ev Gokulam Motors - Tata Power', 'Tata.ev Gokulam Motors - Tata Power, Choornikkara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('653acb9a-9807-531f-abf3-30067754406e', '5c5cd135-8075-5947-bcc8-2b46bb227672', 'Tata.ev Gokulam Motors - Tata Power', 'Tata.ev Gokulam Motors - Tata Power, Choornikkara, Kerala, India', 10.08130279, 76.33946199, 'India EV Network License', 'LIC-IN-ST585', 500.0, 60.0, true, 'Choornikkara', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '653acb9a-9807-531f-abf3-30067754406e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9d62410d-1cc6-59c0-8ecf-5d98cdef514c', '653acb9a-9807-531f-abf3-30067754406e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6759b518-06d5-5e42-bd5d-edf9e68bb66e', '653acb9a-9807-531f-abf3-30067754406e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 586: Taj Cochin Internation Airport Hotel - Tata Power (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('32528514-e8c1-578f-a26a-6c783948e387', '00000000-0000-0000-0000-000000000000', 'st586@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st586@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('32528514-e8c1-578f-a26a-6c783948e387', '32528514-e8c1-578f-a26a-6c783948e387', '{"sub": "32528514-e8c1-578f-a26a-6c783948e387", "email": "st586@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '32528514-e8c1-578f-a26a-6c783948e387')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('32528514-e8c1-578f-a26a-6c783948e387', 'admin', 'st586@boss.com', 'Admin Taj Cochin Internation Airport Hotel - Tata Power', 'Taj Cochin Internation Airport Hotel - Tata Power', 'Taj Cochin Internation Airport Hotel - Tata Power, Nedumbassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7d7bbb4e-6843-565a-9cdf-5ffedd931f63', '32528514-e8c1-578f-a26a-6c783948e387', 'Taj Cochin Internation Airport Hotel - Tata Power', 'Taj Cochin Internation Airport Hotel - Tata Power, Nedumbassery, Kerala, India', 10.15999504, 76.39015422, 'India EV Network License', 'LIC-IN-ST586', 500.0, 60.0, true, 'Nedumbassery', 'Kerala', 2, 'Tata Power', '24 Hours (Airport)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7d7bbb4e-6843-565a-9cdf-5ffedd931f63';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e150b979-b8fc-5580-986d-d7afb1693bfd', '7d7bbb4e-6843-565a-9cdf-5ffedd931f63', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('00156271-b4c0-52d5-89e9-da8262f61ba2', '7d7bbb4e-6843-565a-9cdf-5ffedd931f63', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 587: SAJ Earth Resort - Tata Power (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('98bbf9ef-ea14-5e68-b69b-e47a353d3a54', '00000000-0000-0000-0000-000000000000', 'st587@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st587@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('98bbf9ef-ea14-5e68-b69b-e47a353d3a54', '98bbf9ef-ea14-5e68-b69b-e47a353d3a54', '{"sub": "98bbf9ef-ea14-5e68-b69b-e47a353d3a54", "email": "st587@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '98bbf9ef-ea14-5e68-b69b-e47a353d3a54')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('98bbf9ef-ea14-5e68-b69b-e47a353d3a54', 'admin', 'st587@boss.com', 'Admin SAJ Earth Resort - Tata Power', 'SAJ Earth Resort - Tata Power', 'SAJ Earth Resort - Tata Power, Nedumbassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('243ba47f-21fb-5796-821c-152acb85d7e1', '98bbf9ef-ea14-5e68-b69b-e47a353d3a54', 'SAJ Earth Resort - Tata Power', 'SAJ Earth Resort - Tata Power, Nedumbassery, Kerala, India', 10.16222425, 76.3846535, 'India EV Network License', 'LIC-IN-ST587', 500.0, 60.0, true, 'Nedumbassery', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '243ba47f-21fb-5796-821c-152acb85d7e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8c35d33c-bd82-5682-b409-793d569cc238', '243ba47f-21fb-5796-821c-152acb85d7e1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('48d25055-25ba-5b19-9b51-8449aa5ec48b', '243ba47f-21fb-5796-821c-152acb85d7e1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 588: Luxon Motors - Tata Power (Kariyad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5f1bc83c-ee8c-5dfd-967b-caecd701b093', '00000000-0000-0000-0000-000000000000', 'st588@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st588@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5f1bc83c-ee8c-5dfd-967b-caecd701b093', '5f1bc83c-ee8c-5dfd-967b-caecd701b093', '{"sub": "5f1bc83c-ee8c-5dfd-967b-caecd701b093", "email": "st588@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5f1bc83c-ee8c-5dfd-967b-caecd701b093')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5f1bc83c-ee8c-5dfd-967b-caecd701b093', 'admin', 'st588@boss.com', 'Admin Luxon Motors - Tata Power', 'Luxon Motors - Tata Power', 'Luxon Motors - Tata Power, Kariyad, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c2766049-a58c-5989-b9d0-6eede560518a', '5f1bc83c-ee8c-5dfd-967b-caecd701b093', 'Luxon Motors - Tata Power', 'Luxon Motors - Tata Power, Kariyad, Kerala, India', 10.16204205, 76.36735603, 'India EV Network License', 'LIC-IN-ST588', 500.0, 60.0, true, 'Kariyad', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c2766049-a58c-5989-b9d0-6eede560518a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4f910353-ffc1-5f7b-8f23-d8dadc586ec3', 'c2766049-a58c-5989-b9d0-6eede560518a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1efd913e-31fa-5028-8695-a76fc782eb8d', 'c2766049-a58c-5989-b9d0-6eede560518a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 589: Sree Gokulam Motors - Tata Power (Angamaly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dc23907e-4fbd-5372-9c78-154898a7866f', '00000000-0000-0000-0000-000000000000', 'st589@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st589@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dc23907e-4fbd-5372-9c78-154898a7866f', 'dc23907e-4fbd-5372-9c78-154898a7866f', '{"sub": "dc23907e-4fbd-5372-9c78-154898a7866f", "email": "st589@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dc23907e-4fbd-5372-9c78-154898a7866f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dc23907e-4fbd-5372-9c78-154898a7866f', 'admin', 'st589@boss.com', 'Admin Sree Gokulam Motors - Tata Power', 'Sree Gokulam Motors - Tata Power', 'Sree Gokulam Motors - Tata Power, Angamaly, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e72b5819-a434-5bea-bf94-ddfde1976ca7', 'dc23907e-4fbd-5372-9c78-154898a7866f', 'Sree Gokulam Motors - Tata Power', 'Sree Gokulam Motors - Tata Power, Angamaly, Kerala, India', 10.22106036, 76.37675213, 'India EV Network License', 'LIC-IN-ST589', 500.0, 60.0, true, 'Angamaly', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e72b5819-a434-5bea-bf94-ddfde1976ca7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a56980eb-8fc1-577b-bd09-b41f0d71380b', 'e72b5819-a434-5bea-bf94-ddfde1976ca7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2a0f21c4-cc2e-57cc-b776-0fc471b717b4', 'e72b5819-a434-5bea-bf94-ddfde1976ca7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 590: Centro Mall Charging Station - Tata Power (Kodungallur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0cfac495-7ecf-5160-8038-4b64dade9c98', '00000000-0000-0000-0000-000000000000', 'st590@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st590@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0cfac495-7ecf-5160-8038-4b64dade9c98', '0cfac495-7ecf-5160-8038-4b64dade9c98', '{"sub": "0cfac495-7ecf-5160-8038-4b64dade9c98", "email": "st590@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0cfac495-7ecf-5160-8038-4b64dade9c98')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0cfac495-7ecf-5160-8038-4b64dade9c98', 'admin', 'st590@boss.com', 'Admin Centro Mall Charging Station - Tata Power', 'Centro Mall Charging Station - Tata Power', 'Centro Mall Charging Station - Tata Power, Kodungallur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('784c9d22-ffcc-5664-9194-9ecd2d0a1b2a', '0cfac495-7ecf-5160-8038-4b64dade9c98', 'Centro Mall Charging Station - Tata Power', 'Centro Mall Charging Station - Tata Power, Kodungallur, Kerala, India', 10.23248948, 76.19594022, 'India EV Network License', 'LIC-IN-ST590', 500.0, 60.0, true, 'Kodungallur', 'Kerala', 2, 'Tata Power', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '784c9d22-ffcc-5664-9194-9ecd2d0a1b2a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8e0cca35-cf25-5781-be4e-67ddf1ebad72', '784c9d22-ffcc-5664-9194-9ecd2d0a1b2a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('edb9aa8a-cd79-5e45-a927-7518041c17b6', '784c9d22-ffcc-5664-9194-9ecd2d0a1b2a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 591: IOCL Thiruvonam Fuels - Tata Power (Palakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('242d15e0-dba0-596f-9fde-45a5acd8fd16', '00000000-0000-0000-0000-000000000000', 'st591@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st591@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('242d15e0-dba0-596f-9fde-45a5acd8fd16', '242d15e0-dba0-596f-9fde-45a5acd8fd16', '{"sub": "242d15e0-dba0-596f-9fde-45a5acd8fd16", "email": "st591@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '242d15e0-dba0-596f-9fde-45a5acd8fd16')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('242d15e0-dba0-596f-9fde-45a5acd8fd16', 'admin', 'st591@boss.com', 'Admin IOCL Thiruvonam Fuels - Tata Power', 'IOCL Thiruvonam Fuels - Tata Power', 'IOCL Thiruvonam Fuels - Tata Power, Palakkad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d1897396-44f7-512d-b47e-55f590344988', '242d15e0-dba0-596f-9fde-45a5acd8fd16', 'IOCL Thiruvonam Fuels - Tata Power', 'IOCL Thiruvonam Fuels - Tata Power, Palakkad, Kerala, India', 10.76983098, 76.6680965, 'India EV Network License', 'LIC-IN-ST591', 500.0, 60.0, true, 'Palakkad', 'Kerala', 2, 'Tata Power', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd1897396-44f7-512d-b47e-55f590344988';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5538acd2-9bde-5104-bb45-8932a977d893', 'd1897396-44f7-512d-b47e-55f590344988', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ae50d718-b841-5213-9dc4-62b0c6607eb5', 'd1897396-44f7-512d-b47e-55f590344988', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 592: KVR Automotive - Tata Power (Koppam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('21b76949-8b45-56e8-847f-5faf15dcf08b', '00000000-0000-0000-0000-000000000000', 'st592@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st592@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('21b76949-8b45-56e8-847f-5faf15dcf08b', '21b76949-8b45-56e8-847f-5faf15dcf08b', '{"sub": "21b76949-8b45-56e8-847f-5faf15dcf08b", "email": "st592@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '21b76949-8b45-56e8-847f-5faf15dcf08b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('21b76949-8b45-56e8-847f-5faf15dcf08b', 'admin', 'st592@boss.com', 'Admin KVR Automotive - Tata Power', 'KVR Automotive - Tata Power', 'KVR Automotive - Tata Power, Koppam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4bbbc635-1232-5129-a68a-993113775e51', '21b76949-8b45-56e8-847f-5faf15dcf08b', 'KVR Automotive - Tata Power', 'KVR Automotive - Tata Power, Koppam, Kerala, India', 10.7822582, 76.65824511, 'India EV Network License', 'LIC-IN-ST592', 500.0, 60.0, true, 'Koppam', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4bbbc635-1232-5129-a68a-993113775e51';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('affa08e6-3094-529d-9932-11d2dd4f224b', '4bbbc635-1232-5129-a68a-993113775e51', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5d95037e-133f-5b29-bcef-c047b93593c3', '4bbbc635-1232-5129-a68a-993113775e51', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 593: Gokulam Residency - Tata Power (Amballur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('64faddd5-aa6a-560d-b013-e3f5caabb92c', '00000000-0000-0000-0000-000000000000', 'st593@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st593@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('64faddd5-aa6a-560d-b013-e3f5caabb92c', '64faddd5-aa6a-560d-b013-e3f5caabb92c', '{"sub": "64faddd5-aa6a-560d-b013-e3f5caabb92c", "email": "st593@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '64faddd5-aa6a-560d-b013-e3f5caabb92c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('64faddd5-aa6a-560d-b013-e3f5caabb92c', 'admin', 'st593@boss.com', 'Admin Gokulam Residency - Tata Power', 'Gokulam Residency - Tata Power', 'Gokulam Residency - Tata Power, Amballur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('16ecec12-6571-5628-a0f9-8bf037791d34', '64faddd5-aa6a-560d-b013-e3f5caabb92c', 'Gokulam Residency - Tata Power', 'Gokulam Residency - Tata Power, Amballur, Kerala, India', 10.4361871, 76.26520583, 'India EV Network License', 'LIC-IN-ST593', 500.0, 60.0, true, 'Amballur', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '16ecec12-6571-5628-a0f9-8bf037791d34';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('726b946f-5ecc-53b5-b9d0-8b0052982d2e', '16ecec12-6571-5628-a0f9-8bf037791d34', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('03c97fe5-4fa1-5b3c-a89b-90a4711b4c6d', '16ecec12-6571-5628-a0f9-8bf037791d34', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 594: Tata.ev Hyson Motors - Tata Power (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1ced6fdd-d906-5590-a031-2f6a0bc832c7', '00000000-0000-0000-0000-000000000000', 'st594@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st594@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1ced6fdd-d906-5590-a031-2f6a0bc832c7', '1ced6fdd-d906-5590-a031-2f6a0bc832c7', '{"sub": "1ced6fdd-d906-5590-a031-2f6a0bc832c7", "email": "st594@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1ced6fdd-d906-5590-a031-2f6a0bc832c7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1ced6fdd-d906-5590-a031-2f6a0bc832c7', 'admin', 'st594@boss.com', 'Admin Tata.ev Hyson Motors - Tata Power', 'Tata.ev Hyson Motors - Tata Power', 'Tata.ev Hyson Motors - Tata Power, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6f41d1e3-7e2d-555c-ab0d-8ba6188b341f', '1ced6fdd-d906-5590-a031-2f6a0bc832c7', 'Tata.ev Hyson Motors - Tata Power', 'Tata.ev Hyson Motors - Tata Power, Thrissur, Kerala, India', 10.49672847, 76.25836131, 'India EV Network License', 'LIC-IN-ST594', 500.0, 60.0, true, 'Thrissur', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6f41d1e3-7e2d-555c-ab0d-8ba6188b341f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d9c07052-1c6f-5e1c-aadf-8db6fc9c67cd', '6f41d1e3-7e2d-555c-ab0d-8ba6188b341f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8e8bc7f7-e170-5efb-a33a-39244f395880', '6f41d1e3-7e2d-555c-ab0d-8ba6188b341f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 595: PCK Centenary (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('821ebfcf-dbbe-5530-9fbf-4b06add724f8', '00000000-0000-0000-0000-000000000000', 'st595@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st595@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('821ebfcf-dbbe-5530-9fbf-4b06add724f8', '821ebfcf-dbbe-5530-9fbf-4b06add724f8', '{"sub": "821ebfcf-dbbe-5530-9fbf-4b06add724f8", "email": "st595@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '821ebfcf-dbbe-5530-9fbf-4b06add724f8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('821ebfcf-dbbe-5530-9fbf-4b06add724f8', 'admin', 'st595@boss.com', 'Admin PCK Centenary', 'PCK Centenary', 'PCK Centenary, Thrissur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('593a2358-112f-5374-bc95-7f6c166532b0', '821ebfcf-dbbe-5530-9fbf-4b06add724f8', 'PCK Centenary', 'PCK Centenary, Thrissur, Kerala, India', 10.52294042, 76.20624767, 'India EV Network License', 'LIC-IN-ST595', 500.0, 7.4, true, 'Thrissur', 'Kerala', 1, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '593a2358-112f-5374-bc95-7f6c166532b0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5a96bcf4-e6c5-58e6-ae21-971f9b6c3d11', '593a2358-112f-5374-bc95-7f6c166532b0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 596: TML Hyson Motors - Tata Power (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e106ce6d-c1b5-5e0d-b66f-d5f59e2a2bfd', '00000000-0000-0000-0000-000000000000', 'st596@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st596@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e106ce6d-c1b5-5e0d-b66f-d5f59e2a2bfd', 'e106ce6d-c1b5-5e0d-b66f-d5f59e2a2bfd', '{"sub": "e106ce6d-c1b5-5e0d-b66f-d5f59e2a2bfd", "email": "st596@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e106ce6d-c1b5-5e0d-b66f-d5f59e2a2bfd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e106ce6d-c1b5-5e0d-b66f-d5f59e2a2bfd', 'admin', 'st596@boss.com', 'Admin TML Hyson Motors - Tata Power', 'TML Hyson Motors - Tata Power', 'TML Hyson Motors - Tata Power, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7d22c45d-1976-585f-a219-cb93ea77af08', 'e106ce6d-c1b5-5e0d-b66f-d5f59e2a2bfd', 'TML Hyson Motors - Tata Power', 'TML Hyson Motors - Tata Power, Thrissur, Kerala, India', 10.54042299, 76.18967782, 'India EV Network License', 'LIC-IN-ST596', 500.0, 60.0, true, 'Thrissur', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7d22c45d-1976-585f-a219-cb93ea77af08';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cda0ac25-c936-5b89-be06-f65e80745232', '7d22c45d-1976-585f-a219-cb93ea77af08', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6d977bf3-f512-5fec-b34d-adcb2b6fa50f', '7d22c45d-1976-585f-a219-cb93ea77af08', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 597: Hotel Gokulam Sabari - Tata Power (Guruvayur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7b82bd1d-80ed-5214-9df5-d18e01d4226a', '00000000-0000-0000-0000-000000000000', 'st597@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st597@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7b82bd1d-80ed-5214-9df5-d18e01d4226a', '7b82bd1d-80ed-5214-9df5-d18e01d4226a', '{"sub": "7b82bd1d-80ed-5214-9df5-d18e01d4226a", "email": "st597@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7b82bd1d-80ed-5214-9df5-d18e01d4226a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7b82bd1d-80ed-5214-9df5-d18e01d4226a', 'admin', 'st597@boss.com', 'Admin Hotel Gokulam Sabari - Tata Power', 'Hotel Gokulam Sabari - Tata Power', 'Hotel Gokulam Sabari - Tata Power, Guruvayur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4c7eb88d-c7aa-54bd-94a8-119baac28fd2', '7b82bd1d-80ed-5214-9df5-d18e01d4226a', 'Hotel Gokulam Sabari - Tata Power', 'Hotel Gokulam Sabari - Tata Power, Guruvayur, Kerala, India', 10.59635698, 76.04293443, 'India EV Network License', 'LIC-IN-ST597', 500.0, 60.0, true, 'Guruvayur', 'Kerala', 2, 'Tata Power', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4c7eb88d-c7aa-54bd-94a8-119baac28fd2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3b6e6e14-ada2-521f-8ac7-4775bf5212db', '4c7eb88d-c7aa-54bd-94a8-119baac28fd2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fd598919-d170-57af-9a94-bf956f8ef5dd', '4c7eb88d-c7aa-54bd-94a8-119baac28fd2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 598: Shirdi (Shirdi, Maharashtra)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6f85b2c6-f68d-5c13-b28c-1734b554db3a', '00000000-0000-0000-0000-000000000000', 'st598@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st598@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6f85b2c6-f68d-5c13-b28c-1734b554db3a', '6f85b2c6-f68d-5c13-b28c-1734b554db3a', '{"sub": "6f85b2c6-f68d-5c13-b28c-1734b554db3a", "email": "st598@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6f85b2c6-f68d-5c13-b28c-1734b554db3a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6f85b2c6-f68d-5c13-b28c-1734b554db3a', 'admin', 'st598@boss.com', 'Admin Shirdi', 'Shirdi', 'Shirdi, Shirdi, Maharashtra, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('da7bb878-3bf3-51ec-9ba8-612d0732d438', '6f85b2c6-f68d-5c13-b28c-1734b554db3a', 'Shirdi', 'Shirdi, Shirdi, Maharashtra, India', 19.75759399, 74.47634733, 'India EV Network License', 'LIC-IN-ST598', 500.0, 7.4, true, 'Shirdi', 'Maharashtra', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'da7bb878-3bf3-51ec-9ba8-612d0732d438';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b1ec2aeb-6f6e-5815-a954-16bd6d005aad', 'da7bb878-3bf3-51ec-9ba8-612d0732d438', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 599: InFour Wheel Care And Tyres - Tata Power (Perinthalmanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e21b5159-9be3-5385-952d-163aa767d089', '00000000-0000-0000-0000-000000000000', 'st599@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st599@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e21b5159-9be3-5385-952d-163aa767d089', 'e21b5159-9be3-5385-952d-163aa767d089', '{"sub": "e21b5159-9be3-5385-952d-163aa767d089", "email": "st599@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e21b5159-9be3-5385-952d-163aa767d089')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e21b5159-9be3-5385-952d-163aa767d089', 'admin', 'st599@boss.com', 'Admin InFour Wheel Care And Tyres - Tata Power', 'InFour Wheel Care And Tyres - Tata Power', 'InFour Wheel Care And Tyres - Tata Power, Perinthalmanna, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8796d7f9-6d0e-5cc0-81f8-81043c8ab40f', 'e21b5159-9be3-5385-952d-163aa767d089', 'InFour Wheel Care And Tyres - Tata Power', 'InFour Wheel Care And Tyres - Tata Power, Perinthalmanna, Kerala, India', 10.96023797, 76.23467881, 'India EV Network License', 'LIC-IN-ST599', 500.0, 60.0, true, 'Perinthalmanna', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8796d7f9-6d0e-5cc0-81f8-81043c8ab40f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b6dbd209-ae3b-5dc6-9f3c-3f2f11851af1', '8796d7f9-6d0e-5cc0-81f8-81043c8ab40f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('99605b68-de11-55b2-90a3-53b774729957', '8796d7f9-6d0e-5cc0-81f8-81043c8ab40f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 600: TML KVR Automotive - Tata Power (Perinthalmanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ddff14bf-7a01-5bfe-ab21-f6548714c292', '00000000-0000-0000-0000-000000000000', 'st600@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st600@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ddff14bf-7a01-5bfe-ab21-f6548714c292', 'ddff14bf-7a01-5bfe-ab21-f6548714c292', '{"sub": "ddff14bf-7a01-5bfe-ab21-f6548714c292", "email": "st600@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ddff14bf-7a01-5bfe-ab21-f6548714c292')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ddff14bf-7a01-5bfe-ab21-f6548714c292', 'admin', 'st600@boss.com', 'Admin TML KVR Automotive - Tata Power', 'TML KVR Automotive - Tata Power', 'TML KVR Automotive - Tata Power, Perinthalmanna, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('38a87a0f-186c-5be6-baa3-b2bd34fed2be', 'ddff14bf-7a01-5bfe-ab21-f6548714c292', 'TML KVR Automotive - Tata Power', 'TML KVR Automotive - Tata Power, Perinthalmanna, Kerala, India', 10.98450272, 76.18784701, 'India EV Network License', 'LIC-IN-ST600', 500.0, 60.0, true, 'Perinthalmanna', 'Kerala', 2, 'Tata Power', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '38a87a0f-186c-5be6-baa3-b2bd34fed2be';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f9851a79-a0ee-586c-9dbe-4144e86b175c', '38a87a0f-186c-5be6-baa3-b2bd34fed2be', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('94153927-a826-55a6-a482-26f86d9cf4bc', '38a87a0f-186c-5be6-baa3-b2bd34fed2be', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
