-- Seed Stations Part 5 (Stations 401 to 500)
BEGIN;

-- Station 401: Lulu Mall EVCS (Govindapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c59f83ad-10ed-5b52-b4a9-d4f246a630c5', '00000000-0000-0000-0000-000000000000', 'st401@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st401@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c59f83ad-10ed-5b52-b4a9-d4f246a630c5', 'c59f83ad-10ed-5b52-b4a9-d4f246a630c5', '{"sub": "c59f83ad-10ed-5b52-b4a9-d4f246a630c5", "email": "st401@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c59f83ad-10ed-5b52-b4a9-d4f246a630c5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c59f83ad-10ed-5b52-b4a9-d4f246a630c5', 'admin', 'st401@boss.com', 'Admin Lulu Mall EVCS', 'Lulu Mall EVCS', 'Lulu Mall EVCS, Govindapuram, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('eb41cad6-5c98-5421-aabd-e3d6428820eb', 'c59f83ad-10ed-5b52-b4a9-d4f246a630c5', 'Lulu Mall EVCS', 'Lulu Mall EVCS, Govindapuram, Kerala, India', 11.24085462, 75.80269852, 'India EV Network License', 'LIC-IN-ST401', 500.0, 7.4, true, 'Govindapuram', 'Kerala', 1, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'eb41cad6-5c98-5421-aabd-e3d6428820eb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6c0325cc-770d-53c6-9740-10a630f888b5', 'eb41cad6-5c98-5421-aabd-e3d6428820eb', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 402: Iris Mall EVCS (Balusseri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6e4d1e06-1eb9-525a-be68-7ed00ea37481', '00000000-0000-0000-0000-000000000000', 'st402@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st402@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6e4d1e06-1eb9-525a-be68-7ed00ea37481', '6e4d1e06-1eb9-525a-be68-7ed00ea37481', '{"sub": "6e4d1e06-1eb9-525a-be68-7ed00ea37481", "email": "st402@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6e4d1e06-1eb9-525a-be68-7ed00ea37481')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6e4d1e06-1eb9-525a-be68-7ed00ea37481', 'admin', 'st402@boss.com', 'Admin Iris Mall EVCS', 'Iris Mall EVCS', 'Iris Mall EVCS, Balusseri, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('37bf2110-8188-5763-a414-809e55d1b9e1', '6e4d1e06-1eb9-525a-be68-7ed00ea37481', 'Iris Mall EVCS', 'Iris Mall EVCS, Balusseri, Kerala, India', 11.44624844, 75.83307969, 'India EV Network License', 'LIC-IN-ST402', 500.0, 7.4, true, 'Balusseri', 'Kerala', 1, 'GO EC (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '37bf2110-8188-5763-a414-809e55d1b9e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd952ecb-88e1-502f-b837-c9bca0b190e6', '37bf2110-8188-5763-a414-809e55d1b9e1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 403: Elektron EVCS (Perambra, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4c895310-94f1-5614-913e-414f470bee35', '00000000-0000-0000-0000-000000000000', 'st403@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st403@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4c895310-94f1-5614-913e-414f470bee35', '4c895310-94f1-5614-913e-414f470bee35', '{"sub": "4c895310-94f1-5614-913e-414f470bee35", "email": "st403@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4c895310-94f1-5614-913e-414f470bee35')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4c895310-94f1-5614-913e-414f470bee35', 'admin', 'st403@boss.com', 'Admin Elektron EVCS', 'Elektron EVCS', 'Elektron EVCS, Perambra, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('06f79702-76b3-5b93-804a-7677be3dcc3e', '4c895310-94f1-5614-913e-414f470bee35', 'Elektron EVCS', 'Elektron EVCS, Perambra, Kerala, India', 11.55125369, 75.74625711, 'India EV Network License', 'LIC-IN-ST403', 500.0, 7.4, true, 'Perambra', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '06f79702-76b3-5b93-804a-7677be3dcc3e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('348c4c7d-32b8-599f-b480-233f25c6a30d', '06f79702-76b3-5b93-804a-7677be3dcc3e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 404: Power Drive EV Supercharging Station (Anjarakandy, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e276cd59-758f-59ac-86f8-6c17bc984a42', '00000000-0000-0000-0000-000000000000', 'st404@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st404@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e276cd59-758f-59ac-86f8-6c17bc984a42', 'e276cd59-758f-59ac-86f8-6c17bc984a42', '{"sub": "e276cd59-758f-59ac-86f8-6c17bc984a42", "email": "st404@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e276cd59-758f-59ac-86f8-6c17bc984a42')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e276cd59-758f-59ac-86f8-6c17bc984a42', 'admin', 'st404@boss.com', 'Admin Power Drive EV Supercharging Station', 'Power Drive EV Supercharging Station', 'Power Drive EV Supercharging Station, Anjarakandy, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f0ee2353-17bf-5920-b1d4-e12a2e0e3c94', 'e276cd59-758f-59ac-86f8-6c17bc984a42', 'Power Drive EV Supercharging Station', 'Power Drive EV Supercharging Station, Anjarakandy, Kerala, India', 11.88139916, 75.50131377, 'India EV Network License', 'LIC-IN-ST404', 500.0, 7.4, true, 'Anjarakandy', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f0ee2353-17bf-5920-b1d4-e12a2e0e3c94';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6915d5d1-a5d5-5881-be44-d0a8bc5df45d', 'f0ee2353-17bf-5920-b1d4-e12a2e0e3c94', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 405: Sreekandapuram Samudra EVCS (Sreekandapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('61749baf-6707-5afa-b752-3af2de90992d', '00000000-0000-0000-0000-000000000000', 'st405@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st405@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('61749baf-6707-5afa-b752-3af2de90992d', '61749baf-6707-5afa-b752-3af2de90992d', '{"sub": "61749baf-6707-5afa-b752-3af2de90992d", "email": "st405@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '61749baf-6707-5afa-b752-3af2de90992d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('61749baf-6707-5afa-b752-3af2de90992d', 'admin', 'st405@boss.com', 'Admin Sreekandapuram Samudra EVCS', 'Sreekandapuram Samudra EVCS', 'Sreekandapuram Samudra EVCS, Sreekandapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d0e5c858-46ac-5959-b430-2a606c08ea57', '61749baf-6707-5afa-b752-3af2de90992d', 'Sreekandapuram Samudra EVCS', 'Sreekandapuram Samudra EVCS, Sreekandapuram, Kerala, India', 12.04252833, 75.50983364, 'India EV Network License', 'LIC-IN-ST405', 500.0, 7.4, true, 'Sreekandapuram', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd0e5c858-46ac-5959-b430-2a606c08ea57';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('aad5643b-6796-5061-9cd5-48ec1a11f264', 'd0e5c858-46ac-5959-b430-2a606c08ea57', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 406: Tamar Cafe (Kumbla, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('29e07118-4e74-5a9a-90ec-0a749d5d4664', '00000000-0000-0000-0000-000000000000', 'st406@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st406@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('29e07118-4e74-5a9a-90ec-0a749d5d4664', '29e07118-4e74-5a9a-90ec-0a749d5d4664', '{"sub": "29e07118-4e74-5a9a-90ec-0a749d5d4664", "email": "st406@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '29e07118-4e74-5a9a-90ec-0a749d5d4664')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('29e07118-4e74-5a9a-90ec-0a749d5d4664', 'admin', 'st406@boss.com', 'Admin Tamar Cafe', 'Tamar Cafe', 'Tamar Cafe, Kumbla, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2a2fc8ee-dab6-5859-8365-69b03080ad42', '29e07118-4e74-5a9a-90ec-0a749d5d4664', 'Tamar Cafe', 'Tamar Cafe, Kumbla, Kerala, India', 12.60628184, 74.93843824, 'India EV Network License', 'LIC-IN-ST406', 500.0, 7.4, true, 'Kumbla', 'Kerala', 1, 'GO EC (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2a2fc8ee-dab6-5859-8365-69b03080ad42';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0aff5029-49f0-5f63-85ed-4a8f6557da71', '2a2fc8ee-dab6-5859-8365-69b03080ad42', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 407: Sheraton Grand Chennai Resort (Chennai, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('68674e60-eea2-52f1-b2af-bffa8b8744de', '00000000-0000-0000-0000-000000000000', 'st407@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st407@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('68674e60-eea2-52f1-b2af-bffa8b8744de', '68674e60-eea2-52f1-b2af-bffa8b8744de', '{"sub": "68674e60-eea2-52f1-b2af-bffa8b8744de", "email": "st407@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '68674e60-eea2-52f1-b2af-bffa8b8744de')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('68674e60-eea2-52f1-b2af-bffa8b8744de', 'admin', 'st407@boss.com', 'Admin Sheraton Grand Chennai Resort', 'Sheraton Grand Chennai Resort', 'Sheraton Grand Chennai Resort, Chennai, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bf22b8d3-61ca-5ebe-af2f-d334df31eae1', '68674e60-eea2-52f1-b2af-bffa8b8744de', 'Sheraton Grand Chennai Resort', 'Sheraton Grand Chennai Resort, Chennai, Tamil Nadu, India', 12.74428581, 80.2392813, 'India EV Network License', 'LIC-IN-ST407', 500.0, 7.4, true, 'Chennai', 'Tamil Nadu', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bf22b8d3-61ca-5ebe-af2f-d334df31eae1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b2d1c07d-ebc6-5dcd-b64f-872cf5a2a5c0', 'bf22b8d3-61ca-5ebe-af2f-d334df31eae1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 408: Four Points By Sheraton (Mahabalipuram, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('74e8a8ff-2bbd-5dd3-88d1-3f4177b4a3b2', '00000000-0000-0000-0000-000000000000', 'st408@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st408@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('74e8a8ff-2bbd-5dd3-88d1-3f4177b4a3b2', '74e8a8ff-2bbd-5dd3-88d1-3f4177b4a3b2', '{"sub": "74e8a8ff-2bbd-5dd3-88d1-3f4177b4a3b2", "email": "st408@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '74e8a8ff-2bbd-5dd3-88d1-3f4177b4a3b2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('74e8a8ff-2bbd-5dd3-88d1-3f4177b4a3b2', 'admin', 'st408@boss.com', 'Admin Four Points By Sheraton', 'Four Points By Sheraton', 'Four Points By Sheraton, Mahabalipuram, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f79abfcd-0c55-5e2b-a273-f05ee4047634', '74e8a8ff-2bbd-5dd3-88d1-3f4177b4a3b2', 'Four Points By Sheraton', 'Four Points By Sheraton, Mahabalipuram, Tamil Nadu, India', 12.61307921, 80.16879624, 'India EV Network License', 'LIC-IN-ST408', 500.0, 7.4, true, 'Mahabalipuram', 'Tamil Nadu', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f79abfcd-0c55-5e2b-a273-f05ee4047634';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('103670d4-832c-546c-bf4d-15bf1c2127fc', 'f79abfcd-0c55-5e2b-a273-f05ee4047634', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 409: Pondur - Oragadam (Sriperumbudur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('28981d65-c441-56ea-991c-f54fa0fe9be4', '00000000-0000-0000-0000-000000000000', 'st409@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st409@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('28981d65-c441-56ea-991c-f54fa0fe9be4', '28981d65-c441-56ea-991c-f54fa0fe9be4', '{"sub": "28981d65-c441-56ea-991c-f54fa0fe9be4", "email": "st409@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '28981d65-c441-56ea-991c-f54fa0fe9be4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('28981d65-c441-56ea-991c-f54fa0fe9be4', 'admin', 'st409@boss.com', 'Admin Pondur - Oragadam', 'Pondur - Oragadam', 'Pondur - Oragadam, Sriperumbudur, Tamil Nadu, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('68467ea6-2442-53fe-9a06-ca5067ad7adb', '28981d65-c441-56ea-991c-f54fa0fe9be4', 'Pondur - Oragadam', 'Pondur - Oragadam, Sriperumbudur, Tamil Nadu, India', 12.92743399, 79.93416223, 'India EV Network License', 'LIC-IN-ST409', 500.0, 7.4, true, 'Sriperumbudur', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '68467ea6-2442-53fe-9a06-ca5067ad7adb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7550bb2d-824e-584b-9b6f-24a026e9a500', '68467ea6-2442-53fe-9a06-ca5067ad7adb', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 410: Fairfield By Marriott (Sriperumbudur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('28b62350-153d-58c6-9d50-a4817742a8e7', '00000000-0000-0000-0000-000000000000', 'st410@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st410@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('28b62350-153d-58c6-9d50-a4817742a8e7', '28b62350-153d-58c6-9d50-a4817742a8e7', '{"sub": "28b62350-153d-58c6-9d50-a4817742a8e7", "email": "st410@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '28b62350-153d-58c6-9d50-a4817742a8e7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('28b62350-153d-58c6-9d50-a4817742a8e7', 'admin', 'st410@boss.com', 'Admin Fairfield By Marriott', 'Fairfield By Marriott', 'Fairfield By Marriott, Sriperumbudur, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0388897f-b8c7-55d9-bcc8-d4ac91587248', '28b62350-153d-58c6-9d50-a4817742a8e7', 'Fairfield By Marriott', 'Fairfield By Marriott, Sriperumbudur, Tamil Nadu, India', 12.93260726, 79.90581636, 'India EV Network License', 'LIC-IN-ST410', 500.0, 7.4, true, 'Sriperumbudur', 'Tamil Nadu', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0388897f-b8c7-55d9-bcc8-d4ac91587248';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d52874f8-84eb-5cb2-ad09-68663ffc473b', '0388897f-b8c7-55d9-bcc8-d4ac91587248', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 411: Hotel Seasons (Tiruvannamalai, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a65a6070-8d90-500b-930a-837f93e98f96', '00000000-0000-0000-0000-000000000000', 'st411@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st411@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a65a6070-8d90-500b-930a-837f93e98f96', 'a65a6070-8d90-500b-930a-837f93e98f96', '{"sub": "a65a6070-8d90-500b-930a-837f93e98f96", "email": "st411@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a65a6070-8d90-500b-930a-837f93e98f96')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a65a6070-8d90-500b-930a-837f93e98f96', 'admin', 'st411@boss.com', 'Admin Hotel Seasons', 'Hotel Seasons', 'Hotel Seasons, Tiruvannamalai, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('65f29d81-ad3c-591c-aecc-24abe6db5855', 'a65a6070-8d90-500b-930a-837f93e98f96', 'Hotel Seasons', 'Hotel Seasons, Tiruvannamalai, Tamil Nadu, India', 12.25866069, 79.06838859, 'India EV Network License', 'LIC-IN-ST411', 500.0, 7.4, true, 'Tiruvannamalai', 'Tamil Nadu', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '65f29d81-ad3c-591c-aecc-24abe6db5855';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('757065f3-3269-586e-93c0-e7ef8aca27f7', '65f29d81-ad3c-591c-aecc-24abe6db5855', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 412: Sugam Hospitality (Arasur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2a4886ce-334e-58da-8e0f-650e5a363961', '00000000-0000-0000-0000-000000000000', 'st412@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st412@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2a4886ce-334e-58da-8e0f-650e5a363961', '2a4886ce-334e-58da-8e0f-650e5a363961', '{"sub": "2a4886ce-334e-58da-8e0f-650e5a363961", "email": "st412@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2a4886ce-334e-58da-8e0f-650e5a363961')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2a4886ce-334e-58da-8e0f-650e5a363961', 'admin', 'st412@boss.com', 'Admin Sugam Hospitality', 'Sugam Hospitality', 'Sugam Hospitality, Arasur, Tamil Nadu, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('34adb63c-9bc0-53e2-80b7-e5d4cc66bad5', '2a4886ce-334e-58da-8e0f-650e5a363961', 'Sugam Hospitality', 'Sugam Hospitality, Arasur, Tamil Nadu, India', 11.81284597, 79.41801965, 'India EV Network License', 'LIC-IN-ST412', 500.0, 7.4, true, 'Arasur', 'Tamil Nadu', 1, 'Chargezone (India)', '24 Hours (Hospital)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '34adb63c-9bc0-53e2-80b7-e5d4cc66bad5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('15b29067-b8c6-521f-a262-90b9282893d1', '34adb63c-9bc0-53e2-80b7-e5d4cc66bad5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 413: Ashva Hyundai (Elambalur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f4bc5579-c774-5642-a77f-fe96a73aa422', '00000000-0000-0000-0000-000000000000', 'st413@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st413@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f4bc5579-c774-5642-a77f-fe96a73aa422', 'f4bc5579-c774-5642-a77f-fe96a73aa422', '{"sub": "f4bc5579-c774-5642-a77f-fe96a73aa422", "email": "st413@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f4bc5579-c774-5642-a77f-fe96a73aa422')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f4bc5579-c774-5642-a77f-fe96a73aa422', 'admin', 'st413@boss.com', 'Admin Ashva Hyundai', 'Ashva Hyundai', 'Ashva Hyundai, Elambalur, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c00b20a7-a7be-5be3-b25c-3739e47a5119', 'f4bc5579-c774-5642-a77f-fe96a73aa422', 'Ashva Hyundai', 'Ashva Hyundai, Elambalur, Tamil Nadu, India', 11.26305138, 78.89741318, 'India EV Network License', 'LIC-IN-ST413', 500.0, 7.4, true, 'Elambalur', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c00b20a7-a7be-5be3-b25c-3739e47a5119';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9b864a89-93cd-5228-9f4b-e51ce25af54a', 'c00b20a7-a7be-5be3-b25c-3739e47a5119', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 414: Kovai Hyundai (Salem, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4cc1bb25-c12a-5fa0-aebd-94dba87ec379', '00000000-0000-0000-0000-000000000000', 'st414@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st414@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4cc1bb25-c12a-5fa0-aebd-94dba87ec379', '4cc1bb25-c12a-5fa0-aebd-94dba87ec379', '{"sub": "4cc1bb25-c12a-5fa0-aebd-94dba87ec379", "email": "st414@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4cc1bb25-c12a-5fa0-aebd-94dba87ec379')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4cc1bb25-c12a-5fa0-aebd-94dba87ec379', 'admin', 'st414@boss.com', 'Admin Kovai Hyundai', 'Kovai Hyundai', 'Kovai Hyundai, Salem, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1b0c4f91-7112-5f06-96fd-5ca239192238', '4cc1bb25-c12a-5fa0-aebd-94dba87ec379', 'Kovai Hyundai', 'Kovai Hyundai, Salem, Tamil Nadu, India', 11.64835524, 78.12020883, 'India EV Network License', 'LIC-IN-ST414', 500.0, 7.4, true, 'Salem', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1b0c4f91-7112-5f06-96fd-5ca239192238';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6448960d-9a4b-5b1d-9389-da4840a5dae7', '1b0c4f91-7112-5f06-96fd-5ca239192238', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 415: Lotus Hyundai (Coimbatore, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a4c3b3b4-9094-552f-832a-91cfc3167ed5', '00000000-0000-0000-0000-000000000000', 'st415@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st415@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a4c3b3b4-9094-552f-832a-91cfc3167ed5', 'a4c3b3b4-9094-552f-832a-91cfc3167ed5', '{"sub": "a4c3b3b4-9094-552f-832a-91cfc3167ed5", "email": "st415@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a4c3b3b4-9094-552f-832a-91cfc3167ed5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a4c3b3b4-9094-552f-832a-91cfc3167ed5', 'admin', 'st415@boss.com', 'Admin Lotus Hyundai', 'Lotus Hyundai', 'Lotus Hyundai, Coimbatore, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4aef411c-5375-57f6-a9c2-0dc984139d84', 'a4c3b3b4-9094-552f-832a-91cfc3167ed5', 'Lotus Hyundai', 'Lotus Hyundai, Coimbatore, Tamil Nadu, India', 11.04548355, 76.98578975, 'India EV Network License', 'LIC-IN-ST415', 500.0, 7.4, true, 'Coimbatore', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4aef411c-5375-57f6-a9c2-0dc984139d84';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8391c9bc-e191-5732-9114-4c2728b593e2', '4aef411c-5375-57f6-a9c2-0dc984139d84', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 416: Vetri Hyundai (Thanjavur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8098c419-a8c2-503f-9492-c87dbbbc010f', '00000000-0000-0000-0000-000000000000', 'st416@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st416@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8098c419-a8c2-503f-9492-c87dbbbc010f', '8098c419-a8c2-503f-9492-c87dbbbc010f', '{"sub": "8098c419-a8c2-503f-9492-c87dbbbc010f", "email": "st416@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8098c419-a8c2-503f-9492-c87dbbbc010f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8098c419-a8c2-503f-9492-c87dbbbc010f', 'admin', 'st416@boss.com', 'Admin Vetri Hyundai', 'Vetri Hyundai', 'Vetri Hyundai, Thanjavur, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('79f090cc-98ad-5e15-b25e-6b39aa20b3d1', '8098c419-a8c2-503f-9492-c87dbbbc010f', 'Vetri Hyundai', 'Vetri Hyundai, Thanjavur, Tamil Nadu, India', 10.74085677, 79.10755813, 'India EV Network License', 'LIC-IN-ST416', 500.0, 7.4, true, 'Thanjavur', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '79f090cc-98ad-5e15-b25e-6b39aa20b3d1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8e38d643-d877-5984-8ca4-9ec916b2bf43', '79f090cc-98ad-5e15-b25e-6b39aa20b3d1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 417: Courtyard By Marriott (Tiruchirappalli, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('acef520b-2535-5bf7-bdbf-c5786c6c206a', '00000000-0000-0000-0000-000000000000', 'st417@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st417@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('acef520b-2535-5bf7-bdbf-c5786c6c206a', 'acef520b-2535-5bf7-bdbf-c5786c6c206a', '{"sub": "acef520b-2535-5bf7-bdbf-c5786c6c206a", "email": "st417@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'acef520b-2535-5bf7-bdbf-c5786c6c206a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('acef520b-2535-5bf7-bdbf-c5786c6c206a', 'admin', 'st417@boss.com', 'Admin Courtyard By Marriott', 'Courtyard By Marriott', 'Courtyard By Marriott, Tiruchirappalli, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b65f2ed6-9feb-520f-b1be-72cab8886124', 'acef520b-2535-5bf7-bdbf-c5786c6c206a', 'Courtyard By Marriott', 'Courtyard By Marriott, Tiruchirappalli, Tamil Nadu, India', 10.80435322, 78.67725322, 'India EV Network License', 'LIC-IN-ST417', 500.0, 7.4, true, 'Tiruchirappalli', 'Tamil Nadu', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b65f2ed6-9feb-520f-b1be-72cab8886124';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dc5797e1-a2d8-5267-a91a-058e9fe18141', 'b65f2ed6-9feb-520f-b1be-72cab8886124', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 418: Oxina Hyundai (Tiruchirappalli, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d216cbf0-77bd-5051-bc2b-b5f82a6c4f1e', '00000000-0000-0000-0000-000000000000', 'st418@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st418@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d216cbf0-77bd-5051-bc2b-b5f82a6c4f1e', 'd216cbf0-77bd-5051-bc2b-b5f82a6c4f1e', '{"sub": "d216cbf0-77bd-5051-bc2b-b5f82a6c4f1e", "email": "st418@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd216cbf0-77bd-5051-bc2b-b5f82a6c4f1e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d216cbf0-77bd-5051-bc2b-b5f82a6c4f1e', 'admin', 'st418@boss.com', 'Admin Oxina Hyundai', 'Oxina Hyundai', 'Oxina Hyundai, Tiruchirappalli, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('98987907-2628-562b-aa0c-fd5d3c60767c', 'd216cbf0-77bd-5051-bc2b-b5f82a6c4f1e', 'Oxina Hyundai', 'Oxina Hyundai, Tiruchirappalli, Tamil Nadu, India', 10.7912074, 78.65778448, 'India EV Network License', 'LIC-IN-ST418', 500.0, 7.4, true, 'Tiruchirappalli', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '98987907-2628-562b-aa0c-fd5d3c60767c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4b64c0b5-3e7b-5a3f-b00f-12cdd3ba3d12', '98987907-2628-562b-aa0c-fd5d3c60767c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 419: Surya's Veggie Restaurant (Vaiyampatti, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('181a14a2-64fe-5941-8d5d-895677349a17', '00000000-0000-0000-0000-000000000000', 'st419@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st419@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('181a14a2-64fe-5941-8d5d-895677349a17', '181a14a2-64fe-5941-8d5d-895677349a17', '{"sub": "181a14a2-64fe-5941-8d5d-895677349a17", "email": "st419@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '181a14a2-64fe-5941-8d5d-895677349a17')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('181a14a2-64fe-5941-8d5d-895677349a17', 'admin', 'st419@boss.com', 'Admin Surya''s Veggie Restaurant', 'Surya''s Veggie Restaurant', 'Surya''s Veggie Restaurant, Vaiyampatti, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, created_at)
VALUES ('b437a9a5-68ba-5b93-bad0-d404473cc690', '181a14a2-64fe-5941-8d5d-895677349a17', 'Surya''s Veggie Restaurant', 'Surya''s Veggie Restaurant, Vaiyampatti, Tamil Nadu, India', 10.56066896, 78.32180842, 'India EV Network License', 'LIC-IN-ST419', 500.0, 49.0, true, 'Vaiyampatti', 'Tamil Nadu', 2, 'Chargezone (India)', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('acb091b6-dedf-5fe9-a7a3-3800bbe25946', 'b437a9a5-68ba-5b93-bad0-d404473cc690', 'Port A', 50, 'available', 0, 'GB/T', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('825133d0-b3a7-5c00-b587-20d0a7f570e8', 'b437a9a5-68ba-5b93-bad0-d404473cc690', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO NOTHING;

-- Station 420: Sree Karpagamoorthy Automobiles (Karaikudi, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7d2443aa-f100-5ab3-8aef-0d1c4dc0b3a0', '00000000-0000-0000-0000-000000000000', 'st420@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st420@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7d2443aa-f100-5ab3-8aef-0d1c4dc0b3a0', '7d2443aa-f100-5ab3-8aef-0d1c4dc0b3a0', '{"sub": "7d2443aa-f100-5ab3-8aef-0d1c4dc0b3a0", "email": "st420@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7d2443aa-f100-5ab3-8aef-0d1c4dc0b3a0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7d2443aa-f100-5ab3-8aef-0d1c4dc0b3a0', 'admin', 'st420@boss.com', 'Admin Sree Karpagamoorthy Automobiles', 'Sree Karpagamoorthy Automobiles', 'Sree Karpagamoorthy Automobiles, Karaikudi, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1c913a98-0388-5707-8901-d14662104abc', '7d2443aa-f100-5ab3-8aef-0d1c4dc0b3a0', 'Sree Karpagamoorthy Automobiles', 'Sree Karpagamoorthy Automobiles, Karaikudi, Tamil Nadu, India', 10.07007841, 78.72750458, 'India EV Network License', 'LIC-IN-ST420', 500.0, 7.4, true, 'Karaikudi', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1c913a98-0388-5707-8901-d14662104abc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b1b7faf1-d1cb-5292-bf50-3092d14998a3', '1c913a98-0388-5707-8901-d14662104abc', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 421: Veepees Bistro And Cafè (Tirumangalam, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9b637db4-9f1c-5022-869e-3731c7b01330', '00000000-0000-0000-0000-000000000000', 'st421@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st421@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9b637db4-9f1c-5022-869e-3731c7b01330', '9b637db4-9f1c-5022-869e-3731c7b01330', '{"sub": "9b637db4-9f1c-5022-869e-3731c7b01330", "email": "st421@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9b637db4-9f1c-5022-869e-3731c7b01330')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9b637db4-9f1c-5022-869e-3731c7b01330', 'admin', 'st421@boss.com', 'Admin Veepees Bistro And Cafè', 'Veepees Bistro And Cafè', 'Veepees Bistro And Cafè, Tirumangalam, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c8068812-6c26-5a4b-82ed-4e488ea46701', '9b637db4-9f1c-5022-869e-3731c7b01330', 'Veepees Bistro And Cafè', 'Veepees Bistro And Cafè, Tirumangalam, Tamil Nadu, India', 9.817119729, 77.97834107, 'India EV Network License', 'LIC-IN-ST421', 500.0, 7.4, true, 'Tirumangalam', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c8068812-6c26-5a4b-82ed-4e488ea46701';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6e7eee96-8d99-526d-bebb-402fadefb112', 'c8068812-6c26-5a4b-82ed-4e488ea46701', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 422: M. S. Shanmuganadar Mattai Kadai (Mettupatti, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b7716f2b-d469-5337-babc-e06550afe258', '00000000-0000-0000-0000-000000000000', 'st422@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st422@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b7716f2b-d469-5337-babc-e06550afe258', 'b7716f2b-d469-5337-babc-e06550afe258', '{"sub": "b7716f2b-d469-5337-babc-e06550afe258", "email": "st422@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b7716f2b-d469-5337-babc-e06550afe258')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b7716f2b-d469-5337-babc-e06550afe258', 'admin', 'st422@boss.com', 'Admin M. S. Shanmuganadar Mattai Kadai', 'M. S. Shanmuganadar Mattai Kadai', 'M. S. Shanmuganadar Mattai Kadai, Mettupatti, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('04e07ca9-586d-56d5-b49d-de437992e361', 'b7716f2b-d469-5337-babc-e06550afe258', 'M. S. Shanmuganadar Mattai Kadai', 'M. S. Shanmuganadar Mattai Kadai, Mettupatti, Tamil Nadu, India', 9.300003538, 77.91565811, 'India EV Network License', 'LIC-IN-ST422', 500.0, 7.4, true, 'Mettupatti', 'Tamil Nadu', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '04e07ca9-586d-56d5-b49d-de437992e361';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('962cc3d2-3254-5c8a-bc0e-d53db316df35', '04e07ca9-586d-56d5-b49d-de437992e361', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 423: Popular Hyundai (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a8a5d81d-7180-508f-85e3-db3a60d1d3be', '00000000-0000-0000-0000-000000000000', 'st423@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st423@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a8a5d81d-7180-508f-85e3-db3a60d1d3be', 'a8a5d81d-7180-508f-85e3-db3a60d1d3be', '{"sub": "a8a5d81d-7180-508f-85e3-db3a60d1d3be", "email": "st423@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a8a5d81d-7180-508f-85e3-db3a60d1d3be')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a8a5d81d-7180-508f-85e3-db3a60d1d3be', 'admin', 'st423@boss.com', 'Admin Popular Hyundai', 'Popular Hyundai', 'Popular Hyundai, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('660fc032-7beb-5b2a-b2a0-02613e6f0efa', 'a8a5d81d-7180-508f-85e3-db3a60d1d3be', 'Popular Hyundai', 'Popular Hyundai, Thrissur, Kerala, India', 10.50242024, 76.25798226, 'India EV Network License', 'LIC-IN-ST423', 500.0, 7.4, true, 'Thrissur', 'Kerala', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '660fc032-7beb-5b2a-b2a0-02613e6f0efa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b293350d-f99f-536f-a01a-d359de7083b7', '660fc032-7beb-5b2a-b2a0-02613e6f0efa', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 424: Indus EV Charging (Nileshwaram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d53ebb35-5f28-556b-9803-ed900611a6a3', '00000000-0000-0000-0000-000000000000', 'st424@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st424@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d53ebb35-5f28-556b-9803-ed900611a6a3', 'd53ebb35-5f28-556b-9803-ed900611a6a3', '{"sub": "d53ebb35-5f28-556b-9803-ed900611a6a3", "email": "st424@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd53ebb35-5f28-556b-9803-ed900611a6a3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d53ebb35-5f28-556b-9803-ed900611a6a3', 'admin', 'st424@boss.com', 'Admin Indus EV Charging', 'Indus EV Charging', 'Indus EV Charging, Nileshwaram, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1c84f36f-a878-5c3c-9071-7105b3cd3fc8', 'd53ebb35-5f28-556b-9803-ed900611a6a3', 'Indus EV Charging', 'Indus EV Charging, Nileshwaram, Kerala, India', 12.25915661, 75.15052988, 'India EV Network License', 'LIC-IN-ST424', 500.0, 7.4, true, 'Nileshwaram', 'Kerala', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1c84f36f-a878-5c3c-9071-7105b3cd3fc8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9d50502f-f847-5bdc-9fd3-7354f392bd0d', '1c84f36f-a878-5c3c-9071-7105b3cd3fc8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 425: JBS Bistro Cafe (Tirunelveli, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('008e3775-d2d7-540a-88a4-9115d8641378', '00000000-0000-0000-0000-000000000000', 'st425@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st425@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('008e3775-d2d7-540a-88a4-9115d8641378', '008e3775-d2d7-540a-88a4-9115d8641378', '{"sub": "008e3775-d2d7-540a-88a4-9115d8641378", "email": "st425@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '008e3775-d2d7-540a-88a4-9115d8641378')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('008e3775-d2d7-540a-88a4-9115d8641378', 'admin', 'st425@boss.com', 'Admin JBS Bistro Cafe', 'JBS Bistro Cafe', 'JBS Bistro Cafe, Tirunelveli, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8256fe7e-9bd6-553e-8df8-1d9ed997e854', '008e3775-d2d7-540a-88a4-9115d8641378', 'JBS Bistro Cafe', 'JBS Bistro Cafe, Tirunelveli, Tamil Nadu, India', 8.540251135, 77.6695171, 'India EV Network License', 'LIC-IN-ST425', 500.0, 7.4, true, 'Tirunelveli', 'Tamil Nadu', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8256fe7e-9bd6-553e-8df8-1d9ed997e854';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7cab8e04-0dc9-5025-9bf6-088a35a62fb6', '8256fe7e-9bd6-553e-8df8-1d9ed997e854', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 426: Hydra Charging Station (Dharapuram, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('af4b6f92-c5fb-55aa-9b2e-b974dfe65ffb', '00000000-0000-0000-0000-000000000000', 'st426@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st426@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('af4b6f92-c5fb-55aa-9b2e-b974dfe65ffb', 'af4b6f92-c5fb-55aa-9b2e-b974dfe65ffb', '{"sub": "af4b6f92-c5fb-55aa-9b2e-b974dfe65ffb", "email": "st426@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'af4b6f92-c5fb-55aa-9b2e-b974dfe65ffb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('af4b6f92-c5fb-55aa-9b2e-b974dfe65ffb', 'admin', 'st426@boss.com', 'Admin Hydra Charging Station', 'Hydra Charging Station', 'Hydra Charging Station, Dharapuram, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6ac414e3-4070-5522-8a75-fb276c9d4693', 'af4b6f92-c5fb-55aa-9b2e-b974dfe65ffb', 'Hydra Charging Station', 'Hydra Charging Station, Dharapuram, Tamil Nadu, India', 10.71722243, 77.5562138, 'India EV Network License', 'LIC-IN-ST426', 500.0, 7.4, true, 'Dharapuram', 'Tamil Nadu', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6ac414e3-4070-5522-8a75-fb276c9d4693';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('27f09796-5984-5532-b1b5-fd7a65e7c33d', '6ac414e3-4070-5522-8a75-fb276c9d4693', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 427: Hydra Charging Station (Singallur, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a221de4e-7818-5eea-b007-5e0c8739f8d3', '00000000-0000-0000-0000-000000000000', 'st427@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st427@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a221de4e-7818-5eea-b007-5e0c8739f8d3', 'a221de4e-7818-5eea-b007-5e0c8739f8d3', '{"sub": "a221de4e-7818-5eea-b007-5e0c8739f8d3", "email": "st427@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a221de4e-7818-5eea-b007-5e0c8739f8d3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a221de4e-7818-5eea-b007-5e0c8739f8d3', 'admin', 'st427@boss.com', 'Admin Hydra Charging Station', 'Hydra Charging Station', 'Hydra Charging Station, Singallur, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('879449d0-e2f4-59a3-8de8-2323a23d2bdd', 'a221de4e-7818-5eea-b007-5e0c8739f8d3', 'Hydra Charging Station', 'Hydra Charging Station, Singallur, Tamil Nadu, India', 10.9967578, 77.00865211, 'India EV Network License', 'LIC-IN-ST427', 500.0, 7.4, true, 'Singallur', 'Tamil Nadu', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '879449d0-e2f4-59a3-8de8-2323a23d2bdd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('24fe0d5d-a0af-53ac-8f26-272ad170f6ba', '879449d0-e2f4-59a3-8de8-2323a23d2bdd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 428: Hydra Charging (Coimbatore, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3e611d04-885e-572a-97fe-a98403f6d542', '00000000-0000-0000-0000-000000000000', 'st428@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st428@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3e611d04-885e-572a-97fe-a98403f6d542', '3e611d04-885e-572a-97fe-a98403f6d542', '{"sub": "3e611d04-885e-572a-97fe-a98403f6d542", "email": "st428@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3e611d04-885e-572a-97fe-a98403f6d542')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3e611d04-885e-572a-97fe-a98403f6d542', 'admin', 'st428@boss.com', 'Admin Hydra Charging', 'Hydra Charging', 'Hydra Charging, Coimbatore, Tamil Nadu, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6dd6caa6-02db-56d2-9ffd-f8e967127941', '3e611d04-885e-572a-97fe-a98403f6d542', 'Hydra Charging', 'Hydra Charging, Coimbatore, Tamil Nadu, India', 11.05285775, 76.94583684, 'India EV Network License', 'LIC-IN-ST428', 500.0, 7.4, true, 'Coimbatore', 'Tamil Nadu', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6dd6caa6-02db-56d2-9ffd-f8e967127941';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06877108-7c07-5eac-9615-f4633d2c5d64', '6dd6caa6-02db-56d2-9ffd-f8e967127941', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 429: Hydra Charging Station (Mettupalayam, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4b2a8f5d-4788-54be-b39c-715cc316c46d', '00000000-0000-0000-0000-000000000000', 'st429@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st429@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4b2a8f5d-4788-54be-b39c-715cc316c46d', '4b2a8f5d-4788-54be-b39c-715cc316c46d', '{"sub": "4b2a8f5d-4788-54be-b39c-715cc316c46d", "email": "st429@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4b2a8f5d-4788-54be-b39c-715cc316c46d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4b2a8f5d-4788-54be-b39c-715cc316c46d', 'admin', 'st429@boss.com', 'Admin Hydra Charging Station', 'Hydra Charging Station', 'Hydra Charging Station, Mettupalayam, Tamil Nadu, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4c04322e-5fc2-5005-815a-780b5e86cb1e', '4b2a8f5d-4788-54be-b39c-715cc316c46d', 'Hydra Charging Station', 'Hydra Charging Station, Mettupalayam, Tamil Nadu, India', 11.31864953, 76.92080873, 'India EV Network License', 'LIC-IN-ST429', 500.0, 7.4, true, 'Mettupalayam', 'Tamil Nadu', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4c04322e-5fc2-5005-815a-780b5e86cb1e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cc0b1bf8-d23a-5652-aa3a-ff55899e97d5', '4c04322e-5fc2-5005-815a-780b5e86cb1e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 430: Cherumattathil Agencies (Udayamperoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('41797000-e28d-56de-84af-65d00763a316', '00000000-0000-0000-0000-000000000000', 'st430@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st430@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('41797000-e28d-56de-84af-65d00763a316', '41797000-e28d-56de-84af-65d00763a316', '{"sub": "41797000-e28d-56de-84af-65d00763a316", "email": "st430@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '41797000-e28d-56de-84af-65d00763a316')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('41797000-e28d-56de-84af-65d00763a316', 'admin', 'st430@boss.com', 'Admin Cherumattathil Agencies', 'Cherumattathil Agencies', 'Cherumattathil Agencies, Udayamperoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('495253e9-1f95-5b6a-874f-3d32924318cd', '41797000-e28d-56de-84af-65d00763a316', 'Cherumattathil Agencies', 'Cherumattathil Agencies, Udayamperoor, Kerala, India', 9.910471286, 76.36446384, 'India EV Network License', 'LIC-IN-ST430', 500.0, 7.4, true, 'Udayamperoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '495253e9-1f95-5b6a-874f-3d32924318cd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('52d2d583-28b3-5fe6-a99f-b310ecaf9553', '495253e9-1f95-5b6a-874f-3d32924318cd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 431: Keys Select Kochi (Kochi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7e1f5378-3c5f-5532-929e-4e8b27ee8bc0', '00000000-0000-0000-0000-000000000000', 'st431@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st431@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7e1f5378-3c5f-5532-929e-4e8b27ee8bc0', '7e1f5378-3c5f-5532-929e-4e8b27ee8bc0', '{"sub": "7e1f5378-3c5f-5532-929e-4e8b27ee8bc0", "email": "st431@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7e1f5378-3c5f-5532-929e-4e8b27ee8bc0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7e1f5378-3c5f-5532-929e-4e8b27ee8bc0', 'admin', 'st431@boss.com', 'Admin Keys Select Kochi', 'Keys Select Kochi', 'Keys Select Kochi, Kochi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('553f4953-bb6c-559b-9107-bf8bbb105fe5', '7e1f5378-3c5f-5532-929e-4e8b27ee8bc0', 'Keys Select Kochi', 'Keys Select Kochi, Kochi, Kerala, India', 9.933191621, 76.30004945, 'India EV Network License', 'LIC-IN-ST431', 500.0, 7.4, true, 'Kochi', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '553f4953-bb6c-559b-9107-bf8bbb105fe5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('09801d37-897c-5ebb-b319-0107b07e6db4', '553f4953-bb6c-559b-9107-bf8bbb105fe5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 432: Lemon Tree Vembanad Lake Resort (Muhamma, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('432ab175-96f7-5010-91fc-e680b3ed4337', '00000000-0000-0000-0000-000000000000', 'st432@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st432@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('432ab175-96f7-5010-91fc-e680b3ed4337', '432ab175-96f7-5010-91fc-e680b3ed4337', '{"sub": "432ab175-96f7-5010-91fc-e680b3ed4337", "email": "st432@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '432ab175-96f7-5010-91fc-e680b3ed4337')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('432ab175-96f7-5010-91fc-e680b3ed4337', 'admin', 'st432@boss.com', 'Admin Lemon Tree Vembanad Lake Resort', 'Lemon Tree Vembanad Lake Resort', 'Lemon Tree Vembanad Lake Resort, Muhamma, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1c6f28a0-71d7-587d-b35f-00fdfcca8b05', '432ab175-96f7-5010-91fc-e680b3ed4337', 'Lemon Tree Vembanad Lake Resort', 'Lemon Tree Vembanad Lake Resort, Muhamma, Kerala, India', 9.619244356, 76.37218582, 'India EV Network License', 'LIC-IN-ST432', 500.0, 7.4, true, 'Muhamma', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1c6f28a0-71d7-587d-b35f-00fdfcca8b05';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('91ddc35d-8148-5d27-8d8d-43fc9868d02d', '1c6f28a0-71d7-587d-b35f-00fdfcca8b05', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 433: Key Select Thiruvananthapuram (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f98332c5-b4d8-5775-b2ce-63c90d1b2dda', '00000000-0000-0000-0000-000000000000', 'st433@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st433@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f98332c5-b4d8-5775-b2ce-63c90d1b2dda', 'f98332c5-b4d8-5775-b2ce-63c90d1b2dda', '{"sub": "f98332c5-b4d8-5775-b2ce-63c90d1b2dda", "email": "st433@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f98332c5-b4d8-5775-b2ce-63c90d1b2dda')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f98332c5-b4d8-5775-b2ce-63c90d1b2dda', 'admin', 'st433@boss.com', 'Admin Key Select Thiruvananthapuram', 'Key Select Thiruvananthapuram', 'Key Select Thiruvananthapuram, Thiruvananthapuram, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b0f21513-c4aa-5b63-91b6-eb4bb320e7a7', 'f98332c5-b4d8-5775-b2ce-63c90d1b2dda', 'Key Select Thiruvananthapuram', 'Key Select Thiruvananthapuram, Thiruvananthapuram, Kerala, India', 8.494716714, 76.95231018, 'India EV Network License', 'LIC-IN-ST433', 500.0, 7.4, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b0f21513-c4aa-5b63-91b6-eb4bb320e7a7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dade87c5-eae2-518d-b955-39c59f8d10b1', 'b0f21513-c4aa-5b63-91b6-eb4bb320e7a7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 434: Lemon Tree Hotel (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7c9fee20-c582-5712-a68f-504965095ac7', '00000000-0000-0000-0000-000000000000', 'st434@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st434@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7c9fee20-c582-5712-a68f-504965095ac7', '7c9fee20-c582-5712-a68f-504965095ac7', '{"sub": "7c9fee20-c582-5712-a68f-504965095ac7", "email": "st434@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7c9fee20-c582-5712-a68f-504965095ac7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7c9fee20-c582-5712-a68f-504965095ac7', 'admin', 'st434@boss.com', 'Admin Lemon Tree Hotel', 'Lemon Tree Hotel', 'Lemon Tree Hotel, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7e8c393a-8613-548b-951f-b1c7e5d7217d', '7c9fee20-c582-5712-a68f-504965095ac7', 'Lemon Tree Hotel', 'Lemon Tree Hotel, Kerala, India', 8.493284029, 76.9573161, 'India EV Network License', 'LIC-IN-ST434', 500.0, 7.4, true, 'Kozhikode', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7e8c393a-8613-548b-951f-b1c7e5d7217d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06c9b1f3-e0a1-5535-9006-8754c3752143', '7e8c393a-8613-548b-951f-b1c7e5d7217d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 435: KKOH (Nagercoil, Tamil Nadu)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('93ed0054-aeb1-518d-935b-efd9cc64676f', '00000000-0000-0000-0000-000000000000', 'st435@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st435@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('93ed0054-aeb1-518d-935b-efd9cc64676f', '93ed0054-aeb1-518d-935b-efd9cc64676f', '{"sub": "93ed0054-aeb1-518d-935b-efd9cc64676f", "email": "st435@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '93ed0054-aeb1-518d-935b-efd9cc64676f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('93ed0054-aeb1-518d-935b-efd9cc64676f', 'admin', 'st435@boss.com', 'Admin KKOH', 'KKOH', 'KKOH, Nagercoil, Tamil Nadu, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('045e9e5c-612c-5eb5-9ce8-66fe5ad294ee', '93ed0054-aeb1-518d-935b-efd9cc64676f', 'KKOH', 'KKOH, Nagercoil, Tamil Nadu, India', 8.194502907, 77.39441636, 'India EV Network License', 'LIC-IN-ST435', 500.0, 7.4, true, 'Nagercoil', 'Tamil Nadu', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '045e9e5c-612c-5eb5-9ce8-66fe5ad294ee';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0d0d310f-fea6-598c-8d4b-752773ac6327', '045e9e5c-612c-5eb5-9ce8-66fe5ad294ee', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 436: Regen Energy (Kechery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b21e2229-da6a-52a9-b4e1-8d71e4d7fdba', '00000000-0000-0000-0000-000000000000', 'st436@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st436@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b21e2229-da6a-52a9-b4e1-8d71e4d7fdba', 'b21e2229-da6a-52a9-b4e1-8d71e4d7fdba', '{"sub": "b21e2229-da6a-52a9-b4e1-8d71e4d7fdba", "email": "st436@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b21e2229-da6a-52a9-b4e1-8d71e4d7fdba')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b21e2229-da6a-52a9-b4e1-8d71e4d7fdba', 'admin', 'st436@boss.com', 'Admin Regen Energy', 'Regen Energy', 'Regen Energy, Kechery, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ee87c41f-c42d-57a6-b716-8933d4dbafa0', 'b21e2229-da6a-52a9-b4e1-8d71e4d7fdba', 'Regen Energy', 'Regen Energy, Kechery, Kerala, India', 10.66622295, 76.11344399, 'India EV Network License', 'LIC-IN-ST436', 500.0, 7.4, true, 'Kechery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ee87c41f-c42d-57a6-b716-8933d4dbafa0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9cb5d57d-847a-51bc-955f-bd44dfda75dd', 'ee87c41f-c42d-57a6-b716-8933d4dbafa0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 437: Driftnatuon Food Court NH44 (Warangal, Telangana)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6ca7aa3e-4713-5b7c-8527-453dd655b69e', '00000000-0000-0000-0000-000000000000', 'st437@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st437@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6ca7aa3e-4713-5b7c-8527-453dd655b69e', '6ca7aa3e-4713-5b7c-8527-453dd655b69e', '{"sub": "6ca7aa3e-4713-5b7c-8527-453dd655b69e", "email": "st437@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6ca7aa3e-4713-5b7c-8527-453dd655b69e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6ca7aa3e-4713-5b7c-8527-453dd655b69e', 'admin', 'st437@boss.com', 'Admin Driftnatuon Food Court NH44', 'Driftnatuon Food Court NH44', 'Driftnatuon Food Court NH44, Telangana, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d09a8c9b-cc05-5dfa-819b-0371b9456609', '6ca7aa3e-4713-5b7c-8527-453dd655b69e', 'Driftnatuon Food Court NH44', 'Driftnatuon Food Court NH44, Telangana, India', 16.81449384, 78.14832854, 'India EV Network License', 'LIC-IN-ST437', 500.0, 7.4, true, 'Warangal', 'Telangana', 1, 'Chargezone (India)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd09a8c9b-cc05-5dfa-819b-0371b9456609';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a1ecbd63-3ddb-5896-9fcc-1eb8c6d1691c', 'd09a8c9b-cc05-5dfa-819b-0371b9456609', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 438: Driftnation Food Court NH44 (Medchal-Malkajgiri, Telangana)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3a7d910c-205a-5336-a38e-622e97142ab1', '00000000-0000-0000-0000-000000000000', 'st438@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st438@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3a7d910c-205a-5336-a38e-622e97142ab1', '3a7d910c-205a-5336-a38e-622e97142ab1', '{"sub": "3a7d910c-205a-5336-a38e-622e97142ab1", "email": "st438@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3a7d910c-205a-5336-a38e-622e97142ab1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3a7d910c-205a-5336-a38e-622e97142ab1', 'admin', 'st438@boss.com', 'Admin Driftnation Food Court NH44', 'Driftnation Food Court NH44', 'Driftnation Food Court NH44, Telangana, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('221af837-11ab-5fd4-9ccb-a0082fb713bc', '3a7d910c-205a-5336-a38e-622e97142ab1', 'Driftnation Food Court NH44', 'Driftnation Food Court NH44, Telangana, India', 16.81475507, 78.14840023, 'India EV Network License', 'LIC-IN-ST438', 500.0, 7.4, true, 'Medchal-Malkajgiri', 'Telangana', 1, 'JIO BP Pulse (India)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '221af837-11ab-5fd4-9ccb-a0082fb713bc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2cd51f6c-4405-5abd-8207-7106aa28de91', '221af837-11ab-5fd4-9ccb-a0082fb713bc', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 439: SK Volt Hub Kovoor (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f7d2fd01-a842-5db4-bdef-7353e99c2b9b', '00000000-0000-0000-0000-000000000000', 'st439@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st439@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f7d2fd01-a842-5db4-bdef-7353e99c2b9b', 'f7d2fd01-a842-5db4-bdef-7353e99c2b9b', '{"sub": "f7d2fd01-a842-5db4-bdef-7353e99c2b9b", "email": "st439@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f7d2fd01-a842-5db4-bdef-7353e99c2b9b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f7d2fd01-a842-5db4-bdef-7353e99c2b9b', 'admin', 'st439@boss.com', 'Admin SK Volt Hub Kovoor', 'SK Volt Hub Kovoor', 'SK Volt Hub Kovoor, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('252e5c1d-0afb-52d3-b5e4-1e1411b6a1b5', 'f7d2fd01-a842-5db4-bdef-7353e99c2b9b', 'SK Volt Hub Kovoor', 'SK Volt Hub Kovoor, Kozhikode, Kerala, India', 11.26843239, 75.83115597, 'India EV Network License', 'LIC-IN-ST439', 500.0, 7.4, true, 'Kozhikode', 'Kerala', 1, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '252e5c1d-0afb-52d3-b5e4-1e1411b6a1b5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1ec7b3bf-3d60-5b7b-9906-a5948ed1fb43', '252e5c1d-0afb-52d3-b5e4-1e1411b6a1b5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 440: NE-4 KFC Parking (Karnal, Haryana)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e519c5b8-90c2-528f-806c-95ca166a976b', '00000000-0000-0000-0000-000000000000', 'st440@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st440@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e519c5b8-90c2-528f-806c-95ca166a976b', 'e519c5b8-90c2-528f-806c-95ca166a976b', '{"sub": "e519c5b8-90c2-528f-806c-95ca166a976b", "email": "st440@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e519c5b8-90c2-528f-806c-95ca166a976b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e519c5b8-90c2-528f-806c-95ca166a976b', 'admin', 'st440@boss.com', 'Admin NE-4 KFC Parking', 'NE-4 KFC Parking', 'NE-4 KFC Parking, Haryana, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('74e40da5-1b91-5bec-b37f-8db2ea45c44c', 'e519c5b8-90c2-528f-806c-95ca166a976b', 'NE-4 KFC Parking', 'NE-4 KFC Parking, Haryana, India', 27.73556257, 76.98387711, 'India EV Network License', 'LIC-IN-ST440', 500.0, 7.4, true, 'Karnal', 'Haryana', 1, 'Statiq (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '74e40da5-1b91-5bec-b37f-8db2ea45c44c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7484ad7f-ec01-5814-bc5a-569164e57e09', '74e40da5-1b91-5bec-b37f-8db2ea45c44c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 441: Hotel Highway King (Jaipur, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d1c20aa4-0142-5105-be20-2eeb5aa01452', '00000000-0000-0000-0000-000000000000', 'st441@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st441@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d1c20aa4-0142-5105-be20-2eeb5aa01452', 'd1c20aa4-0142-5105-be20-2eeb5aa01452', '{"sub": "d1c20aa4-0142-5105-be20-2eeb5aa01452", "email": "st441@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd1c20aa4-0142-5105-be20-2eeb5aa01452')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d1c20aa4-0142-5105-be20-2eeb5aa01452', 'admin', 'st441@boss.com', 'Admin Hotel Highway King', 'Hotel Highway King', 'Hotel Highway King, Rajasthan, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('934a23be-c2e8-50e8-a674-b0013b89c6e3', 'd1c20aa4-0142-5105-be20-2eeb5aa01452', 'Hotel Highway King', 'Hotel Highway King, Rajasthan, India', 26.83003059, 75.57120344, 'India EV Network License', 'LIC-IN-ST441', 500.0, 7.4, true, 'Jaipur', 'Rajasthan', 1, 'Statiq (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '934a23be-c2e8-50e8-a674-b0013b89c6e3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d6c247d3-1999-5318-b772-49ecc45d5321', '934a23be-c2e8-50e8-a674-b0013b89c6e3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 442: Old Rao Hotel (Dudu, rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7bd3dafe-776e-5dba-a52d-b54c1fa37530', '00000000-0000-0000-0000-000000000000', 'st442@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st442@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7bd3dafe-776e-5dba-a52d-b54c1fa37530', '7bd3dafe-776e-5dba-a52d-b54c1fa37530', '{"sub": "7bd3dafe-776e-5dba-a52d-b54c1fa37530", "email": "st442@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7bd3dafe-776e-5dba-a52d-b54c1fa37530')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7bd3dafe-776e-5dba-a52d-b54c1fa37530', 'admin', 'st442@boss.com', 'Admin Old Rao Hotel', 'Old Rao Hotel', 'Old Rao Hotel, Dudu, rajasthan, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2492cd0b-379b-55fe-978d-cbfa3f01f3ef', '7bd3dafe-776e-5dba-a52d-b54c1fa37530', 'Old Rao Hotel', 'Old Rao Hotel, Dudu, rajasthan, India', 26.63638297, 75.10221733, 'India EV Network License', 'LIC-IN-ST442', 500.0, 7.4, true, 'Dudu', 'rajasthan', 1, 'Adani Gas-EV (TR)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2492cd0b-379b-55fe-978d-cbfa3f01f3ef';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17b05e5c-c868-5cce-8b4f-f73bd32f7d16', '2492cd0b-379b-55fe-978d-cbfa3f01f3ef', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 443: Earthtron EV (Paota, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9644050e-035f-5d0b-a019-180854b0baa6', '00000000-0000-0000-0000-000000000000', 'st443@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st443@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9644050e-035f-5d0b-a019-180854b0baa6', '9644050e-035f-5d0b-a019-180854b0baa6', '{"sub": "9644050e-035f-5d0b-a019-180854b0baa6", "email": "st443@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9644050e-035f-5d0b-a019-180854b0baa6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9644050e-035f-5d0b-a019-180854b0baa6', 'admin', 'st443@boss.com', 'Admin Earthtron EV', 'Earthtron EV', 'Earthtron EV, Paota, Rajasthan, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6fd1be76-e3bf-579e-88fe-71114215b758', '9644050e-035f-5d0b-a019-180854b0baa6', 'Earthtron EV', 'Earthtron EV, Paota, Rajasthan, India', 27.56255202, 76.07508906, 'India EV Network License', 'LIC-IN-ST443', 500.0, 7.4, true, 'Paota', 'Rajasthan', 1, 'EarthtronEV (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6fd1be76-e3bf-579e-88fe-71114215b758';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4d8717a5-9145-59d8-aae7-99f9df50c5e1', '6fd1be76-e3bf-579e-88fe-71114215b758', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 444: Earthtron EV (Paota, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('902cdf60-ad62-54b6-b6d8-3cee618a72ee', '00000000-0000-0000-0000-000000000000', 'st444@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st444@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('902cdf60-ad62-54b6-b6d8-3cee618a72ee', '902cdf60-ad62-54b6-b6d8-3cee618a72ee', '{"sub": "902cdf60-ad62-54b6-b6d8-3cee618a72ee", "email": "st444@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '902cdf60-ad62-54b6-b6d8-3cee618a72ee')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('902cdf60-ad62-54b6-b6d8-3cee618a72ee', 'admin', 'st444@boss.com', 'Admin Earthtron EV', 'Earthtron EV', 'Earthtron EV, Paota, Rajasthan, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('68c3aa50-4049-50f6-a4aa-171b64812cc4', '902cdf60-ad62-54b6-b6d8-3cee618a72ee', 'Earthtron EV', 'Earthtron EV, Paota, Rajasthan, India', 27.56255202, 76.07508906, 'India EV Network License', 'LIC-IN-ST444', 500.0, 7.4, true, 'Paota', 'Rajasthan', 1, 'CHARGE+', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '68c3aa50-4049-50f6-a4aa-171b64812cc4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('173a913c-1041-54ca-8aa7-82fe0da4435b', '68c3aa50-4049-50f6-a4aa-171b64812cc4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 445: Mannat (Paota, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f0d2a182-c474-5e79-b13d-fc073af39285', '00000000-0000-0000-0000-000000000000', 'st445@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st445@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f0d2a182-c474-5e79-b13d-fc073af39285', 'f0d2a182-c474-5e79-b13d-fc073af39285', '{"sub": "f0d2a182-c474-5e79-b13d-fc073af39285", "email": "st445@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f0d2a182-c474-5e79-b13d-fc073af39285')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f0d2a182-c474-5e79-b13d-fc073af39285', 'admin', 'st445@boss.com', 'Admin Mannat', 'Mannat', 'Mannat, Paota, Rajasthan, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ebbcba19-b450-52f0-a0ce-cdcf45b441d9', 'f0d2a182-c474-5e79-b13d-fc073af39285', 'Mannat', 'Mannat, Paota, Rajasthan, India', 27.56240732, 76.07497801, 'India EV Network License', 'LIC-IN-ST445', 500.0, 7.4, true, 'Paota', 'Rajasthan', 1, 'Charge_iN by Mahindra', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ebbcba19-b450-52f0-a0ce-cdcf45b441d9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4466350d-f1a4-5c45-8219-86a645e11b88', 'ebbcba19-b450-52f0-a0ce-cdcf45b441d9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 446: Amrai Resort Tata.Ev (Satara, MH)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dc0ea166-77c8-5cfc-bf70-be0f1d7d0b9e', '00000000-0000-0000-0000-000000000000', 'st446@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st446@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dc0ea166-77c8-5cfc-bf70-be0f1d7d0b9e', 'dc0ea166-77c8-5cfc-bf70-be0f1d7d0b9e', '{"sub": "dc0ea166-77c8-5cfc-bf70-be0f1d7d0b9e", "email": "st446@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dc0ea166-77c8-5cfc-bf70-be0f1d7d0b9e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dc0ea166-77c8-5cfc-bf70-be0f1d7d0b9e', 'admin', 'st446@boss.com', 'Admin Amrai Resort Tata.Ev', 'Amrai Resort Tata.Ev', 'Amrai Resort Tata.Ev, Satara, MH, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ee4f4423-fe41-55a2-8d59-a2addd08796d', 'dc0ea166-77c8-5cfc-bf70-be0f1d7d0b9e', 'Amrai Resort Tata.Ev', 'Amrai Resort Tata.Ev, Satara, MH, India', 17.63735819, 74.01217807, 'India EV Network License', 'LIC-IN-ST446', 500.0, 60.0, true, 'Satara', 'MH', 2, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ee4f4423-fe41-55a2-8d59-a2addd08796d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('471f60a3-488e-5d0a-9387-24751c90adc8', 'ee4f4423-fe41-55a2-8d59-a2addd08796d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('48579e71-746c-57c0-9a20-63d3a759e622', 'ee4f4423-fe41-55a2-8d59-a2addd08796d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 447: Tata.Ev Vapi (Vapi, Gujarat)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('211c484d-7d76-55b4-aecc-7c48339b4417', '00000000-0000-0000-0000-000000000000', 'st447@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st447@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('211c484d-7d76-55b4-aecc-7c48339b4417', '211c484d-7d76-55b4-aecc-7c48339b4417', '{"sub": "211c484d-7d76-55b4-aecc-7c48339b4417", "email": "st447@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '211c484d-7d76-55b4-aecc-7c48339b4417')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('211c484d-7d76-55b4-aecc-7c48339b4417', 'admin', 'st447@boss.com', 'Admin Tata.Ev Vapi', 'Tata.Ev Vapi', 'Tata.Ev Vapi, Vapi, Gujarat, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ea05637c-b6a4-59b1-9670-9e14eae9fd3b', '211c484d-7d76-55b4-aecc-7c48339b4417', 'Tata.Ev Vapi', 'Tata.Ev Vapi, Vapi, Gujarat, India', 20.38011026, 72.91445488, 'India EV Network License', 'LIC-IN-ST447', 500.0, 60.0, true, 'Vapi', 'Gujarat', 2, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ea05637c-b6a4-59b1-9670-9e14eae9fd3b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d58a7b21-1ae5-54d6-8ac8-3caa6831ce0a', 'ea05637c-b6a4-59b1-9670-9e14eae9fd3b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5f4d8a16-0d8e-575e-be5a-004d83803634', 'ea05637c-b6a4-59b1-9670-9e14eae9fd3b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 448: BPCL EV Dharamshala Road (Dharamshala, Himachal Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a992d269-62b2-5ed2-ba70-e3d464949cd7', '00000000-0000-0000-0000-000000000000', 'st448@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st448@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a992d269-62b2-5ed2-ba70-e3d464949cd7', 'a992d269-62b2-5ed2-ba70-e3d464949cd7', '{"sub": "a992d269-62b2-5ed2-ba70-e3d464949cd7", "email": "st448@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a992d269-62b2-5ed2-ba70-e3d464949cd7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a992d269-62b2-5ed2-ba70-e3d464949cd7', 'admin', 'st448@boss.com', 'Admin BPCL EV Dharamshala Road', 'BPCL EV Dharamshala Road', 'BPCL EV Dharamshala Road, Dharamshala, Himachal Pradesh, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5f14bdfb-4793-552f-b979-4c241a411d30', 'a992d269-62b2-5ed2-ba70-e3d464949cd7', 'BPCL EV Dharamshala Road', 'BPCL EV Dharamshala Road, Dharamshala, Himachal Pradesh, India', 32.21450539, 76.31693963, 'India EV Network License', 'LIC-IN-ST448', 500.0, 30.0, true, 'Dharamshala', 'Himachal Pradesh', 2, 'eDrive BPCL (IN)', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5f14bdfb-4793-552f-b979-4c241a411d30';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a2d78f69-225d-519b-b6c8-65386be5e95b', '5f14bdfb-4793-552f-b979-4c241a411d30', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('76abd255-8e7d-5622-8728-fafc473dd976', '5f14bdfb-4793-552f-b979-4c241a411d30', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 449: Bundelkhand Expressway 188 Km Rest Area (Agra, Uttar Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b33576d3-e75d-5a7a-8eba-f64ee93feae3', '00000000-0000-0000-0000-000000000000', 'st449@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st449@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b33576d3-e75d-5a7a-8eba-f64ee93feae3', 'b33576d3-e75d-5a7a-8eba-f64ee93feae3', '{"sub": "b33576d3-e75d-5a7a-8eba-f64ee93feae3", "email": "st449@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b33576d3-e75d-5a7a-8eba-f64ee93feae3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b33576d3-e75d-5a7a-8eba-f64ee93feae3', 'admin', 'st449@boss.com', 'Admin Bundelkhand Expressway 188 Km Rest Area', 'Bundelkhand Expressway 188 Km Rest Area', 'Bundelkhand Expressway 188 Km Rest Area, Uttar Pradesh, India', 500.0, 7, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('34bc63ae-a3f8-5fbe-87c2-d8b5668d70b8', 'b33576d3-e75d-5a7a-8eba-f64ee93feae3', 'Bundelkhand Expressway 188 Km Rest Area', 'Bundelkhand Expressway 188 Km Rest Area, Uttar Pradesh, India', 26.33694246, 79.37007255, 'India EV Network License', 'LIC-IN-ST449', 500.0, 7.4, true, 'Agra', 'Uttar Pradesh', 1, 'Adani Gas-EV (TR)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '34bc63ae-a3f8-5fbe-87c2-d8b5668d70b8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0e3cf7c6-a3b4-562c-89ab-eb9b98fd22ce', '34bc63ae-a3f8-5fbe-87c2-d8b5668d70b8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 450: Bundelkhand Expressway Chitrakoot Toll (Lucknow, Uttar Pradesh)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('345d30bc-f657-5c4c-8fa0-34c405201b47', '00000000-0000-0000-0000-000000000000', 'st450@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st450@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('345d30bc-f657-5c4c-8fa0-34c405201b47', '345d30bc-f657-5c4c-8fa0-34c405201b47', '{"sub": "345d30bc-f657-5c4c-8fa0-34c405201b47", "email": "st450@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '345d30bc-f657-5c4c-8fa0-34c405201b47')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('345d30bc-f657-5c4c-8fa0-34c405201b47', 'admin', 'st450@boss.com', 'Admin Bundelkhand Expressway Chitrakoot Toll', 'Bundelkhand Expressway Chitrakoot Toll', 'Bundelkhand Expressway Chitrakoot Toll, Uttar Pradesh, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0eea1c4c-c28a-5d76-8ef9-9cfff48449fd', '345d30bc-f657-5c4c-8fa0-34c405201b47', 'Bundelkhand Expressway Chitrakoot Toll', 'Bundelkhand Expressway Chitrakoot Toll, Uttar Pradesh, India', 25.25244456, 80.74364419, 'India EV Network License', 'LIC-IN-ST450', 500.0, 7.4, true, 'Lucknow', 'Uttar Pradesh', 1, 'Adani Gas-EV (TR)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0eea1c4c-c28a-5d76-8ef9-9cfff48449fd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('649da286-1997-5804-9864-165b3f9844bb', '0eea1c4c-c28a-5d76-8ef9-9cfff48449fd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 451: JIO-BP Pulse (Armoor, Telangana)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c1311d5b-bfd2-550e-b1ee-910a98bba88a', '00000000-0000-0000-0000-000000000000', 'st451@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st451@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c1311d5b-bfd2-550e-b1ee-910a98bba88a', 'c1311d5b-bfd2-550e-b1ee-910a98bba88a', '{"sub": "c1311d5b-bfd2-550e-b1ee-910a98bba88a", "email": "st451@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c1311d5b-bfd2-550e-b1ee-910a98bba88a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c1311d5b-bfd2-550e-b1ee-910a98bba88a', 'admin', 'st451@boss.com', 'Admin JIO-BP Pulse', 'JIO-BP Pulse', 'JIO-BP Pulse, Armoor, Telangana, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('65eeeff8-721a-5c09-a7c1-4e5d16b6dd77', 'c1311d5b-bfd2-550e-b1ee-910a98bba88a', 'JIO-BP Pulse', 'JIO-BP Pulse, Armoor, Telangana, India', 18.82290771, 78.32172268, 'India EV Network License', 'LIC-IN-ST451', 500.0, 60.0, true, 'Armoor', 'Telangana', 3, 'JIO BP Pulse (India)', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '65eeeff8-721a-5c09-a7c1-4e5d16b6dd77';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('673fea72-6313-5e8a-b1ed-aa16d6468d68', '65eeeff8-721a-5c09-a7c1-4e5d16b6dd77', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dea95d1b-eba6-53fb-8c6c-0e4b47c65efd', '65eeeff8-721a-5c09-a7c1-4e5d16b6dd77', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('84978269-5095-5e0f-8eb1-611ad508de6f', '65eeeff8-721a-5c09-a7c1-4e5d16b6dd77', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 452: NH44 (Rangareddy, Telangana)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4f48666a-9873-53c8-aac7-35d7f1d89b49', '00000000-0000-0000-0000-000000000000', 'st452@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st452@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4f48666a-9873-53c8-aac7-35d7f1d89b49', '4f48666a-9873-53c8-aac7-35d7f1d89b49', '{"sub": "4f48666a-9873-53c8-aac7-35d7f1d89b49", "email": "st452@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4f48666a-9873-53c8-aac7-35d7f1d89b49')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4f48666a-9873-53c8-aac7-35d7f1d89b49', 'admin', 'st452@boss.com', 'Admin NH44', 'NH44', 'NH44, Telangana, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2e60926d-48e7-577e-ad7d-fa9c7c664a59', '4f48666a-9873-53c8-aac7-35d7f1d89b49', 'NH44', 'NH44, Telangana, India', 15.88633415, 78.01636639, 'India EV Network License', 'LIC-IN-ST452', 500.0, 7.4, true, 'Rangareddy', 'Telangana', 1, 'Chargezone (India)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2e60926d-48e7-577e-ad7d-fa9c7c664a59';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b014f7d8-2872-585f-8b05-3f9e41052691', '2e60926d-48e7-577e-ad7d-fa9c7c664a59', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 453: Sai Restaurant & Cafe (Narayanwadi, Maharashtra)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('01a5687a-ed2a-5695-a6ea-820a1f53a144', '00000000-0000-0000-0000-000000000000', 'st453@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st453@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('01a5687a-ed2a-5695-a6ea-820a1f53a144', '01a5687a-ed2a-5695-a6ea-820a1f53a144', '{"sub": "01a5687a-ed2a-5695-a6ea-820a1f53a144", "email": "st453@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '01a5687a-ed2a-5695-a6ea-820a1f53a144')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('01a5687a-ed2a-5695-a6ea-820a1f53a144', 'admin', 'st453@boss.com', 'Admin Sai Restaurant & Cafe', 'Sai Restaurant & Cafe', 'Sai Restaurant & Cafe, Narayanwadi, Maharashtra, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0a2dbf32-9353-5a43-8e57-59fa7b754c1b', '01a5687a-ed2a-5695-a6ea-820a1f53a144', 'Sai Restaurant & Cafe', 'Sai Restaurant & Cafe, Narayanwadi, Maharashtra, India', 17.22435243, 74.18016473, 'India EV Network License', 'LIC-IN-ST453', 500.0, 7.4, true, 'Narayanwadi', 'Maharashtra', 1, 'Zeon Charging', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0a2dbf32-9353-5a43-8e57-59fa7b754c1b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('25ba7ede-4f67-5a7d-b748-bd5f0b7f115d', '0a2dbf32-9353-5a43-8e57-59fa7b754c1b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 454: Ishyu Restaurant Jetcharge (Udaipur, Rajasthan)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d0924567-3080-58bd-b8bd-9f9fe7115fe6', '00000000-0000-0000-0000-000000000000', 'st454@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st454@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d0924567-3080-58bd-b8bd-9f9fe7115fe6', 'd0924567-3080-58bd-b8bd-9f9fe7115fe6', '{"sub": "d0924567-3080-58bd-b8bd-9f9fe7115fe6", "email": "st454@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd0924567-3080-58bd-b8bd-9f9fe7115fe6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d0924567-3080-58bd-b8bd-9f9fe7115fe6', 'admin', 'st454@boss.com', 'Admin Ishyu Restaurant Jetcharge', 'Ishyu Restaurant Jetcharge', 'Ishyu Restaurant Jetcharge, Rajasthan, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7591fc36-eebf-59f5-b104-584b4885eae4', 'd0924567-3080-58bd-b8bd-9f9fe7115fe6', 'Ishyu Restaurant Jetcharge', 'Ishyu Restaurant Jetcharge, Rajasthan, India', 24.89141835, 75.96482113, 'India EV Network License', 'LIC-IN-ST454', 500.0, 7.4, true, 'Udaipur', 'Rajasthan', 1, 'eDrive BPCL (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7591fc36-eebf-59f5-b104-584b4885eae4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a5cb717f-79ea-5f94-9432-6a4a61ce3568', '7591fc36-eebf-59f5-b104-584b4885eae4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 455: Al Ameemi Fast Charging Station (Payyanur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf1c59ba-de58-5a01-aab9-2ef239bdde55', '00000000-0000-0000-0000-000000000000', 'st455@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st455@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf1c59ba-de58-5a01-aab9-2ef239bdde55', 'cf1c59ba-de58-5a01-aab9-2ef239bdde55', '{"sub": "cf1c59ba-de58-5a01-aab9-2ef239bdde55", "email": "st455@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf1c59ba-de58-5a01-aab9-2ef239bdde55')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf1c59ba-de58-5a01-aab9-2ef239bdde55', 'admin', 'st455@boss.com', 'Admin Al Ameemi Fast Charging Station', 'Al Ameemi Fast Charging Station', 'Al Ameemi Fast Charging Station, Payyanur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f10cdba7-3885-5dae-b87b-cb9821149cd7', 'cf1c59ba-de58-5a01-aab9-2ef239bdde55', 'Al Ameemi Fast Charging Station', 'Al Ameemi Fast Charging Station, Payyanur, Kerala, India', 12.10566047, 75.21173432, 'India EV Network License', 'LIC-IN-ST455', 500.0, 7.4, true, 'Payyanur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f10cdba7-3885-5dae-b87b-cb9821149cd7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5333ecd3-4176-5fa2-a561-b2a137fd3adb', 'f10cdba7-3885-5dae-b87b-cb9821149cd7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 456: EQ TP Power | Vellur (Vellur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('74b7c4e9-b807-5d3e-9700-87f29c1f2cf3', '00000000-0000-0000-0000-000000000000', 'st456@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st456@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('74b7c4e9-b807-5d3e-9700-87f29c1f2cf3', '74b7c4e9-b807-5d3e-9700-87f29c1f2cf3', '{"sub": "74b7c4e9-b807-5d3e-9700-87f29c1f2cf3", "email": "st456@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '74b7c4e9-b807-5d3e-9700-87f29c1f2cf3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('74b7c4e9-b807-5d3e-9700-87f29c1f2cf3', 'admin', 'st456@boss.com', 'Admin EQ TP Power | Vellur', 'EQ TP Power | Vellur', 'EQ TP Power | Vellur, Vellur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dddc4f27-3b64-5cc5-994f-a1080c1adf17', '74b7c4e9-b807-5d3e-9700-87f29c1f2cf3', 'EQ TP Power | Vellur', 'EQ TP Power | Vellur, Vellur, Kerala, India', 12.14989799, 75.21263664, 'India EV Network License', 'LIC-IN-ST456', 500.0, 7.4, true, 'Vellur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dddc4f27-3b64-5cc5-994f-a1080c1adf17';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c603c690-279e-5eb8-bff8-947ab8bd8cb0', 'dddc4f27-3b64-5cc5-994f-a1080c1adf17', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 457: EQ Sprinkle EVCS | Thaliparamba (Thaliparamba, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d26e861f-fd63-5500-a6de-738f7600cdc3', '00000000-0000-0000-0000-000000000000', 'st457@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st457@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d26e861f-fd63-5500-a6de-738f7600cdc3', 'd26e861f-fd63-5500-a6de-738f7600cdc3', '{"sub": "d26e861f-fd63-5500-a6de-738f7600cdc3", "email": "st457@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd26e861f-fd63-5500-a6de-738f7600cdc3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d26e861f-fd63-5500-a6de-738f7600cdc3', 'admin', 'st457@boss.com', 'Admin EQ Sprinkle EVCS | Thaliparamba', 'EQ Sprinkle EVCS | Thaliparamba', 'EQ Sprinkle EVCS | Thaliparamba, Thaliparamba, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c20f7311-5e76-5a39-bbc1-229920592a1d', 'd26e861f-fd63-5500-a6de-738f7600cdc3', 'EQ Sprinkle EVCS | Thaliparamba', 'EQ Sprinkle EVCS | Thaliparamba, Thaliparamba, Kerala, India', 12.04865464, 75.34628006, 'India EV Network License', 'LIC-IN-ST457', 500.0, 7.4, true, 'Thaliparamba', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c20f7311-5e76-5a39-bbc1-229920592a1d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('88fc9023-4f47-56c7-a78d-7175ad1918c6', 'c20f7311-5e76-5a39-bbc1-229920592a1d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 458: Chirakkal Bank EVCS (Chirakkal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c54391e3-ef4d-55e3-bcf6-fbe1e6bd17a2', '00000000-0000-0000-0000-000000000000', 'st458@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st458@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c54391e3-ef4d-55e3-bcf6-fbe1e6bd17a2', 'c54391e3-ef4d-55e3-bcf6-fbe1e6bd17a2', '{"sub": "c54391e3-ef4d-55e3-bcf6-fbe1e6bd17a2", "email": "st458@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c54391e3-ef4d-55e3-bcf6-fbe1e6bd17a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c54391e3-ef4d-55e3-bcf6-fbe1e6bd17a2', 'admin', 'st458@boss.com', 'Admin Chirakkal Bank EVCS', 'Chirakkal Bank EVCS', 'Chirakkal Bank EVCS, Chirakkal, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2d8566fb-9a72-5bb6-917e-474df1ed4415', 'c54391e3-ef4d-55e3-bcf6-fbe1e6bd17a2', 'Chirakkal Bank EVCS', 'Chirakkal Bank EVCS, Chirakkal, Kerala, India', 11.91670442, 75.35830443, 'India EV Network License', 'LIC-IN-ST458', 500.0, 7.4, true, 'Chirakkal', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2d8566fb-9a72-5bb6-917e-474df1ed4415';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6f9f88d3-0457-5692-8eaa-2628275a20fe', '2d8566fb-9a72-5bb6-917e-474df1ed4415', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 459: VAN-V | EVOK | Panamaram (Panamaram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('71385a25-8d61-516e-bef2-56bfa710601d', '00000000-0000-0000-0000-000000000000', 'st459@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st459@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('71385a25-8d61-516e-bef2-56bfa710601d', '71385a25-8d61-516e-bef2-56bfa710601d', '{"sub": "71385a25-8d61-516e-bef2-56bfa710601d", "email": "st459@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '71385a25-8d61-516e-bef2-56bfa710601d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('71385a25-8d61-516e-bef2-56bfa710601d', 'admin', 'st459@boss.com', 'Admin VAN-V | EVOK | Panamaram', 'VAN-V | EVOK | Panamaram', 'VAN-V | EVOK | Panamaram, Panamaram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1a7148df-2662-55ca-8e97-e83487571065', '71385a25-8d61-516e-bef2-56bfa710601d', 'VAN-V | EVOK | Panamaram', 'VAN-V | EVOK | Panamaram, Panamaram, Kerala, India', 11.7257471, 76.07767337, 'India EV Network License', 'LIC-IN-ST459', 500.0, 30.0, true, 'Panamaram', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1a7148df-2662-55ca-8e97-e83487571065';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f7eb96a0-5370-5e20-ba11-c63195eea825', '1a7148df-2662-55ca-8e97-e83487571065', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a13502ba-4984-537b-bcf9-e99ae1ad0c42', '1a7148df-2662-55ca-8e97-e83487571065', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 460: JetEV Nest Developers | Kambalakkad (Kamabalakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d605c9cd-db2f-5088-8b9f-11cc94a90b82', '00000000-0000-0000-0000-000000000000', 'st460@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st460@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d605c9cd-db2f-5088-8b9f-11cc94a90b82', 'd605c9cd-db2f-5088-8b9f-11cc94a90b82', '{"sub": "d605c9cd-db2f-5088-8b9f-11cc94a90b82", "email": "st460@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd605c9cd-db2f-5088-8b9f-11cc94a90b82')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d605c9cd-db2f-5088-8b9f-11cc94a90b82', 'admin', 'st460@boss.com', 'Admin JetEV Nest Developers | Kambalakkad', 'JetEV Nest Developers | Kambalakkad', 'JetEV Nest Developers | Kambalakkad, Kamabalakkad, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5733e875-5185-59cf-afb6-a6e83176bbe4', 'd605c9cd-db2f-5088-8b9f-11cc94a90b82', 'JetEV Nest Developers | Kambalakkad', 'JetEV Nest Developers | Kambalakkad, Kamabalakkad, Kerala, India', 11.66781267, 76.07946997, 'India EV Network License', 'LIC-IN-ST460', 500.0, 7.4, true, 'Kamabalakkad', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5733e875-5185-59cf-afb6-a6e83176bbe4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('82dafb6a-3c09-51c5-9c82-b6d97785f9d4', '5733e875-5185-59cf-afb6-a6e83176bbe4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 461: Ecozone EVCS | Ulliyeri (Ulliyeri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('71ae4bdc-596d-506d-9575-df1fb33f2e96', '00000000-0000-0000-0000-000000000000', 'st461@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st461@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('71ae4bdc-596d-506d-9575-df1fb33f2e96', '71ae4bdc-596d-506d-9575-df1fb33f2e96', '{"sub": "71ae4bdc-596d-506d-9575-df1fb33f2e96", "email": "st461@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '71ae4bdc-596d-506d-9575-df1fb33f2e96')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('71ae4bdc-596d-506d-9575-df1fb33f2e96', 'admin', 'st461@boss.com', 'Admin Ecozone EVCS | Ulliyeri', 'Ecozone EVCS | Ulliyeri', 'Ecozone EVCS | Ulliyeri, Ulliyeri, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b6d172da-c96f-5e64-8dbe-45d9db8570a5', '71ae4bdc-596d-506d-9575-df1fb33f2e96', 'Ecozone EVCS | Ulliyeri', 'Ecozone EVCS | Ulliyeri, Ulliyeri, Kerala, India', 11.44651486, 75.77262022, 'India EV Network License', 'LIC-IN-ST461', 500.0, 7.4, true, 'Ulliyeri', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b6d172da-c96f-5e64-8dbe-45d9db8570a5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ddcee3e4-be0c-5164-b435-1a377e0f6d97', 'b6d172da-c96f-5e64-8dbe-45d9db8570a5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 462: Flash Charge EVCS | Thirivangoor (Thirivangoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ff33dca5-4d60-5b26-8a40-8456d0589211', '00000000-0000-0000-0000-000000000000', 'st462@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st462@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ff33dca5-4d60-5b26-8a40-8456d0589211', 'ff33dca5-4d60-5b26-8a40-8456d0589211', '{"sub": "ff33dca5-4d60-5b26-8a40-8456d0589211", "email": "st462@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ff33dca5-4d60-5b26-8a40-8456d0589211')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ff33dca5-4d60-5b26-8a40-8456d0589211', 'admin', 'st462@boss.com', 'Admin Flash Charge EVCS | Thirivangoor', 'Flash Charge EVCS | Thirivangoor', 'Flash Charge EVCS | Thirivangoor, Thirivangoor, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c59703c1-959e-5603-b4c7-6c4886bcc9d4', 'ff33dca5-4d60-5b26-8a40-8456d0589211', 'Flash Charge EVCS | Thirivangoor', 'Flash Charge EVCS | Thirivangoor, Thirivangoor, India', 11.3821299, 75.73661186, 'India EV Network License', 'LIC-IN-ST462', 500.0, 7.4, true, 'Thirivangoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c59703c1-959e-5603-b4c7-6c4886bcc9d4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7493806c-1c8f-5db4-a22a-d931d847b0c4', 'c59703c1-959e-5603-b4c7-6c4886bcc9d4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 463: Kairali EVCS | Vengalam (Vengalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fb3e3f63-a9f4-567e-b32e-9e57d49980d5', '00000000-0000-0000-0000-000000000000', 'st463@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st463@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fb3e3f63-a9f4-567e-b32e-9e57d49980d5', 'fb3e3f63-a9f4-567e-b32e-9e57d49980d5', '{"sub": "fb3e3f63-a9f4-567e-b32e-9e57d49980d5", "email": "st463@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fb3e3f63-a9f4-567e-b32e-9e57d49980d5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fb3e3f63-a9f4-567e-b32e-9e57d49980d5', 'admin', 'st463@boss.com', 'Admin Kairali EVCS | Vengalam', 'Kairali EVCS | Vengalam', 'Kairali EVCS | Vengalam, Vengalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c2458d47-73c0-56c7-a1e2-daf1cd267ab3', 'fb3e3f63-a9f4-567e-b32e-9e57d49980d5', 'Kairali EVCS | Vengalam', 'Kairali EVCS | Vengalam, Vengalam, Kerala, India', 11.36474601, 75.73944993, 'India EV Network License', 'LIC-IN-ST463', 500.0, 7.4, true, 'Vengalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c2458d47-73c0-56c7-a1e2-daf1cd267ab3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0c7e6247-0543-5e3d-90c8-700cf6002c8f', 'c2458d47-73c0-56c7-a1e2-daf1cd267ab3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 464: EVM Citroen Calicut (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('507a8c54-6549-5d71-91ba-857c9ef44c64', '00000000-0000-0000-0000-000000000000', 'st464@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st464@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('507a8c54-6549-5d71-91ba-857c9ef44c64', '507a8c54-6549-5d71-91ba-857c9ef44c64', '{"sub": "507a8c54-6549-5d71-91ba-857c9ef44c64", "email": "st464@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '507a8c54-6549-5d71-91ba-857c9ef44c64')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('507a8c54-6549-5d71-91ba-857c9ef44c64', 'admin', 'st464@boss.com', 'Admin EVM Citroen Calicut', 'EVM Citroen Calicut', 'EVM Citroen Calicut, Kozhikode, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a36b7dce-6cb7-5cde-ac55-798653dc0c25', '507a8c54-6549-5d71-91ba-857c9ef44c64', 'EVM Citroen Calicut', 'EVM Citroen Calicut, Kozhikode, Kerala, India', 11.30428543, 75.75957892, 'India EV Network License', 'LIC-IN-ST464', 500.0, 7.4, true, 'Kozhikode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a36b7dce-6cb7-5cde-ac55-798653dc0c25';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('726547f0-e9cc-5ee6-80ee-e563c4fd067c', 'a36b7dce-6cb7-5cde-ac55-798653dc0c25', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 465: Shakti | EVOK Charging Hub (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('20eaed5f-445c-514c-b3a2-b82269ed020a', '00000000-0000-0000-0000-000000000000', 'st465@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st465@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('20eaed5f-445c-514c-b3a2-b82269ed020a', '20eaed5f-445c-514c-b3a2-b82269ed020a', '{"sub": "20eaed5f-445c-514c-b3a2-b82269ed020a", "email": "st465@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '20eaed5f-445c-514c-b3a2-b82269ed020a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('20eaed5f-445c-514c-b3a2-b82269ed020a', 'admin', 'st465@boss.com', 'Admin Shakti | EVOK Charging Hub', 'Shakti | EVOK Charging Hub', 'Shakti | EVOK Charging Hub, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5a604760-47f9-5e80-82e2-7aa919a38d44', '20eaed5f-445c-514c-b3a2-b82269ed020a', 'Shakti | EVOK Charging Hub', 'Shakti | EVOK Charging Hub, Kozhikode, Kerala, India', 11.25784125, 75.81018792, 'India EV Network License', 'LIC-IN-ST465', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5a604760-47f9-5e80-82e2-7aa919a38d44';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a2f8587b-43b9-5e87-96a1-fe81e9b32e2d', '5a604760-47f9-5e80-82e2-7aa919a38d44', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d6cb5f09-9297-5e9a-8314-a44805081bde', '5a604760-47f9-5e80-82e2-7aa919a38d44', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 466: EcoVolt EVCS | EVOK | Pantheerankavu (Pantheerankavu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eb31e190-9792-51b6-bcc5-fa89fa69f411', '00000000-0000-0000-0000-000000000000', 'st466@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st466@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eb31e190-9792-51b6-bcc5-fa89fa69f411', 'eb31e190-9792-51b6-bcc5-fa89fa69f411', '{"sub": "eb31e190-9792-51b6-bcc5-fa89fa69f411", "email": "st466@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eb31e190-9792-51b6-bcc5-fa89fa69f411')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eb31e190-9792-51b6-bcc5-fa89fa69f411', 'admin', 'st466@boss.com', 'Admin EcoVolt EVCS | EVOK | Pantheerankavu', 'EcoVolt EVCS | EVOK | Pantheerankavu', 'EcoVolt EVCS | EVOK | Pantheerankavu, Pantheerankavu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b49edf08-f980-55a2-a42a-6822257415d1', 'eb31e190-9792-51b6-bcc5-fa89fa69f411', 'EcoVolt EVCS | EVOK | Pantheerankavu', 'EcoVolt EVCS | EVOK | Pantheerankavu, Pantheerankavu, Kerala, India', 11.23535468, 75.8456683, 'India EV Network License', 'LIC-IN-ST466', 500.0, 30.0, true, 'Pantheerankavu', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b49edf08-f980-55a2-a42a-6822257415d1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('504fff4d-2d19-5904-a09a-0820493a6ac7', 'b49edf08-f980-55a2-a42a-6822257415d1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f02fd0da-b400-59a8-ab7a-ca2ea86ee453', 'b49edf08-f980-55a2-a42a-6822257415d1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 467: Bisluck Energy EVCS | Vattaparamba (Edavannappara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f8b4c5fc-2650-56ed-9e94-c11f6ebb9bd4', '00000000-0000-0000-0000-000000000000', 'st467@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st467@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f8b4c5fc-2650-56ed-9e94-c11f6ebb9bd4', 'f8b4c5fc-2650-56ed-9e94-c11f6ebb9bd4', '{"sub": "f8b4c5fc-2650-56ed-9e94-c11f6ebb9bd4", "email": "st467@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f8b4c5fc-2650-56ed-9e94-c11f6ebb9bd4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f8b4c5fc-2650-56ed-9e94-c11f6ebb9bd4', 'admin', 'st467@boss.com', 'Admin Bisluck Energy EVCS | Vattaparamba', 'Bisluck Energy EVCS | Vattaparamba', 'Bisluck Energy EVCS | Vattaparamba, Edavannappara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6abe468a-6d96-5b2b-a2a4-5c261d5fbb4f', 'f8b4c5fc-2650-56ed-9e94-c11f6ebb9bd4', 'Bisluck Energy EVCS | Vattaparamba', 'Bisluck Energy EVCS | Vattaparamba, Edavannappara, Kerala, India', 11.16434134, 75.96400737, 'India EV Network License', 'LIC-IN-ST467', 500.0, 7.4, true, 'Edavannappara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6abe468a-6d96-5b2b-a2a4-5c261d5fbb4f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17441402-4693-5aea-a107-dee5956906e0', '6abe468a-6d96-5b2b-a2a4-5c261d5fbb4f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 468: Elite EVOK Charging Hub | Perinthalmanna (Perinthalmanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a58c05b3-c9a4-5317-b93a-99c5b37f668c', '00000000-0000-0000-0000-000000000000', 'st468@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st468@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a58c05b3-c9a4-5317-b93a-99c5b37f668c', 'a58c05b3-c9a4-5317-b93a-99c5b37f668c', '{"sub": "a58c05b3-c9a4-5317-b93a-99c5b37f668c", "email": "st468@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a58c05b3-c9a4-5317-b93a-99c5b37f668c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a58c05b3-c9a4-5317-b93a-99c5b37f668c', 'admin', 'st468@boss.com', 'Admin Elite EVOK Charging Hub | Perinthalmanna', 'Elite EVOK Charging Hub | Perinthalmanna', 'Elite EVOK Charging Hub | Perinthalmanna, Perinthalmanna, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a0e21648-d9a9-5637-8ddb-1ee7daf94f5b', 'a58c05b3-c9a4-5317-b93a-99c5b37f668c', 'Elite EVOK Charging Hub | Perinthalmanna', 'Elite EVOK Charging Hub | Perinthalmanna, Perinthalmanna, Kerala, India', 10.97774961, 76.24286289, 'India EV Network License', 'LIC-IN-ST468', 500.0, 30.0, true, 'Perinthalmanna', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a0e21648-d9a9-5637-8ddb-1ee7daf94f5b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('71d9eafc-7df6-5601-80ed-d5cf295bad7e', 'a0e21648-d9a9-5637-8ddb-1ee7daf94f5b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4898db6a-a86a-5a68-a1fb-43896b08d6b5', 'a0e21648-d9a9-5637-8ddb-1ee7daf94f5b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 469: Sam EVCV | Perinthalmanna (Parinthalmanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ef2d1770-d33d-50df-a085-8e827d812efe', '00000000-0000-0000-0000-000000000000', 'st469@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st469@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ef2d1770-d33d-50df-a085-8e827d812efe', 'ef2d1770-d33d-50df-a085-8e827d812efe', '{"sub": "ef2d1770-d33d-50df-a085-8e827d812efe", "email": "st469@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ef2d1770-d33d-50df-a085-8e827d812efe')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ef2d1770-d33d-50df-a085-8e827d812efe', 'admin', 'st469@boss.com', 'Admin Sam EVCV | Perinthalmanna', 'Sam EVCV | Perinthalmanna', 'Sam EVCV | Perinthalmanna, Parinthalmanna, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f8417417-868e-5ef7-a492-9ff7eeff74d3', 'ef2d1770-d33d-50df-a085-8e827d812efe', 'Sam EVCV | Perinthalmanna', 'Sam EVCV | Perinthalmanna, Parinthalmanna, Kerala, India', 10.95035814, 76.16323671, 'India EV Network License', 'LIC-IN-ST469', 500.0, 7.4, true, 'Parinthalmanna', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f8417417-868e-5ef7-a492-9ff7eeff74d3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ab264122-3d1a-564b-a880-26272c607194', 'f8417417-868e-5ef7-a492-9ff7eeff74d3', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 470: BP Angadi | EVOK | Tirur (Tirur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9c84cade-a1f1-5899-a3ca-f81ae9dc1ac8', '00000000-0000-0000-0000-000000000000', 'st470@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st470@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9c84cade-a1f1-5899-a3ca-f81ae9dc1ac8', '9c84cade-a1f1-5899-a3ca-f81ae9dc1ac8', '{"sub": "9c84cade-a1f1-5899-a3ca-f81ae9dc1ac8", "email": "st470@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9c84cade-a1f1-5899-a3ca-f81ae9dc1ac8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9c84cade-a1f1-5899-a3ca-f81ae9dc1ac8', 'admin', 'st470@boss.com', 'Admin BP Angadi | EVOK | Tirur', 'BP Angadi | EVOK | Tirur', 'BP Angadi | EVOK | Tirur, Tirur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6c4ba742-b910-5408-8335-66c2b5a4205e', '9c84cade-a1f1-5899-a3ca-f81ae9dc1ac8', 'BP Angadi | EVOK | Tirur', 'BP Angadi | EVOK | Tirur, Tirur, Kerala, India', 10.88631362, 75.93057433, 'India EV Network License', 'LIC-IN-ST470', 500.0, 30.0, true, 'Tirur', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6c4ba742-b910-5408-8335-66c2b5a4205e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('850f33e2-9f9d-5f1d-9b29-25d9663417ff', '6c4ba742-b910-5408-8335-66c2b5a4205e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0fddcc5b-3e04-5ad7-8921-86315ded814e', '6c4ba742-b910-5408-8335-66c2b5a4205e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 471: EVee Buddy | Town Plug EVCS | Palakkad (Palakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e967250b-d15b-5aad-9f55-abdfa71a3533', '00000000-0000-0000-0000-000000000000', 'st471@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st471@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e967250b-d15b-5aad-9f55-abdfa71a3533', 'e967250b-d15b-5aad-9f55-abdfa71a3533', '{"sub": "e967250b-d15b-5aad-9f55-abdfa71a3533", "email": "st471@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e967250b-d15b-5aad-9f55-abdfa71a3533')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e967250b-d15b-5aad-9f55-abdfa71a3533', 'admin', 'st471@boss.com', 'Admin EVee Buddy | Town Plug EVCS | Palakkad', 'EVee Buddy | Town Plug EVCS | Palakkad', 'EVee Buddy | Town Plug EVCS | Palakkad, Palakkad, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ab3c40cd-f773-5b89-8418-5881ff64b89c', 'e967250b-d15b-5aad-9f55-abdfa71a3533', 'EVee Buddy | Town Plug EVCS | Palakkad', 'EVee Buddy | Town Plug EVCS | Palakkad, Palakkad, Kerala, India', 10.76489386, 76.65199428, 'India EV Network License', 'LIC-IN-ST471', 500.0, 7.4, true, 'Palakkad', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ab3c40cd-f773-5b89-8418-5881ff64b89c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('115131d2-c9a2-590c-9983-bc85af113608', 'ab3c40cd-f773-5b89-8418-5881ff64b89c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 472: EVMOD EVCS | Pudussery (Kanjikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fe2f7658-edf2-5c1d-b6d5-6a9bd2bd0806', '00000000-0000-0000-0000-000000000000', 'st472@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st472@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fe2f7658-edf2-5c1d-b6d5-6a9bd2bd0806', 'fe2f7658-edf2-5c1d-b6d5-6a9bd2bd0806', '{"sub": "fe2f7658-edf2-5c1d-b6d5-6a9bd2bd0806", "email": "st472@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fe2f7658-edf2-5c1d-b6d5-6a9bd2bd0806')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fe2f7658-edf2-5c1d-b6d5-6a9bd2bd0806', 'admin', 'st472@boss.com', 'Admin EVMOD EVCS | Pudussery', 'EVMOD EVCS | Pudussery', 'EVMOD EVCS | Pudussery, Kanjikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ef27be0f-e238-559c-af21-337410a6f26d', 'fe2f7658-edf2-5c1d-b6d5-6a9bd2bd0806', 'EVMOD EVCS | Pudussery', 'EVMOD EVCS | Pudussery, Kanjikode, Kerala, India', 10.79699086, 76.76440926, 'India EV Network License', 'LIC-IN-ST472', 500.0, 7.4, true, 'Kanjikode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ef27be0f-e238-559c-af21-337410a6f26d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d674d70d-f0da-5284-852f-98c15b75ac7b', 'ef27be0f-e238-559c-af21-337410a6f26d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 473: EVDay EVCS | Ottappalam | Manissery (Ottappalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('33463ae4-45cd-528d-937a-afb0cb6386f0', '00000000-0000-0000-0000-000000000000', 'st473@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st473@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('33463ae4-45cd-528d-937a-afb0cb6386f0', '33463ae4-45cd-528d-937a-afb0cb6386f0', '{"sub": "33463ae4-45cd-528d-937a-afb0cb6386f0", "email": "st473@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '33463ae4-45cd-528d-937a-afb0cb6386f0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('33463ae4-45cd-528d-937a-afb0cb6386f0', 'admin', 'st473@boss.com', 'Admin EVDay EVCS | Ottappalam | Manissery', 'EVDay EVCS | Ottappalam | Manissery', 'EVDay EVCS | Ottappalam | Manissery, Ottappalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7690fd8b-fb9c-5ab4-a048-a73ce8b16f73', '33463ae4-45cd-528d-937a-afb0cb6386f0', 'EVDay EVCS | Ottappalam | Manissery', 'EVDay EVCS | Ottappalam | Manissery, Ottappalam, Kerala, India', 10.7777153, 76.3412277, 'India EV Network License', 'LIC-IN-ST473', 500.0, 7.4, true, 'Ottappalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7690fd8b-fb9c-5ab4-a048-a73ce8b16f73';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b71af254-212d-55af-aa11-f69def490405', '7690fd8b-fb9c-5ab4-a048-a73ce8b16f73', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 474: K4 EV Fast Charging Station (Kunnamkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('76585b3c-b715-537b-b2f8-2f6423a0fbed', '00000000-0000-0000-0000-000000000000', 'st474@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st474@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('76585b3c-b715-537b-b2f8-2f6423a0fbed', '76585b3c-b715-537b-b2f8-2f6423a0fbed', '{"sub": "76585b3c-b715-537b-b2f8-2f6423a0fbed", "email": "st474@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '76585b3c-b715-537b-b2f8-2f6423a0fbed')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('76585b3c-b715-537b-b2f8-2f6423a0fbed', 'admin', 'st474@boss.com', 'Admin K4 EV Fast Charging Station', 'K4 EV Fast Charging Station', 'K4 EV Fast Charging Station, Kunnamkulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('68551117-a3ce-5d6b-b8c1-ac0dc3b988d7', '76585b3c-b715-537b-b2f8-2f6423a0fbed', 'K4 EV Fast Charging Station', 'K4 EV Fast Charging Station, Kunnamkulam, Kerala, India', 10.70522046, 76.0892676, 'India EV Network License', 'LIC-IN-ST474', 500.0, 7.4, true, 'Kunnamkulam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '68551117-a3ce-5d6b-b8c1-ac0dc3b988d7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('528d4acf-b244-5da0-94f0-abe9871dfab6', '68551117-a3ce-5d6b-b8c1-ac0dc3b988d7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 475: VKJ | Flash Charge EVCS | Chettuva (Chettuva, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0f823b21-ff4d-50ab-826e-0dc1fc8f12c1', '00000000-0000-0000-0000-000000000000', 'st475@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st475@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0f823b21-ff4d-50ab-826e-0dc1fc8f12c1', '0f823b21-ff4d-50ab-826e-0dc1fc8f12c1', '{"sub": "0f823b21-ff4d-50ab-826e-0dc1fc8f12c1", "email": "st475@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0f823b21-ff4d-50ab-826e-0dc1fc8f12c1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0f823b21-ff4d-50ab-826e-0dc1fc8f12c1', 'admin', 'st475@boss.com', 'Admin VKJ | Flash Charge EVCS | Chettuva', 'VKJ | Flash Charge EVCS | Chettuva', 'VKJ | Flash Charge EVCS | Chettuva, Chettuva, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('eb07a43b-9318-52f1-9bd6-25108f5b30b2', '0f823b21-ff4d-50ab-826e-0dc1fc8f12c1', 'VKJ | Flash Charge EVCS | Chettuva', 'VKJ | Flash Charge EVCS | Chettuva, Chettuva, Kerala, India', 10.52142322, 76.05127901, 'India EV Network License', 'LIC-IN-ST475', 500.0, 7.4, true, 'Chettuva', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'eb07a43b-9318-52f1-9bd6-25108f5b30b2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ba949f98-6916-5bc8-874d-9064a2a5e773', 'eb07a43b-9318-52f1-9bd6-25108f5b30b2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 476: Duke Communications | Pazhuvil (Pazhuvil, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('89010946-5008-542d-9f99-de1b0e79d56a', '00000000-0000-0000-0000-000000000000', 'st476@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st476@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('89010946-5008-542d-9f99-de1b0e79d56a', '89010946-5008-542d-9f99-de1b0e79d56a', '{"sub": "89010946-5008-542d-9f99-de1b0e79d56a", "email": "st476@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '89010946-5008-542d-9f99-de1b0e79d56a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('89010946-5008-542d-9f99-de1b0e79d56a', 'admin', 'st476@boss.com', 'Admin Duke Communications | Pazhuvil', 'Duke Communications | Pazhuvil', 'Duke Communications | Pazhuvil, Pazhuvil, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e6e39b6b-7f0b-5f4a-bba3-abe4144c16d9', '89010946-5008-542d-9f99-de1b0e79d56a', 'Duke Communications | Pazhuvil', 'Duke Communications | Pazhuvil, Pazhuvil, Kerala, India', 10.41643787, 76.15367479, 'India EV Network License', 'LIC-IN-ST476', 500.0, 7.4, true, 'Pazhuvil', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e6e39b6b-7f0b-5f4a-bba3-abe4144c16d9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4338358f-b3b3-5ca9-98eb-d2625f1a0333', 'e6e39b6b-7f0b-5f4a-bba3-abe4144c16d9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 477: Amigo EV Charge Hub | Marygiri | Vadakkenchery (Vadakkenchery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('719a3c01-8226-5d13-a4ee-bb96275892b6', '00000000-0000-0000-0000-000000000000', 'st477@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st477@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('719a3c01-8226-5d13-a4ee-bb96275892b6', '719a3c01-8226-5d13-a4ee-bb96275892b6', '{"sub": "719a3c01-8226-5d13-a4ee-bb96275892b6", "email": "st477@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '719a3c01-8226-5d13-a4ee-bb96275892b6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('719a3c01-8226-5d13-a4ee-bb96275892b6', 'admin', 'st477@boss.com', 'Admin Amigo EV Charge Hub | Marygiri | Vadakkenchery', 'Amigo EV Charge Hub | Marygiri | Vadakkenchery', 'Amigo EV Charge Hub | Marygiri | Vadakkenchery, Vadakkenchery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5394a8b4-a08d-50f6-bb95-c3aba106048b', '719a3c01-8226-5d13-a4ee-bb96275892b6', 'Amigo EV Charge Hub | Marygiri | Vadakkenchery', 'Amigo EV Charge Hub | Marygiri | Vadakkenchery, Vadakkenchery, Kerala, India', 10.58405552, 76.43581742, 'India EV Network License', 'LIC-IN-ST477', 500.0, 7.4, true, 'Vadakkenchery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5394a8b4-a08d-50f6-bb95-c3aba106048b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('83462213-0b85-5ab5-8b84-a454f71103d4', '5394a8b4-a08d-50f6-bb95-c3aba106048b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 478: Turbo EV Charge Hub | Mannuthi Bypass (Mannuthi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('56c78deb-6a19-5f8a-b459-f4492fe73e00', '00000000-0000-0000-0000-000000000000', 'st478@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st478@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('56c78deb-6a19-5f8a-b459-f4492fe73e00', '56c78deb-6a19-5f8a-b459-f4492fe73e00', '{"sub": "56c78deb-6a19-5f8a-b459-f4492fe73e00", "email": "st478@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '56c78deb-6a19-5f8a-b459-f4492fe73e00')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('56c78deb-6a19-5f8a-b459-f4492fe73e00', 'admin', 'st478@boss.com', 'Admin Turbo EV Charge Hub | Mannuthi Bypass', 'Turbo EV Charge Hub | Mannuthi Bypass', 'Turbo EV Charge Hub | Mannuthi Bypass, Mannuthi, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4374ff5d-c64f-5037-ba7d-5a294349ac03', '56c78deb-6a19-5f8a-b459-f4492fe73e00', 'Turbo EV Charge Hub | Mannuthi Bypass', 'Turbo EV Charge Hub | Mannuthi Bypass, Mannuthi, Kerala, India', 10.52860575, 76.25562113, 'India EV Network License', 'LIC-IN-ST478', 500.0, 7.4, true, 'Mannuthi', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Highway/Transit)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4374ff5d-c64f-5037-ba7d-5a294349ac03';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5e18f034-b794-501b-938f-746a3e47349c', '4374ff5d-c64f-5037-ba7d-5a294349ac03', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 479: EVOK Charging Hub | Mannuthy (Mannuthi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6ee98546-1767-5907-ba74-ce25dc4055f1', '00000000-0000-0000-0000-000000000000', 'st479@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st479@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6ee98546-1767-5907-ba74-ce25dc4055f1', '6ee98546-1767-5907-ba74-ce25dc4055f1', '{"sub": "6ee98546-1767-5907-ba74-ce25dc4055f1", "email": "st479@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6ee98546-1767-5907-ba74-ce25dc4055f1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6ee98546-1767-5907-ba74-ce25dc4055f1', 'admin', 'st479@boss.com', 'Admin EVOK Charging Hub | Mannuthy', 'EVOK Charging Hub | Mannuthy', 'EVOK Charging Hub | Mannuthy, Mannuthi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1842ac12-49d4-58ac-a9cc-4edba521e52c', '6ee98546-1767-5907-ba74-ce25dc4055f1', 'EVOK Charging Hub | Mannuthy', 'EVOK Charging Hub | Mannuthy, Mannuthi, Kerala, India', 10.53955965, 76.25391684, 'India EV Network License', 'LIC-IN-ST479', 500.0, 30.0, true, 'Mannuthi', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1842ac12-49d4-58ac-a9cc-4edba521e52c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5d73f0a1-8373-5209-876a-7a8933e77ef3', '1842ac12-49d4-58ac-a9cc-4edba521e52c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6064d6f5-ea75-50bd-be43-5239e7de2a6c', '1842ac12-49d4-58ac-a9cc-4edba521e52c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 480: M Star EVCS | Koorkenchery (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('51bcf45a-2b15-539c-b714-0f96fbc7cdda', '00000000-0000-0000-0000-000000000000', 'st480@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st480@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('51bcf45a-2b15-539c-b714-0f96fbc7cdda', '51bcf45a-2b15-539c-b714-0f96fbc7cdda', '{"sub": "51bcf45a-2b15-539c-b714-0f96fbc7cdda", "email": "st480@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '51bcf45a-2b15-539c-b714-0f96fbc7cdda')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('51bcf45a-2b15-539c-b714-0f96fbc7cdda', 'admin', 'st480@boss.com', 'Admin M Star EVCS | Koorkenchery', 'M Star EVCS | Koorkenchery', 'M Star EVCS | Koorkenchery, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('29473cac-0885-56c8-a64a-8772c1e0964f', '51bcf45a-2b15-539c-b714-0f96fbc7cdda', 'M Star EVCS | Koorkenchery', 'M Star EVCS | Koorkenchery, Thrissur, Kerala, India', 10.5112198, 76.21322687, 'India EV Network License', 'LIC-IN-ST480', 500.0, 7.4, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '29473cac-0885-56c8-a64a-8772c1e0964f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('51904533-05af-54fb-899c-69fa497cf647', '29473cac-0885-56c8-a64a-8772c1e0964f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 481: Irrai EVCS | Chalakka (Chalakka, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2692b089-8a6e-5e0f-ad29-082e2d26b21a', '00000000-0000-0000-0000-000000000000', 'st481@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st481@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2692b089-8a6e-5e0f-ad29-082e2d26b21a', '2692b089-8a6e-5e0f-ad29-082e2d26b21a', '{"sub": "2692b089-8a6e-5e0f-ad29-082e2d26b21a", "email": "st481@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2692b089-8a6e-5e0f-ad29-082e2d26b21a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2692b089-8a6e-5e0f-ad29-082e2d26b21a', 'admin', 'st481@boss.com', 'Admin Irrai EVCS | Chalakka', 'Irrai EVCS | Chalakka', 'Irrai EVCS | Chalakka, Chalakka, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fe32960c-5b2f-598c-82e3-6be573bb5dea', '2692b089-8a6e-5e0f-ad29-082e2d26b21a', 'Irrai EVCS | Chalakka', 'Irrai EVCS | Chalakka, Chalakka, Kerala, India', 10.1550447, 76.28093392, 'India EV Network License', 'LIC-IN-ST481', 500.0, 7.4, true, 'Chalakka', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fe32960c-5b2f-598c-82e3-6be573bb5dea';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('41f1db3c-3e4d-50de-a945-84c7db401a77', 'fe32960c-5b2f-598c-82e3-6be573bb5dea', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 482: SK EVCS | Kizhakkambalam (Kizhakkambalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3b425d4d-bd77-50f4-bc52-50819dfd5510', '00000000-0000-0000-0000-000000000000', 'st482@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st482@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3b425d4d-bd77-50f4-bc52-50819dfd5510', '3b425d4d-bd77-50f4-bc52-50819dfd5510', '{"sub": "3b425d4d-bd77-50f4-bc52-50819dfd5510", "email": "st482@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3b425d4d-bd77-50f4-bc52-50819dfd5510')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3b425d4d-bd77-50f4-bc52-50819dfd5510', 'admin', 'st482@boss.com', 'Admin SK EVCS | Kizhakkambalam', 'SK EVCS | Kizhakkambalam', 'SK EVCS | Kizhakkambalam, Kizhakkambalam, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4e8f3c2a-20ee-5e4f-8668-a73fccd51808', '3b425d4d-bd77-50f4-bc52-50819dfd5510', 'SK EVCS | Kizhakkambalam', 'SK EVCS | Kizhakkambalam, Kizhakkambalam, Kerala, India', 10.0364764, 76.41865034, 'India EV Network License', 'LIC-IN-ST482', 500.0, 7.4, true, 'Kizhakkambalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4e8f3c2a-20ee-5e4f-8668-a73fccd51808';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ed9fcb04-fde7-5a6a-bbb5-665a7b926cfb', '4e8f3c2a-20ee-5e4f-8668-a73fccd51808', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 483: Jayalakshmi Silks EVCS | CAPGO | Vennala (Vennala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('70416d1f-83dc-5d19-8297-4098db841c92', '00000000-0000-0000-0000-000000000000', 'st483@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st483@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('70416d1f-83dc-5d19-8297-4098db841c92', '70416d1f-83dc-5d19-8297-4098db841c92', '{"sub": "70416d1f-83dc-5d19-8297-4098db841c92", "email": "st483@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '70416d1f-83dc-5d19-8297-4098db841c92')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('70416d1f-83dc-5d19-8297-4098db841c92', 'admin', 'st483@boss.com', 'Admin Jayalakshmi Silks EVCS | CAPGO | Vennala', 'Jayalakshmi Silks EVCS | CAPGO | Vennala', 'Jayalakshmi Silks EVCS | CAPGO | Vennala, Vennala, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('64fe1c57-59f1-5f08-9a1c-80d2ec3c7b55', '70416d1f-83dc-5d19-8297-4098db841c92', 'Jayalakshmi Silks EVCS | CAPGO | Vennala', 'Jayalakshmi Silks EVCS | CAPGO | Vennala, Vennala, Kerala, India', 10.00394558, 76.3133535, 'India EV Network License', 'LIC-IN-ST483', 500.0, 7.4, true, 'Vennala', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '64fe1c57-59f1-5f08-9a1c-80d2ec3c7b55';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a71ec035-067b-5132-bd53-c1d9714aab71', '64fe1c57-59f1-5f08-9a1c-80d2ec3c7b55', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 484: Sunvolt DLF Riverside | Vyttila (Vyttila, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('33139098-4cb7-5e6c-99a8-9acebb8c38c7', '00000000-0000-0000-0000-000000000000', 'st484@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st484@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('33139098-4cb7-5e6c-99a8-9acebb8c38c7', '33139098-4cb7-5e6c-99a8-9acebb8c38c7', '{"sub": "33139098-4cb7-5e6c-99a8-9acebb8c38c7", "email": "st484@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '33139098-4cb7-5e6c-99a8-9acebb8c38c7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('33139098-4cb7-5e6c-99a8-9acebb8c38c7', 'admin', 'st484@boss.com', 'Admin Sunvolt DLF Riverside | Vyttila', 'Sunvolt DLF Riverside | Vyttila', 'Sunvolt DLF Riverside | Vyttila, Vyttila, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b9deeb7e-b995-5868-94c8-1eb5e138252f', '33139098-4cb7-5e6c-99a8-9acebb8c38c7', 'Sunvolt DLF Riverside | Vyttila', 'Sunvolt DLF Riverside | Vyttila, Vyttila, Kerala, India', 9.959224022, 76.31419021, 'India EV Network License', 'LIC-IN-ST484', 500.0, 7.4, true, 'Vyttila', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b9deeb7e-b995-5868-94c8-1eb5e138252f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('070903d1-0097-5192-8fae-7529a3ec2fe7', 'b9deeb7e-b995-5868-94c8-1eb5e138252f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 485: Flash EVCS | Kundannoor (Kundannoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c0b42dde-ba68-5bd9-9064-1d9e1df2b28f', '00000000-0000-0000-0000-000000000000', 'st485@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st485@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c0b42dde-ba68-5bd9-9064-1d9e1df2b28f', 'c0b42dde-ba68-5bd9-9064-1d9e1df2b28f', '{"sub": "c0b42dde-ba68-5bd9-9064-1d9e1df2b28f", "email": "st485@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c0b42dde-ba68-5bd9-9064-1d9e1df2b28f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c0b42dde-ba68-5bd9-9064-1d9e1df2b28f', 'admin', 'st485@boss.com', 'Admin Flash EVCS | Kundannoor', 'Flash EVCS | Kundannoor', 'Flash EVCS | Kundannoor, Kundannoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e972c3fa-4f3c-5c10-8e1a-336ba5e2397a', 'c0b42dde-ba68-5bd9-9064-1d9e1df2b28f', 'Flash EVCS | Kundannoor', 'Flash EVCS | Kundannoor, Kundannoor, Kerala, India', 9.938719981, 76.31830916, 'India EV Network License', 'LIC-IN-ST485', 500.0, 7.4, true, 'Kundannoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e972c3fa-4f3c-5c10-8e1a-336ba5e2397a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d13935cf-2f5e-559f-87f5-0559c514bb66', 'e972c3fa-4f3c-5c10-8e1a-336ba5e2397a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 486: Adithya Shree EVCS | Ponnamveli (Cherthala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5375a136-358c-5ba3-8b2e-09eb030ef61a', '00000000-0000-0000-0000-000000000000', 'st486@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st486@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5375a136-358c-5ba3-8b2e-09eb030ef61a', '5375a136-358c-5ba3-8b2e-09eb030ef61a', '{"sub": "5375a136-358c-5ba3-8b2e-09eb030ef61a", "email": "st486@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5375a136-358c-5ba3-8b2e-09eb030ef61a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5375a136-358c-5ba3-8b2e-09eb030ef61a', 'admin', 'st486@boss.com', 'Admin Adithya Shree EVCS | Ponnamveli', 'Adithya Shree EVCS | Ponnamveli', 'Adithya Shree EVCS | Ponnamveli, Cherthala, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7fef3349-2fe3-56e5-80f2-e7dda840fd8b', '5375a136-358c-5ba3-8b2e-09eb030ef61a', 'Adithya Shree EVCS | Ponnamveli', 'Adithya Shree EVCS | Ponnamveli, Cherthala, Kerala, India', 9.743231981, 76.31942862, 'India EV Network License', 'LIC-IN-ST486', 500.0, 7.4, true, 'Cherthala', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7fef3349-2fe3-56e5-80f2-e7dda840fd8b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4dab7e1c-1ac0-5886-8358-cddd939d90d1', '7fef3349-2fe3-56e5-80f2-e7dda840fd8b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 487: EVee Buddy | Mangalath EVCS | Mangalathunada (Kolenchery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('13348a5b-019b-5c78-809d-3e39b2774be1', '00000000-0000-0000-0000-000000000000', 'st487@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st487@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('13348a5b-019b-5c78-809d-3e39b2774be1', '13348a5b-019b-5c78-809d-3e39b2774be1', '{"sub": "13348a5b-019b-5c78-809d-3e39b2774be1", "email": "st487@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '13348a5b-019b-5c78-809d-3e39b2774be1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('13348a5b-019b-5c78-809d-3e39b2774be1', 'admin', 'st487@boss.com', 'Admin EVee Buddy | Mangalath EVCS | Mangalathunada', 'EVee Buddy | Mangalath EVCS | Mangalathunada', 'EVee Buddy | Mangalath EVCS | Mangalathunada, Kolenchery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('667bffcd-4caa-529d-9cea-8915b17d3e40', '13348a5b-019b-5c78-809d-3e39b2774be1', 'EVee Buddy | Mangalath EVCS | Mangalathunada', 'EVee Buddy | Mangalath EVCS | Mangalathunada, Kolenchery, Kerala, India', 10.01677286, 76.50315707, 'India EV Network License', 'LIC-IN-ST487', 500.0, 7.4, true, 'Kolenchery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '667bffcd-4caa-529d-9cea-8915b17d3e40';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('580e3618-7c27-552d-91f6-f9736d9c042a', '667bffcd-4caa-529d-9cea-8915b17d3e40', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 488: Kavalangad Service Bank EVCS | EVOK (Nellimattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1bd05693-1368-5e3e-ab46-1edb9f4bb5fa', '00000000-0000-0000-0000-000000000000', 'st488@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st488@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1bd05693-1368-5e3e-ab46-1edb9f4bb5fa', '1bd05693-1368-5e3e-ab46-1edb9f4bb5fa', '{"sub": "1bd05693-1368-5e3e-ab46-1edb9f4bb5fa", "email": "st488@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1bd05693-1368-5e3e-ab46-1edb9f4bb5fa')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1bd05693-1368-5e3e-ab46-1edb9f4bb5fa', 'admin', 'st488@boss.com', 'Admin Kavalangad Service Bank EVCS | EVOK', 'Kavalangad Service Bank EVCS | EVOK', 'Kavalangad Service Bank EVCS | EVOK, Nellimattom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9c29cc9d-f8b8-5370-acd7-802be8775400', '1bd05693-1368-5e3e-ab46-1edb9f4bb5fa', 'Kavalangad Service Bank EVCS | EVOK', 'Kavalangad Service Bank EVCS | EVOK, Nellimattom, Kerala, India', 10.05906858, 76.68397959, 'India EV Network License', 'LIC-IN-ST488', 500.0, 30.0, true, 'Nellimattom', 'Kerala', 2, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9c29cc9d-f8b8-5370-acd7-802be8775400';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('76151223-e818-5843-aaba-2137b8529dce', '9c29cc9d-f8b8-5370-acd7-802be8775400', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3a48f41b-5579-59c2-986c-13123eadf78b', '9c29cc9d-f8b8-5370-acd7-802be8775400', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 489: EVOK Charging Station | Meenkunnam (Meenkunnam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('192e2e11-6f92-574f-a00b-eebae19709a3', '00000000-0000-0000-0000-000000000000', 'st489@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st489@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('192e2e11-6f92-574f-a00b-eebae19709a3', '192e2e11-6f92-574f-a00b-eebae19709a3', '{"sub": "192e2e11-6f92-574f-a00b-eebae19709a3", "email": "st489@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '192e2e11-6f92-574f-a00b-eebae19709a3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('192e2e11-6f92-574f-a00b-eebae19709a3', 'admin', 'st489@boss.com', 'Admin EVOK Charging Station | Meenkunnam', 'EVOK Charging Station | Meenkunnam', 'EVOK Charging Station | Meenkunnam, Meenkunnam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3ababb12-6313-56f5-8864-cb775b801a89', '192e2e11-6f92-574f-a00b-eebae19709a3', 'EVOK Charging Station | Meenkunnam', 'EVOK Charging Station | Meenkunnam, Meenkunnam, Kerala, India', 9.935613467, 76.57550197, 'India EV Network License', 'LIC-IN-ST489', 500.0, 30.0, true, 'Meenkunnam', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3ababb12-6313-56f5-8864-cb775b801a89';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f5dd90a9-bec3-52c4-9c62-295b24748057', '3ababb12-6313-56f5-8864-cb775b801a89', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('67886a81-a0a7-58f0-8133-d3f66cc1aa23', '3ababb12-6313-56f5-8864-cb775b801a89', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 490: EVee Buddy | Vedas Energy EVCS | Ramapuram (Ramapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ec826d76-70e1-5461-b152-c34ea98d8487', '00000000-0000-0000-0000-000000000000', 'st490@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st490@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ec826d76-70e1-5461-b152-c34ea98d8487', 'ec826d76-70e1-5461-b152-c34ea98d8487', '{"sub": "ec826d76-70e1-5461-b152-c34ea98d8487", "email": "st490@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ec826d76-70e1-5461-b152-c34ea98d8487')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ec826d76-70e1-5461-b152-c34ea98d8487', 'admin', 'st490@boss.com', 'Admin EVee Buddy | Vedas Energy EVCS | Ramapuram', 'EVee Buddy | Vedas Energy EVCS | Ramapuram', 'EVee Buddy | Vedas Energy EVCS | Ramapuram, Ramapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('08b829b7-6185-5587-bab1-b4b814f9f2d2', 'ec826d76-70e1-5461-b152-c34ea98d8487', 'EVee Buddy | Vedas Energy EVCS | Ramapuram', 'EVee Buddy | Vedas Energy EVCS | Ramapuram, Ramapuram, Kerala, India', 9.796182731, 76.66330811, 'India EV Network License', 'LIC-IN-ST490', 500.0, 7.4, true, 'Ramapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '08b829b7-6185-5587-bab1-b4b814f9f2d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('53a88d3a-b6b1-5f39-98cb-1e3f68012f48', '08b829b7-6185-5587-bab1-b4b814f9f2d2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 491: Qwik Volt EVCS | Kothanalloor (Ettumanoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a9285926-a80f-576a-9ec2-41e8e9932f76', '00000000-0000-0000-0000-000000000000', 'st491@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st491@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a9285926-a80f-576a-9ec2-41e8e9932f76', 'a9285926-a80f-576a-9ec2-41e8e9932f76', '{"sub": "a9285926-a80f-576a-9ec2-41e8e9932f76", "email": "st491@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a9285926-a80f-576a-9ec2-41e8e9932f76')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a9285926-a80f-576a-9ec2-41e8e9932f76', 'admin', 'st491@boss.com', 'Admin Qwik Volt EVCS | Kothanalloor', 'Qwik Volt EVCS | Kothanalloor', 'Qwik Volt EVCS | Kothanalloor, Ettumanoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d709d18a-9aa1-5d0c-b6c8-c8e7ffa3208c', 'a9285926-a80f-576a-9ec2-41e8e9932f76', 'Qwik Volt EVCS | Kothanalloor', 'Qwik Volt EVCS | Kothanalloor, Ettumanoor, Kerala, India', 9.718846766, 76.52517369, 'India EV Network License', 'LIC-IN-ST491', 500.0, 7.4, true, 'Ettumanoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd709d18a-9aa1-5d0c-b6c8-c8e7ffa3208c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9216fff8-72d3-5b66-bf7d-8fc73163cfba', 'd709d18a-9aa1-5d0c-b6c8-c8e7ffa3208c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 492: Nest Homestay EVOK | Adimali (Adimali, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fcd79563-efdb-5c37-8b0d-ad473dfbc91b', '00000000-0000-0000-0000-000000000000', 'st492@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st492@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fcd79563-efdb-5c37-8b0d-ad473dfbc91b', 'fcd79563-efdb-5c37-8b0d-ad473dfbc91b', '{"sub": "fcd79563-efdb-5c37-8b0d-ad473dfbc91b", "email": "st492@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fcd79563-efdb-5c37-8b0d-ad473dfbc91b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fcd79563-efdb-5c37-8b0d-ad473dfbc91b', 'admin', 'st492@boss.com', 'Admin Nest Homestay EVOK | Adimali', 'Nest Homestay EVOK | Adimali', 'Nest Homestay EVOK | Adimali, Adimali, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('18631ef1-5bf4-5483-9103-50af2a1854c5', 'fcd79563-efdb-5c37-8b0d-ad473dfbc91b', 'Nest Homestay EVOK | Adimali', 'Nest Homestay EVOK | Adimali, Adimali, Kerala, India', 10.01725794, 77.00066031, 'India EV Network License', 'LIC-IN-ST492', 500.0, 30.0, true, 'Adimali', 'Kerala', 2, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '18631ef1-5bf4-5483-9103-50af2a1854c5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('243469db-c29e-55a9-ab99-76b22214720b', '18631ef1-5bf4-5483-9103-50af2a1854c5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('973ebb69-70d0-5b1b-9bbb-507348d4f774', '18631ef1-5bf4-5483-9103-50af2a1854c5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 493: EVee Buddy | Everest Hotel | Idukki (Idukki, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bd753d1d-a554-5387-8713-d3711975a04f', '00000000-0000-0000-0000-000000000000', 'st493@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st493@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bd753d1d-a554-5387-8713-d3711975a04f', 'bd753d1d-a554-5387-8713-d3711975a04f', '{"sub": "bd753d1d-a554-5387-8713-d3711975a04f", "email": "st493@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bd753d1d-a554-5387-8713-d3711975a04f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bd753d1d-a554-5387-8713-d3711975a04f', 'admin', 'st493@boss.com', 'Admin EVee Buddy | Everest Hotel | Idukki', 'EVee Buddy | Everest Hotel | Idukki', 'EVee Buddy | Everest Hotel | Idukki, Idukki, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('53979164-532d-5019-9014-f338bb78ffd1', 'bd753d1d-a554-5387-8713-d3711975a04f', 'EVee Buddy | Everest Hotel | Idukki', 'EVee Buddy | Everest Hotel | Idukki, Idukki, Kerala, India', 9.847466205, 76.98095644, 'India EV Network License', 'LIC-IN-ST493', 500.0, 7.4, true, 'Idukki', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '53979164-532d-5019-9014-f338bb78ffd1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('652d97ef-429f-52ef-afd9-7fc131cfc611', '53979164-532d-5019-9014-f338bb78ffd1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 494: Flash Charge EVCS | Kattappana (Kattappana, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8a6fb7f8-05e6-54ec-9953-ae63c72b9fd4', '00000000-0000-0000-0000-000000000000', 'st494@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st494@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8a6fb7f8-05e6-54ec-9953-ae63c72b9fd4', '8a6fb7f8-05e6-54ec-9953-ae63c72b9fd4', '{"sub": "8a6fb7f8-05e6-54ec-9953-ae63c72b9fd4", "email": "st494@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8a6fb7f8-05e6-54ec-9953-ae63c72b9fd4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8a6fb7f8-05e6-54ec-9953-ae63c72b9fd4', 'admin', 'st494@boss.com', 'Admin Flash Charge EVCS | Kattappana', 'Flash Charge EVCS | Kattappana', 'Flash Charge EVCS | Kattappana, Kattappana, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('044373fd-1e55-58c7-b035-3e0189d11511', '8a6fb7f8-05e6-54ec-9953-ae63c72b9fd4', 'Flash Charge EVCS | Kattappana', 'Flash Charge EVCS | Kattappana, Kattappana, Kerala, India', 9.75083765, 77.10918576, 'India EV Network License', 'LIC-IN-ST494', 500.0, 7.4, true, 'Kattappana', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '044373fd-1e55-58c7-b035-3e0189d11511';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0ea24a26-2e81-56ef-abd8-c665e182bdf0', '044373fd-1e55-58c7-b035-3e0189d11511', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 495: Flash Charge EVCS | Vagamon (Vagamon, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('59849d19-7aa9-568f-99f0-1e663700273b', '00000000-0000-0000-0000-000000000000', 'st495@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st495@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('59849d19-7aa9-568f-99f0-1e663700273b', '59849d19-7aa9-568f-99f0-1e663700273b', '{"sub": "59849d19-7aa9-568f-99f0-1e663700273b", "email": "st495@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '59849d19-7aa9-568f-99f0-1e663700273b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('59849d19-7aa9-568f-99f0-1e663700273b', 'admin', 'st495@boss.com', 'Admin Flash Charge EVCS | Vagamon', 'Flash Charge EVCS | Vagamon', 'Flash Charge EVCS | Vagamon, Vagamon, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('78cc5edc-375d-50aa-a007-7be881bbd8cf', '59849d19-7aa9-568f-99f0-1e663700273b', 'Flash Charge EVCS | Vagamon', 'Flash Charge EVCS | Vagamon, Vagamon, Kerala, India', 9.688898074, 76.90444843, 'India EV Network License', 'LIC-IN-ST495', 500.0, 7.4, true, 'Vagamon', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '78cc5edc-375d-50aa-a007-7be881bbd8cf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d2b5be1d-8275-590d-abcf-955e16cfe197', '78cc5edc-375d-50aa-a007-7be881bbd8cf', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 496: EV Point EVCS | Pala (Pala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4568fbda-75f6-5db1-93f8-0696e42b03e3', '00000000-0000-0000-0000-000000000000', 'st496@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st496@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4568fbda-75f6-5db1-93f8-0696e42b03e3', '4568fbda-75f6-5db1-93f8-0696e42b03e3', '{"sub": "4568fbda-75f6-5db1-93f8-0696e42b03e3", "email": "st496@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4568fbda-75f6-5db1-93f8-0696e42b03e3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4568fbda-75f6-5db1-93f8-0696e42b03e3', 'admin', 'st496@boss.com', 'Admin EV Point EVCS | Pala', 'EV Point EVCS | Pala', 'EV Point EVCS | Pala, Pala, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f46fee04-7f01-5161-91e5-e1a852ef86d8', '4568fbda-75f6-5db1-93f8-0696e42b03e3', 'EV Point EVCS | Pala', 'EV Point EVCS | Pala, Pala, Kerala, India', 9.719752345, 76.69166294, 'India EV Network License', 'LIC-IN-ST496', 500.0, 7.4, true, 'Pala', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f46fee04-7f01-5161-91e5-e1a852ef86d8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('40df3c89-9c20-5632-a9b6-de6a3ab896fa', 'f46fee04-7f01-5161-91e5-e1a852ef86d8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 497: EQ ChargeMate | Naalumanikkattu (Manarcadu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf201beb-8549-5a6f-bd5f-e5c411e63625', '00000000-0000-0000-0000-000000000000', 'st497@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st497@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf201beb-8549-5a6f-bd5f-e5c411e63625', 'cf201beb-8549-5a6f-bd5f-e5c411e63625', '{"sub": "cf201beb-8549-5a6f-bd5f-e5c411e63625", "email": "st497@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf201beb-8549-5a6f-bd5f-e5c411e63625')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf201beb-8549-5a6f-bd5f-e5c411e63625', 'admin', 'st497@boss.com', 'Admin EQ ChargeMate | Naalumanikkattu', 'EQ ChargeMate | Naalumanikkattu', 'EQ ChargeMate | Naalumanikkattu, Manarcadu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0337494e-8747-59f7-8369-9e5391d5ea80', 'cf201beb-8549-5a6f-bd5f-e5c411e63625', 'EQ ChargeMate | Naalumanikkattu', 'EQ ChargeMate | Naalumanikkattu, Manarcadu, Kerala, India', 9.606083639, 76.57615047, 'India EV Network License', 'LIC-IN-ST497', 500.0, 7.4, true, 'Manarcadu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0337494e-8747-59f7-8369-9e5391d5ea80';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('57685f36-4890-585c-9ecd-efc1e04807c2', '0337494e-8747-59f7-8369-9e5391d5ea80', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 498: Sihla Energy EVCS | Pathanadu (Pathanadu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('98760c03-da80-5cdd-bf03-ecc509fb71df', '00000000-0000-0000-0000-000000000000', 'st498@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st498@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('98760c03-da80-5cdd-bf03-ecc509fb71df', '98760c03-da80-5cdd-bf03-ecc509fb71df', '{"sub": "98760c03-da80-5cdd-bf03-ecc509fb71df", "email": "st498@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '98760c03-da80-5cdd-bf03-ecc509fb71df')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('98760c03-da80-5cdd-bf03-ecc509fb71df', 'admin', 'st498@boss.com', 'Admin Sihla Energy EVCS | Pathanadu', 'Sihla Energy EVCS | Pathanadu', 'Sihla Energy EVCS | Pathanadu, Pathanadu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a1913660-6b20-5c59-a7ed-bac1820d0caf', '98760c03-da80-5cdd-bf03-ecc509fb71df', 'Sihla Energy EVCS | Pathanadu', 'Sihla Energy EVCS | Pathanadu, Pathanadu, Kerala, India', 9.509674573, 76.69336074, 'India EV Network License', 'LIC-IN-ST498', 500.0, 7.4, true, 'Pathanadu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a1913660-6b20-5c59-a7ed-bac1820d0caf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ee3c63e0-0fa7-5676-a457-cebc1be418cc', 'a1913660-6b20-5c59-a7ed-bac1820d0caf', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 499: EQ Charis EVCS | Cheeranchira (Changanassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d8343ab2-c718-5ecf-a5c5-f9529530e283', '00000000-0000-0000-0000-000000000000', 'st499@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st499@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d8343ab2-c718-5ecf-a5c5-f9529530e283', 'd8343ab2-c718-5ecf-a5c5-f9529530e283', '{"sub": "d8343ab2-c718-5ecf-a5c5-f9529530e283", "email": "st499@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd8343ab2-c718-5ecf-a5c5-f9529530e283')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d8343ab2-c718-5ecf-a5c5-f9529530e283', 'admin', 'st499@boss.com', 'Admin EQ Charis EVCS | Cheeranchira', 'EQ Charis EVCS | Cheeranchira', 'EQ Charis EVCS | Cheeranchira, Changanassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('62fce404-9b68-53fe-97ba-ff01c62d55a1', 'd8343ab2-c718-5ecf-a5c5-f9529530e283', 'EQ Charis EVCS | Cheeranchira', 'EQ Charis EVCS | Cheeranchira, Changanassery, Kerala, India', 9.478424884, 76.56147986, 'India EV Network License', 'LIC-IN-ST499', 500.0, 7.4, true, 'Changanassery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '62fce404-9b68-53fe-97ba-ff01c62d55a1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('839e4d60-f020-56f8-8da7-a51c6265efc1', '62fce404-9b68-53fe-97ba-ff01c62d55a1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 500: Iongrid | Thuruthy (Changanasseri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a66ce072-12ac-515d-9c4a-d8ded3816362', '00000000-0000-0000-0000-000000000000', 'st500@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st500@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a66ce072-12ac-515d-9c4a-d8ded3816362', 'a66ce072-12ac-515d-9c4a-d8ded3816362', '{"sub": "a66ce072-12ac-515d-9c4a-d8ded3816362", "email": "st500@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a66ce072-12ac-515d-9c4a-d8ded3816362')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a66ce072-12ac-515d-9c4a-d8ded3816362', 'admin', 'st500@boss.com', 'Admin Iongrid | Thuruthy', 'Iongrid | Thuruthy', 'Iongrid | Thuruthy, Changanasseri, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('76dcb1aa-ba70-5408-a93b-8f545491f792', 'a66ce072-12ac-515d-9c4a-d8ded3816362', 'Iongrid | Thuruthy', 'Iongrid | Thuruthy, Changanasseri, Kerala, India', 9.47379427, 76.52851438, 'India EV Network License', 'LIC-IN-ST500', 500.0, 7.4, true, 'Changanasseri', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '76dcb1aa-ba70-5408-a93b-8f545491f792';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3a6cf2ba-0c05-5f83-a90c-62806e0c6b92', '76dcb1aa-ba70-5408-a93b-8f545491f792', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
