-- Seed Stations Part 3 (Stations 201 to 300)
BEGIN;

-- Station 201: BPCL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0febe234-a83c-571a-a9f0-03ba09acf058', '00000000-0000-0000-0000-000000000000', 'st201@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st201@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0febe234-a83c-571a-a9f0-03ba09acf058', '0febe234-a83c-571a-a9f0-03ba09acf058', '{"sub": "0febe234-a83c-571a-a9f0-03ba09acf058", "email": "st201@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0febe234-a83c-571a-a9f0-03ba09acf058')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0febe234-a83c-571a-a9f0-03ba09acf058', 'admin', 'st201@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ef136023-0f86-5b57-92d6-1f1b743e0207', '0febe234-a83c-571a-a9f0-03ba09acf058', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 20.0090935, 85.813832, 'India EV Network License', 'LIC-IN-ST201', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ef136023-0f86-5b57-92d6-1f1b743e0207';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('10285767-258a-56b9-9118-7225a93e3a44', 'ef136023-0f86-5b57-92d6-1f1b743e0207', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7091a9dd-a914-5b20-8087-1eacded4cb70', 'ef136023-0f86-5b57-92d6-1f1b743e0207', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 202: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e3fe9dd4-9891-5e5f-a6c7-75061ee0c636', '00000000-0000-0000-0000-000000000000', 'st202@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st202@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e3fe9dd4-9891-5e5f-a6c7-75061ee0c636', 'e3fe9dd4-9891-5e5f-a6c7-75061ee0c636', '{"sub": "e3fe9dd4-9891-5e5f-a6c7-75061ee0c636", "email": "st202@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e3fe9dd4-9891-5e5f-a6c7-75061ee0c636')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e3fe9dd4-9891-5e5f-a6c7-75061ee0c636', 'admin', 'st202@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('882e105b-15a7-5acc-8d23-23e54cb9e802', 'e3fe9dd4-9891-5e5f-a6c7-75061ee0c636', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.8373153, 85.8366266, 'India EV Network License', 'LIC-IN-ST202', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '882e105b-15a7-5acc-8d23-23e54cb9e802';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eda6a4a4-086a-5762-b8de-7ad026d27256', '882e105b-15a7-5acc-8d23-23e54cb9e802', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bca42a85-7d8a-559b-a817-ed06df204952', '882e105b-15a7-5acc-8d23-23e54cb9e802', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 203: Hindustan Petroleum Corporation Limited (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('057b04dd-3b33-50f9-a88e-8ffe1e934774', '00000000-0000-0000-0000-000000000000', 'st203@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st203@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('057b04dd-3b33-50f9-a88e-8ffe1e934774', '057b04dd-3b33-50f9-a88e-8ffe1e934774', '{"sub": "057b04dd-3b33-50f9-a88e-8ffe1e934774", "email": "st203@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '057b04dd-3b33-50f9-a88e-8ffe1e934774')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('057b04dd-3b33-50f9-a88e-8ffe1e934774', 'admin', 'st203@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b03c0edf-3849-5f21-a38a-e59d28c41225', '057b04dd-3b33-50f9-a88e-8ffe1e934774', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 19.887409, 85.803106, 'India EV Network License', 'LIC-IN-ST203', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b03c0edf-3849-5f21-a38a-e59d28c41225';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b5071fec-61df-5da2-9ef5-16de0ff20408', 'b03c0edf-3849-5f21-a38a-e59d28c41225', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b35ae7ce-ba47-5f35-8cfb-45220cbc7eb6', 'b03c0edf-3849-5f21-a38a-e59d28c41225', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 204: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('506bfe6d-2302-5969-9fb5-c0b08624a379', '00000000-0000-0000-0000-000000000000', 'st204@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st204@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('506bfe6d-2302-5969-9fb5-c0b08624a379', '506bfe6d-2302-5969-9fb5-c0b08624a379', '{"sub": "506bfe6d-2302-5969-9fb5-c0b08624a379", "email": "st204@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '506bfe6d-2302-5969-9fb5-c0b08624a379')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('506bfe6d-2302-5969-9fb5-c0b08624a379', 'admin', 'st204@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dcf8c07e-fe03-537c-8235-542f8c195160', '506bfe6d-2302-5969-9fb5-c0b08624a379', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.864923, 85.66567, 'India EV Network License', 'LIC-IN-ST204', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dcf8c07e-fe03-537c-8235-542f8c195160';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d1ff9c03-bbd4-597d-b721-1d45b4cc22fc', 'dcf8c07e-fe03-537c-8235-542f8c195160', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9e8ea559-995d-5689-a167-dc149f53ad9e', 'dcf8c07e-fe03-537c-8235-542f8c195160', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 205: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('50686be4-9ad2-530b-bd1b-4e4807c178a4', '00000000-0000-0000-0000-000000000000', 'st205@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st205@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('50686be4-9ad2-530b-bd1b-4e4807c178a4', '50686be4-9ad2-530b-bd1b-4e4807c178a4', '{"sub": "50686be4-9ad2-530b-bd1b-4e4807c178a4", "email": "st205@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '50686be4-9ad2-530b-bd1b-4e4807c178a4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('50686be4-9ad2-530b-bd1b-4e4807c178a4', 'admin', 'st205@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('754426d6-c434-5cc5-8d2b-bc6f3b4a843f', '50686be4-9ad2-530b-bd1b-4e4807c178a4', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.9604389, 85.4336031, 'India EV Network License', 'LIC-IN-ST205', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '754426d6-c434-5cc5-8d2b-bc6f3b4a843f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1528988f-501a-5f69-b80c-9739953a4a8c', '754426d6-c434-5cc5-8d2b-bc6f3b4a843f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('73e21dbb-edaa-5844-9f4c-5c4680ec5e4e', '754426d6-c434-5cc5-8d2b-bc6f3b4a843f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 206: BPCL Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('25a29671-955f-5bc1-ae96-d393666290db', '00000000-0000-0000-0000-000000000000', 'st206@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st206@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('25a29671-955f-5bc1-ae96-d393666290db', '25a29671-955f-5bc1-ae96-d393666290db', '{"sub": "25a29671-955f-5bc1-ae96-d393666290db", "email": "st206@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '25a29671-955f-5bc1-ae96-d393666290db')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('25a29671-955f-5bc1-ae96-d393666290db', 'admin', 'st206@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fd069cbc-4a56-5f99-b287-4cf464ac84f3', '25a29671-955f-5bc1-ae96-d393666290db', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.995597, 85.479968, 'India EV Network License', 'LIC-IN-ST206', 500.0, 30.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fd069cbc-4a56-5f99-b287-4cf464ac84f3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6225d4b0-8170-5578-9b14-3370010a6960', 'fd069cbc-4a56-5f99-b287-4cf464ac84f3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f827f02e-986c-5262-ae1e-2cbfbbe375b1', 'fd069cbc-4a56-5f99-b287-4cf464ac84f3', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 207: Hindustan Petroleum Corporation Limited (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('37f97705-65b6-539e-bfb7-dee3ed6da454', '00000000-0000-0000-0000-000000000000', 'st207@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st207@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('37f97705-65b6-539e-bfb7-dee3ed6da454', '37f97705-65b6-539e-bfb7-dee3ed6da454', '{"sub": "37f97705-65b6-539e-bfb7-dee3ed6da454", "email": "st207@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '37f97705-65b6-539e-bfb7-dee3ed6da454')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('37f97705-65b6-539e-bfb7-dee3ed6da454', 'admin', 'st207@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('943bbe72-016e-540d-9645-e32cf2984fab', '37f97705-65b6-539e-bfb7-dee3ed6da454', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 19.9901672, 85.4736527, 'India EV Network License', 'LIC-IN-ST207', 500.0, 30.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '943bbe72-016e-540d-9645-e32cf2984fab';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ff216ea2-9919-564e-ba0e-63bc7047013f', '943bbe72-016e-540d-9645-e32cf2984fab', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8e1aea24-f6c4-5d7d-be0a-718f5c39bf3d', '943bbe72-016e-540d-9645-e32cf2984fab', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 208: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ac040196-4506-55ed-a5a5-02bbd8cf2555', '00000000-0000-0000-0000-000000000000', 'st208@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st208@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ac040196-4506-55ed-a5a5-02bbd8cf2555', 'ac040196-4506-55ed-a5a5-02bbd8cf2555', '{"sub": "ac040196-4506-55ed-a5a5-02bbd8cf2555", "email": "st208@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ac040196-4506-55ed-a5a5-02bbd8cf2555')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ac040196-4506-55ed-a5a5-02bbd8cf2555', 'admin', 'st208@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9c1f817c-c9b1-5ecf-8dec-cf644be6c433', 'ac040196-4506-55ed-a5a5-02bbd8cf2555', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.924364, 84.57135, 'India EV Network License', 'LIC-IN-ST208', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9c1f817c-c9b1-5ecf-8dec-cf644be6c433';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f412ce82-89ae-5094-be0c-1e649684591d', '9c1f817c-c9b1-5ecf-8dec-cf644be6c433', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('97d9970f-8a2f-55d0-a69d-f0856268729a', '9c1f817c-c9b1-5ecf-8dec-cf644be6c433', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 209: Jio-bp (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('732f8527-4e79-53f5-9d9b-716f62c41c65', '00000000-0000-0000-0000-000000000000', 'st209@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st209@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('732f8527-4e79-53f5-9d9b-716f62c41c65', '732f8527-4e79-53f5-9d9b-716f62c41c65', '{"sub": "732f8527-4e79-53f5-9d9b-716f62c41c65", "email": "st209@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '732f8527-4e79-53f5-9d9b-716f62c41c65')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('732f8527-4e79-53f5-9d9b-716f62c41c65', 'admin', 'st209@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('549e6f12-276f-5207-bcf5-45ec892660bb', '732f8527-4e79-53f5-9d9b-716f62c41c65', 'Jio-bp', 'Jio-bp, Odisha, India', 20.038907, 84.638569, 'India EV Network License', 'LIC-IN-ST209', 500.0, 50.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '549e6f12-276f-5207-bcf5-45ec892660bb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c69e82ca-55d1-577b-84ca-664955822216', '549e6f12-276f-5207-bcf5-45ec892660bb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('334713f2-9e2d-5bd4-9aa5-791bd0cc1ef6', '549e6f12-276f-5207-bcf5-45ec892660bb', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 210: Tata Power Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dfdd21f5-3b52-5839-ae56-fd2eb47a722d', '00000000-0000-0000-0000-000000000000', 'st210@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st210@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dfdd21f5-3b52-5839-ae56-fd2eb47a722d', 'dfdd21f5-3b52-5839-ae56-fd2eb47a722d', '{"sub": "dfdd21f5-3b52-5839-ae56-fd2eb47a722d", "email": "st210@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dfdd21f5-3b52-5839-ae56-fd2eb47a722d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dfdd21f5-3b52-5839-ae56-fd2eb47a722d', 'admin', 'st210@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('148e8613-b666-5a7e-b8ed-fab5c7b9ab49', 'dfdd21f5-3b52-5839-ae56-fd2eb47a722d', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.924915, 83.174075, 'India EV Network License', 'LIC-IN-ST210', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '148e8613-b666-5a7e-b8ed-fab5c7b9ab49';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e381a5d3-cd38-59cd-9ad8-4b53ceb4ab9c', '148e8613-b666-5a7e-b8ed-fab5c7b9ab49', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e06890ab-4478-5117-a59c-5c5e7a9f8ccf', '148e8613-b666-5a7e-b8ed-fab5c7b9ab49', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 211: Electric Vehicle Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1bfcfc6b-48c5-55e9-8a25-5255b47cfb32', '00000000-0000-0000-0000-000000000000', 'st211@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st211@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1bfcfc6b-48c5-55e9-8a25-5255b47cfb32', '1bfcfc6b-48c5-55e9-8a25-5255b47cfb32', '{"sub": "1bfcfc6b-48c5-55e9-8a25-5255b47cfb32", "email": "st211@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1bfcfc6b-48c5-55e9-8a25-5255b47cfb32')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1bfcfc6b-48c5-55e9-8a25-5255b47cfb32', 'admin', 'st211@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 11, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8d0c97bd-9ac0-59a0-aaac-8e85c08cf4cd', '1bfcfc6b-48c5-55e9-8a25-5255b47cfb32', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.0887924, 82.3621049, 'India EV Network License', 'LIC-IN-ST211', 500.0, 25.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8d0c97bd-9ac0-59a0-aaac-8e85c08cf4cd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9cfdbff4-83a8-5763-aed2-41407908f2c3', '8d0c97bd-9ac0-59a0-aaac-8e85c08cf4cd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b4afd989-4161-5791-8b8b-7cdb55751b9a', '8d0c97bd-9ac0-59a0-aaac-8e85c08cf4cd', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 212: G.K Rickshaw (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f24ec4bf-48d3-56f0-89f6-72427fb7e887', '00000000-0000-0000-0000-000000000000', 'st212@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st212@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f24ec4bf-48d3-56f0-89f6-72427fb7e887', 'f24ec4bf-48d3-56f0-89f6-72427fb7e887', '{"sub": "f24ec4bf-48d3-56f0-89f6-72427fb7e887", "email": "st212@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f24ec4bf-48d3-56f0-89f6-72427fb7e887')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f24ec4bf-48d3-56f0-89f6-72427fb7e887', 'admin', 'st212@boss.com', 'Admin G.K Rickshaw', 'G.K Rickshaw', 'G.K Rickshaw, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('78206e60-b907-5518-b505-b4fc5c9fc29f', 'f24ec4bf-48d3-56f0-89f6-72427fb7e887', 'G.K Rickshaw', 'G.K Rickshaw, Odisha, India', 19.8134808, 85.8362997, 'India EV Network License', 'LIC-IN-ST212', 500.0, 7.4, true, 'Ganjam', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '78206e60-b907-5518-b505-b4fc5c9fc29f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5975c26b-1739-5714-b535-b8788e401c46', '78206e60-b907-5518-b505-b4fc5c9fc29f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 213: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b1e2d2aa-95bd-55c5-9d0e-8c8090b41b03', '00000000-0000-0000-0000-000000000000', 'st213@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st213@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b1e2d2aa-95bd-55c5-9d0e-8c8090b41b03', 'b1e2d2aa-95bd-55c5-9d0e-8c8090b41b03', '{"sub": "b1e2d2aa-95bd-55c5-9d0e-8c8090b41b03", "email": "st213@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b1e2d2aa-95bd-55c5-9d0e-8c8090b41b03')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b1e2d2aa-95bd-55c5-9d0e-8c8090b41b03', 'admin', 'st213@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3cc62942-27b2-51ba-96a7-9c5c353976f7', 'b1e2d2aa-95bd-55c5-9d0e-8c8090b41b03', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.7952607, 85.8132809, 'India EV Network License', 'LIC-IN-ST213', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3cc62942-27b2-51ba-96a7-9c5c353976f7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9b5dfcb6-f3cc-51b1-b3e9-307aaa3a05d8', '3cc62942-27b2-51ba-96a7-9c5c353976f7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e6b01b0d-61c2-5578-80c9-38cbc55ac86a', '3cc62942-27b2-51ba-96a7-9c5c353976f7', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 214: KACHERI SECTION TPCODL (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c62cfc7d-8560-56f3-a064-4065f55dfde3', '00000000-0000-0000-0000-000000000000', 'st214@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st214@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c62cfc7d-8560-56f3-a064-4065f55dfde3', 'c62cfc7d-8560-56f3-a064-4065f55dfde3', '{"sub": "c62cfc7d-8560-56f3-a064-4065f55dfde3", "email": "st214@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c62cfc7d-8560-56f3-a064-4065f55dfde3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c62cfc7d-8560-56f3-a064-4065f55dfde3', 'admin', 'st214@boss.com', 'Admin KACHERI SECTION TPCODL', 'KACHERI SECTION TPCODL', 'KACHERI SECTION TPCODL, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('84b73ceb-b541-5272-889e-57af5aa68687', 'c62cfc7d-8560-56f3-a064-4065f55dfde3', 'KACHERI SECTION TPCODL', 'KACHERI SECTION TPCODL, Odisha, India', 19.8024197, 85.8239399, 'India EV Network License', 'LIC-IN-ST214', 500.0, 7.4, true, 'Ganjam', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '84b73ceb-b541-5272-889e-57af5aa68687';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3f13ee2d-aae6-51d4-89c0-094d8a8a4e84', '84b73ceb-b541-5272-889e-57af5aa68687', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 215: Relux Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2f90aaa7-2d36-5ad5-bf16-e2577dc3963f', '00000000-0000-0000-0000-000000000000', 'st215@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st215@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2f90aaa7-2d36-5ad5-bf16-e2577dc3963f', '2f90aaa7-2d36-5ad5-bf16-e2577dc3963f', '{"sub": "2f90aaa7-2d36-5ad5-bf16-e2577dc3963f", "email": "st215@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2f90aaa7-2d36-5ad5-bf16-e2577dc3963f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2f90aaa7-2d36-5ad5-bf16-e2577dc3963f', 'admin', 'st215@boss.com', 'Admin Relux Charging Station', 'Relux Charging Station', 'Relux Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3decd41f-f98a-5530-aa81-78edda422dd6', '2f90aaa7-2d36-5ad5-bf16-e2577dc3963f', 'Relux Charging Station', 'Relux Charging Station, Odisha, India', 19.7907462, 85.8030868, 'India EV Network License', 'LIC-IN-ST215', 500.0, 7.4, true, 'Khordha', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3decd41f-f98a-5530-aa81-78edda422dd6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4d346719-1cc4-5e28-9faf-b15a9311cc72', '3decd41f-f98a-5530-aa81-78edda422dd6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 216: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('008084c8-a7fc-5b50-9a9c-e894e17c40fa', '00000000-0000-0000-0000-000000000000', 'st216@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st216@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('008084c8-a7fc-5b50-9a9c-e894e17c40fa', '008084c8-a7fc-5b50-9a9c-e894e17c40fa', '{"sub": "008084c8-a7fc-5b50-9a9c-e894e17c40fa", "email": "st216@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '008084c8-a7fc-5b50-9a9c-e894e17c40fa')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('008084c8-a7fc-5b50-9a9c-e894e17c40fa', 'admin', 'st216@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2f97abf8-9c1d-5a93-80c4-4dbd92298b17', '008084c8-a7fc-5b50-9a9c-e894e17c40fa', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.718938, 85.5235713, 'India EV Network License', 'LIC-IN-ST216', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2f97abf8-9c1d-5a93-80c4-4dbd92298b17';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c642486a-b37d-5b8e-a52e-2a32a81e9c2b', '2f97abf8-9c1d-5a93-80c4-4dbd92298b17', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('20fb08dd-e299-5e37-9765-774d11e0b646', '2f97abf8-9c1d-5a93-80c4-4dbd92298b17', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 217: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6e24a9fa-3fc4-5186-bd75-f1329939e2f6', '00000000-0000-0000-0000-000000000000', 'st217@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st217@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6e24a9fa-3fc4-5186-bd75-f1329939e2f6', '6e24a9fa-3fc4-5186-bd75-f1329939e2f6', '{"sub": "6e24a9fa-3fc4-5186-bd75-f1329939e2f6", "email": "st217@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6e24a9fa-3fc4-5186-bd75-f1329939e2f6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6e24a9fa-3fc4-5186-bd75-f1329939e2f6', 'admin', 'st217@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3bb01bd0-c87d-5f02-a78e-e3728c9bea08', '6e24a9fa-3fc4-5186-bd75-f1329939e2f6', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.799158, 85.664566, 'India EV Network License', 'LIC-IN-ST217', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3bb01bd0-c87d-5f02-a78e-e3728c9bea08';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('69113f0f-dad2-5885-aa05-afc9ef5b1974', '3bb01bd0-c87d-5f02-a78e-e3728c9bea08', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f43938e2-e359-5820-9584-88ad004db874', '3bb01bd0-c87d-5f02-a78e-e3728c9bea08', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 218: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('05ccae90-7060-5598-b46d-a9261d1b21d3', '00000000-0000-0000-0000-000000000000', 'st218@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st218@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('05ccae90-7060-5598-b46d-a9261d1b21d3', '05ccae90-7060-5598-b46d-a9261d1b21d3', '{"sub": "05ccae90-7060-5598-b46d-a9261d1b21d3", "email": "st218@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '05ccae90-7060-5598-b46d-a9261d1b21d3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('05ccae90-7060-5598-b46d-a9261d1b21d3', 'admin', 'st218@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b932dc73-b879-58a5-b1f7-6d92a8f65ad6', '05ccae90-7060-5598-b46d-a9261d1b21d3', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.71935, 85.5244868, 'India EV Network License', 'LIC-IN-ST218', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b932dc73-b879-58a5-b1f7-6d92a8f65ad6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('97a4af1b-eef4-583b-b2b6-24c53c6a09b8', 'b932dc73-b879-58a5-b1f7-6d92a8f65ad6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('71d65783-3ac5-5c04-a2f7-d782333e7565', 'b932dc73-b879-58a5-b1f7-6d92a8f65ad6', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 219: Jio-bp pulse Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3f1ff61b-c3d9-5e43-a74f-f8494966fd0f', '00000000-0000-0000-0000-000000000000', 'st219@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st219@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3f1ff61b-c3d9-5e43-a74f-f8494966fd0f', '3f1ff61b-c3d9-5e43-a74f-f8494966fd0f', '{"sub": "3f1ff61b-c3d9-5e43-a74f-f8494966fd0f", "email": "st219@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3f1ff61b-c3d9-5e43-a74f-f8494966fd0f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3f1ff61b-c3d9-5e43-a74f-f8494966fd0f', 'admin', 'st219@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5c0ba6c2-3022-56d2-9d50-cdfaa60ebec6', '3f1ff61b-c3d9-5e43-a74f-f8494966fd0f', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 19.67855, 85.171409, 'India EV Network License', 'LIC-IN-ST219', 500.0, 60.0, true, 'Balasore', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5c0ba6c2-3022-56d2-9d50-cdfaa60ebec6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b92f39e-33a8-5439-bec4-25fa379ce3ec', '5c0ba6c2-3022-56d2-9d50-cdfaa60ebec6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('922d5dec-7aec-5f10-8b77-fd336eb3601c', '5c0ba6c2-3022-56d2-9d50-cdfaa60ebec6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c6f14a22-0ed2-5789-96c0-73f77fc0c7de', '5c0ba6c2-3022-56d2-9d50-cdfaa60ebec6', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 220: Tata Power Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0efddb23-f4eb-5ead-b09a-471ffbcb7528', '00000000-0000-0000-0000-000000000000', 'st220@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st220@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0efddb23-f4eb-5ead-b09a-471ffbcb7528', '0efddb23-f4eb-5ead-b09a-471ffbcb7528', '{"sub": "0efddb23-f4eb-5ead-b09a-471ffbcb7528", "email": "st220@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0efddb23-f4eb-5ead-b09a-471ffbcb7528')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0efddb23-f4eb-5ead-b09a-471ffbcb7528', 'admin', 'st220@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8689a9f1-96cd-5558-922e-b3f65b2a4d04', '0efddb23-f4eb-5ead-b09a-471ffbcb7528', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.6782474, 85.1714786, 'India EV Network License', 'LIC-IN-ST220', 500.0, 60.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8689a9f1-96cd-5558-922e-b3f65b2a4d04';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6cfdea3e-f652-5efb-a8b8-602915476834', '8689a9f1-96cd-5558-922e-b3f65b2a4d04', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('158a5ea7-233b-599d-b84d-7ec1b28bceea', '8689a9f1-96cd-5558-922e-b3f65b2a4d04', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 221: Adani Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9be7df8a-1daf-572b-b7d5-15b5c4d6ce71', '00000000-0000-0000-0000-000000000000', 'st221@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st221@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9be7df8a-1daf-572b-b7d5-15b5c4d6ce71', '9be7df8a-1daf-572b-b7d5-15b5c4d6ce71', '{"sub": "9be7df8a-1daf-572b-b7d5-15b5c4d6ce71", "email": "st221@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9be7df8a-1daf-572b-b7d5-15b5c4d6ce71')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9be7df8a-1daf-572b-b7d5-15b5c4d6ce71', 'admin', 'st221@boss.com', 'Admin Adani Charging Station', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('eb1939c3-271e-51ce-b794-500764ac376c', '9be7df8a-1daf-572b-b7d5-15b5c4d6ce71', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 19.6331555, 85.1353263, 'India EV Network License', 'LIC-IN-ST221', 500.0, 60.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'eb1939c3-271e-51ce-b794-500764ac376c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e3858095-3dcb-57b6-8fea-fb31a9a89b52', 'eb1939c3-271e-51ce-b794-500764ac376c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('08ee9f66-4845-569a-8cf4-c86bdc18edb8', 'eb1939c3-271e-51ce-b794-500764ac376c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 222: BPCL Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3f8b6dfa-cf6c-53d9-b091-36d855b46f46', '00000000-0000-0000-0000-000000000000', 'st222@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st222@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3f8b6dfa-cf6c-53d9-b091-36d855b46f46', '3f8b6dfa-cf6c-53d9-b091-36d855b46f46', '{"sub": "3f8b6dfa-cf6c-53d9-b091-36d855b46f46", "email": "st222@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3f8b6dfa-cf6c-53d9-b091-36d855b46f46')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3f8b6dfa-cf6c-53d9-b091-36d855b46f46', 'admin', 'st222@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e0558a9f-e2d0-52b8-a9f6-6035a04e0c38', '3f8b6dfa-cf6c-53d9-b091-36d855b46f46', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.749316, 85.207598, 'India EV Network License', 'LIC-IN-ST222', 500.0, 30.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e0558a9f-e2d0-52b8-a9f6-6035a04e0c38';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f13b42ef-d8c1-5c82-a84d-0d7855495485', 'e0558a9f-e2d0-52b8-a9f6-6035a04e0c38', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('724c2c6c-9247-5113-ac42-65fbe7014129', 'e0558a9f-e2d0-52b8-a9f6-6035a04e0c38', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 223: Jio-bp (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('aa3f83f3-991f-5eb5-99ec-8d98cdf8be9a', '00000000-0000-0000-0000-000000000000', 'st223@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st223@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('aa3f83f3-991f-5eb5-99ec-8d98cdf8be9a', 'aa3f83f3-991f-5eb5-99ec-8d98cdf8be9a', '{"sub": "aa3f83f3-991f-5eb5-99ec-8d98cdf8be9a", "email": "st223@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'aa3f83f3-991f-5eb5-99ec-8d98cdf8be9a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('aa3f83f3-991f-5eb5-99ec-8d98cdf8be9a', 'admin', 'st223@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d0c40632-0ea9-572e-9dd8-fb8158f41c78', 'aa3f83f3-991f-5eb5-99ec-8d98cdf8be9a', 'Jio-bp', 'Jio-bp, Odisha, India', 19.731375, 83.479141, 'India EV Network License', 'LIC-IN-ST223', 500.0, 50.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd0c40632-0ea9-572e-9dd8-fb8158f41c78';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('79949e6c-5ab2-5c08-bcf0-72222a45ac33', 'd0c40632-0ea9-572e-9dd8-fb8158f41c78', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('84f12550-32f0-5987-8a87-7e15fa581d8c', 'd0c40632-0ea9-572e-9dd8-fb8158f41c78', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 224: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9b574157-16da-51d6-be5a-8d67b5183ae4', '00000000-0000-0000-0000-000000000000', 'st224@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st224@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9b574157-16da-51d6-be5a-8d67b5183ae4', '9b574157-16da-51d6-be5a-8d67b5183ae4', '{"sub": "9b574157-16da-51d6-be5a-8d67b5183ae4", "email": "st224@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9b574157-16da-51d6-be5a-8d67b5183ae4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9b574157-16da-51d6-be5a-8d67b5183ae4', 'admin', 'st224@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('00b6770d-4d08-5316-8234-882534133ffc', '9b574157-16da-51d6-be5a-8d67b5183ae4', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.652453, 82.225619, 'India EV Network License', 'LIC-IN-ST224', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '00b6770d-4d08-5316-8234-882534133ffc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('44ef4af8-9871-5e28-ac5c-aad1d7277951', '00b6770d-4d08-5316-8234-882534133ffc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4d9551b0-c2ca-5e41-a473-dbdedece4ee9', '00b6770d-4d08-5316-8234-882534133ffc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 225: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('822e3047-430a-5787-a2bd-802d717b00c8', '00000000-0000-0000-0000-000000000000', 'st225@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st225@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('822e3047-430a-5787-a2bd-802d717b00c8', '822e3047-430a-5787-a2bd-802d717b00c8', '{"sub": "822e3047-430a-5787-a2bd-802d717b00c8", "email": "st225@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '822e3047-430a-5787-a2bd-802d717b00c8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('822e3047-430a-5787-a2bd-802d717b00c8', 'admin', 'st225@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('25db8263-71f4-51b8-9ed8-83d7b4f5686f', '822e3047-430a-5787-a2bd-802d717b00c8', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.31151, 84.83354, 'India EV Network License', 'LIC-IN-ST225', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '25db8263-71f4-51b8-9ed8-83d7b4f5686f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('78b5f913-7389-50df-a2c5-ecb3a6f85f38', '25db8263-71f4-51b8-9ed8-83d7b4f5686f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b34afb2a-c18b-589b-add7-046d72e24a4d', '25db8263-71f4-51b8-9ed8-83d7b4f5686f', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 226: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('196b3cd7-1592-55d9-b19e-2ff872495f3f', '00000000-0000-0000-0000-000000000000', 'st226@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st226@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('196b3cd7-1592-55d9-b19e-2ff872495f3f', '196b3cd7-1592-55d9-b19e-2ff872495f3f', '{"sub": "196b3cd7-1592-55d9-b19e-2ff872495f3f", "email": "st226@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '196b3cd7-1592-55d9-b19e-2ff872495f3f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('196b3cd7-1592-55d9-b19e-2ff872495f3f', 'admin', 'st226@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e4a9ba4f-a127-5fe5-9bca-d684aa6b4a17', '196b3cd7-1592-55d9-b19e-2ff872495f3f', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.34123, 84.76845, 'India EV Network License', 'LIC-IN-ST226', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e4a9ba4f-a127-5fe5-9bca-d684aa6b4a17';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('93a7b30c-809b-5be2-a864-8de47b556182', 'e4a9ba4f-a127-5fe5-9bca-d684aa6b4a17', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5d535ca7-3c5c-5bae-a39a-33e4ab6c1d61', 'e4a9ba4f-a127-5fe5-9bca-d684aa6b4a17', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 227: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0b32c0a4-5f9d-5dee-8358-7c603a725b27', '00000000-0000-0000-0000-000000000000', 'st227@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st227@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0b32c0a4-5f9d-5dee-8358-7c603a725b27', '0b32c0a4-5f9d-5dee-8358-7c603a725b27', '{"sub": "0b32c0a4-5f9d-5dee-8358-7c603a725b27", "email": "st227@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0b32c0a4-5f9d-5dee-8358-7c603a725b27')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0b32c0a4-5f9d-5dee-8358-7c603a725b27', 'admin', 'st227@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('92dc9440-c787-5bbd-9dee-88b45583249b', '0b32c0a4-5f9d-5dee-8358-7c603a725b27', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.324255, 84.87503, 'India EV Network License', 'LIC-IN-ST227', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '92dc9440-c787-5bbd-9dee-88b45583249b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('855a347e-ddb4-55e4-af91-dc47cdbdd5b3', '92dc9440-c787-5bbd-9dee-88b45583249b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('65ddf701-e912-5e6a-925f-8bda3864e138', '92dc9440-c787-5bbd-9dee-88b45583249b', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 228: Electric Vehicle Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8de73eb6-18c3-5c4c-a0a3-74bc001fd078', '00000000-0000-0000-0000-000000000000', 'st228@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st228@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8de73eb6-18c3-5c4c-a0a3-74bc001fd078', '8de73eb6-18c3-5c4c-a0a3-74bc001fd078', '{"sub": "8de73eb6-18c3-5c4c-a0a3-74bc001fd078", "email": "st228@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8de73eb6-18c3-5c4c-a0a3-74bc001fd078')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8de73eb6-18c3-5c4c-a0a3-74bc001fd078', 'admin', 'st228@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fdef8ed7-e469-5f2c-9d23-f63babeb2088', '8de73eb6-18c3-5c4c-a0a3-74bc001fd078', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3171717, 84.7772474, 'India EV Network License', 'LIC-IN-ST228', 500.0, 25.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fdef8ed7-e469-5f2c-9d23-f63babeb2088';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('766c47c0-ebed-50bd-96c5-1d0977d46904', 'fdef8ed7-e469-5f2c-9d23-f63babeb2088', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ae79a360-a14c-5c28-9c88-e2c97ec74852', 'fdef8ed7-e469-5f2c-9d23-f63babeb2088', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 229: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1ad99c67-037b-5bf4-b577-2e628debd146', '00000000-0000-0000-0000-000000000000', 'st229@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st229@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1ad99c67-037b-5bf4-b577-2e628debd146', '1ad99c67-037b-5bf4-b577-2e628debd146', '{"sub": "1ad99c67-037b-5bf4-b577-2e628debd146", "email": "st229@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1ad99c67-037b-5bf4-b577-2e628debd146')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1ad99c67-037b-5bf4-b577-2e628debd146', 'admin', 'st229@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c06930e7-fcda-5cc9-bbb8-077f7c509b69', '1ad99c67-037b-5bf4-b577-2e628debd146', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3071386, 84.8292277, 'India EV Network License', 'LIC-IN-ST229', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c06930e7-fcda-5cc9-bbb8-077f7c509b69';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5cef7dc4-4d46-52ef-a5ba-48826c94837c', 'c06930e7-fcda-5cc9-bbb8-077f7c509b69', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('603f002f-a470-51ff-af48-7592e1386515', 'c06930e7-fcda-5cc9-bbb8-077f7c509b69', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 230: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('062f7d0c-b042-5511-a559-72587b8fc54f', '00000000-0000-0000-0000-000000000000', 'st230@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st230@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('062f7d0c-b042-5511-a559-72587b8fc54f', '062f7d0c-b042-5511-a559-72587b8fc54f', '{"sub": "062f7d0c-b042-5511-a559-72587b8fc54f", "email": "st230@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '062f7d0c-b042-5511-a559-72587b8fc54f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('062f7d0c-b042-5511-a559-72587b8fc54f', 'admin', 'st230@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3cdfcf73-cbd3-5292-beea-060aae18b88a', '062f7d0c-b042-5511-a559-72587b8fc54f', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3194175, 84.7844863, 'India EV Network License', 'LIC-IN-ST230', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3cdfcf73-cbd3-5292-beea-060aae18b88a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('984593f6-cc1d-58af-bcfe-4f958bc0878f', '3cdfcf73-cbd3-5292-beea-060aae18b88a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('22f9605c-418b-5862-9fd8-ec05d90ff641', '3cdfcf73-cbd3-5292-beea-060aae18b88a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 231: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('46994d77-0006-5cc4-993f-fdf9aa916fbe', '00000000-0000-0000-0000-000000000000', 'st231@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st231@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('46994d77-0006-5cc4-993f-fdf9aa916fbe', '46994d77-0006-5cc4-993f-fdf9aa916fbe', '{"sub": "46994d77-0006-5cc4-993f-fdf9aa916fbe", "email": "st231@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '46994d77-0006-5cc4-993f-fdf9aa916fbe')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('46994d77-0006-5cc4-993f-fdf9aa916fbe', 'admin', 'st231@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('263366e4-5bd9-5d16-88e6-9697ee7edbd1', '46994d77-0006-5cc4-993f-fdf9aa916fbe', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.308462, 84.77319, 'India EV Network License', 'LIC-IN-ST231', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '263366e4-5bd9-5d16-88e6-9697ee7edbd1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8d62d993-5363-53e7-9096-2b1fd67854a9', '263366e4-5bd9-5d16-88e6-9697ee7edbd1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8a9e7ef6-0b42-5cd9-aee9-3719c0669f37', '263366e4-5bd9-5d16-88e6-9697ee7edbd1', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 232: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bd3d34e3-87af-5caf-8506-73c99c1e86b6', '00000000-0000-0000-0000-000000000000', 'st232@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st232@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bd3d34e3-87af-5caf-8506-73c99c1e86b6', 'bd3d34e3-87af-5caf-8506-73c99c1e86b6', '{"sub": "bd3d34e3-87af-5caf-8506-73c99c1e86b6", "email": "st232@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bd3d34e3-87af-5caf-8506-73c99c1e86b6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bd3d34e3-87af-5caf-8506-73c99c1e86b6', 'admin', 'st232@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d95f8e7f-3700-5158-a103-ff5da3433d2f', 'bd3d34e3-87af-5caf-8506-73c99c1e86b6', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.301504, 84.83013, 'India EV Network License', 'LIC-IN-ST232', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd95f8e7f-3700-5158-a103-ff5da3433d2f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('75cbc732-943e-5b38-a956-1266b07624f2', 'd95f8e7f-3700-5158-a103-ff5da3433d2f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('10c567d9-aaf8-5d1e-82ca-e96cfd6bf70f', 'd95f8e7f-3700-5158-a103-ff5da3433d2f', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 233: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3e5ae8be-dfa2-58c7-a1a0-cb9c95b52240', '00000000-0000-0000-0000-000000000000', 'st233@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st233@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3e5ae8be-dfa2-58c7-a1a0-cb9c95b52240', '3e5ae8be-dfa2-58c7-a1a0-cb9c95b52240', '{"sub": "3e5ae8be-dfa2-58c7-a1a0-cb9c95b52240", "email": "st233@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3e5ae8be-dfa2-58c7-a1a0-cb9c95b52240')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3e5ae8be-dfa2-58c7-a1a0-cb9c95b52240', 'admin', 'st233@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('67c3d93e-2818-52ea-925c-f465ad3ce98c', '3e5ae8be-dfa2-58c7-a1a0-cb9c95b52240', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.306038, 84.78173, 'India EV Network License', 'LIC-IN-ST233', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '67c3d93e-2818-52ea-925c-f465ad3ce98c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b89ca01f-0ef6-51f8-887d-227140a3f4dd', '67c3d93e-2818-52ea-925c-f465ad3ce98c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('50d9a60b-333f-521f-862f-f7c92fa9f5bf', '67c3d93e-2818-52ea-925c-f465ad3ce98c', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 234: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('edecacf9-af7d-5aea-94cd-0fb4622fdba8', '00000000-0000-0000-0000-000000000000', 'st234@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st234@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('edecacf9-af7d-5aea-94cd-0fb4622fdba8', 'edecacf9-af7d-5aea-94cd-0fb4622fdba8', '{"sub": "edecacf9-af7d-5aea-94cd-0fb4622fdba8", "email": "st234@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'edecacf9-af7d-5aea-94cd-0fb4622fdba8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('edecacf9-af7d-5aea-94cd-0fb4622fdba8', 'admin', 'st234@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a20f353d-62ae-53b3-8094-2ad9e0df1bf0', 'edecacf9-af7d-5aea-94cd-0fb4622fdba8', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.315211, 84.858144, 'India EV Network License', 'LIC-IN-ST234', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a20f353d-62ae-53b3-8094-2ad9e0df1bf0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('635d4344-caeb-5098-80ce-0f1fffa7de29', 'a20f353d-62ae-53b3-8094-2ad9e0df1bf0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('da3781ae-17a8-5ca9-8c47-a6ac866afda6', 'a20f353d-62ae-53b3-8094-2ad9e0df1bf0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 235: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('73ac4096-adef-570a-9b46-e2350e65f6a7', '00000000-0000-0000-0000-000000000000', 'st235@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st235@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('73ac4096-adef-570a-9b46-e2350e65f6a7', '73ac4096-adef-570a-9b46-e2350e65f6a7', '{"sub": "73ac4096-adef-570a-9b46-e2350e65f6a7", "email": "st235@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '73ac4096-adef-570a-9b46-e2350e65f6a7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('73ac4096-adef-570a-9b46-e2350e65f6a7', 'admin', 'st235@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2213f049-e233-5511-b7b5-89be95f3f0c9', '73ac4096-adef-570a-9b46-e2350e65f6a7', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.31608, 84.85278, 'India EV Network License', 'LIC-IN-ST235', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2213f049-e233-5511-b7b5-89be95f3f0c9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7f27ab9b-d62a-5f10-9314-35d8224a2988', '2213f049-e233-5511-b7b5-89be95f3f0c9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a65816ef-0cd8-5dc9-adf9-f6fd6fb8fa12', '2213f049-e233-5511-b7b5-89be95f3f0c9', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 236: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f953087e-f85d-585c-8cc1-3acc117752b8', '00000000-0000-0000-0000-000000000000', 'st236@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st236@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f953087e-f85d-585c-8cc1-3acc117752b8', 'f953087e-f85d-585c-8cc1-3acc117752b8', '{"sub": "f953087e-f85d-585c-8cc1-3acc117752b8", "email": "st236@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f953087e-f85d-585c-8cc1-3acc117752b8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f953087e-f85d-585c-8cc1-3acc117752b8', 'admin', 'st236@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b418d984-b040-54e6-b812-be9f4fc0f0c5', 'f953087e-f85d-585c-8cc1-3acc117752b8', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.30744, 84.81665, 'India EV Network License', 'LIC-IN-ST236', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b418d984-b040-54e6-b812-be9f4fc0f0c5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e8a86961-f4ca-5e95-a433-0bee6e84f97a', 'b418d984-b040-54e6-b812-be9f4fc0f0c5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('74db9da1-f471-59d7-a1a6-54bc2a09337c', 'b418d984-b040-54e6-b812-be9f4fc0f0c5', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 237: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('25c74666-4ed0-53d8-b589-c32750483104', '00000000-0000-0000-0000-000000000000', 'st237@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st237@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('25c74666-4ed0-53d8-b589-c32750483104', '25c74666-4ed0-53d8-b589-c32750483104', '{"sub": "25c74666-4ed0-53d8-b589-c32750483104", "email": "st237@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '25c74666-4ed0-53d8-b589-c32750483104')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('25c74666-4ed0-53d8-b589-c32750483104', 'admin', 'st237@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('56750f98-5c41-59e4-838e-775cce44345d', '25c74666-4ed0-53d8-b589-c32750483104', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.3176997, 84.7905836, 'India EV Network License', 'LIC-IN-ST237', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '56750f98-5c41-59e4-838e-775cce44345d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f066e340-ac51-5859-8a0b-8413ab4bee55', '56750f98-5c41-59e4-838e-775cce44345d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bf88f4f3-aa23-5daf-982d-4bf89ece824f', '56750f98-5c41-59e4-838e-775cce44345d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 238: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('abce2c15-aa1c-5c95-90e3-7ee88bf71816', '00000000-0000-0000-0000-000000000000', 'st238@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st238@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('abce2c15-aa1c-5c95-90e3-7ee88bf71816', 'abce2c15-aa1c-5c95-90e3-7ee88bf71816', '{"sub": "abce2c15-aa1c-5c95-90e3-7ee88bf71816", "email": "st238@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'abce2c15-aa1c-5c95-90e3-7ee88bf71816')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('abce2c15-aa1c-5c95-90e3-7ee88bf71816', 'admin', 'st238@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3ec3f49e-eca6-537a-a183-fb6d0e5838dc', 'abce2c15-aa1c-5c95-90e3-7ee88bf71816', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.32163, 84.86715, 'India EV Network License', 'LIC-IN-ST238', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3ec3f49e-eca6-537a-a183-fb6d0e5838dc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('68f12785-6e19-5496-a3fb-7bf3c34906b6', '3ec3f49e-eca6-537a-a183-fb6d0e5838dc', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('276825a6-26d2-5154-b880-31ebcf9215a7', '3ec3f49e-eca6-537a-a183-fb6d0e5838dc', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 239: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('34faa060-3cce-5a74-8a9e-1cab7a0db239', '00000000-0000-0000-0000-000000000000', 'st239@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st239@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('34faa060-3cce-5a74-8a9e-1cab7a0db239', '34faa060-3cce-5a74-8a9e-1cab7a0db239', '{"sub": "34faa060-3cce-5a74-8a9e-1cab7a0db239", "email": "st239@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '34faa060-3cce-5a74-8a9e-1cab7a0db239')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('34faa060-3cce-5a74-8a9e-1cab7a0db239', 'admin', 'st239@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f0e84353-57cf-5253-8b82-69db4862731a', '34faa060-3cce-5a74-8a9e-1cab7a0db239', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.319885, 84.78113, 'India EV Network License', 'LIC-IN-ST239', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f0e84353-57cf-5253-8b82-69db4862731a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('af7bab4d-683e-5af1-a6cd-2c26699b939f', 'f0e84353-57cf-5253-8b82-69db4862731a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eb5155b6-2249-5ccc-b1d3-89515c34194b', 'f0e84353-57cf-5253-8b82-69db4862731a', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 240: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2677a1a2-7acd-56e1-bec2-7b028f9d34f9', '00000000-0000-0000-0000-000000000000', 'st240@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st240@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2677a1a2-7acd-56e1-bec2-7b028f9d34f9', '2677a1a2-7acd-56e1-bec2-7b028f9d34f9', '{"sub": "2677a1a2-7acd-56e1-bec2-7b028f9d34f9", "email": "st240@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2677a1a2-7acd-56e1-bec2-7b028f9d34f9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2677a1a2-7acd-56e1-bec2-7b028f9d34f9', 'admin', 'st240@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('aaaa19e5-8678-5360-bdbe-dc924ee059af', '2677a1a2-7acd-56e1-bec2-7b028f9d34f9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.2956471, 84.8195658, 'India EV Network License', 'LIC-IN-ST240', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'aaaa19e5-8678-5360-bdbe-dc924ee059af';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('897acc1c-205e-50d3-b6e9-7235423a3ab3', 'aaaa19e5-8678-5360-bdbe-dc924ee059af', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('facbc153-e6d1-5a30-b671-1594c27fa8b3', 'aaaa19e5-8678-5360-bdbe-dc924ee059af', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 241: BPCL Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('335e2c15-1374-5813-baae-37d21a68af35', '00000000-0000-0000-0000-000000000000', 'st241@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st241@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('335e2c15-1374-5813-baae-37d21a68af35', '335e2c15-1374-5813-baae-37d21a68af35', '{"sub": "335e2c15-1374-5813-baae-37d21a68af35", "email": "st241@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '335e2c15-1374-5813-baae-37d21a68af35')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('335e2c15-1374-5813-baae-37d21a68af35', 'admin', 'st241@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('39873555-5f4d-5414-806f-ca7c205f5269', '335e2c15-1374-5813-baae-37d21a68af35', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.334627, 84.768619, 'India EV Network License', 'LIC-IN-ST241', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '39873555-5f4d-5414-806f-ca7c205f5269';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('30acf178-0efc-5166-9fbe-0059aff47aef', '39873555-5f4d-5414-806f-ca7c205f5269', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a4f1b463-1dc8-5d97-822e-4d402f428cf5', '39873555-5f4d-5414-806f-ca7c205f5269', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 242: Ather Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ee5fa8ec-7683-5a45-a40d-3812aa40c07a', '00000000-0000-0000-0000-000000000000', 'st242@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st242@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ee5fa8ec-7683-5a45-a40d-3812aa40c07a', 'ee5fa8ec-7683-5a45-a40d-3812aa40c07a', '{"sub": "ee5fa8ec-7683-5a45-a40d-3812aa40c07a", "email": "st242@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ee5fa8ec-7683-5a45-a40d-3812aa40c07a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ee5fa8ec-7683-5a45-a40d-3812aa40c07a', 'admin', 'st242@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e7004c35-1491-5c64-875d-66e2bfd0c4d6', 'ee5fa8ec-7683-5a45-a40d-3812aa40c07a', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 19.3057277, 84.7817268, 'India EV Network License', 'LIC-IN-ST242', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e7004c35-1491-5c64-875d-66e2bfd0c4d6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('639cfc12-20bc-584d-b043-da05b4ddeb52', 'e7004c35-1491-5c64-875d-66e2bfd0c4d6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a3a6ba8e-cd20-527b-8a13-3fbd340b6e2b', 'e7004c35-1491-5c64-875d-66e2bfd0c4d6', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 243: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('49e9cde4-cfc3-514d-9847-091dea491966', '00000000-0000-0000-0000-000000000000', 'st243@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st243@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('49e9cde4-cfc3-514d-9847-091dea491966', '49e9cde4-cfc3-514d-9847-091dea491966', '{"sub": "49e9cde4-cfc3-514d-9847-091dea491966", "email": "st243@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '49e9cde4-cfc3-514d-9847-091dea491966')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('49e9cde4-cfc3-514d-9847-091dea491966', 'admin', 'st243@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cf21752c-7f2d-5471-9467-0bc8459584e7', '49e9cde4-cfc3-514d-9847-091dea491966', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.303381, 84.795044, 'India EV Network License', 'LIC-IN-ST243', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cf21752c-7f2d-5471-9467-0bc8459584e7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4c30a2b8-67d4-5954-9bde-2ae725dc1c50', 'cf21752c-7f2d-5471-9467-0bc8459584e7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('24bce3ee-aa3a-5aec-a2e4-577890ba8dab', 'cf21752c-7f2d-5471-9467-0bc8459584e7', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 244: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('89bf9a6c-8dc7-554a-a629-d1972e981c36', '00000000-0000-0000-0000-000000000000', 'st244@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st244@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('89bf9a6c-8dc7-554a-a629-d1972e981c36', '89bf9a6c-8dc7-554a-a629-d1972e981c36', '{"sub": "89bf9a6c-8dc7-554a-a629-d1972e981c36", "email": "st244@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '89bf9a6c-8dc7-554a-a629-d1972e981c36')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('89bf9a6c-8dc7-554a-a629-d1972e981c36', 'admin', 'st244@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('14302360-865e-5f25-b102-9a4404fc863a', '89bf9a6c-8dc7-554a-a629-d1972e981c36', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.2991714, 84.8317631, 'India EV Network License', 'LIC-IN-ST244', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '14302360-865e-5f25-b102-9a4404fc863a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('385bba61-9ad5-5bf6-ae79-19442472d5c4', '14302360-865e-5f25-b102-9a4404fc863a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1aafc653-ff02-5dc3-abc1-e3c7d0a5d840', '14302360-865e-5f25-b102-9a4404fc863a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 245: Maa Tara Tarini Tour And Travels (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3dd18cd9-d4d2-5d91-8a4b-975581cb2d74', '00000000-0000-0000-0000-000000000000', 'st245@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st245@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3dd18cd9-d4d2-5d91-8a4b-975581cb2d74', '3dd18cd9-d4d2-5d91-8a4b-975581cb2d74', '{"sub": "3dd18cd9-d4d2-5d91-8a4b-975581cb2d74", "email": "st245@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3dd18cd9-d4d2-5d91-8a4b-975581cb2d74')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3dd18cd9-d4d2-5d91-8a4b-975581cb2d74', 'admin', 'st245@boss.com', 'Admin Maa Tara Tarini Tour And Travels', 'Maa Tara Tarini Tour And Travels', 'Maa Tara Tarini Tour And Travels, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('902d3df0-a0fa-5480-a145-0483d7c132d8', '3dd18cd9-d4d2-5d91-8a4b-975581cb2d74', 'Maa Tara Tarini Tour And Travels', 'Maa Tara Tarini Tour And Travels, Odisha, India', 19.447535, 84.591458, 'India EV Network License', 'LIC-IN-ST245', 500.0, 7.4, true, 'Khordha', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '902d3df0-a0fa-5480-a145-0483d7c132d8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('27ddff25-944a-5e1f-b2ca-2be3036fe895', '902d3df0-a0fa-5480-a145-0483d7c132d8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 246: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('93a7f0a6-94ca-556b-9934-95e6e6e76293', '00000000-0000-0000-0000-000000000000', 'st246@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st246@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('93a7f0a6-94ca-556b-9934-95e6e6e76293', '93a7f0a6-94ca-556b-9934-95e6e6e76293', '{"sub": "93a7f0a6-94ca-556b-9934-95e6e6e76293", "email": "st246@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '93a7f0a6-94ca-556b-9934-95e6e6e76293')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('93a7f0a6-94ca-556b-9934-95e6e6e76293', 'admin', 'st246@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1cd4e0f5-11df-5d93-aa40-7bca88266d2b', '93a7f0a6-94ca-556b-9934-95e6e6e76293', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.180776, 84.725327, 'India EV Network License', 'LIC-IN-ST246', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1cd4e0f5-11df-5d93-aa40-7bca88266d2b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('05005ff2-b677-530e-a96c-54137128d5df', '1cd4e0f5-11df-5d93-aa40-7bca88266d2b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('155f6df5-d6cc-53e4-8ce0-278ae4112b6c', '1cd4e0f5-11df-5d93-aa40-7bca88266d2b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 247: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('24935868-fa03-5940-80db-0ff184ddf603', '00000000-0000-0000-0000-000000000000', 'st247@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st247@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('24935868-fa03-5940-80db-0ff184ddf603', '24935868-fa03-5940-80db-0ff184ddf603', '{"sub": "24935868-fa03-5940-80db-0ff184ddf603", "email": "st247@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '24935868-fa03-5940-80db-0ff184ddf603')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('24935868-fa03-5940-80db-0ff184ddf603', 'admin', 'st247@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0fae9151-7e76-5b6d-9fc8-a3627a25b490', '24935868-fa03-5940-80db-0ff184ddf603', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.26892, 84.77745, 'India EV Network License', 'LIC-IN-ST247', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0fae9151-7e76-5b6d-9fc8-a3627a25b490';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('099248bf-f60d-5efb-a696-38241bb6a3a2', '0fae9151-7e76-5b6d-9fc8-a3627a25b490', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1cb60e0d-0cfe-5ae2-9bd1-855028969dfe', '0fae9151-7e76-5b6d-9fc8-a3627a25b490', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 248: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7045d759-c414-5977-baca-a1236e561358', '00000000-0000-0000-0000-000000000000', 'st248@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st248@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7045d759-c414-5977-baca-a1236e561358', '7045d759-c414-5977-baca-a1236e561358', '{"sub": "7045d759-c414-5977-baca-a1236e561358", "email": "st248@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7045d759-c414-5977-baca-a1236e561358')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7045d759-c414-5977-baca-a1236e561358', 'admin', 'st248@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2e0393df-0e73-5e9c-9ec8-8cb087bf9753', '7045d759-c414-5977-baca-a1236e561358', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.183324, 84.727616, 'India EV Network License', 'LIC-IN-ST248', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2e0393df-0e73-5e9c-9ec8-8cb087bf9753';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('88a88524-f382-53f5-8d7f-a7280a101f8f', '2e0393df-0e73-5e9c-9ec8-8cb087bf9753', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a3d70e99-0a0e-50fb-a95a-a372744a414e', '2e0393df-0e73-5e9c-9ec8-8cb087bf9753', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 249: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ada11e3c-c1a4-5c86-9e3f-77fc46fcbcac', '00000000-0000-0000-0000-000000000000', 'st249@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st249@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ada11e3c-c1a4-5c86-9e3f-77fc46fcbcac', 'ada11e3c-c1a4-5c86-9e3f-77fc46fcbcac', '{"sub": "ada11e3c-c1a4-5c86-9e3f-77fc46fcbcac", "email": "st249@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ada11e3c-c1a4-5c86-9e3f-77fc46fcbcac')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ada11e3c-c1a4-5c86-9e3f-77fc46fcbcac', 'admin', 'st249@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d8dfbe40-a8dc-558c-b48a-424b02401b20', 'ada11e3c-c1a4-5c86-9e3f-77fc46fcbcac', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.194212, 84.61756, 'India EV Network License', 'LIC-IN-ST249', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd8dfbe40-a8dc-558c-b48a-424b02401b20';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a582f85e-a96e-55cd-9194-3f6c161b0ad8', 'd8dfbe40-a8dc-558c-b48a-424b02401b20', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('13a4221e-5211-5864-a7d7-fb1bcd5301b5', 'd8dfbe40-a8dc-558c-b48a-424b02401b20', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 250: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('66de35b4-f53e-5de3-b307-71819453c2e1', '00000000-0000-0000-0000-000000000000', 'st250@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st250@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('66de35b4-f53e-5de3-b307-71819453c2e1', '66de35b4-f53e-5de3-b307-71819453c2e1', '{"sub": "66de35b4-f53e-5de3-b307-71819453c2e1", "email": "st250@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '66de35b4-f53e-5de3-b307-71819453c2e1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('66de35b4-f53e-5de3-b307-71819453c2e1', 'admin', 'st250@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('abbc9942-cd40-5f0b-a320-13c1b2d24930', '66de35b4-f53e-5de3-b307-71819453c2e1', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.845465, 84.5031, 'India EV Network License', 'LIC-IN-ST250', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'abbc9942-cd40-5f0b-a320-13c1b2d24930';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bfae43b2-81ea-5855-8bab-9148c33f9410', 'abbc9942-cd40-5f0b-a320-13c1b2d24930', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3a32ace4-fadc-55fb-9e08-416f25de3106', 'abbc9942-cd40-5f0b-a320-13c1b2d24930', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 251: DIMILI VILLAGE (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9d8481a3-1c82-51c3-bb73-3067d5168346', '00000000-0000-0000-0000-000000000000', 'st251@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st251@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9d8481a3-1c82-51c3-bb73-3067d5168346', '9d8481a3-1c82-51c3-bb73-3067d5168346', '{"sub": "9d8481a3-1c82-51c3-bb73-3067d5168346", "email": "st251@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9d8481a3-1c82-51c3-bb73-3067d5168346')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9d8481a3-1c82-51c3-bb73-3067d5168346', 'admin', 'st251@boss.com', 'Admin DIMILI VILLAGE', 'DIMILI VILLAGE', 'DIMILI VILLAGE, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('92bf8575-cab7-54a9-b027-9598f37a3ef7', '9d8481a3-1c82-51c3-bb73-3067d5168346', 'DIMILI VILLAGE', 'DIMILI VILLAGE, Odisha, India', 18.8020625, 83.9918125, 'India EV Network License', 'LIC-IN-ST251', 500.0, 7.4, true, 'Cuttack', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '92bf8575-cab7-54a9-b027-9598f37a3ef7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('95c84507-99e6-586e-9c6a-e1f14b56c1eb', '92bf8575-cab7-54a9-b027-9598f37a3ef7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 252: Electric Vehicle Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('af7bcf57-a631-52e0-8488-9da4e8393a43', '00000000-0000-0000-0000-000000000000', 'st252@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st252@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('af7bcf57-a631-52e0-8488-9da4e8393a43', 'af7bcf57-a631-52e0-8488-9da4e8393a43', '{"sub": "af7bcf57-a631-52e0-8488-9da4e8393a43", "email": "st252@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'af7bcf57-a631-52e0-8488-9da4e8393a43')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('af7bcf57-a631-52e0-8488-9da4e8393a43', 'admin', 'st252@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fa23d3af-77b0-5b3a-ada2-65fcb36fa3b0', 'af7bcf57-a631-52e0-8488-9da4e8393a43', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.7689167, 83.4215387, 'India EV Network License', 'LIC-IN-ST252', 500.0, 25.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fa23d3af-77b0-5b3a-ada2-65fcb36fa3b0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('554d254d-150e-52d0-a649-6a5dff546477', 'fa23d3af-77b0-5b3a-ada2-65fcb36fa3b0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('10791e52-05d2-59c2-b848-6447ef86eadb', 'fa23d3af-77b0-5b3a-ada2-65fcb36fa3b0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 253: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('80f80159-fc28-5d9c-be43-723e9c474ae7', '00000000-0000-0000-0000-000000000000', 'st253@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st253@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('80f80159-fc28-5d9c-be43-723e9c474ae7', '80f80159-fc28-5d9c-be43-723e9c474ae7', '{"sub": "80f80159-fc28-5d9c-be43-723e9c474ae7", "email": "st253@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '80f80159-fc28-5d9c-be43-723e9c474ae7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('80f80159-fc28-5d9c-be43-723e9c474ae7', 'admin', 'st253@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1ac7f779-6526-5c91-bc4a-0053ad2fccb1', '80f80159-fc28-5d9c-be43-723e9c474ae7', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.8582131, 82.5899051, 'India EV Network License', 'LIC-IN-ST253', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1ac7f779-6526-5c91-bc4a-0053ad2fccb1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b61cfd4b-164e-5cd4-9e82-bcd522aab5c3', '1ac7f779-6526-5c91-bc4a-0053ad2fccb1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('09bbc25f-c572-592e-9bca-a5a727bf466d', '1ac7f779-6526-5c91-bc4a-0053ad2fccb1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 254: BPCL Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('670917c6-58b1-56a6-b1cf-470e8670a173', '00000000-0000-0000-0000-000000000000', 'st254@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st254@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('670917c6-58b1-56a6-b1cf-470e8670a173', '670917c6-58b1-56a6-b1cf-470e8670a173', '{"sub": "670917c6-58b1-56a6-b1cf-470e8670a173", "email": "st254@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '670917c6-58b1-56a6-b1cf-470e8670a173')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('670917c6-58b1-56a6-b1cf-470e8670a173', 'admin', 'st254@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('523b4f45-5220-5728-8b74-f43d1d53bf53', '670917c6-58b1-56a6-b1cf-470e8670a173', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 18.84732, 82.565171, 'India EV Network License', 'LIC-IN-ST254', 500.0, 30.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '523b4f45-5220-5728-8b74-f43d1d53bf53';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('31277a49-f958-5f19-a8f5-97df432563fc', '523b4f45-5220-5728-8b74-f43d1d53bf53', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d00ef85b-e2fb-5719-8a9b-068ef4dfaa8f', '523b4f45-5220-5728-8b74-f43d1d53bf53', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 255: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6b5337c4-b175-507c-a893-8136914891f7', '00000000-0000-0000-0000-000000000000', 'st255@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st255@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6b5337c4-b175-507c-a893-8136914891f7', '6b5337c4-b175-507c-a893-8136914891f7', '{"sub": "6b5337c4-b175-507c-a893-8136914891f7", "email": "st255@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6b5337c4-b175-507c-a893-8136914891f7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6b5337c4-b175-507c-a893-8136914891f7', 'admin', 'st255@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ae02932b-c1f0-58bb-a692-da2a9e4c390c', '6b5337c4-b175-507c-a893-8136914891f7', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.606024, 84.229915, 'India EV Network License', 'LIC-IN-ST255', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ae02932b-c1f0-58bb-a692-da2a9e4c390c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('912d4902-f1c0-584a-9a94-2b08fb9a1b90', 'ae02932b-c1f0-58bb-a692-da2a9e4c390c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ceed03cd-2b8d-529f-a8b8-56e1755da477', 'ae02932b-c1f0-58bb-a692-da2a9e4c390c', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 256: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('24b17e60-9b8d-5d97-b052-59a808b3d5e9', '00000000-0000-0000-0000-000000000000', 'st256@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st256@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('24b17e60-9b8d-5d97-b052-59a808b3d5e9', '24b17e60-9b8d-5d97-b052-59a808b3d5e9', '{"sub": "24b17e60-9b8d-5d97-b052-59a808b3d5e9", "email": "st256@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '24b17e60-9b8d-5d97-b052-59a808b3d5e9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('24b17e60-9b8d-5d97-b052-59a808b3d5e9', 'admin', 'st256@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5f74fc0d-2cea-588c-a616-3f7b8f8feefa', '24b17e60-9b8d-5d97-b052-59a808b3d5e9', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.534753, 83.651339, 'India EV Network License', 'LIC-IN-ST256', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5f74fc0d-2cea-588c-a616-3f7b8f8feefa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('607be1ea-f5e3-5af5-9482-045f70db7877', '5f74fc0d-2cea-588c-a616-3f7b8f8feefa', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2f8ef0d3-ad84-587a-aecf-cbaebf53c571', '5f74fc0d-2cea-588c-a616-3f7b8f8feefa', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 257: okinawa electric scooter (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dd4d4f90-ccc5-5de9-abc1-b982f86664ac', '00000000-0000-0000-0000-000000000000', 'st257@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st257@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dd4d4f90-ccc5-5de9-abc1-b982f86664ac', 'dd4d4f90-ccc5-5de9-abc1-b982f86664ac', '{"sub": "dd4d4f90-ccc5-5de9-abc1-b982f86664ac", "email": "st257@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dd4d4f90-ccc5-5de9-abc1-b982f86664ac')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dd4d4f90-ccc5-5de9-abc1-b982f86664ac', 'admin', 'st257@boss.com', 'Admin okinawa electric scooter', 'okinawa electric scooter', 'okinawa electric scooter, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('475f524b-7182-57f9-8880-e4461b99c56a', 'dd4d4f90-ccc5-5de9-abc1-b982f86664ac', 'okinawa electric scooter', 'okinawa electric scooter, Odisha, India', 18.5970465, 83.7640945, 'India EV Network License', 'LIC-IN-ST257', 500.0, 3.3, true, 'Balasore', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '475f524b-7182-57f9-8880-e4461b99c56a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bae82067-e009-5892-8b35-837c14f299bf', '475f524b-7182-57f9-8880-e4461b99c56a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 258: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3df91a9d-cf22-5e43-a4ca-20f60eff20bb', '00000000-0000-0000-0000-000000000000', 'st258@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st258@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3df91a9d-cf22-5e43-a4ca-20f60eff20bb', '3df91a9d-cf22-5e43-a4ca-20f60eff20bb', '{"sub": "3df91a9d-cf22-5e43-a4ca-20f60eff20bb", "email": "st258@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3df91a9d-cf22-5e43-a4ca-20f60eff20bb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3df91a9d-cf22-5e43-a4ca-20f60eff20bb', 'admin', 'st258@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e8ba22df-e78c-52e3-bb3c-4e981499b48a', '3df91a9d-cf22-5e43-a4ca-20f60eff20bb', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.6104394, 83.3992285, 'India EV Network License', 'LIC-IN-ST258', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e8ba22df-e78c-52e3-bb3c-4e981499b48a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d317e8d1-e52b-5960-9509-ab674da02447', 'e8ba22df-e78c-52e3-bb3c-4e981499b48a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('50863351-382b-5d62-83da-c9c7a80e3d92', 'e8ba22df-e78c-52e3-bb3c-4e981499b48a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 259: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b20af99c-ebfb-582a-b3d9-58a8b47e10e0', '00000000-0000-0000-0000-000000000000', 'st259@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st259@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b20af99c-ebfb-582a-b3d9-58a8b47e10e0', 'b20af99c-ebfb-582a-b3d9-58a8b47e10e0', '{"sub": "b20af99c-ebfb-582a-b3d9-58a8b47e10e0", "email": "st259@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b20af99c-ebfb-582a-b3d9-58a8b47e10e0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b20af99c-ebfb-582a-b3d9-58a8b47e10e0', 'admin', 'st259@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bae017bc-5d60-55a3-8db7-c75b1913710d', 'b20af99c-ebfb-582a-b3d9-58a8b47e10e0', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.5035093, 83.2469705, 'India EV Network License', 'LIC-IN-ST259', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bae017bc-5d60-55a3-8db7-c75b1913710d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a1e59836-be74-5eff-912f-ba9a91cae448', 'bae017bc-5d60-55a3-8db7-c75b1913710d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f73755cc-802b-5c63-87c2-041e715210ab', 'bae017bc-5d60-55a3-8db7-c75b1913710d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 260: Jio-bp (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('079777e8-5590-5dd3-b5f6-264d26ffd0e7', '00000000-0000-0000-0000-000000000000', 'st260@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st260@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('079777e8-5590-5dd3-b5f6-264d26ffd0e7', '079777e8-5590-5dd3-b5f6-264d26ffd0e7', '{"sub": "079777e8-5590-5dd3-b5f6-264d26ffd0e7", "email": "st260@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '079777e8-5590-5dd3-b5f6-264d26ffd0e7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('079777e8-5590-5dd3-b5f6-264d26ffd0e7', 'admin', 'st260@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4d5b33f9-72c9-5b50-9ac9-e022a7031bb9', '079777e8-5590-5dd3-b5f6-264d26ffd0e7', 'Jio-bp', 'Jio-bp, Odisha, India', 18.7012078, 82.879837, 'India EV Network License', 'LIC-IN-ST260', 500.0, 50.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4d5b33f9-72c9-5b50-9ac9-e022a7031bb9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b1c133bf-173a-52cd-95ee-d6caf1118bc5', '4d5b33f9-72c9-5b50-9ac9-e022a7031bb9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d4308c65-435d-5bfe-b915-bc17ca98b065', '4d5b33f9-72c9-5b50-9ac9-e022a7031bb9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 261: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('98905b4c-b6e1-551a-95c8-9a18b91a4e89', '00000000-0000-0000-0000-000000000000', 'st261@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st261@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('98905b4c-b6e1-551a-95c8-9a18b91a4e89', '98905b4c-b6e1-551a-95c8-9a18b91a4e89', '{"sub": "98905b4c-b6e1-551a-95c8-9a18b91a4e89", "email": "st261@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '98905b4c-b6e1-551a-95c8-9a18b91a4e89')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('98905b4c-b6e1-551a-95c8-9a18b91a4e89', 'admin', 'st261@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('516ebcfb-5049-5cc6-82ae-216d2cb0b7eb', '98905b4c-b6e1-551a-95c8-9a18b91a4e89', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.295933, 83.893148, 'India EV Network License', 'LIC-IN-ST261', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '516ebcfb-5049-5cc6-82ae-216d2cb0b7eb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7665b1cb-8942-59b9-8e9d-d126483c25a6', '516ebcfb-5049-5cc6-82ae-216d2cb0b7eb', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('391525dd-df13-585d-9d93-f2be0e9a0b1c', '516ebcfb-5049-5cc6-82ae-216d2cb0b7eb', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 262: Jio-bp pulse Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7f69908b-3177-5ebb-88af-c424def61d61', '00000000-0000-0000-0000-000000000000', 'st262@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st262@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7f69908b-3177-5ebb-88af-c424def61d61', '7f69908b-3177-5ebb-88af-c424def61d61', '{"sub": "7f69908b-3177-5ebb-88af-c424def61d61", "email": "st262@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7f69908b-3177-5ebb-88af-c424def61d61')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7f69908b-3177-5ebb-88af-c424def61d61', 'admin', 'st262@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('41b30493-2469-5615-915d-901d58c05f1e', '7f69908b-3177-5ebb-88af-c424def61d61', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 18.3262791, 83.941268, 'India EV Network License', 'LIC-IN-ST262', 500.0, 60.0, true, 'Cuttack', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '41b30493-2469-5615-915d-901d58c05f1e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b5a364e8-e299-5865-9bba-d4a7819fb21a', '41b30493-2469-5615-915d-901d58c05f1e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6ad62af7-8a8c-594c-8e0f-88d69d275c0b', '41b30493-2469-5615-915d-901d58c05f1e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('81bcabd3-1bba-5cdf-b2b9-5c065aa5b710', '41b30493-2469-5615-915d-901d58c05f1e', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 263: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('59f0221f-554e-5624-81b5-e40650ddd57a', '00000000-0000-0000-0000-000000000000', 'st263@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st263@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('59f0221f-554e-5624-81b5-e40650ddd57a', '59f0221f-554e-5624-81b5-e40650ddd57a', '{"sub": "59f0221f-554e-5624-81b5-e40650ddd57a", "email": "st263@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '59f0221f-554e-5624-81b5-e40650ddd57a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('59f0221f-554e-5624-81b5-e40650ddd57a', 'admin', 'st263@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('53648029-8870-5a70-aa4f-e156ab3ba28a', '59f0221f-554e-5624-81b5-e40650ddd57a', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.3243588, 83.9391102, 'India EV Network License', 'LIC-IN-ST263', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '53648029-8870-5a70-aa4f-e156ab3ba28a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('80d78e66-1357-5057-9f98-6187523800fc', '53648029-8870-5a70-aa4f-e156ab3ba28a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c97871c4-6666-550f-b53b-8c478384e15d', '53648029-8870-5a70-aa4f-e156ab3ba28a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 264: DK MOTORS (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('be60d5de-16d1-5b2e-bf1d-e15837523a5a', '00000000-0000-0000-0000-000000000000', 'st264@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st264@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('be60d5de-16d1-5b2e-bf1d-e15837523a5a', 'be60d5de-16d1-5b2e-bf1d-e15837523a5a', '{"sub": "be60d5de-16d1-5b2e-bf1d-e15837523a5a", "email": "st264@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'be60d5de-16d1-5b2e-bf1d-e15837523a5a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('be60d5de-16d1-5b2e-bf1d-e15837523a5a', 'admin', 'st264@boss.com', 'Admin DK MOTORS', 'DK MOTORS', 'DK MOTORS, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7acaa344-2e81-5073-a267-d6e4495228f2', 'be60d5de-16d1-5b2e-bf1d-e15837523a5a', 'DK MOTORS', 'DK MOTORS, Odisha, India', 18.3226736, 83.893722, 'India EV Network License', 'LIC-IN-ST264', 500.0, 7.4, true, 'Sambalpur', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7acaa344-2e81-5073-a267-d6e4495228f2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c723286f-ddc2-5730-a252-99640171f341', '7acaa344-2e81-5073-a267-d6e4495228f2', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 265: Urzza Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2124296e-8bdd-5b79-816e-cad72782b3e7', '00000000-0000-0000-0000-000000000000', 'st265@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st265@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2124296e-8bdd-5b79-816e-cad72782b3e7', '2124296e-8bdd-5b79-816e-cad72782b3e7', '{"sub": "2124296e-8bdd-5b79-816e-cad72782b3e7", "email": "st265@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2124296e-8bdd-5b79-816e-cad72782b3e7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2124296e-8bdd-5b79-816e-cad72782b3e7', 'admin', 'st265@boss.com', 'Admin Urzza Charging Station', 'Urzza Charging Station', 'Urzza Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('77484c82-f5de-527e-8b7d-f8ec35a09b41', '2124296e-8bdd-5b79-816e-cad72782b3e7', 'Urzza Charging Station', 'Urzza Charging Station, Odisha, India', 18.4243285, 84.0480246, 'India EV Network License', 'LIC-IN-ST265', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '77484c82-f5de-527e-8b7d-f8ec35a09b41';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7770b9fc-de49-5bf3-9fe4-43f8915fcfbd', '77484c82-f5de-527e-8b7d-f8ec35a09b41', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 266: Ather Energy Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('82a401f3-b534-56f6-89c7-47c501700624', '00000000-0000-0000-0000-000000000000', 'st266@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st266@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('82a401f3-b534-56f6-89c7-47c501700624', '82a401f3-b534-56f6-89c7-47c501700624', '{"sub": "82a401f3-b534-56f6-89c7-47c501700624", "email": "st266@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '82a401f3-b534-56f6-89c7-47c501700624')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('82a401f3-b534-56f6-89c7-47c501700624', 'admin', 'st266@boss.com', 'Admin Ather Energy Charging Station', 'Ather Energy Charging Station', 'Ather Energy Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3b40c166-d760-5c0e-abe5-4501cdc2dbd0', '82a401f3-b534-56f6-89c7-47c501700624', 'Ather Energy Charging Station', 'Ather Energy Charging Station, Odisha, India', 18.309546, 83.91882, 'India EV Network License', 'LIC-IN-ST266', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3b40c166-d760-5c0e-abe5-4501cdc2dbd0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fa35cdc4-4b54-5945-b1e7-6edc92d31cb9', '3b40c166-d760-5c0e-abe5-4501cdc2dbd0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd916792-8ccf-5c42-ac0b-e9ada1dcd6f3', '3b40c166-d760-5c0e-abe5-4501cdc2dbd0', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 267: Voltran Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f7733f3c-6be4-5382-9771-ed4991f34579', '00000000-0000-0000-0000-000000000000', 'st267@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st267@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f7733f3c-6be4-5382-9771-ed4991f34579', 'f7733f3c-6be4-5382-9771-ed4991f34579', '{"sub": "f7733f3c-6be4-5382-9771-ed4991f34579", "email": "st267@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f7733f3c-6be4-5382-9771-ed4991f34579')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f7733f3c-6be4-5382-9771-ed4991f34579', 'admin', 'st267@boss.com', 'Admin Voltran Charging Station', 'Voltran Charging Station', 'Voltran Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6c6128b2-ae0f-562b-8a1b-ccfece237c80', 'f7733f3c-6be4-5382-9771-ed4991f34579', 'Voltran Charging Station', 'Voltran Charging Station, Odisha, India', 18.3004408, 83.8711628, 'India EV Network License', 'LIC-IN-ST267', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6c6128b2-ae0f-562b-8a1b-ccfece237c80';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b89394d6-2096-524e-be68-0e079e971a6e', '6c6128b2-ae0f-562b-8a1b-ccfece237c80', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 268: Jio-bp (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0047517e-7259-5a15-a226-78e5dab263ad', '00000000-0000-0000-0000-000000000000', 'st268@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st268@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0047517e-7259-5a15-a226-78e5dab263ad', '0047517e-7259-5a15-a226-78e5dab263ad', '{"sub": "0047517e-7259-5a15-a226-78e5dab263ad", "email": "st268@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0047517e-7259-5a15-a226-78e5dab263ad')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0047517e-7259-5a15-a226-78e5dab263ad', 'admin', 'st268@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('de17e5d6-dee5-59a9-92b4-dda8c3da5dd9', '0047517e-7259-5a15-a226-78e5dab263ad', 'Jio-bp', 'Jio-bp, Odisha, India', 18.289378, 83.914594, 'India EV Network License', 'LIC-IN-ST268', 500.0, 50.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'de17e5d6-dee5-59a9-92b4-dda8c3da5dd9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f23d2622-56fc-5c53-ab87-f3034c2e960e', 'de17e5d6-dee5-59a9-92b4-dda8c3da5dd9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c8393741-1482-5e69-9fc2-81eef765993c', 'de17e5d6-dee5-59a9-92b4-dda8c3da5dd9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 269: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5f4ae0b4-6fec-5f88-91e3-fd68dedc09c9', '00000000-0000-0000-0000-000000000000', 'st269@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st269@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5f4ae0b4-6fec-5f88-91e3-fd68dedc09c9', '5f4ae0b4-6fec-5f88-91e3-fd68dedc09c9', '{"sub": "5f4ae0b4-6fec-5f88-91e3-fd68dedc09c9", "email": "st269@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5f4ae0b4-6fec-5f88-91e3-fd68dedc09c9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5f4ae0b4-6fec-5f88-91e3-fd68dedc09c9', 'admin', 'st269@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d9d3a36c-aefe-5e37-a517-2a1af568390f', '5f4ae0b4-6fec-5f88-91e3-fd68dedc09c9', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.2791756, 83.5261386, 'India EV Network License', 'LIC-IN-ST269', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd9d3a36c-aefe-5e37-a517-2a1af568390f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a29ea334-151c-54e1-a87e-6318cb31f2a6', 'd9d3a36c-aefe-5e37-a517-2a1af568390f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fe4b2147-c4e1-5a1f-a796-508d29aa2549', 'd9d3a36c-aefe-5e37-a517-2a1af568390f', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 270: AtherGrid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf33dd46-d881-538f-96ff-6f9fd879ebe7', '00000000-0000-0000-0000-000000000000', 'st270@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st270@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf33dd46-d881-538f-96ff-6f9fd879ebe7', 'cf33dd46-d881-538f-96ff-6f9fd879ebe7', '{"sub": "cf33dd46-d881-538f-96ff-6f9fd879ebe7", "email": "st270@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf33dd46-d881-538f-96ff-6f9fd879ebe7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf33dd46-d881-538f-96ff-6f9fd879ebe7', 'admin', 'st270@boss.com', 'Admin AtherGrid Charging Station', 'AtherGrid Charging Station', 'AtherGrid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('295ce5d7-099b-5169-a16a-b5ed70757e53', 'cf33dd46-d881-538f-96ff-6f9fd879ebe7', 'AtherGrid Charging Station', 'AtherGrid Charging Station, Odisha, India', 18.3372038, 82.8779255, 'India EV Network License', 'LIC-IN-ST270', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '295ce5d7-099b-5169-a16a-b5ed70757e53';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('710fc1af-9272-5ca4-b0c2-e87203738215', '295ce5d7-099b-5169-a16a-b5ed70757e53', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fc54dece-d1de-51aa-b746-ea90bd05b929', '295ce5d7-099b-5169-a16a-b5ed70757e53', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 271: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('352e808a-9449-5415-bb07-ecc13f4fe20a', '00000000-0000-0000-0000-000000000000', 'st271@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st271@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('352e808a-9449-5415-bb07-ecc13f4fe20a', '352e808a-9449-5415-bb07-ecc13f4fe20a', '{"sub": "352e808a-9449-5415-bb07-ecc13f4fe20a", "email": "st271@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '352e808a-9449-5415-bb07-ecc13f4fe20a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('352e808a-9449-5415-bb07-ecc13f4fe20a', 'admin', 'st271@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6859004a-5c1e-5463-8c2e-291282dd5e9f', '352e808a-9449-5415-bb07-ecc13f4fe20a', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.3225938, 82.8776518, 'India EV Network License', 'LIC-IN-ST271', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6859004a-5c1e-5463-8c2e-291282dd5e9f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4ecd8442-2058-593d-8c63-4077603666c0', '6859004a-5c1e-5463-8c2e-291282dd5e9f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ebde6497-95c9-5b52-bc3a-ec0b397944e2', '6859004a-5c1e-5463-8c2e-291282dd5e9f', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 272: Charzer Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1e8412c0-6112-5402-bd9f-4d7805d79ffc', '00000000-0000-0000-0000-000000000000', 'st272@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st272@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1e8412c0-6112-5402-bd9f-4d7805d79ffc', '1e8412c0-6112-5402-bd9f-4d7805d79ffc', '{"sub": "1e8412c0-6112-5402-bd9f-4d7805d79ffc", "email": "st272@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1e8412c0-6112-5402-bd9f-4d7805d79ffc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1e8412c0-6112-5402-bd9f-4d7805d79ffc', 'admin', 'st272@boss.com', 'Admin Charzer Charging Station', 'Charzer Charging Station', 'Charzer Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('733aa1fe-38ef-506b-9f17-72156a9a990d', '1e8412c0-6112-5402-bd9f-4d7805d79ffc', 'Charzer Charging Station', 'Charzer Charging Station, Odisha, India', 18.2958652, 82.9144748, 'India EV Network License', 'LIC-IN-ST272', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '733aa1fe-38ef-506b-9f17-72156a9a990d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d2b74dfe-42b0-5b97-9dbc-0754058d9552', '733aa1fe-38ef-506b-9f17-72156a9a990d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 273: Electric Vehicle Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('138b7941-aada-5e5b-94d2-288e827c48e6', '00000000-0000-0000-0000-000000000000', 'st273@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st273@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('138b7941-aada-5e5b-94d2-288e827c48e6', '138b7941-aada-5e5b-94d2-288e827c48e6', '{"sub": "138b7941-aada-5e5b-94d2-288e827c48e6", "email": "st273@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '138b7941-aada-5e5b-94d2-288e827c48e6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('138b7941-aada-5e5b-94d2-288e827c48e6', 'admin', 'st273@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ee1e4ccd-dbd9-5690-8740-0bd28daa0364', '138b7941-aada-5e5b-94d2-288e827c48e6', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.3137141, 82.8937424, 'India EV Network License', 'LIC-IN-ST273', 500.0, 25.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ee1e4ccd-dbd9-5690-8740-0bd28daa0364';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5e0a3915-123c-519f-8498-5e48162242f8', 'ee1e4ccd-dbd9-5690-8740-0bd28daa0364', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4b838f0c-bf6c-50c9-87f0-747ae902f3e3', 'ee1e4ccd-dbd9-5690-8740-0bd28daa0364', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 274: Tata Power Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('58ff3974-6ad8-5fc6-bddf-3fba758c1045', '00000000-0000-0000-0000-000000000000', 'st274@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st274@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('58ff3974-6ad8-5fc6-bddf-3fba758c1045', '58ff3974-6ad8-5fc6-bddf-3fba758c1045', '{"sub": "58ff3974-6ad8-5fc6-bddf-3fba758c1045", "email": "st274@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '58ff3974-6ad8-5fc6-bddf-3fba758c1045')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('58ff3974-6ad8-5fc6-bddf-3fba758c1045', 'admin', 'st274@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('13d16884-8f14-5e99-a661-4859df14ce39', '58ff3974-6ad8-5fc6-bddf-3fba758c1045', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.139519, 83.617595, 'India EV Network License', 'LIC-IN-ST274', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '13d16884-8f14-5e99-a661-4859df14ce39';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('87cd77f2-a417-5e36-9a67-bc57eaf28bad', '13d16884-8f14-5e99-a661-4859df14ce39', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a7e1ccb6-41b9-55ed-8d34-587d09c1786d', '13d16884-8f14-5e99-a661-4859df14ce39', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 275: Jio-bp pulse Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('44c1bec7-748c-5bc0-961f-424736cc9258', '00000000-0000-0000-0000-000000000000', 'st275@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st275@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('44c1bec7-748c-5bc0-961f-424736cc9258', '44c1bec7-748c-5bc0-961f-424736cc9258', '{"sub": "44c1bec7-748c-5bc0-961f-424736cc9258", "email": "st275@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '44c1bec7-748c-5bc0-961f-424736cc9258')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('44c1bec7-748c-5bc0-961f-424736cc9258', 'admin', 'st275@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('768957be-b5a7-57b5-b3c1-6d4ec93ccea6', '44c1bec7-748c-5bc0-961f-424736cc9258', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 18.1499177, 83.6353106, 'India EV Network License', 'LIC-IN-ST275', 500.0, 60.0, true, 'Cuttack', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '768957be-b5a7-57b5-b3c1-6d4ec93ccea6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e1d88ced-6bae-58a5-afff-20822cd2680d', '768957be-b5a7-57b5-b3c1-6d4ec93ccea6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ea9e57bb-bdb4-50fc-80b9-f1cbcb38995f', '768957be-b5a7-57b5-b3c1-6d4ec93ccea6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('98a5c592-9462-5574-b84f-02f18a2477f3', '768957be-b5a7-57b5-b3c1-6d4ec93ccea6', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 276: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('25e1c0e4-c0e3-586a-aef3-100e234af11e', '00000000-0000-0000-0000-000000000000', 'st276@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st276@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('25e1c0e4-c0e3-586a-aef3-100e234af11e', '25e1c0e4-c0e3-586a-aef3-100e234af11e', '{"sub": "25e1c0e4-c0e3-586a-aef3-100e234af11e", "email": "st276@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '25e1c0e4-c0e3-586a-aef3-100e234af11e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('25e1c0e4-c0e3-586a-aef3-100e234af11e', 'admin', 'st276@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6829ac6c-80f1-5f61-9ac4-05f49699da71', '25e1c0e4-c0e3-586a-aef3-100e234af11e', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 18.173032, 83.676949, 'India EV Network License', 'LIC-IN-ST276', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6829ac6c-80f1-5f61-9ac4-05f49699da71';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('757f2489-734f-54ed-bc4c-81c78e68af51', '6829ac6c-80f1-5f61-9ac4-05f49699da71', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e745ed42-a452-5069-b691-6b4edb217344', '6829ac6c-80f1-5f61-9ac4-05f49699da71', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 277: JoulePoint Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('97fb2b56-b2cd-55ea-a367-a3b72c36cbae', '00000000-0000-0000-0000-000000000000', 'st277@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st277@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('97fb2b56-b2cd-55ea-a367-a3b72c36cbae', '97fb2b56-b2cd-55ea-a367-a3b72c36cbae', '{"sub": "97fb2b56-b2cd-55ea-a367-a3b72c36cbae", "email": "st277@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '97fb2b56-b2cd-55ea-a367-a3b72c36cbae')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('97fb2b56-b2cd-55ea-a367-a3b72c36cbae', 'admin', 'st277@boss.com', 'Admin JoulePoint Charging Station', 'JoulePoint Charging Station', 'JoulePoint Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('86550b3c-9592-5f1a-9978-b31379174154', '97fb2b56-b2cd-55ea-a367-a3b72c36cbae', 'JoulePoint Charging Station', 'JoulePoint Charging Station, Odisha, India', 18.0418515, 83.5097221, 'India EV Network License', 'LIC-IN-ST277', 500.0, 7.4, true, 'Cuttack', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '86550b3c-9592-5f1a-9978-b31379174154';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6f4ff519-3591-5047-a2bf-b7e680feef73', '86550b3c-9592-5f1a-9978-b31379174154', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 278: Bolt.Earth Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f91fba41-ce62-5b5d-b62c-8449b516c6f0', '00000000-0000-0000-0000-000000000000', 'st278@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st278@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f91fba41-ce62-5b5d-b62c-8449b516c6f0', 'f91fba41-ce62-5b5d-b62c-8449b516c6f0', '{"sub": "f91fba41-ce62-5b5d-b62c-8449b516c6f0", "email": "st278@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f91fba41-ce62-5b5d-b62c-8449b516c6f0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f91fba41-ce62-5b5d-b62c-8449b516c6f0', 'admin', 'st278@boss.com', 'Admin Bolt.Earth Charging Station', 'Bolt.Earth Charging Station', 'Bolt.Earth Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6ce4ab48-5877-5bc1-84d5-c89eaecc95d3', 'f91fba41-ce62-5b5d-b62c-8449b516c6f0', 'Bolt.Earth Charging Station', 'Bolt.Earth Charging Station, Odisha, India', 18.0203857, 83.4020948, 'India EV Network License', 'LIC-IN-ST278', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6ce4ab48-5877-5bc1-84d5-c89eaecc95d3';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4c0a8dca-0da0-5fa4-aaa6-2739dce2f765', '6ce4ab48-5877-5bc1-84d5-c89eaecc95d3', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d8569b3f-ea0b-5be1-a944-bc53de61967e', '6ce4ab48-5877-5bc1-84d5-c89eaecc95d3', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 279: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1037aefa-2c3e-5c65-96a2-9abebd52c7dc', '00000000-0000-0000-0000-000000000000', 'st279@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st279@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1037aefa-2c3e-5c65-96a2-9abebd52c7dc', '1037aefa-2c3e-5c65-96a2-9abebd52c7dc', '{"sub": "1037aefa-2c3e-5c65-96a2-9abebd52c7dc", "email": "st279@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1037aefa-2c3e-5c65-96a2-9abebd52c7dc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1037aefa-2c3e-5c65-96a2-9abebd52c7dc', 'admin', 'st279@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0f927acd-5328-53ce-933a-f0ea248e2996', '1037aefa-2c3e-5c65-96a2-9abebd52c7dc', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.0565007, 83.3971128, 'India EV Network License', 'LIC-IN-ST279', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0f927acd-5328-53ce-933a-f0ea248e2996';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4458e7b1-eba7-5b25-975d-2383cc92d4b0', '0f927acd-5328-53ce-933a-f0ea248e2996', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('695bb549-6569-5dd7-b31f-c4c2cea91e40', '0f927acd-5328-53ce-933a-f0ea248e2996', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 280: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4dfa98db-8291-56c3-996b-415258926871', '00000000-0000-0000-0000-000000000000', 'st280@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st280@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4dfa98db-8291-56c3-996b-415258926871', '4dfa98db-8291-56c3-996b-415258926871', '{"sub": "4dfa98db-8291-56c3-996b-415258926871", "email": "st280@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4dfa98db-8291-56c3-996b-415258926871')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4dfa98db-8291-56c3-996b-415258926871', 'admin', 'st280@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bf494e58-699b-5660-9f67-ac144eea5b91', '4dfa98db-8291-56c3-996b-415258926871', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 18.0570972, 83.3971881, 'India EV Network License', 'LIC-IN-ST280', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bf494e58-699b-5660-9f67-ac144eea5b91';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('642d3abf-869c-58b4-a59f-41d49a0ff973', 'bf494e58-699b-5660-9f67-ac144eea5b91', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('baa0cacd-620b-5e50-bbab-fea5a5f4baac', 'bf494e58-699b-5660-9f67-ac144eea5b91', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 281: ParkNConnect Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ae232382-fa43-5df3-89e6-bde7c8fa650f', '00000000-0000-0000-0000-000000000000', 'st281@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st281@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ae232382-fa43-5df3-89e6-bde7c8fa650f', 'ae232382-fa43-5df3-89e6-bde7c8fa650f', '{"sub": "ae232382-fa43-5df3-89e6-bde7c8fa650f", "email": "st281@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ae232382-fa43-5df3-89e6-bde7c8fa650f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ae232382-fa43-5df3-89e6-bde7c8fa650f', 'admin', 'st281@boss.com', 'Admin ParkNConnect Charging Station', 'ParkNConnect Charging Station', 'ParkNConnect Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('86e125a2-ff0f-5360-941f-d45a585a6056', 'ae232382-fa43-5df3-89e6-bde7c8fa650f', 'ParkNConnect Charging Station', 'ParkNConnect Charging Station, Odisha, India', 18.0928016, 83.3884047, 'India EV Network License', 'LIC-IN-ST281', 500.0, 7.4, true, 'Sambalpur', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '86e125a2-ff0f-5360-941f-d45a585a6056';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9694b94f-60c4-5528-9a4d-9b06bded7185', '86e125a2-ff0f-5360-941f-d45a585a6056', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 282: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('95190172-a127-5061-b955-f8e1c6fd9728', '00000000-0000-0000-0000-000000000000', 'st282@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st282@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('95190172-a127-5061-b955-f8e1c6fd9728', '95190172-a127-5061-b955-f8e1c6fd9728', '{"sub": "95190172-a127-5061-b955-f8e1c6fd9728", "email": "st282@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '95190172-a127-5061-b955-f8e1c6fd9728')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('95190172-a127-5061-b955-f8e1c6fd9728', 'admin', 'st282@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1371537e-00bb-5791-9210-0bafd76b1cbd', '95190172-a127-5061-b955-f8e1c6fd9728', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.080786, 83.38528, 'India EV Network License', 'LIC-IN-ST282', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1371537e-00bb-5791-9210-0bafd76b1cbd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8bbb8e49-607c-5100-8ae4-9b5e67be47f9', '1371537e-00bb-5791-9210-0bafd76b1cbd', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('212c0c14-2a76-52f0-87a7-7412f23ac5c7', '1371537e-00bb-5791-9210-0bafd76b1cbd', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 283: Hindustan Petroleum Corporation Limited Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('414214dc-6b8e-5016-b4ce-1a3d4eebec39', '00000000-0000-0000-0000-000000000000', 'st283@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st283@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('414214dc-6b8e-5016-b4ce-1a3d4eebec39', '414214dc-6b8e-5016-b4ce-1a3d4eebec39', '{"sub": "414214dc-6b8e-5016-b4ce-1a3d4eebec39", "email": "st283@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '414214dc-6b8e-5016-b4ce-1a3d4eebec39')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('414214dc-6b8e-5016-b4ce-1a3d4eebec39', 'admin', 'st283@boss.com', 'Admin Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('36ee5eb6-e64d-5a87-b090-1724ce06a8e1', '414214dc-6b8e-5016-b4ce-1a3d4eebec39', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 17.9524227, 83.4163581, 'India EV Network License', 'LIC-IN-ST283', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '36ee5eb6-e64d-5a87-b090-1724ce06a8e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('eb7d9e47-2be2-5ef3-8560-8ccb758d591b', '36ee5eb6-e64d-5a87-b090-1724ce06a8e1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('861bb2f6-6b4d-5bc6-94ae-497def52288d', '36ee5eb6-e64d-5a87-b090-1724ce06a8e1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 284: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('68d29520-6a86-5092-bbdb-d995a9e8a139', '00000000-0000-0000-0000-000000000000', 'st284@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st284@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('68d29520-6a86-5092-bbdb-d995a9e8a139', '68d29520-6a86-5092-bbdb-d995a9e8a139', '{"sub": "68d29520-6a86-5092-bbdb-d995a9e8a139", "email": "st284@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '68d29520-6a86-5092-bbdb-d995a9e8a139')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('68d29520-6a86-5092-bbdb-d995a9e8a139', 'admin', 'st284@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('83fe6e1a-a701-55c3-912c-8bf5c7bbf025', '68d29520-6a86-5092-bbdb-d995a9e8a139', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.0801438, 83.3853509, 'India EV Network License', 'LIC-IN-ST284', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '83fe6e1a-a701-55c3-912c-8bf5c7bbf025';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1d516517-e241-5687-8b53-e336d8f6cf91', '83fe6e1a-a701-55c3-912c-8bf5c7bbf025', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ed3eb912-c5ae-5a50-a0ff-2559d76ccf09', '83fe6e1a-a701-55c3-912c-8bf5c7bbf025', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 285: Hindustan Petroleum Corporation Limited (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4d09d26a-a0c8-5627-b6ea-83b12e97a9bb', '00000000-0000-0000-0000-000000000000', 'st285@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st285@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4d09d26a-a0c8-5627-b6ea-83b12e97a9bb', '4d09d26a-a0c8-5627-b6ea-83b12e97a9bb', '{"sub": "4d09d26a-a0c8-5627-b6ea-83b12e97a9bb", "email": "st285@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4d09d26a-a0c8-5627-b6ea-83b12e97a9bb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4d09d26a-a0c8-5627-b6ea-83b12e97a9bb', 'admin', 'st285@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('735f53b3-5117-5174-aec9-a5654a89be31', '4d09d26a-a0c8-5627-b6ea-83b12e97a9bb', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 17.952421, 83.416311, 'India EV Network License', 'LIC-IN-ST285', 500.0, 30.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '735f53b3-5117-5174-aec9-a5654a89be31';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('249c163c-17d6-58c0-95de-3babc439922e', '735f53b3-5117-5174-aec9-a5654a89be31', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d31f44a3-ff2e-5eb6-be6a-b42f40e935a7', '735f53b3-5117-5174-aec9-a5654a89be31', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 286: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7db90430-3727-57c3-9270-15a01114483f', '00000000-0000-0000-0000-000000000000', 'st286@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st286@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7db90430-3727-57c3-9270-15a01114483f', '7db90430-3727-57c3-9270-15a01114483f', '{"sub": "7db90430-3727-57c3-9270-15a01114483f", "email": "st286@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7db90430-3727-57c3-9270-15a01114483f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7db90430-3727-57c3-9270-15a01114483f', 'admin', 'st286@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('68051005-1a28-5fdb-a650-f4d3e62993b6', '7db90430-3727-57c3-9270-15a01114483f', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 17.9577677, 83.1773604, 'India EV Network License', 'LIC-IN-ST286', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '68051005-1a28-5fdb-a650-f4d3e62993b6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c5a7227f-2c23-55e7-9f48-6431a1ebc467', '68051005-1a28-5fdb-a650-f4d3e62993b6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f839dcf2-f483-599b-9f40-502468d1b477', '68051005-1a28-5fdb-a650-f4d3e62993b6', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 287: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6eaa50ff-6485-5d01-8583-ff7664bcdf5d', '00000000-0000-0000-0000-000000000000', 'st287@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st287@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6eaa50ff-6485-5d01-8583-ff7664bcdf5d', '6eaa50ff-6485-5d01-8583-ff7664bcdf5d', '{"sub": "6eaa50ff-6485-5d01-8583-ff7664bcdf5d", "email": "st287@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6eaa50ff-6485-5d01-8583-ff7664bcdf5d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6eaa50ff-6485-5d01-8583-ff7664bcdf5d', 'admin', 'st287@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9c0c26c4-ddab-59f7-b16e-52fa8df90a6b', '6eaa50ff-6485-5d01-8583-ff7664bcdf5d', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.116682, 83.13772, 'India EV Network License', 'LIC-IN-ST287', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9c0c26c4-ddab-59f7-b16e-52fa8df90a6b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('daf1d893-9e2e-5227-96fa-0d7c63c4076d', '9c0c26c4-ddab-59f7-b16e-52fa8df90a6b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cb196364-0b0a-534f-9cf5-4923155af2cf', '9c0c26c4-ddab-59f7-b16e-52fa8df90a6b', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 288: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e7514835-9196-5ab9-9ad0-b51a349d0ebd', '00000000-0000-0000-0000-000000000000', 'st288@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st288@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e7514835-9196-5ab9-9ad0-b51a349d0ebd', 'e7514835-9196-5ab9-9ad0-b51a349d0ebd', '{"sub": "e7514835-9196-5ab9-9ad0-b51a349d0ebd", "email": "st288@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e7514835-9196-5ab9-9ad0-b51a349d0ebd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e7514835-9196-5ab9-9ad0-b51a349d0ebd', 'admin', 'st288@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e34ef81d-7f4c-5f7b-9006-059c79bf1e64', 'e7514835-9196-5ab9-9ad0-b51a349d0ebd', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 17.9577677, 83.1773604, 'India EV Network License', 'LIC-IN-ST288', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e34ef81d-7f4c-5f7b-9006-059c79bf1e64';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('49ba35a9-6b7a-5427-96c8-fc4ca6fc65f3', 'e34ef81d-7f4c-5f7b-9006-059c79bf1e64', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2995a30c-f196-5060-b0af-d9447fecd880', 'e34ef81d-7f4c-5f7b-9006-059c79bf1e64', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 289: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('63a202dc-9ce7-5c69-b4f3-f0549d4b5a27', '00000000-0000-0000-0000-000000000000', 'st289@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st289@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('63a202dc-9ce7-5c69-b4f3-f0549d4b5a27', '63a202dc-9ce7-5c69-b4f3-f0549d4b5a27', '{"sub": "63a202dc-9ce7-5c69-b4f3-f0549d4b5a27", "email": "st289@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '63a202dc-9ce7-5c69-b4f3-f0549d4b5a27')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('63a202dc-9ce7-5c69-b4f3-f0549d4b5a27', 'admin', 'st289@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('97ba09ed-ec54-52ab-9bc5-5ffd6d0990ac', '63a202dc-9ce7-5c69-b4f3-f0549d4b5a27', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 18.116682, 83.13772, 'India EV Network License', 'LIC-IN-ST289', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '97ba09ed-ec54-52ab-9bc5-5ffd6d0990ac';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('73d24381-24a5-55f4-9d45-0d40435e89fe', '97ba09ed-ec54-52ab-9bc5-5ffd6d0990ac', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b3a3bf85-3892-5b49-8680-f951d0f6ab48', '97ba09ed-ec54-52ab-9bc5-5ffd6d0990ac', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 290: BPCL Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d2ca3219-5f6e-560f-ad3f-b1ef8fdf233e', '00000000-0000-0000-0000-000000000000', 'st290@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st290@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d2ca3219-5f6e-560f-ad3f-b1ef8fdf233e', 'd2ca3219-5f6e-560f-ad3f-b1ef8fdf233e', '{"sub": "d2ca3219-5f6e-560f-ad3f-b1ef8fdf233e", "email": "st290@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd2ca3219-5f6e-560f-ad3f-b1ef8fdf233e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d2ca3219-5f6e-560f-ad3f-b1ef8fdf233e', 'admin', 'st290@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f7e69b34-35ca-5fc8-8706-aefb450f775a', 'd2ca3219-5f6e-560f-ad3f-b1ef8fdf233e', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 19.995597, 85.479968, 'India EV Network License', 'LIC-IN-ST290', 500.0, 30.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f7e69b34-35ca-5fc8-8706-aefb450f775a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('040fcf93-d307-5f3f-9acd-4e40553fd59f', 'f7e69b34-35ca-5fc8-8706-aefb450f775a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('08ad4d42-d4d4-583a-91f6-f73739679cfc', 'f7e69b34-35ca-5fc8-8706-aefb450f775a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 291: Hindustan Petroleum Corporation Limited (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9ad5c6ef-dd63-5316-a626-98a65f091a80', '00000000-0000-0000-0000-000000000000', 'st291@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st291@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9ad5c6ef-dd63-5316-a626-98a65f091a80', '9ad5c6ef-dd63-5316-a626-98a65f091a80', '{"sub": "9ad5c6ef-dd63-5316-a626-98a65f091a80", "email": "st291@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9ad5c6ef-dd63-5316-a626-98a65f091a80')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9ad5c6ef-dd63-5316-a626-98a65f091a80', 'admin', 'st291@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('15c435be-1b3f-5b3c-b327-ffaaa5e4ef61', '9ad5c6ef-dd63-5316-a626-98a65f091a80', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 19.9901672, 85.4736527, 'India EV Network License', 'LIC-IN-ST291', 500.0, 30.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '15c435be-1b3f-5b3c-b327-ffaaa5e4ef61';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4cb4f478-96a0-5a76-b98d-6e7b4fd7f2d4', '15c435be-1b3f-5b3c-b327-ffaaa5e4ef61', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d86ffc5a-6e1c-541c-b559-986bdf5b879c', '15c435be-1b3f-5b3c-b327-ffaaa5e4ef61', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 292: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c2063cb9-e6ed-5301-be2c-5c0f755bb5b2', '00000000-0000-0000-0000-000000000000', 'st292@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st292@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c2063cb9-e6ed-5301-be2c-5c0f755bb5b2', 'c2063cb9-e6ed-5301-be2c-5c0f755bb5b2', '{"sub": "c2063cb9-e6ed-5301-be2c-5c0f755bb5b2", "email": "st292@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c2063cb9-e6ed-5301-be2c-5c0f755bb5b2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c2063cb9-e6ed-5301-be2c-5c0f755bb5b2', 'admin', 'st292@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('77b3bf6d-e50b-53af-ba4f-8daacccc0ea4', 'c2063cb9-e6ed-5301-be2c-5c0f755bb5b2', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.924364, 84.57135, 'India EV Network License', 'LIC-IN-ST292', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '77b3bf6d-e50b-53af-ba4f-8daacccc0ea4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9f80f2f3-3d74-5431-8656-02c79e540d3f', '77b3bf6d-e50b-53af-ba4f-8daacccc0ea4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2dcad6e4-a8c0-53be-8f9b-02c950617607', '77b3bf6d-e50b-53af-ba4f-8daacccc0ea4', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 293: Jio-bp (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c99db8bb-a84e-53d1-839f-eec5850d7892', '00000000-0000-0000-0000-000000000000', 'st293@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st293@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c99db8bb-a84e-53d1-839f-eec5850d7892', 'c99db8bb-a84e-53d1-839f-eec5850d7892', '{"sub": "c99db8bb-a84e-53d1-839f-eec5850d7892", "email": "st293@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c99db8bb-a84e-53d1-839f-eec5850d7892')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c99db8bb-a84e-53d1-839f-eec5850d7892', 'admin', 'st293@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5983b492-8aa3-5918-966f-14d694f9b57b', 'c99db8bb-a84e-53d1-839f-eec5850d7892', 'Jio-bp', 'Jio-bp, Odisha, India', 20.038907, 84.638569, 'India EV Network License', 'LIC-IN-ST293', 500.0, 50.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5983b492-8aa3-5918-966f-14d694f9b57b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f0828009-2456-5ae4-96a7-a05a0ebd75a9', '5983b492-8aa3-5918-966f-14d694f9b57b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b5b00b3d-a90e-5b4a-a9f4-46d3a75569f5', '5983b492-8aa3-5918-966f-14d694f9b57b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 294: Tata Power Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('927f70b4-d51c-57c1-9739-cefd752aa312', '00000000-0000-0000-0000-000000000000', 'st294@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st294@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('927f70b4-d51c-57c1-9739-cefd752aa312', '927f70b4-d51c-57c1-9739-cefd752aa312', '{"sub": "927f70b4-d51c-57c1-9739-cefd752aa312", "email": "st294@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '927f70b4-d51c-57c1-9739-cefd752aa312')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('927f70b4-d51c-57c1-9739-cefd752aa312', 'admin', 'st294@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4646ee5a-5bad-52a3-a841-eab956ca5db2', '927f70b4-d51c-57c1-9739-cefd752aa312', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 19.924915, 83.174075, 'India EV Network License', 'LIC-IN-ST294', 500.0, 60.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4646ee5a-5bad-52a3-a841-eab956ca5db2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5ee65bb2-30ca-50c4-a589-00e0779bc79f', '4646ee5a-5bad-52a3-a841-eab956ca5db2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1fde557f-e15b-597b-a4c6-fbdf3c025bfe', '4646ee5a-5bad-52a3-a841-eab956ca5db2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 295: Electric Vehicle Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7f593fef-cca2-521d-9cc9-0cf93fc40d54', '00000000-0000-0000-0000-000000000000', 'st295@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st295@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7f593fef-cca2-521d-9cc9-0cf93fc40d54', '7f593fef-cca2-521d-9cc9-0cf93fc40d54', '{"sub": "7f593fef-cca2-521d-9cc9-0cf93fc40d54", "email": "st295@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7f593fef-cca2-521d-9cc9-0cf93fc40d54')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7f593fef-cca2-521d-9cc9-0cf93fc40d54', 'admin', 'st295@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 11, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9dcc9632-7a4c-592f-bba1-add79d2fce22', '7f593fef-cca2-521d-9cc9-0cf93fc40d54', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.0887924, 82.3621049, 'India EV Network License', 'LIC-IN-ST295', 500.0, 25.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9dcc9632-7a4c-592f-bba1-add79d2fce22';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4e49f6c9-7660-5552-a0e0-67aa8e125d31', '9dcc9632-7a4c-592f-bba1-add79d2fce22', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('18bcbbea-2b02-55ed-842f-50d0c11bfc6c', '9dcc9632-7a4c-592f-bba1-add79d2fce22', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 296: G.K Rickshaw (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0d7237f1-c5d4-58d8-9760-f4b461dbe404', '00000000-0000-0000-0000-000000000000', 'st296@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st296@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0d7237f1-c5d4-58d8-9760-f4b461dbe404', '0d7237f1-c5d4-58d8-9760-f4b461dbe404', '{"sub": "0d7237f1-c5d4-58d8-9760-f4b461dbe404", "email": "st296@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0d7237f1-c5d4-58d8-9760-f4b461dbe404')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0d7237f1-c5d4-58d8-9760-f4b461dbe404', 'admin', 'st296@boss.com', 'Admin G.K Rickshaw', 'G.K Rickshaw', 'G.K Rickshaw, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8730cd37-13d9-50a7-a10b-fac9325eea0a', '0d7237f1-c5d4-58d8-9760-f4b461dbe404', 'G.K Rickshaw', 'G.K Rickshaw, Odisha, India', 19.8134808, 85.8362997, 'India EV Network License', 'LIC-IN-ST296', 500.0, 7.4, true, 'Ganjam', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8730cd37-13d9-50a7-a10b-fac9325eea0a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c94dc45b-4498-56cf-920b-377d801f9da1', '8730cd37-13d9-50a7-a10b-fac9325eea0a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 297: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ee5fb9b7-f4d1-5158-ae8e-53f6c9f94517', '00000000-0000-0000-0000-000000000000', 'st297@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st297@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ee5fb9b7-f4d1-5158-ae8e-53f6c9f94517', 'ee5fb9b7-f4d1-5158-ae8e-53f6c9f94517', '{"sub": "ee5fb9b7-f4d1-5158-ae8e-53f6c9f94517", "email": "st297@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ee5fb9b7-f4d1-5158-ae8e-53f6c9f94517')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ee5fb9b7-f4d1-5158-ae8e-53f6c9f94517', 'admin', 'st297@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5336874e-b8ab-50d2-94dc-caf1372f3d34', 'ee5fb9b7-f4d1-5158-ae8e-53f6c9f94517', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 19.7952607, 85.8132809, 'India EV Network License', 'LIC-IN-ST297', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5336874e-b8ab-50d2-94dc-caf1372f3d34';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('575e9122-5c42-5d02-8e7e-16e2cbac169d', '5336874e-b8ab-50d2-94dc-caf1372f3d34', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bfb3aa11-4a8d-5957-a604-8b452d8d3ed3', '5336874e-b8ab-50d2-94dc-caf1372f3d34', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 298: KACHERI SECTION TPCODL (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3db2526d-b3dd-5cb8-b240-9ab2f9ea6043', '00000000-0000-0000-0000-000000000000', 'st298@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st298@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3db2526d-b3dd-5cb8-b240-9ab2f9ea6043', '3db2526d-b3dd-5cb8-b240-9ab2f9ea6043', '{"sub": "3db2526d-b3dd-5cb8-b240-9ab2f9ea6043", "email": "st298@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3db2526d-b3dd-5cb8-b240-9ab2f9ea6043')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3db2526d-b3dd-5cb8-b240-9ab2f9ea6043', 'admin', 'st298@boss.com', 'Admin KACHERI SECTION TPCODL', 'KACHERI SECTION TPCODL', 'KACHERI SECTION TPCODL, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bb937af2-65a6-55bc-b7dc-601640bde9ad', '3db2526d-b3dd-5cb8-b240-9ab2f9ea6043', 'KACHERI SECTION TPCODL', 'KACHERI SECTION TPCODL, Odisha, India', 19.8024197, 85.8239399, 'India EV Network License', 'LIC-IN-ST298', 500.0, 7.4, true, 'Ganjam', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bb937af2-65a6-55bc-b7dc-601640bde9ad';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0cc0fb7f-af01-5d08-bc88-6fab53f3c72c', 'bb937af2-65a6-55bc-b7dc-601640bde9ad', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 299: Relux Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('86fedccc-0d9f-5376-80a1-dbd60450401e', '00000000-0000-0000-0000-000000000000', 'st299@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st299@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('86fedccc-0d9f-5376-80a1-dbd60450401e', '86fedccc-0d9f-5376-80a1-dbd60450401e', '{"sub": "86fedccc-0d9f-5376-80a1-dbd60450401e", "email": "st299@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '86fedccc-0d9f-5376-80a1-dbd60450401e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('86fedccc-0d9f-5376-80a1-dbd60450401e', 'admin', 'st299@boss.com', 'Admin Relux Charging Station', 'Relux Charging Station', 'Relux Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('eed6f340-3b2d-5616-ae04-26efa865d573', '86fedccc-0d9f-5376-80a1-dbd60450401e', 'Relux Charging Station', 'Relux Charging Station, Odisha, India', 19.7907462, 85.8030868, 'India EV Network License', 'LIC-IN-ST299', 500.0, 7.4, true, 'Khordha', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'eed6f340-3b2d-5616-ae04-26efa865d573';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('12218117-54b4-53bc-8a9d-e90cdec24ecf', 'eed6f340-3b2d-5616-ae04-26efa865d573', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 300: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f7c12776-91b4-5745-8a5c-23b5a82c977c', '00000000-0000-0000-0000-000000000000', 'st300@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st300@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f7c12776-91b4-5745-8a5c-23b5a82c977c', 'f7c12776-91b4-5745-8a5c-23b5a82c977c', '{"sub": "f7c12776-91b4-5745-8a5c-23b5a82c977c", "email": "st300@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f7c12776-91b4-5745-8a5c-23b5a82c977c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f7c12776-91b4-5745-8a5c-23b5a82c977c', 'admin', 'st300@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('caeee704-dfd6-55fa-96f2-598357682cee', 'f7c12776-91b4-5745-8a5c-23b5a82c977c', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 19.718938, 85.5235713, 'India EV Network License', 'LIC-IN-ST300', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'caeee704-dfd6-55fa-96f2-598357682cee';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d83be23b-f8a6-5cf8-9901-d5a6a15b33ea', 'caeee704-dfd6-55fa-96f2-598357682cee', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fed29042-8ad8-5ae2-9c21-034180242474', 'caeee704-dfd6-55fa-96f2-598357682cee', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
