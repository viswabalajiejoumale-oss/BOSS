-- Seed Stations Part 1 (Stations 1 to 100)
BEGIN;

-- Ensure the availability_timing column exists on stations table
ALTER TABLE public.stations ADD COLUMN IF NOT EXISTS availability_timing text;

-- Station 1: Nikol EV Charging station (Pune, Maharashtra)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0984c658-98f6-57d1-bc55-82f1297a0d63', '00000000-0000-0000-0000-000000000000', 'st1@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st1@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0984c658-98f6-57d1-bc55-82f1297a0d63', '0984c658-98f6-57d1-bc55-82f1297a0d63', '{"sub": "0984c658-98f6-57d1-bc55-82f1297a0d63", "email": "st1@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0984c658-98f6-57d1-bc55-82f1297a0d63')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0984c658-98f6-57d1-bc55-82f1297a0d63', 'admin', 'st1@boss.com', 'Admin Nikol EV Charging station', 'Nikol EV Charging station', 'Nikol EV Charging station, Pune, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c3b4f891-ec19-54e0-8758-f5b73be76b72', '0984c658-98f6-57d1-bc55-82f1297a0d63', 'Nikol EV Charging station', 'Nikol EV Charging station, Pune, India', 18.7171819, 74.18292088, 'India EV Network License', 'LIC-IN-ST1', 500.0, 7.4, true, 'Pune', 'Maharashtra', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c3b4f891-ec19-54e0-8758-f5b73be76b72';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1613f7ff-6d8a-588a-9078-fe3ad0810412', 'c3b4f891-ec19-54e0-8758-f5b73be76b72', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 2: Blaze Fast Charger For 2 Ev Wheeler (Lb Nagar, Telangana)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('13025982-873a-5675-8b6f-b7881c9b5589', '00000000-0000-0000-0000-000000000000', 'st2@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st2@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('13025982-873a-5675-8b6f-b7881c9b5589', '13025982-873a-5675-8b6f-b7881c9b5589', '{"sub": "13025982-873a-5675-8b6f-b7881c9b5589", "email": "st2@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '13025982-873a-5675-8b6f-b7881c9b5589')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('13025982-873a-5675-8b6f-b7881c9b5589', 'admin', 'st2@boss.com', 'Admin Blaze Fast Charger For 2 Ev Wheeler', 'Blaze Fast Charger For 2 Ev Wheeler', 'Blaze Fast Charger For 2 Ev Wheeler, Lb Nagar, Telangana, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6d80cf3b-363e-5143-ba4c-4af4b9120fe7', '13025982-873a-5675-8b6f-b7881c9b5589', 'Blaze Fast Charger For 2 Ev Wheeler', 'Blaze Fast Charger For 2 Ev Wheeler, Lb Nagar, Telangana, India', 17.34047579, 78.5453955, 'India EV Network License', 'LIC-IN-ST2', 500.0, 7.4, true, 'Lb Nagar', 'Telangana', 1, 'Bolt.Earth (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6d80cf3b-363e-5143-ba4c-4af4b9120fe7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06238f6e-931f-5027-9b6d-57291b9a92de', '6d80cf3b-363e-5143-ba4c-4af4b9120fe7', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 3: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('09e14301-c530-55e4-ab66-f69d8840a031', '00000000-0000-0000-0000-000000000000', 'st3@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st3@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('09e14301-c530-55e4-ab66-f69d8840a031', '09e14301-c530-55e4-ab66-f69d8840a031', '{"sub": "09e14301-c530-55e4-ab66-f69d8840a031", "email": "st3@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '09e14301-c530-55e4-ab66-f69d8840a031')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('09e14301-c530-55e4-ab66-f69d8840a031', 'admin', 'st3@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7bc41519-44c5-51b4-8bd8-a1bf47819ccc', '09e14301-c530-55e4-ab66-f69d8840a031', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 22.2869608, 86.7909833, 'India EV Network License', 'LIC-IN-ST3', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7bc41519-44c5-51b4-8bd8-a1bf47819ccc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8fa7fc28-72bc-5be6-a41b-50a0ddcadcb9', '7bc41519-44c5-51b4-8bd8-a1bf47819ccc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0af5cbeb-244a-5369-b4f4-e139789df5fa', '7bc41519-44c5-51b4-8bd8-a1bf47819ccc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 4: Hindustan Petroleum Corporation Limited Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('29e80e75-9281-5ca3-bdd7-105e40d7089c', '00000000-0000-0000-0000-000000000000', 'st4@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st4@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('29e80e75-9281-5ca3-bdd7-105e40d7089c', '29e80e75-9281-5ca3-bdd7-105e40d7089c', '{"sub": "29e80e75-9281-5ca3-bdd7-105e40d7089c", "email": "st4@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '29e80e75-9281-5ca3-bdd7-105e40d7089c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('29e80e75-9281-5ca3-bdd7-105e40d7089c', 'admin', 'st4@boss.com', 'Admin Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('747e669f-8323-5ede-b634-76187bd3f068', '29e80e75-9281-5ca3-bdd7-105e40d7089c', 'Hindustan Petroleum Corporation Limited Charging Station', 'Hindustan Petroleum Corporation Limited Charging Station, Odisha, India', 22.4497441, 86.5949437, 'India EV Network License', 'LIC-IN-ST4', 500.0, 30.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '747e669f-8323-5ede-b634-76187bd3f068';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d8207487-fc48-5293-99fe-c4ea646304e3', '747e669f-8323-5ede-b634-76187bd3f068', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6579ab13-7d59-5dfa-9a08-6bb6d5870efa', '747e669f-8323-5ede-b634-76187bd3f068', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 5: Hindustan Petroleum Corporation Limited (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f752f025-d4ab-55dd-b2a8-d586ad84b9cb', '00000000-0000-0000-0000-000000000000', 'st5@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st5@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f752f025-d4ab-55dd-b2a8-d586ad84b9cb', 'f752f025-d4ab-55dd-b2a8-d586ad84b9cb', '{"sub": "f752f025-d4ab-55dd-b2a8-d586ad84b9cb", "email": "st5@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f752f025-d4ab-55dd-b2a8-d586ad84b9cb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f752f025-d4ab-55dd-b2a8-d586ad84b9cb', 'admin', 'st5@boss.com', 'Admin Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5dc02c4d-3e65-5713-a358-0489c262d5dc', 'f752f025-d4ab-55dd-b2a8-d586ad84b9cb', 'Hindustan Petroleum Corporation Limited', 'Hindustan Petroleum Corporation Limited, Odisha, India', 22.4498584, 86.5950411, 'India EV Network License', 'LIC-IN-ST5', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5dc02c4d-3e65-5713-a358-0489c262d5dc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('137af6d8-d95e-58e5-852c-bc8e830907a6', '5dc02c4d-3e65-5713-a358-0489c262d5dc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('abbd93a9-8343-5f50-836a-8a719ca94bb5', '5dc02c4d-3e65-5713-a358-0489c262d5dc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 6: Jio-bp (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('852bc13f-827e-5a4c-a46e-b7294a1cfe3f', '00000000-0000-0000-0000-000000000000', 'st6@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st6@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('852bc13f-827e-5a4c-a46e-b7294a1cfe3f', '852bc13f-827e-5a4c-a46e-b7294a1cfe3f', '{"sub": "852bc13f-827e-5a4c-a46e-b7294a1cfe3f", "email": "st6@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '852bc13f-827e-5a4c-a46e-b7294a1cfe3f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('852bc13f-827e-5a4c-a46e-b7294a1cfe3f', 'admin', 'st6@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5fe2a6d3-4525-5b7f-bfca-a6a4bea8cf5f', '852bc13f-827e-5a4c-a46e-b7294a1cfe3f', 'Jio-bp', 'Jio-bp, Odisha, India', 22.14025, 85.71265, 'India EV Network License', 'LIC-IN-ST6', 500.0, 50.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5fe2a6d3-4525-5b7f-bfca-a6a4bea8cf5f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e4f8ab27-711f-57a5-902e-a8f7d1a32419', '5fe2a6d3-4525-5b7f-bfca-a6a4bea8cf5f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('28344a82-0fb7-5102-8875-2fe868a34de7', '5fe2a6d3-4525-5b7f-bfca-a6a4bea8cf5f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 7: Jio-bp (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5f59b25d-78b6-5e8f-9702-fb1cd979c47d', '00000000-0000-0000-0000-000000000000', 'st7@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st7@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5f59b25d-78b6-5e8f-9702-fb1cd979c47d', '5f59b25d-78b6-5e8f-9702-fb1cd979c47d', '{"sub": "5f59b25d-78b6-5e8f-9702-fb1cd979c47d", "email": "st7@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5f59b25d-78b6-5e8f-9702-fb1cd979c47d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5f59b25d-78b6-5e8f-9702-fb1cd979c47d', 'admin', 'st7@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('66f147bf-db81-5906-9b86-5c400ff5d4ef', '5f59b25d-78b6-5e8f-9702-fb1cd979c47d', 'Jio-bp', 'Jio-bp, Odisha, India', 22.0015401, 85.3279801, 'India EV Network License', 'LIC-IN-ST7', 500.0, 50.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '66f147bf-db81-5906-9b86-5c400ff5d4ef';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6ec95d57-fb27-5c7d-9138-3c86104c4406', '66f147bf-db81-5906-9b86-5c400ff5d4ef', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fe5691a3-e662-5246-a96d-a255fd098597', '66f147bf-db81-5906-9b86-5c400ff5d4ef', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 8: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('519bd7b6-369f-5858-a3d8-8c82fcc98c31', '00000000-0000-0000-0000-000000000000', 'st8@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st8@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('519bd7b6-369f-5858-a3d8-8c82fcc98c31', '519bd7b6-369f-5858-a3d8-8c82fcc98c31', '{"sub": "519bd7b6-369f-5858-a3d8-8c82fcc98c31", "email": "st8@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '519bd7b6-369f-5858-a3d8-8c82fcc98c31')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('519bd7b6-369f-5858-a3d8-8c82fcc98c31', 'admin', 'st8@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2d56c46d-438f-5b0d-8b37-02559ad145c0', '519bd7b6-369f-5858-a3d8-8c82fcc98c31', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 22.243666, 84.827354, 'India EV Network License', 'LIC-IN-ST8', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2d56c46d-438f-5b0d-8b37-02559ad145c0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('85c7b502-934d-5fce-9ffe-ac5e2b0d8323', '2d56c46d-438f-5b0d-8b37-02559ad145c0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('db3493d2-68ae-5262-bcda-be3cbfa0101a', '2d56c46d-438f-5b0d-8b37-02559ad145c0', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 9: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6deeadbf-5345-5cf0-bc40-91649c417cc7', '00000000-0000-0000-0000-000000000000', 'st9@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st9@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6deeadbf-5345-5cf0-bc40-91649c417cc7', '6deeadbf-5345-5cf0-bc40-91649c417cc7', '{"sub": "6deeadbf-5345-5cf0-bc40-91649c417cc7", "email": "st9@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6deeadbf-5345-5cf0-bc40-91649c417cc7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6deeadbf-5345-5cf0-bc40-91649c417cc7', 'admin', 'st9@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('29637600-6498-5c53-a909-bd02afef92bf', '6deeadbf-5345-5cf0-bc40-91649c417cc7', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 22.23666, 84.77015, 'India EV Network License', 'LIC-IN-ST9', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '29637600-6498-5c53-a909-bd02afef92bf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6daeb27a-2f7b-56c1-b764-c331059fe608', '29637600-6498-5c53-a909-bd02afef92bf', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('29e601c2-6698-5179-af4d-1b8065280755', '29637600-6498-5c53-a909-bd02afef92bf', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 10: Ather Grid Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2071649d-0692-5265-983a-083232de0edc', '00000000-0000-0000-0000-000000000000', 'st10@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st10@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2071649d-0692-5265-983a-083232de0edc', '2071649d-0692-5265-983a-083232de0edc', '{"sub": "2071649d-0692-5265-983a-083232de0edc", "email": "st10@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2071649d-0692-5265-983a-083232de0edc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2071649d-0692-5265-983a-083232de0edc', 'admin', 'st10@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b85bffdd-0c3f-5fe2-8833-5ac12f3788e1', '2071649d-0692-5265-983a-083232de0edc', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 22.2267046, 84.8641165, 'India EV Network License', 'LIC-IN-ST10', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b85bffdd-0c3f-5fe2-8833-5ac12f3788e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4f977d47-c7aa-5e02-b905-a80e01b93de6', 'b85bffdd-0c3f-5fe2-8833-5ac12f3788e1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('febcf440-fb22-5d57-9b9a-89ef89e998ca', 'b85bffdd-0c3f-5fe2-8833-5ac12f3788e1', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 11: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a84c1073-cea6-5357-8957-d2d98573f6e5', '00000000-0000-0000-0000-000000000000', 'st11@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st11@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a84c1073-cea6-5357-8957-d2d98573f6e5', 'a84c1073-cea6-5357-8957-d2d98573f6e5', '{"sub": "a84c1073-cea6-5357-8957-d2d98573f6e5", "email": "st11@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a84c1073-cea6-5357-8957-d2d98573f6e5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a84c1073-cea6-5357-8957-d2d98573f6e5', 'admin', 'st11@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('993a4045-5d8c-5759-ada1-6ef7ff701f09', 'a84c1073-cea6-5357-8957-d2d98573f6e5', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 22.2268099, 84.7960364, 'India EV Network License', 'LIC-IN-ST11', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '993a4045-5d8c-5759-ada1-6ef7ff701f09';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a245f9fd-d8a3-5700-82c1-f895038398a7', '993a4045-5d8c-5759-ada1-6ef7ff701f09', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7d963bef-a1d1-52f2-9c08-6d8be7168a1a', '993a4045-5d8c-5759-ada1-6ef7ff701f09', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 12: Ather Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('14e26d24-f51a-5bb2-9562-833e58f8e9f9', '00000000-0000-0000-0000-000000000000', 'st12@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st12@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('14e26d24-f51a-5bb2-9562-833e58f8e9f9', '14e26d24-f51a-5bb2-9562-833e58f8e9f9', '{"sub": "14e26d24-f51a-5bb2-9562-833e58f8e9f9", "email": "st12@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '14e26d24-f51a-5bb2-9562-833e58f8e9f9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('14e26d24-f51a-5bb2-9562-833e58f8e9f9', 'admin', 'st12@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f339777a-f9b8-53c9-8ba2-4674267d2a01', '14e26d24-f51a-5bb2-9562-833e58f8e9f9', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 22.2278125, 84.8183874, 'India EV Network License', 'LIC-IN-ST12', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f339777a-f9b8-53c9-8ba2-4674267d2a01';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ba073520-65bf-5667-b962-3dbbc36e8a62', 'f339777a-f9b8-53c9-8ba2-4674267d2a01', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c9d3a18f-f7a4-5a7f-90bf-e69581b877eb', 'f339777a-f9b8-53c9-8ba2-4674267d2a01', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 13: Ather charging station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b7dfbacb-e57e-542f-9e4c-d1a3fc543e3f', '00000000-0000-0000-0000-000000000000', 'st13@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st13@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b7dfbacb-e57e-542f-9e4c-d1a3fc543e3f', 'b7dfbacb-e57e-542f-9e4c-d1a3fc543e3f', '{"sub": "b7dfbacb-e57e-542f-9e4c-d1a3fc543e3f", "email": "st13@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b7dfbacb-e57e-542f-9e4c-d1a3fc543e3f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b7dfbacb-e57e-542f-9e4c-d1a3fc543e3f', 'admin', 'st13@boss.com', 'Admin Ather charging station', 'Ather charging station', 'Ather charging station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6dd8493e-f1ed-5b92-9963-9ac340649c65', 'b7dfbacb-e57e-542f-9e4c-d1a3fc543e3f', 'Ather charging station', 'Ather charging station, Odisha, India', 22.1040381, 84.0375432, 'India EV Network License', 'LIC-IN-ST13', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6dd8493e-f1ed-5b92-9963-9ac340649c65';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ed8e3900-42b9-5ff7-a5ac-0d6704253b06', '6dd8493e-f1ed-5b92-9963-9ac340649c65', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('72f83a88-683b-532c-ad28-e21fec403eab', '6dd8493e-f1ed-5b92-9963-9ac340649c65', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 14: Jio-bp (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('37c2fed4-2b5d-5a21-b193-328ad09af99d', '00000000-0000-0000-0000-000000000000', 'st14@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st14@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('37c2fed4-2b5d-5a21-b193-328ad09af99d', '37c2fed4-2b5d-5a21-b193-328ad09af99d', '{"sub": "37c2fed4-2b5d-5a21-b193-328ad09af99d", "email": "st14@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '37c2fed4-2b5d-5a21-b193-328ad09af99d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('37c2fed4-2b5d-5a21-b193-328ad09af99d', 'admin', 'st14@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ef256a49-1037-581c-ab9f-1743a077aeed', '37c2fed4-2b5d-5a21-b193-328ad09af99d', 'Jio-bp', 'Jio-bp, Odisha, India', 22.1100379, 83.9953189, 'India EV Network License', 'LIC-IN-ST14', 500.0, 50.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ef256a49-1037-581c-ab9f-1743a077aeed';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('94bd2d43-b024-5697-82bb-f63c7a6b7d95', 'ef256a49-1037-581c-ab9f-1743a077aeed', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5826be32-d06a-5f57-992e-ec973357e1f3', 'ef256a49-1037-581c-ab9f-1743a077aeed', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 15: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('75c7e71b-4b78-5c1a-b6f3-78d2176b56b0', '00000000-0000-0000-0000-000000000000', 'st15@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st15@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('75c7e71b-4b78-5c1a-b6f3-78d2176b56b0', '75c7e71b-4b78-5c1a-b6f3-78d2176b56b0', '{"sub": "75c7e71b-4b78-5c1a-b6f3-78d2176b56b0", "email": "st15@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '75c7e71b-4b78-5c1a-b6f3-78d2176b56b0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('75c7e71b-4b78-5c1a-b6f3-78d2176b56b0', 'admin', 'st15@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e178905e-13dd-5745-9bbf-b953e996ad4a', '75c7e71b-4b78-5c1a-b6f3-78d2176b56b0', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 22.105083, 84.037895, 'India EV Network License', 'LIC-IN-ST15', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e178905e-13dd-5745-9bbf-b953e996ad4a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('85bf1685-e5f2-5578-bde9-6786b0ff43dc', 'e178905e-13dd-5745-9bbf-b953e996ad4a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2a7f69f9-fa63-5d9e-802d-cbdac274a012', 'e178905e-13dd-5745-9bbf-b953e996ad4a', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 16: Tata Power Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('03da2d9d-462c-5dd6-b1f4-c571644c13a8', '00000000-0000-0000-0000-000000000000', 'st16@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st16@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('03da2d9d-462c-5dd6-b1f4-c571644c13a8', '03da2d9d-462c-5dd6-b1f4-c571644c13a8', '{"sub": "03da2d9d-462c-5dd6-b1f4-c571644c13a8", "email": "st16@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '03da2d9d-462c-5dd6-b1f4-c571644c13a8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('03da2d9d-462c-5dd6-b1f4-c571644c13a8', 'admin', 'st16@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('421033a0-f750-5e70-9ea3-20de0cda8ecf', '03da2d9d-462c-5dd6-b1f4-c571644c13a8', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.762953, 87.010724, 'India EV Network License', 'LIC-IN-ST16', 500.0, 60.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '421033a0-f750-5e70-9ea3-20de0cda8ecf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3ce3d2b4-1744-542e-9691-c7f2530446bc', '421033a0-f750-5e70-9ea3-20de0cda8ecf', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('78d55796-35bf-5ccf-ae47-e345d66e967e', '421033a0-f750-5e70-9ea3-20de0cda8ecf', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 17: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d3984f35-ef7d-5753-ae3e-6c59f0f49132', '00000000-0000-0000-0000-000000000000', 'st17@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st17@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d3984f35-ef7d-5753-ae3e-6c59f0f49132', 'd3984f35-ef7d-5753-ae3e-6c59f0f49132', '{"sub": "d3984f35-ef7d-5753-ae3e-6c59f0f49132", "email": "st17@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd3984f35-ef7d-5753-ae3e-6c59f0f49132')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d3984f35-ef7d-5753-ae3e-6c59f0f49132', 'admin', 'st17@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e1b9bb4e-6aed-583a-bdc3-25cd6c71591d', 'd3984f35-ef7d-5753-ae3e-6c59f0f49132', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.940046, 86.744606, 'India EV Network License', 'LIC-IN-ST17', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e1b9bb4e-6aed-583a-bdc3-25cd6c71591d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7302dd36-5faf-57f6-86d9-cd50fff86f63', 'e1b9bb4e-6aed-583a-bdc3-25cd6c71591d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('56e26178-1909-59c3-bcc2-a97c876f2707', 'e1b9bb4e-6aed-583a-bdc3-25cd6c71591d', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 18: WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a9f6ba59-0203-57bc-a748-d8003f592778', '00000000-0000-0000-0000-000000000000', 'st18@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st18@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a9f6ba59-0203-57bc-a748-d8003f592778', 'a9f6ba59-0203-57bc-a748-d8003f592778', '{"sub": "a9f6ba59-0203-57bc-a748-d8003f592778", "email": "st18@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a9f6ba59-0203-57bc-a748-d8003f592778')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a9f6ba59-0203-57bc-a748-d8003f592778', 'admin', 'st18@boss.com', 'Admin WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA', 'WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA', 'WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f3a69fd0-ac89-5c45-ba9b-e2453e8e090a', 'a9f6ba59-0203-57bc-a748-d8003f592778', 'WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA', 'WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA, Odisha, India', 21.9265285, 86.7319555, 'India EV Network License', 'LIC-IN-ST18', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f3a69fd0-ac89-5c45-ba9b-e2453e8e090a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8564f4c5-de26-5292-928d-51c4822f1b37', 'f3a69fd0-ac89-5c45-ba9b-e2453e8e090a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 19: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('84e57577-ca01-5c76-a907-fe4b380d6152', '00000000-0000-0000-0000-000000000000', 'st19@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st19@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('84e57577-ca01-5c76-a907-fe4b380d6152', '84e57577-ca01-5c76-a907-fe4b380d6152', '{"sub": "84e57577-ca01-5c76-a907-fe4b380d6152", "email": "st19@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '84e57577-ca01-5c76-a907-fe4b380d6152')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('84e57577-ca01-5c76-a907-fe4b380d6152', 'admin', 'st19@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c435123c-1785-5c1f-a245-d478ba0c2222', '84e57577-ca01-5c76-a907-fe4b380d6152', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.909101, 86.751335, 'India EV Network License', 'LIC-IN-ST19', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c435123c-1785-5c1f-a245-d478ba0c2222';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('187992e1-30d6-50e3-b462-8db77e01875d', 'c435123c-1785-5c1f-a245-d478ba0c2222', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('47a83008-1ac8-57ec-bf4b-48d50f1957db', 'c435123c-1785-5c1f-a245-d478ba0c2222', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 20: Electric Vehicle Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6d76eb36-9ad7-53a3-a913-29f44ae281a2', '00000000-0000-0000-0000-000000000000', 'st20@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st20@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6d76eb36-9ad7-53a3-a913-29f44ae281a2', '6d76eb36-9ad7-53a3-a913-29f44ae281a2', '{"sub": "6d76eb36-9ad7-53a3-a913-29f44ae281a2", "email": "st20@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6d76eb36-9ad7-53a3-a913-29f44ae281a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6d76eb36-9ad7-53a3-a913-29f44ae281a2', 'admin', 'st20@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e41c7ba9-2d4d-511e-b728-140cb672f00a', '6d76eb36-9ad7-53a3-a913-29f44ae281a2', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.8057616, 85.9951672, 'India EV Network License', 'LIC-IN-ST20', 500.0, 25.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e41c7ba9-2d4d-511e-b728-140cb672f00a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a6b88bfa-e1c1-5e4f-996c-b5384da6a7be', 'e41c7ba9-2d4d-511e-b728-140cb672f00a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ff129568-87af-5bdc-8fa7-94de914c7ecd', 'e41c7ba9-2d4d-511e-b728-140cb672f00a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 21: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('695faa9f-69c6-5669-a419-437590565e53', '00000000-0000-0000-0000-000000000000', 'st21@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st21@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('695faa9f-69c6-5669-a419-437590565e53', '695faa9f-69c6-5669-a419-437590565e53', '{"sub": "695faa9f-69c6-5669-a419-437590565e53", "email": "st21@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '695faa9f-69c6-5669-a419-437590565e53')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('695faa9f-69c6-5669-a419-437590565e53', 'admin', 'st21@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2e960ff4-1709-5940-a652-69bc9c978712', '695faa9f-69c6-5669-a419-437590565e53', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.85272, 83.99909, 'India EV Network License', 'LIC-IN-ST21', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2e960ff4-1709-5940-a652-69bc9c978712';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('44c00323-5808-5aeb-8b82-275aa17f3a1b', '2e960ff4-1709-5940-a652-69bc9c978712', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7dd85411-9cc3-5775-864a-0eeac97a85cf', '2e960ff4-1709-5940-a652-69bc9c978712', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 22: Tata Power Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('428f9ef3-b95b-508e-9e7e-360f650744e2', '00000000-0000-0000-0000-000000000000', 'st22@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st22@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('428f9ef3-b95b-508e-9e7e-360f650744e2', '428f9ef3-b95b-508e-9e7e-360f650744e2', '{"sub": "428f9ef3-b95b-508e-9e7e-360f650744e2", "email": "st22@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '428f9ef3-b95b-508e-9e7e-360f650744e2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('428f9ef3-b95b-508e-9e7e-360f650744e2', 'admin', 'st22@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5553cfcd-92e2-550a-8c3b-99e4bce49129', '428f9ef3-b95b-508e-9e7e-360f650744e2', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.86703, 83.966208, 'India EV Network License', 'LIC-IN-ST22', 500.0, 60.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5553cfcd-92e2-550a-8c3b-99e4bce49129';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0ce8e1db-b20b-5049-8be4-cfd0c32df1a7', '5553cfcd-92e2-550a-8c3b-99e4bce49129', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1a8b52b0-c982-59ca-ba40-8896ae1cc4d9', '5553cfcd-92e2-550a-8c3b-99e4bce49129', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 23: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c4770e89-3a7b-531e-b85e-34095992cc8b', '00000000-0000-0000-0000-000000000000', 'st23@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st23@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c4770e89-3a7b-531e-b85e-34095992cc8b', 'c4770e89-3a7b-531e-b85e-34095992cc8b', '{"sub": "c4770e89-3a7b-531e-b85e-34095992cc8b", "email": "st23@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c4770e89-3a7b-531e-b85e-34095992cc8b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c4770e89-3a7b-531e-b85e-34095992cc8b', 'admin', 'st23@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bfe36ad7-d2bb-56d2-a909-9d2c8bfe6c0c', 'c4770e89-3a7b-531e-b85e-34095992cc8b', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.917408, 83.38266, 'India EV Network License', 'LIC-IN-ST23', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bfe36ad7-d2bb-56d2-a909-9d2c8bfe6c0c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9b620ea3-187e-5901-90d3-1aa45b286726', 'bfe36ad7-d2bb-56d2-a909-9d2c8bfe6c0c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e4d5b207-b11a-5650-9a05-d63c8de810da', 'bfe36ad7-d2bb-56d2-a909-9d2c8bfe6c0c', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 24: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('13fcea9a-e4af-53cc-b5f3-d0154782678f', '00000000-0000-0000-0000-000000000000', 'st24@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st24@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('13fcea9a-e4af-53cc-b5f3-d0154782678f', '13fcea9a-e4af-53cc-b5f3-d0154782678f', '{"sub": "13fcea9a-e4af-53cc-b5f3-d0154782678f", "email": "st24@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '13fcea9a-e4af-53cc-b5f3-d0154782678f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('13fcea9a-e4af-53cc-b5f3-d0154782678f', 'admin', 'st24@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dcde6753-92af-5fcb-ba4b-baaee23d3960', '13fcea9a-e4af-53cc-b5f3-d0154782678f', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.920674, 83.370714, 'India EV Network License', 'LIC-IN-ST24', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dcde6753-92af-5fcb-ba4b-baaee23d3960';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('67861a4c-604e-5cbc-80c0-69cfaf320a8f', 'dcde6753-92af-5fcb-ba4b-baaee23d3960', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0f8896f9-ebc1-5802-a411-9de5005ede4f', 'dcde6753-92af-5fcb-ba4b-baaee23d3960', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 25: BPCL Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a8d7c3a6-77b6-57bd-979f-078c27f25e00', '00000000-0000-0000-0000-000000000000', 'st25@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st25@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a8d7c3a6-77b6-57bd-979f-078c27f25e00', 'a8d7c3a6-77b6-57bd-979f-078c27f25e00', '{"sub": "a8d7c3a6-77b6-57bd-979f-078c27f25e00", "email": "st25@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a8d7c3a6-77b6-57bd-979f-078c27f25e00')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a8d7c3a6-77b6-57bd-979f-078c27f25e00', 'admin', 'st25@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8f489587-d641-55c2-9f82-f0dfd4fa00a8', 'a8d7c3a6-77b6-57bd-979f-078c27f25e00', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.872869, 83.388349, 'India EV Network License', 'LIC-IN-ST25', 500.0, 30.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8f489587-d641-55c2-9f82-f0dfd4fa00a8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5f73bff8-db00-5ff5-ac6d-34e5bb7154b3', '8f489587-d641-55c2-9f82-f0dfd4fa00a8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e52da4cb-1df2-5ef2-a179-837319f1fdde', '8f489587-d641-55c2-9f82-f0dfd4fa00a8', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 26: Ankush Vehicles (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5fa5cdb2-0e61-5250-9b39-d504c80e85ea', '00000000-0000-0000-0000-000000000000', 'st26@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st26@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5fa5cdb2-0e61-5250-9b39-d504c80e85ea', '5fa5cdb2-0e61-5250-9b39-d504c80e85ea', '{"sub": "5fa5cdb2-0e61-5250-9b39-d504c80e85ea", "email": "st26@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5fa5cdb2-0e61-5250-9b39-d504c80e85ea')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5fa5cdb2-0e61-5250-9b39-d504c80e85ea', 'admin', 'st26@boss.com', 'Admin Ankush Vehicles', 'Ankush Vehicles', 'Ankush Vehicles, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('80395665-2c35-5018-a938-86f16d1285cc', '5fa5cdb2-0e61-5250-9b39-d504c80e85ea', 'Ankush Vehicles', 'Ankush Vehicles, Odisha, India', 21.8485001, 82.7791088, 'India EV Network License', 'LIC-IN-ST26', 500.0, 7.4, true, 'Cuttack', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '80395665-2c35-5018-a938-86f16d1285cc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('808d6b32-63a6-5048-ab26-8601f83aca98', '80395665-2c35-5018-a938-86f16d1285cc', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 27: CharjKaro Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1679fb47-2a96-506e-8c95-d9bac940f948', '00000000-0000-0000-0000-000000000000', 'st27@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st27@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1679fb47-2a96-506e-8c95-d9bac940f948', '1679fb47-2a96-506e-8c95-d9bac940f948', '{"sub": "1679fb47-2a96-506e-8c95-d9bac940f948", "email": "st27@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1679fb47-2a96-506e-8c95-d9bac940f948')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1679fb47-2a96-506e-8c95-d9bac940f948', 'admin', 'st27@boss.com', 'Admin CharjKaro Charging Station', 'CharjKaro Charging Station', 'CharjKaro Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('77eb135c-dfbe-54d5-9b59-4825d8497e92', '1679fb47-2a96-506e-8c95-d9bac940f948', 'CharjKaro Charging Station', 'CharjKaro Charging Station, Odisha, India', 21.8069144, 82.7525293, 'India EV Network License', 'LIC-IN-ST27', 500.0, 7.4, true, 'Ganjam', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '77eb135c-dfbe-54d5-9b59-4825d8497e92';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a51f8f8e-957c-57d3-bd75-37478219a3d5', '77eb135c-dfbe-54d5-9b59-4825d8497e92', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 28: BPCL Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('860f6f86-6cec-5b00-85c7-cd35287720a7', '00000000-0000-0000-0000-000000000000', 'st28@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st28@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('860f6f86-6cec-5b00-85c7-cd35287720a7', '860f6f86-6cec-5b00-85c7-cd35287720a7', '{"sub": "860f6f86-6cec-5b00-85c7-cd35287720a7", "email": "st28@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '860f6f86-6cec-5b00-85c7-cd35287720a7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('860f6f86-6cec-5b00-85c7-cd35287720a7', 'admin', 'st28@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1939a4d4-7036-528d-9d68-72d254956316', '860f6f86-6cec-5b00-85c7-cd35287720a7', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.8641043, 82.4621088, 'India EV Network License', 'LIC-IN-ST28', 500.0, 30.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1939a4d4-7036-528d-9d68-72d254956316';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('01682a1f-f365-5fdd-a992-1851aec64852', '1939a4d4-7036-528d-9d68-72d254956316', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4346a162-f314-5d3b-9d9b-9421eb0c55a3', '1939a4d4-7036-528d-9d68-72d254956316', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 29: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('227e92bc-4d57-5533-8898-32472fec2620', '00000000-0000-0000-0000-000000000000', 'st29@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st29@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('227e92bc-4d57-5533-8898-32472fec2620', '227e92bc-4d57-5533-8898-32472fec2620', '{"sub": "227e92bc-4d57-5533-8898-32472fec2620", "email": "st29@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '227e92bc-4d57-5533-8898-32472fec2620')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('227e92bc-4d57-5533-8898-32472fec2620', 'admin', 'st29@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('579dfe3b-dafb-5552-a793-e52304c2f016', '227e92bc-4d57-5533-8898-32472fec2620', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.8833782, 82.1504942, 'India EV Network License', 'LIC-IN-ST29', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '579dfe3b-dafb-5552-a793-e52304c2f016';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17a3bb50-510e-59ba-849c-7949ef4f4b06', '579dfe3b-dafb-5552-a793-e52304c2f016', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c835bb45-4316-57e9-85ae-eeb6d331f009', '579dfe3b-dafb-5552-a793-e52304c2f016', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 30: BPCL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3741a4ea-0e66-562c-aeac-613db7bddec8', '00000000-0000-0000-0000-000000000000', 'st30@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st30@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3741a4ea-0e66-562c-aeac-613db7bddec8', '3741a4ea-0e66-562c-aeac-613db7bddec8', '{"sub": "3741a4ea-0e66-562c-aeac-613db7bddec8", "email": "st30@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3741a4ea-0e66-562c-aeac-613db7bddec8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3741a4ea-0e66-562c-aeac-613db7bddec8', 'admin', 'st30@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c1fa6334-d986-5c02-9174-55372eedf91d', '3741a4ea-0e66-562c-aeac-613db7bddec8', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.734158, 81.535732, 'India EV Network License', 'LIC-IN-ST30', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c1fa6334-d986-5c02-9174-55372eedf91d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a7562ac9-12b7-5892-ab43-6244357b6c6f', 'c1fa6334-d986-5c02-9174-55372eedf91d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('149393b5-f184-57b7-a63a-d4a484844008', 'c1fa6334-d986-5c02-9174-55372eedf91d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 31: Jio-bp pulse Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('593882bc-9104-59b6-b219-a40d27be522b', '00000000-0000-0000-0000-000000000000', 'st31@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st31@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('593882bc-9104-59b6-b219-a40d27be522b', '593882bc-9104-59b6-b219-a40d27be522b', '{"sub": "593882bc-9104-59b6-b219-a40d27be522b", "email": "st31@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '593882bc-9104-59b6-b219-a40d27be522b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('593882bc-9104-59b6-b219-a40d27be522b', 'admin', 'st31@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('76201cdc-0510-5838-bfa4-5f82edef3958', '593882bc-9104-59b6-b219-a40d27be522b', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 21.592751, 87.020588, 'India EV Network License', 'LIC-IN-ST31', 500.0, 60.0, true, 'Balasore', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '76201cdc-0510-5838-bfa4-5f82edef3958';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('adb8353a-eb33-5d84-9a14-818f1e490576', '76201cdc-0510-5838-bfa4-5f82edef3958', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ecdddba9-ba3a-5d9e-9025-1e4d3095970c', '76201cdc-0510-5838-bfa4-5f82edef3958', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4b18e5db-ebab-5f0e-906c-98b514a276ac', '76201cdc-0510-5838-bfa4-5f82edef3958', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 32: Jio-bp pulse Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('44848be5-e47e-5580-bf25-d823c9b366ad', '00000000-0000-0000-0000-000000000000', 'st32@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st32@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('44848be5-e47e-5580-bf25-d823c9b366ad', '44848be5-e47e-5580-bf25-d823c9b366ad', '{"sub": "44848be5-e47e-5580-bf25-d823c9b366ad", "email": "st32@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '44848be5-e47e-5580-bf25-d823c9b366ad')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('44848be5-e47e-5580-bf25-d823c9b366ad', 'admin', 'st32@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c4e0cb65-7290-5d02-b541-2d8041b0a4a1', '44848be5-e47e-5580-bf25-d823c9b366ad', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 21.5926108, 87.0205579, 'India EV Network License', 'LIC-IN-ST32', 500.0, 60.0, true, 'Khordha', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c4e0cb65-7290-5d02-b541-2d8041b0a4a1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('340aab9b-c255-5d03-b38b-5ccec2477125', 'c4e0cb65-7290-5d02-b541-2d8041b0a4a1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0cbd2b6e-67f1-52c7-82b6-41df5ec2c232', 'c4e0cb65-7290-5d02-b541-2d8041b0a4a1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f92dd026-e76b-57c2-ae0c-7a4901ab9b56', 'c4e0cb65-7290-5d02-b541-2d8041b0a4a1', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 33: Electric Vehicle Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('301e7718-dbb7-51ee-a7a3-55091d3f979b', '00000000-0000-0000-0000-000000000000', 'st33@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st33@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('301e7718-dbb7-51ee-a7a3-55091d3f979b', '301e7718-dbb7-51ee-a7a3-55091d3f979b', '{"sub": "301e7718-dbb7-51ee-a7a3-55091d3f979b", "email": "st33@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '301e7718-dbb7-51ee-a7a3-55091d3f979b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('301e7718-dbb7-51ee-a7a3-55091d3f979b', 'admin', 'st33@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c6ef31b4-8b73-5eb2-bd3a-d59fcf693d98', '301e7718-dbb7-51ee-a7a3-55091d3f979b', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.5930166, 87.0207285, 'India EV Network License', 'LIC-IN-ST33', 500.0, 25.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c6ef31b4-8b73-5eb2-bd3a-d59fcf693d98';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0f55fa0c-0976-5a64-876f-ba0139d68ea5', 'c6ef31b4-8b73-5eb2-bd3a-d59fcf693d98', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('77736769-b882-5553-979b-8e431f2cb3c8', 'c6ef31b4-8b73-5eb2-bd3a-d59fcf693d98', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 34: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c20cb087-db88-5c23-9e6c-6132d16318ce', '00000000-0000-0000-0000-000000000000', 'st34@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st34@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c20cb087-db88-5c23-9e6c-6132d16318ce', 'c20cb087-db88-5c23-9e6c-6132d16318ce', '{"sub": "c20cb087-db88-5c23-9e6c-6132d16318ce", "email": "st34@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c20cb087-db88-5c23-9e6c-6132d16318ce')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c20cb087-db88-5c23-9e6c-6132d16318ce', 'admin', 'st34@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b50ec7d3-28f3-554b-86ed-483942b7a03d', 'c20cb087-db88-5c23-9e6c-6132d16318ce', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.481623, 86.9069, 'India EV Network License', 'LIC-IN-ST34', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b50ec7d3-28f3-554b-86ed-483942b7a03d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7593f24f-4c5a-5701-a418-74878f8def8d', 'b50ec7d3-28f3-554b-86ed-483942b7a03d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ad000903-3458-5054-a6cc-8115b2d9715f', 'b50ec7d3-28f3-554b-86ed-483942b7a03d', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 35: Ather Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('08e9120d-f89c-51aa-9ea5-3e3c4994d7b1', '00000000-0000-0000-0000-000000000000', 'st35@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st35@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('08e9120d-f89c-51aa-9ea5-3e3c4994d7b1', '08e9120d-f89c-51aa-9ea5-3e3c4994d7b1', '{"sub": "08e9120d-f89c-51aa-9ea5-3e3c4994d7b1", "email": "st35@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '08e9120d-f89c-51aa-9ea5-3e3c4994d7b1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('08e9120d-f89c-51aa-9ea5-3e3c4994d7b1', 'admin', 'st35@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dc1a07f6-9c1b-5dfe-9a52-1cf50b1d6ffe', '08e9120d-f89c-51aa-9ea5-3e3c4994d7b1', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 21.49872, 86.93108, 'India EV Network License', 'LIC-IN-ST35', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dc1a07f6-9c1b-5dfe-9a52-1cf50b1d6ffe';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3e1c2c73-8666-572f-9aaf-525d15bbed89', 'dc1a07f6-9c1b-5dfe-9a52-1cf50b1d6ffe', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('50445514-4539-5362-a28a-b4cf75135c1e', 'dc1a07f6-9c1b-5dfe-9a52-1cf50b1d6ffe', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 36: Electric Vehicle Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1585c1c0-1c29-53a5-b861-20929768411f', '00000000-0000-0000-0000-000000000000', 'st36@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st36@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1585c1c0-1c29-53a5-b861-20929768411f', '1585c1c0-1c29-53a5-b861-20929768411f', '{"sub": "1585c1c0-1c29-53a5-b861-20929768411f", "email": "st36@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1585c1c0-1c29-53a5-b861-20929768411f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1585c1c0-1c29-53a5-b861-20929768411f', 'admin', 'st36@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('85abd524-0ec8-5cde-9980-ff8a72164f2c', '1585c1c0-1c29-53a5-b861-20929768411f', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.5746535, 87.0984959, 'India EV Network License', 'LIC-IN-ST36', 500.0, 25.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '85abd524-0ec8-5cde-9980-ff8a72164f2c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dfdd9a01-d1da-59da-b4f8-b7803f7b8b5a', '85abd524-0ec8-5cde-9980-ff8a72164f2c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8e07df43-d8bf-5205-9366-52713c5dbace', '85abd524-0ec8-5cde-9980-ff8a72164f2c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 37: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('62fef4d2-23df-57c7-858e-52f45af0bf1c', '00000000-0000-0000-0000-000000000000', 'st37@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st37@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('62fef4d2-23df-57c7-858e-52f45af0bf1c', '62fef4d2-23df-57c7-858e-52f45af0bf1c', '{"sub": "62fef4d2-23df-57c7-858e-52f45af0bf1c", "email": "st37@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '62fef4d2-23df-57c7-858e-52f45af0bf1c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('62fef4d2-23df-57c7-858e-52f45af0bf1c', 'admin', 'st37@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5b1ef991-1397-598a-b587-721e206c01d0', '62fef4d2-23df-57c7-858e-52f45af0bf1c', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.479922, 86.904904, 'India EV Network License', 'LIC-IN-ST37', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5b1ef991-1397-598a-b587-721e206c01d0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b5167ddb-b51d-5c0c-8872-4dc5d3da99b6', '5b1ef991-1397-598a-b587-721e206c01d0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1e47f17f-2f53-5327-90bd-13c9cdbbd944', '5b1ef991-1397-598a-b587-721e206c01d0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 38: Ather Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5cdb9f80-c635-5854-bb25-ce2d2cbf7632', '00000000-0000-0000-0000-000000000000', 'st38@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st38@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5cdb9f80-c635-5854-bb25-ce2d2cbf7632', '5cdb9f80-c635-5854-bb25-ce2d2cbf7632', '{"sub": "5cdb9f80-c635-5854-bb25-ce2d2cbf7632", "email": "st38@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5cdb9f80-c635-5854-bb25-ce2d2cbf7632')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5cdb9f80-c635-5854-bb25-ce2d2cbf7632', 'admin', 'st38@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('394b3824-f9a6-50d7-9f58-6b034ca32bf0', '5cdb9f80-c635-5854-bb25-ce2d2cbf7632', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 21.5064591, 86.911091, 'India EV Network License', 'LIC-IN-ST38', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '394b3824-f9a6-50d7-9f58-6b034ca32bf0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c00b3699-9452-59a5-b545-1a83d5568855', '394b3824-f9a6-50d7-9f58-6b034ca32bf0', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('58fc002f-d3f8-54f6-8c26-a07d46d3aa5c', '394b3824-f9a6-50d7-9f58-6b034ca32bf0', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 39: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('79b65eff-929e-54ab-b9ec-05d9f5192b5c', '00000000-0000-0000-0000-000000000000', 'st39@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st39@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('79b65eff-929e-54ab-b9ec-05d9f5192b5c', '79b65eff-929e-54ab-b9ec-05d9f5192b5c', '{"sub": "79b65eff-929e-54ab-b9ec-05d9f5192b5c", "email": "st39@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '79b65eff-929e-54ab-b9ec-05d9f5192b5c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('79b65eff-929e-54ab-b9ec-05d9f5192b5c', 'admin', 'st39@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e6ebbd54-3bb2-5910-8313-7288b55c5c03', '79b65eff-929e-54ab-b9ec-05d9f5192b5c', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.4978274, 86.8896469, 'India EV Network License', 'LIC-IN-ST39', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e6ebbd54-3bb2-5910-8313-7288b55c5c03';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('42f45bf7-a1ad-5fd0-baac-b14ded3a3947', 'e6ebbd54-3bb2-5910-8313-7288b55c5c03', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('32012266-3fc0-5ebd-a416-7dba57212b1e', 'e6ebbd54-3bb2-5910-8313-7288b55c5c03', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 40: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4f478ab9-5f8f-55bf-a246-49938b1c5b1f', '00000000-0000-0000-0000-000000000000', 'st40@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st40@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4f478ab9-5f8f-55bf-a246-49938b1c5b1f', '4f478ab9-5f8f-55bf-a246-49938b1c5b1f', '{"sub": "4f478ab9-5f8f-55bf-a246-49938b1c5b1f", "email": "st40@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4f478ab9-5f8f-55bf-a246-49938b1c5b1f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4f478ab9-5f8f-55bf-a246-49938b1c5b1f', 'admin', 'st40@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('16aad870-936b-56e6-a7fb-d208b2f7cac8', '4f478ab9-5f8f-55bf-a246-49938b1c5b1f', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.548809, 85.494006, 'India EV Network License', 'LIC-IN-ST40', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '16aad870-936b-56e6-a7fb-d208b2f7cac8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('23d76d29-8d84-51b1-94df-8f71296e484b', '16aad870-936b-56e6-a7fb-d208b2f7cac8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('452daf07-7980-5911-b404-6cd13952606b', '16aad870-936b-56e6-a7fb-d208b2f7cac8', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 41: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('757be4f9-6941-57bf-885d-207d8506a18e', '00000000-0000-0000-0000-000000000000', 'st41@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st41@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('757be4f9-6941-57bf-885d-207d8506a18e', '757be4f9-6941-57bf-885d-207d8506a18e', '{"sub": "757be4f9-6941-57bf-885d-207d8506a18e", "email": "st41@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '757be4f9-6941-57bf-885d-207d8506a18e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('757be4f9-6941-57bf-885d-207d8506a18e', 'admin', 'st41@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c8dfd15e-bee0-56a6-8568-d4d9640535c9', '757be4f9-6941-57bf-885d-207d8506a18e', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.6324613, 85.5907884, 'India EV Network License', 'LIC-IN-ST41', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c8dfd15e-bee0-56a6-8568-d4d9640535c9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e57a8f70-6adf-566b-9478-3c299f6253c7', 'c8dfd15e-bee0-56a6-8568-d4d9640535c9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ea932e51-99bd-5852-8785-760bea32b7f4', 'c8dfd15e-bee0-56a6-8568-d4d9640535c9', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 42: Electric Vehicle Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0e5fc301-6a42-50a5-b13d-572478c10bd3', '00000000-0000-0000-0000-000000000000', 'st42@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st42@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0e5fc301-6a42-50a5-b13d-572478c10bd3', '0e5fc301-6a42-50a5-b13d-572478c10bd3', '{"sub": "0e5fc301-6a42-50a5-b13d-572478c10bd3", "email": "st42@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0e5fc301-6a42-50a5-b13d-572478c10bd3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0e5fc301-6a42-50a5-b13d-572478c10bd3', 'admin', 'st42@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9c9eb878-855b-57b5-ad4e-5bd53ef2a2b9', '0e5fc301-6a42-50a5-b13d-572478c10bd3', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.5490869, 85.4942709, 'India EV Network License', 'LIC-IN-ST42', 500.0, 25.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9c9eb878-855b-57b5-ad4e-5bd53ef2a2b9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5fab4954-9fb2-586b-b4bc-32c40e6d11cb', '9c9eb878-855b-57b5-ad4e-5bd53ef2a2b9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('199b5d1b-05e5-54ff-8128-6b2bb8cf632a', '9c9eb878-855b-57b5-ad4e-5bd53ef2a2b9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 43: Ather Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('416a3981-81ab-5e3e-97c4-694c81037467', '00000000-0000-0000-0000-000000000000', 'st43@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st43@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('416a3981-81ab-5e3e-97c4-694c81037467', '416a3981-81ab-5e3e-97c4-694c81037467', '{"sub": "416a3981-81ab-5e3e-97c4-694c81037467", "email": "st43@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '416a3981-81ab-5e3e-97c4-694c81037467')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('416a3981-81ab-5e3e-97c4-694c81037467', 'admin', 'st43@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('50c93938-58a4-56af-ae66-7b2525aa078b', '416a3981-81ab-5e3e-97c4-694c81037467', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 21.65143, 85.59395, 'India EV Network License', 'LIC-IN-ST43', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '50c93938-58a4-56af-ae66-7b2525aa078b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('da1448f5-b185-56c3-9295-e5184464359c', '50c93938-58a4-56af-ae66-7b2525aa078b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8f43fc2c-8d05-5d75-8180-a18eb32e291a', '50c93938-58a4-56af-ae66-7b2525aa078b', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 44: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('15bf3ba4-751d-5c3b-b823-21756ba4ab76', '00000000-0000-0000-0000-000000000000', 'st44@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st44@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('15bf3ba4-751d-5c3b-b823-21756ba4ab76', '15bf3ba4-751d-5c3b-b823-21756ba4ab76', '{"sub": "15bf3ba4-751d-5c3b-b823-21756ba4ab76", "email": "st44@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '15bf3ba4-751d-5c3b-b823-21756ba4ab76')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('15bf3ba4-751d-5c3b-b823-21756ba4ab76', 'admin', 'st44@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('95de59e0-7b4e-5ad2-982d-fcbe3ac29943', '15bf3ba4-751d-5c3b-b823-21756ba4ab76', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.491887, 83.9860082, 'India EV Network License', 'LIC-IN-ST44', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '95de59e0-7b4e-5ad2-982d-fcbe3ac29943';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c20c9a98-dd6d-5221-ba27-6cea9955b674', '95de59e0-7b4e-5ad2-982d-fcbe3ac29943', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1ba27aa7-1d1c-5cb6-b233-0d61d3c6bfc8', '95de59e0-7b4e-5ad2-982d-fcbe3ac29943', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 45: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('070dafe9-43d8-5dd9-b9af-233fab854fae', '00000000-0000-0000-0000-000000000000', 'st45@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st45@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('070dafe9-43d8-5dd9-b9af-233fab854fae', '070dafe9-43d8-5dd9-b9af-233fab854fae', '{"sub": "070dafe9-43d8-5dd9-b9af-233fab854fae", "email": "st45@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '070dafe9-43d8-5dd9-b9af-233fab854fae')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('070dafe9-43d8-5dd9-b9af-233fab854fae', 'admin', 'st45@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1c85c705-630b-5f98-9796-1af3f18e1e69', '070dafe9-43d8-5dd9-b9af-233fab854fae', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.467634, 83.977264, 'India EV Network License', 'LIC-IN-ST45', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1c85c705-630b-5f98-9796-1af3f18e1e69';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('22220ea7-2230-5963-a39a-9ba4a7e1f0c5', '1c85c705-630b-5f98-9796-1af3f18e1e69', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3bc42e0d-5b1e-57d4-a5ae-9cc6a8edd68c', '1c85c705-630b-5f98-9796-1af3f18e1e69', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 46: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a37a8f48-2a8e-5d3d-a93a-2aa167e35d1f', '00000000-0000-0000-0000-000000000000', 'st46@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st46@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a37a8f48-2a8e-5d3d-a93a-2aa167e35d1f', 'a37a8f48-2a8e-5d3d-a93a-2aa167e35d1f', '{"sub": "a37a8f48-2a8e-5d3d-a93a-2aa167e35d1f", "email": "st46@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a37a8f48-2a8e-5d3d-a93a-2aa167e35d1f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a37a8f48-2a8e-5d3d-a93a-2aa167e35d1f', 'admin', 'st46@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a3857756-f841-5cde-8d6a-fa4d8b553e71', 'a37a8f48-2a8e-5d3d-a93a-2aa167e35d1f', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.5106163, 84.0059202, 'India EV Network License', 'LIC-IN-ST46', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a3857756-f841-5cde-8d6a-fa4d8b553e71';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('403e17f8-758d-581f-bc96-50ef4186e76a', 'a3857756-f841-5cde-8d6a-fa4d8b553e71', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e3a1bb4a-d1b1-58f4-832e-5569b613be72', 'a3857756-f841-5cde-8d6a-fa4d8b553e71', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 47: Ather Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6c2c7df4-fd90-5ea3-85ef-4f2e4d21e67c', '00000000-0000-0000-0000-000000000000', 'st47@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st47@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6c2c7df4-fd90-5ea3-85ef-4f2e4d21e67c', '6c2c7df4-fd90-5ea3-85ef-4f2e4d21e67c', '{"sub": "6c2c7df4-fd90-5ea3-85ef-4f2e4d21e67c", "email": "st47@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6c2c7df4-fd90-5ea3-85ef-4f2e4d21e67c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6c2c7df4-fd90-5ea3-85ef-4f2e4d21e67c', 'admin', 'st47@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('614c2bb2-c0f2-5765-979e-ee6eaec2dd29', '6c2c7df4-fd90-5ea3-85ef-4f2e4d21e67c', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 21.49525, 83.97572, 'India EV Network License', 'LIC-IN-ST47', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '614c2bb2-c0f2-5765-979e-ee6eaec2dd29';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cdab73a2-7ebd-55a9-bad1-c655469108b5', '614c2bb2-c0f2-5765-979e-ee6eaec2dd29', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a5c489db-f0c7-5bfc-b3c8-69ac3e5478b7', '614c2bb2-c0f2-5765-979e-ee6eaec2dd29', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 48: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ab48a9d6-a5de-58cf-b6f8-1ebec26f1a25', '00000000-0000-0000-0000-000000000000', 'st48@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st48@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ab48a9d6-a5de-58cf-b6f8-1ebec26f1a25', 'ab48a9d6-a5de-58cf-b6f8-1ebec26f1a25', '{"sub": "ab48a9d6-a5de-58cf-b6f8-1ebec26f1a25", "email": "st48@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ab48a9d6-a5de-58cf-b6f8-1ebec26f1a25')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ab48a9d6-a5de-58cf-b6f8-1ebec26f1a25', 'admin', 'st48@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9440bcb6-0cc2-5625-bc0e-092151d6aa29', 'ab48a9d6-a5de-58cf-b6f8-1ebec26f1a25', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.5010249, 83.8913131, 'India EV Network License', 'LIC-IN-ST48', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9440bcb6-0cc2-5625-bc0e-092151d6aa29';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('88965830-85a1-5646-a42c-8b1044a8022e', '9440bcb6-0cc2-5625-bc0e-092151d6aa29', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('57246a0b-0ded-57df-88e0-a7a4d37fb139', '9440bcb6-0cc2-5625-bc0e-092151d6aa29', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 49: BPCL Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('58bece7d-32af-54b0-835d-433fe89235dc', '00000000-0000-0000-0000-000000000000', 'st49@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st49@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('58bece7d-32af-54b0-835d-433fe89235dc', '58bece7d-32af-54b0-835d-433fe89235dc', '{"sub": "58bece7d-32af-54b0-835d-433fe89235dc", "email": "st49@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '58bece7d-32af-54b0-835d-433fe89235dc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('58bece7d-32af-54b0-835d-433fe89235dc', 'admin', 'st49@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5abacccf-d633-513e-9392-a7578e75a7e1', '58bece7d-32af-54b0-835d-433fe89235dc', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.494135, 83.98229, 'India EV Network License', 'LIC-IN-ST49', 500.0, 30.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5abacccf-d633-513e-9392-a7578e75a7e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('946f159a-4d90-512a-8bbe-c56a4e07a1f3', '5abacccf-d633-513e-9392-a7578e75a7e1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('87737ee6-1c62-54ec-b7fa-fe08b3211b3d', '5abacccf-d633-513e-9392-a7578e75a7e1', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 50: Jio-bp (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f3f405c2-ba0c-55fd-aa9f-ff24dd8e9eff', '00000000-0000-0000-0000-000000000000', 'st50@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st50@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f3f405c2-ba0c-55fd-aa9f-ff24dd8e9eff', 'f3f405c2-ba0c-55fd-aa9f-ff24dd8e9eff', '{"sub": "f3f405c2-ba0c-55fd-aa9f-ff24dd8e9eff", "email": "st50@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f3f405c2-ba0c-55fd-aa9f-ff24dd8e9eff')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f3f405c2-ba0c-55fd-aa9f-ff24dd8e9eff', 'admin', 'st50@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('74cd0068-610c-5333-8678-c0e79095c3dc', 'f3f405c2-ba0c-55fd-aa9f-ff24dd8e9eff', 'Jio-bp', 'Jio-bp, Odisha, India', 21.6326653, 82.1592037, 'India EV Network License', 'LIC-IN-ST50', 500.0, 50.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '74cd0068-610c-5333-8678-c0e79095c3dc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2e8337ae-d01b-5ed9-9861-442115a28ffe', '74cd0068-610c-5333-8678-c0e79095c3dc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fa10b15a-c5ae-5b18-8500-7f8e50bb3e9d', '74cd0068-610c-5333-8678-c0e79095c3dc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 51: Jio-bp (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf7f7b6b-b626-5a24-b852-19752bda49eb', '00000000-0000-0000-0000-000000000000', 'st51@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st51@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf7f7b6b-b626-5a24-b852-19752bda49eb', 'cf7f7b6b-b626-5a24-b852-19752bda49eb', '{"sub": "cf7f7b6b-b626-5a24-b852-19752bda49eb", "email": "st51@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf7f7b6b-b626-5a24-b852-19752bda49eb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf7f7b6b-b626-5a24-b852-19752bda49eb', 'admin', 'st51@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6d7de669-691c-58af-bc93-1c1562bac67f', 'cf7f7b6b-b626-5a24-b852-19752bda49eb', 'Jio-bp', 'Jio-bp, Odisha, India', 21.55027, 81.94746, 'India EV Network License', 'LIC-IN-ST51', 500.0, 50.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6d7de669-691c-58af-bc93-1c1562bac67f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3c475d23-79c6-5a9c-aedc-d3279bdd2992', '6d7de669-691c-58af-bc93-1c1562bac67f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1e5fc5bb-7fc2-5a31-988b-a73f4253f30a', '6d7de669-691c-58af-bc93-1c1562bac67f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 52: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bd01843b-1c73-5269-a5f7-24759ee637d8', '00000000-0000-0000-0000-000000000000', 'st52@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st52@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bd01843b-1c73-5269-a5f7-24759ee637d8', 'bd01843b-1c73-5269-a5f7-24759ee637d8', '{"sub": "bd01843b-1c73-5269-a5f7-24759ee637d8", "email": "st52@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bd01843b-1c73-5269-a5f7-24759ee637d8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bd01843b-1c73-5269-a5f7-24759ee637d8', 'admin', 'st52@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bfe0d5d1-fae3-5b4f-81c8-3ddd44a54093', 'bd01843b-1c73-5269-a5f7-24759ee637d8', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.51608, 81.69389, 'India EV Network License', 'LIC-IN-ST52', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bfe0d5d1-fae3-5b4f-81c8-3ddd44a54093';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('121c519d-1804-541b-9af0-96ac6262abef', 'bfe0d5d1-fae3-5b4f-81c8-3ddd44a54093', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2aa5e847-55a0-537c-af17-ce49d4d89133', 'bfe0d5d1-fae3-5b4f-81c8-3ddd44a54093', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 53: PRATIK E RICKSHAW (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('789975e3-78f4-5a1c-aadf-908cef2c040a', '00000000-0000-0000-0000-000000000000', 'st53@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st53@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('789975e3-78f4-5a1c-aadf-908cef2c040a', '789975e3-78f4-5a1c-aadf-908cef2c040a', '{"sub": "789975e3-78f4-5a1c-aadf-908cef2c040a", "email": "st53@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '789975e3-78f4-5a1c-aadf-908cef2c040a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('789975e3-78f4-5a1c-aadf-908cef2c040a', 'admin', 'st53@boss.com', 'Admin PRATIK E RICKSHAW', 'PRATIK E RICKSHAW', 'PRATIK E RICKSHAW, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('46d361c5-8506-54d7-97bc-3a0d34dac88e', '789975e3-78f4-5a1c-aadf-908cef2c040a', 'PRATIK E RICKSHAW', 'PRATIK E RICKSHAW, Odisha, India', 21.7025644, 81.5427175, 'India EV Network License', 'LIC-IN-ST53', 500.0, 3.3, true, 'Ganjam', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '46d361c5-8506-54d7-97bc-3a0d34dac88e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6f191f7e-a7f4-5265-9376-5d18c755bae5', '46d361c5-8506-54d7-97bc-3a0d34dac88e', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 54: Ather Grid Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1ea12ea7-7258-5b22-aa2d-e85cf2d2fd26', '00000000-0000-0000-0000-000000000000', 'st54@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st54@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1ea12ea7-7258-5b22-aa2d-e85cf2d2fd26', '1ea12ea7-7258-5b22-aa2d-e85cf2d2fd26', '{"sub": "1ea12ea7-7258-5b22-aa2d-e85cf2d2fd26", "email": "st54@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1ea12ea7-7258-5b22-aa2d-e85cf2d2fd26')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1ea12ea7-7258-5b22-aa2d-e85cf2d2fd26', 'admin', 'st54@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5e9e1b3a-5396-5cf2-b62d-47c4fbc082f1', '1ea12ea7-7258-5b22-aa2d-e85cf2d2fd26', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.697687, 81.54614, 'India EV Network License', 'LIC-IN-ST54', 500.0, 3.3, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5e9e1b3a-5396-5cf2-b62d-47c4fbc082f1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('07babdde-255e-52a8-8b30-5100a76f52f5', '5e9e1b3a-5396-5cf2-b62d-47c4fbc082f1', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7a911d76-84a2-58db-b00b-56ab7bfdcefa', '5e9e1b3a-5396-5cf2-b62d-47c4fbc082f1', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 55: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('15e8f466-b4a5-50b1-8082-00e308fe3065', '00000000-0000-0000-0000-000000000000', 'st55@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st55@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('15e8f466-b4a5-50b1-8082-00e308fe3065', '15e8f466-b4a5-50b1-8082-00e308fe3065', '{"sub": "15e8f466-b4a5-50b1-8082-00e308fe3065", "email": "st55@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '15e8f466-b4a5-50b1-8082-00e308fe3065')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('15e8f466-b4a5-50b1-8082-00e308fe3065', 'admin', 'st55@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('44c0affd-06a9-5a0e-aaa7-0bdc08c472cb', '15e8f466-b4a5-50b1-8082-00e308fe3065', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.63401, 81.62389, 'India EV Network License', 'LIC-IN-ST55', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '44c0affd-06a9-5a0e-aaa7-0bdc08c472cb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2014ee56-2a36-5cf0-b8ef-46c0d256d2d1', '44c0affd-06a9-5a0e-aaa7-0bdc08c472cb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('14f53628-2dd9-52a8-ac1e-3c12b6776f2a', '44c0affd-06a9-5a0e-aaa7-0bdc08c472cb', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 56: BPCL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7c2c8916-5988-56df-a6a3-720db7d48ecc', '00000000-0000-0000-0000-000000000000', 'st56@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st56@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7c2c8916-5988-56df-a6a3-720db7d48ecc', '7c2c8916-5988-56df-a6a3-720db7d48ecc', '{"sub": "7c2c8916-5988-56df-a6a3-720db7d48ecc", "email": "st56@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7c2c8916-5988-56df-a6a3-720db7d48ecc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7c2c8916-5988-56df-a6a3-720db7d48ecc', 'admin', 'st56@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7f1225ae-7105-592c-970c-efe0508380d5', '7c2c8916-5988-56df-a6a3-720db7d48ecc', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.5166085, 81.6939279, 'India EV Network License', 'LIC-IN-ST56', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7f1225ae-7105-592c-970c-efe0508380d5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('90c3bc59-5fd5-5c04-8e32-a69f058abe4f', '7f1225ae-7105-592c-970c-efe0508380d5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d4f99e58-8ec3-5139-95ea-d56d020ca400', '7f1225ae-7105-592c-970c-efe0508380d5', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 57: Jio-bp pulse Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fad44b45-d2ce-5ee0-946c-a0d952c92d8b', '00000000-0000-0000-0000-000000000000', 'st57@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st57@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fad44b45-d2ce-5ee0-946c-a0d952c92d8b', 'fad44b45-d2ce-5ee0-946c-a0d952c92d8b', '{"sub": "fad44b45-d2ce-5ee0-946c-a0d952c92d8b", "email": "st57@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fad44b45-d2ce-5ee0-946c-a0d952c92d8b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fad44b45-d2ce-5ee0-946c-a0d952c92d8b', 'admin', 'st57@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bfd975dd-6a4e-5d0d-8827-4bb1e201ea8e', 'fad44b45-d2ce-5ee0-946c-a0d952c92d8b', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 21.317264, 86.725105, 'India EV Network License', 'LIC-IN-ST57', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bfd975dd-6a4e-5d0d-8827-4bb1e201ea8e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('72edf76d-c340-528c-972c-34b0b781ee2b', 'bfd975dd-6a4e-5d0d-8827-4bb1e201ea8e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d1d32f97-1da0-53ee-ad54-709992d9a2cf', 'bfd975dd-6a4e-5d0d-8827-4bb1e201ea8e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8478e9d7-3a18-58a5-8d98-bcb6816051d4', 'bfd975dd-6a4e-5d0d-8827-4bb1e201ea8e', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 58: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dd324986-ed72-572a-9209-8ffd6ae3e77d', '00000000-0000-0000-0000-000000000000', 'st58@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st58@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dd324986-ed72-572a-9209-8ffd6ae3e77d', 'dd324986-ed72-572a-9209-8ffd6ae3e77d', '{"sub": "dd324986-ed72-572a-9209-8ffd6ae3e77d", "email": "st58@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dd324986-ed72-572a-9209-8ffd6ae3e77d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dd324986-ed72-572a-9209-8ffd6ae3e77d', 'admin', 'st58@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5a73e8a0-0079-52ed-87c5-21b98a1d0747', 'dd324986-ed72-572a-9209-8ffd6ae3e77d', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.2845369, 86.6749795, 'India EV Network License', 'LIC-IN-ST58', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5a73e8a0-0079-52ed-87c5-21b98a1d0747';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('13290eff-a593-5e87-a0dd-fe458a7b73e0', '5a73e8a0-0079-52ed-87c5-21b98a1d0747', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('794e3bd2-fd70-5525-aced-d1d3a7b7d9f7', '5a73e8a0-0079-52ed-87c5-21b98a1d0747', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 59: BPCL Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('55d8c3e8-e06a-5417-9b20-836d8a12ad41', '00000000-0000-0000-0000-000000000000', 'st59@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st59@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('55d8c3e8-e06a-5417-9b20-836d8a12ad41', '55d8c3e8-e06a-5417-9b20-836d8a12ad41', '{"sub": "55d8c3e8-e06a-5417-9b20-836d8a12ad41", "email": "st59@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '55d8c3e8-e06a-5417-9b20-836d8a12ad41')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('55d8c3e8-e06a-5417-9b20-836d8a12ad41', 'admin', 'st59@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f173438b-a68a-5004-8867-c00bfe4d190d', '55d8c3e8-e06a-5417-9b20-836d8a12ad41', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.3825286, 86.79633, 'India EV Network License', 'LIC-IN-ST59', 500.0, 30.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f173438b-a68a-5004-8867-c00bfe4d190d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e4d35afd-c61b-56dd-af44-96c754f3a408', 'f173438b-a68a-5004-8867-c00bfe4d190d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4e2cd4fc-e801-57ba-bbf7-51deab814892', 'f173438b-a68a-5004-8867-c00bfe4d190d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 60: BPCL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1a3b9af6-352b-5983-bf18-22b10b785f07', '00000000-0000-0000-0000-000000000000', 'st60@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st60@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1a3b9af6-352b-5983-bf18-22b10b785f07', '1a3b9af6-352b-5983-bf18-22b10b785f07', '{"sub": "1a3b9af6-352b-5983-bf18-22b10b785f07", "email": "st60@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1a3b9af6-352b-5983-bf18-22b10b785f07')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1a3b9af6-352b-5983-bf18-22b10b785f07', 'admin', 'st60@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e89eec70-5e5f-5b31-98d1-7ad8c650dfe2', '1a3b9af6-352b-5983-bf18-22b10b785f07', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.358081, 86.784451, 'India EV Network License', 'LIC-IN-ST60', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e89eec70-5e5f-5b31-98d1-7ad8c650dfe2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b2f01163-8b47-578d-88c7-f0136c50f6f7', 'e89eec70-5e5f-5b31-98d1-7ad8c650dfe2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ac983bce-a8de-5fb6-b071-6936200f448f', 'e89eec70-5e5f-5b31-98d1-7ad8c650dfe2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 61: Electric Vehicle Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('610fb56d-d79f-5005-a431-00c5b8d37825', '00000000-0000-0000-0000-000000000000', 'st61@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st61@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('610fb56d-d79f-5005-a431-00c5b8d37825', '610fb56d-d79f-5005-a431-00c5b8d37825', '{"sub": "610fb56d-d79f-5005-a431-00c5b8d37825", "email": "st61@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '610fb56d-d79f-5005-a431-00c5b8d37825')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('610fb56d-d79f-5005-a431-00c5b8d37825', 'admin', 'st61@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a91a8ed9-3eec-5e22-b8dd-23916819032d', '610fb56d-d79f-5005-a431-00c5b8d37825', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.2216615, 86.1190697, 'India EV Network License', 'LIC-IN-ST61', 500.0, 25.0, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a91a8ed9-3eec-5e22-b8dd-23916819032d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ff0acc0d-34fe-5b41-9520-170294ef0189', 'a91a8ed9-3eec-5e22-b8dd-23916819032d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f8a28210-fbd2-5107-a433-be37529c0301', 'a91a8ed9-3eec-5e22-b8dd-23916819032d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 62: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0ea26ead-6a92-547f-931c-81f4ee81608a', '00000000-0000-0000-0000-000000000000', 'st62@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st62@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0ea26ead-6a92-547f-931c-81f4ee81608a', '0ea26ead-6a92-547f-931c-81f4ee81608a', '{"sub": "0ea26ead-6a92-547f-931c-81f4ee81608a", "email": "st62@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0ea26ead-6a92-547f-931c-81f4ee81608a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0ea26ead-6a92-547f-931c-81f4ee81608a', 'admin', 'st62@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8a0f59c7-4966-5b5d-b989-ef7256955f88', '0ea26ead-6a92-547f-931c-81f4ee81608a', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.200249, 86.12389, 'India EV Network License', 'LIC-IN-ST62', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8a0f59c7-4966-5b5d-b989-ef7256955f88';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8b65588a-e66d-5d80-ab16-7e81f23c9a0a', '8a0f59c7-4966-5b5d-b989-ef7256955f88', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3dc96c34-386f-582c-9284-e07723f00394', '8a0f59c7-4966-5b5d-b989-ef7256955f88', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 63: BPCL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9a932905-6069-5120-ae4f-cdfc24de9ffc', '00000000-0000-0000-0000-000000000000', 'st63@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st63@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9a932905-6069-5120-ae4f-cdfc24de9ffc', '9a932905-6069-5120-ae4f-cdfc24de9ffc', '{"sub": "9a932905-6069-5120-ae4f-cdfc24de9ffc", "email": "st63@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9a932905-6069-5120-ae4f-cdfc24de9ffc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9a932905-6069-5120-ae4f-cdfc24de9ffc', 'admin', 'st63@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d29faff0-b3e0-50fd-81bc-5e4cf127bcc9', '9a932905-6069-5120-ae4f-cdfc24de9ffc', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.3652959, 83.7440391, 'India EV Network License', 'LIC-IN-ST63', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd29faff0-b3e0-50fd-81bc-5e4cf127bcc9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('455c0b71-4a82-5729-b4fd-9d9a70be17b5', 'd29faff0-b3e0-50fd-81bc-5e4cf127bcc9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ecdd2ec8-9eef-5d3c-babe-65ed70b38eb4', 'd29faff0-b3e0-50fd-81bc-5e4cf127bcc9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 64: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('50bcfc77-2d6d-51ba-995e-b74bce56da82', '00000000-0000-0000-0000-000000000000', 'st64@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st64@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('50bcfc77-2d6d-51ba-995e-b74bce56da82', '50bcfc77-2d6d-51ba-995e-b74bce56da82', '{"sub": "50bcfc77-2d6d-51ba-995e-b74bce56da82", "email": "st64@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '50bcfc77-2d6d-51ba-995e-b74bce56da82')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('50bcfc77-2d6d-51ba-995e-b74bce56da82', 'admin', 'st64@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ea41e9cb-23a8-5018-a453-da4b64307a83', '50bcfc77-2d6d-51ba-995e-b74bce56da82', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.314257, 83.4589782, 'India EV Network License', 'LIC-IN-ST64', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ea41e9cb-23a8-5018-a453-da4b64307a83';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dace855a-8fe2-54d8-b4e8-b98960906d37', 'ea41e9cb-23a8-5018-a453-da4b64307a83', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f8a0d6bc-715a-5fe1-b4bd-4096218e73ba', 'ea41e9cb-23a8-5018-a453-da4b64307a83', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 65: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('93e7fb5b-4f9e-5c99-8864-9efaa559b4a9', '00000000-0000-0000-0000-000000000000', 'st65@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st65@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('93e7fb5b-4f9e-5c99-8864-9efaa559b4a9', '93e7fb5b-4f9e-5c99-8864-9efaa559b4a9', '{"sub": "93e7fb5b-4f9e-5c99-8864-9efaa559b4a9", "email": "st65@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '93e7fb5b-4f9e-5c99-8864-9efaa559b4a9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('93e7fb5b-4f9e-5c99-8864-9efaa559b4a9', 'admin', 'st65@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('692174e2-1eb7-58c8-a83e-fb34e8c96022', '93e7fb5b-4f9e-5c99-8864-9efaa559b4a9', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.3127038, 83.3128902, 'India EV Network License', 'LIC-IN-ST65', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '692174e2-1eb7-58c8-a83e-fb34e8c96022';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a1c8c13c-b73d-5474-bd93-5ac2e05c525d', '692174e2-1eb7-58c8-a83e-fb34e8c96022', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4b99002a-adbe-5c76-86b3-364fc67a7d0c', '692174e2-1eb7-58c8-a83e-fb34e8c96022', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 66: BPCL Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e7d4dde9-22b5-5dc0-b5db-d11a8f10ccb4', '00000000-0000-0000-0000-000000000000', 'st66@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st66@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e7d4dde9-22b5-5dc0-b5db-d11a8f10ccb4', 'e7d4dde9-22b5-5dc0-b5db-d11a8f10ccb4', '{"sub": "e7d4dde9-22b5-5dc0-b5db-d11a8f10ccb4", "email": "st66@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e7d4dde9-22b5-5dc0-b5db-d11a8f10ccb4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e7d4dde9-22b5-5dc0-b5db-d11a8f10ccb4', 'admin', 'st66@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('55cbd19b-717f-50c3-b6d5-172495c5453e', 'e7d4dde9-22b5-5dc0-b5db-d11a8f10ccb4', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.314738, 83.309171, 'India EV Network License', 'LIC-IN-ST66', 500.0, 30.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '55cbd19b-717f-50c3-b6d5-172495c5453e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cdf36e4d-d774-5c8a-b885-66f2a00881b7', '55cbd19b-717f-50c3-b6d5-172495c5453e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dfa191a1-6d00-59b6-9f68-065a7fe96325', '55cbd19b-717f-50c3-b6d5-172495c5453e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 67: Adani Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2ba6d1b1-87a8-5132-a067-dcbc4ff0b29a', '00000000-0000-0000-0000-000000000000', 'st67@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st67@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2ba6d1b1-87a8-5132-a067-dcbc4ff0b29a', '2ba6d1b1-87a8-5132-a067-dcbc4ff0b29a', '{"sub": "2ba6d1b1-87a8-5132-a067-dcbc4ff0b29a", "email": "st67@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2ba6d1b1-87a8-5132-a067-dcbc4ff0b29a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2ba6d1b1-87a8-5132-a067-dcbc4ff0b29a', 'admin', 'st67@boss.com', 'Admin Adani Charging Station', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1a70a685-3ca8-5cf7-b82c-44331772c36d', '2ba6d1b1-87a8-5132-a067-dcbc4ff0b29a', 'Adani Charging Station', 'Adani Charging Station, Odisha, India', 21.296246, 82.921301, 'India EV Network License', 'LIC-IN-ST67', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1a70a685-3ca8-5cf7-b82c-44331772c36d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2ffd181e-8e9e-5006-b0b4-eb384d6b1306', '1a70a685-3ca8-5cf7-b82c-44331772c36d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('11d890ae-56c7-5d99-81c3-bd5db3f519aa', '1a70a685-3ca8-5cf7-b82c-44331772c36d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 68: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ace70120-1fcb-562e-a400-d58d3ea19f04', '00000000-0000-0000-0000-000000000000', 'st68@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st68@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ace70120-1fcb-562e-a400-d58d3ea19f04', 'ace70120-1fcb-562e-a400-d58d3ea19f04', '{"sub": "ace70120-1fcb-562e-a400-d58d3ea19f04", "email": "st68@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ace70120-1fcb-562e-a400-d58d3ea19f04')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ace70120-1fcb-562e-a400-d58d3ea19f04', 'admin', 'st68@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8d3eaa95-1eb0-5a11-8818-fbfea3cc8139', 'ace70120-1fcb-562e-a400-d58d3ea19f04', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.32392, 81.7012, 'India EV Network License', 'LIC-IN-ST68', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8d3eaa95-1eb0-5a11-8818-fbfea3cc8139';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3575bb59-c2ea-5e9c-a79c-979d87fb5701', '8d3eaa95-1eb0-5a11-8818-fbfea3cc8139', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('21ca1013-2b68-5f6f-8bb1-13427afc9aad', '8d3eaa95-1eb0-5a11-8818-fbfea3cc8139', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 69: Electric Vehicle Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eb92eb6d-6cd2-519f-9e2b-1383cfe915c9', '00000000-0000-0000-0000-000000000000', 'st69@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st69@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eb92eb6d-6cd2-519f-9e2b-1383cfe915c9', 'eb92eb6d-6cd2-519f-9e2b-1383cfe915c9', '{"sub": "eb92eb6d-6cd2-519f-9e2b-1383cfe915c9", "email": "st69@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eb92eb6d-6cd2-519f-9e2b-1383cfe915c9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eb92eb6d-6cd2-519f-9e2b-1383cfe915c9', 'admin', 'st69@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('91370c29-b835-5336-b1ba-9f9d6a89db8d', 'eb92eb6d-6cd2-519f-9e2b-1383cfe915c9', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.2020656, 81.9192961, 'India EV Network License', 'LIC-IN-ST69', 500.0, 25.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '91370c29-b835-5336-b1ba-9f9d6a89db8d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e5c7f51b-bd89-5c8c-b426-24208e0be338', '91370c29-b835-5336-b1ba-9f9d6a89db8d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('09e5dddb-dc39-5013-aa74-aeb2bec61598', '91370c29-b835-5336-b1ba-9f9d6a89db8d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 70: BPCL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7bd1736a-831a-57b6-93d0-d0aabc1517de', '00000000-0000-0000-0000-000000000000', 'st70@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st70@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7bd1736a-831a-57b6-93d0-d0aabc1517de', '7bd1736a-831a-57b6-93d0-d0aabc1517de', '{"sub": "7bd1736a-831a-57b6-93d0-d0aabc1517de", "email": "st70@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7bd1736a-831a-57b6-93d0-d0aabc1517de')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7bd1736a-831a-57b6-93d0-d0aabc1517de', 'admin', 'st70@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5a9ef5d1-0d56-547c-87a3-e788475fa130', '7bd1736a-831a-57b6-93d0-d0aabc1517de', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.2057845, 81.872112, 'India EV Network License', 'LIC-IN-ST70', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5a9ef5d1-0d56-547c-87a3-e788475fa130';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0d09292d-cb43-5cb1-abba-cc7228b8a11e', '5a9ef5d1-0d56-547c-87a3-e788475fa130', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a97cdb49-7f4b-5b97-a4d5-cf230281f719', '5a9ef5d1-0d56-547c-87a3-e788475fa130', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 71: Jio-bp (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('270fe96b-4c6d-5e49-93b5-d78a68a9f5f2', '00000000-0000-0000-0000-000000000000', 'st71@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st71@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('270fe96b-4c6d-5e49-93b5-d78a68a9f5f2', '270fe96b-4c6d-5e49-93b5-d78a68a9f5f2', '{"sub": "270fe96b-4c6d-5e49-93b5-d78a68a9f5f2", "email": "st71@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '270fe96b-4c6d-5e49-93b5-d78a68a9f5f2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('270fe96b-4c6d-5e49-93b5-d78a68a9f5f2', 'admin', 'st71@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('722b77fe-0cc0-5f7e-b36c-28e9d7e70d75', '270fe96b-4c6d-5e49-93b5-d78a68a9f5f2', 'Jio-bp', 'Jio-bp, Odisha, India', 21.3028027, 81.7368091, 'India EV Network License', 'LIC-IN-ST71', 500.0, 50.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '722b77fe-0cc0-5f7e-b36c-28e9d7e70d75';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b3402bd8-5f63-5fdb-8cd0-323f6d4a67f5', '722b77fe-0cc0-5f7e-b36c-28e9d7e70d75', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dca8a40c-b4dd-5383-bfea-47e88debcc0f', '722b77fe-0cc0-5f7e-b36c-28e9d7e70d75', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 72: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('78b2abeb-3cb5-5fcb-bc23-67a0c33f17f5', '00000000-0000-0000-0000-000000000000', 'st72@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st72@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('78b2abeb-3cb5-5fcb-bc23-67a0c33f17f5', '78b2abeb-3cb5-5fcb-bc23-67a0c33f17f5', '{"sub": "78b2abeb-3cb5-5fcb-bc23-67a0c33f17f5", "email": "st72@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '78b2abeb-3cb5-5fcb-bc23-67a0c33f17f5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('78b2abeb-3cb5-5fcb-bc23-67a0c33f17f5', 'admin', 'st72@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dd9b98f1-8692-5af3-b811-4c544c43904d', '78b2abeb-3cb5-5fcb-bc23-67a0c33f17f5', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.2182526, 81.6301313, 'India EV Network License', 'LIC-IN-ST72', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dd9b98f1-8692-5af3-b811-4c544c43904d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7e75bf07-3e45-5247-871e-118347ba246f', 'dd9b98f1-8692-5af3-b811-4c544c43904d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d62633b5-2474-514f-80b2-e1fa450db41a', 'dd9b98f1-8692-5af3-b811-4c544c43904d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 73: NIKOL EV Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('63bbc63a-24f3-5370-8b7a-e14b1579e89d', '00000000-0000-0000-0000-000000000000', 'st73@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st73@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('63bbc63a-24f3-5370-8b7a-e14b1579e89d', '63bbc63a-24f3-5370-8b7a-e14b1579e89d', '{"sub": "63bbc63a-24f3-5370-8b7a-e14b1579e89d", "email": "st73@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '63bbc63a-24f3-5370-8b7a-e14b1579e89d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('63bbc63a-24f3-5370-8b7a-e14b1579e89d', 'admin', 'st73@boss.com', 'Admin NIKOL EV Charging Station', 'NIKOL EV Charging Station', 'NIKOL EV Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('96d10723-540f-5c1f-bbb6-c5f6b9503223', '63bbc63a-24f3-5370-8b7a-e14b1579e89d', 'NIKOL EV Charging Station', 'NIKOL EV Charging Station, Odisha, India', 21.3173134, 81.6397184, 'India EV Network License', 'LIC-IN-ST73', 500.0, 7.4, true, 'Khordha', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '96d10723-540f-5c1f-bbb6-c5f6b9503223';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7ea7c917-1268-53cb-9c0b-4dfbca954de1', '96d10723-540f-5c1f-bbb6-c5f6b9503223', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 74: Tata Power Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3147836e-5186-54b4-97fa-80cb3a5e8568', '00000000-0000-0000-0000-000000000000', 'st74@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st74@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3147836e-5186-54b4-97fa-80cb3a5e8568', '3147836e-5186-54b4-97fa-80cb3a5e8568', '{"sub": "3147836e-5186-54b4-97fa-80cb3a5e8568", "email": "st74@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3147836e-5186-54b4-97fa-80cb3a5e8568')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3147836e-5186-54b4-97fa-80cb3a5e8568', 'admin', 'st74@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f242f070-f9bb-5c79-8e79-50221eeec4da', '3147836e-5186-54b4-97fa-80cb3a5e8568', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.2377887, 81.6896835, 'India EV Network License', 'LIC-IN-ST74', 500.0, 60.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f242f070-f9bb-5c79-8e79-50221eeec4da';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e51c66ae-61d9-5682-8e11-2e68397e3313', 'f242f070-f9bb-5c79-8e79-50221eeec4da', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0492ff22-6a84-5748-95ed-119f4164abd4', 'f242f070-f9bb-5c79-8e79-50221eeec4da', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 75: BPCL Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2caa9185-1daf-52cd-9715-6fcfd2edc7d7', '00000000-0000-0000-0000-000000000000', 'st75@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st75@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2caa9185-1daf-52cd-9715-6fcfd2edc7d7', '2caa9185-1daf-52cd-9715-6fcfd2edc7d7', '{"sub": "2caa9185-1daf-52cd-9715-6fcfd2edc7d7", "email": "st75@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2caa9185-1daf-52cd-9715-6fcfd2edc7d7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2caa9185-1daf-52cd-9715-6fcfd2edc7d7', 'admin', 'st75@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('28e14359-b761-5ce5-bdc4-68226268799a', '2caa9185-1daf-52cd-9715-6fcfd2edc7d7', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.2495941, 81.523425, 'India EV Network License', 'LIC-IN-ST75', 500.0, 30.0, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '28e14359-b761-5ce5-bdc4-68226268799a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06a03f93-cec3-52a9-b0b4-5545d9ed6cef', '28e14359-b761-5ce5-bdc4-68226268799a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('642c71af-7fd0-5f8c-b9a0-aa06b61f4e1a', '28e14359-b761-5ce5-bdc4-68226268799a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 76: Jio-bp (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ff20f0c3-5007-5aab-af64-513b7953c8e0', '00000000-0000-0000-0000-000000000000', 'st76@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st76@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ff20f0c3-5007-5aab-af64-513b7953c8e0', 'ff20f0c3-5007-5aab-af64-513b7953c8e0', '{"sub": "ff20f0c3-5007-5aab-af64-513b7953c8e0", "email": "st76@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ff20f0c3-5007-5aab-af64-513b7953c8e0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ff20f0c3-5007-5aab-af64-513b7953c8e0', 'admin', 'st76@boss.com', 'Admin Jio-bp', 'Jio-bp', 'Jio-bp, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('404ae427-d9db-532d-acc5-58d02108aae0', 'ff20f0c3-5007-5aab-af64-513b7953c8e0', 'Jio-bp', 'Jio-bp, Odisha, India', 21.341343, 81.429919, 'India EV Network License', 'LIC-IN-ST76', 500.0, 50.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '404ae427-d9db-532d-acc5-58d02108aae0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b7fe93bd-edec-554b-9306-5455fb6458da', '404ae427-d9db-532d-acc5-58d02108aae0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d5f2e6b2-c601-5252-b708-1b941628f25c', '404ae427-d9db-532d-acc5-58d02108aae0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 77: BPCL Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fa258e12-5a67-52ec-9d85-e6e671d2b2b2', '00000000-0000-0000-0000-000000000000', 'st77@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st77@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fa258e12-5a67-52ec-9d85-e6e671d2b2b2', 'fa258e12-5a67-52ec-9d85-e6e671d2b2b2', '{"sub": "fa258e12-5a67-52ec-9d85-e6e671d2b2b2", "email": "st77@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fa258e12-5a67-52ec-9d85-e6e671d2b2b2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fa258e12-5a67-52ec-9d85-e6e671d2b2b2', 'admin', 'st77@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d8066feb-ed26-57dd-aaf4-b1470932f73f', 'fa258e12-5a67-52ec-9d85-e6e671d2b2b2', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.364806, 81.6637644, 'India EV Network License', 'LIC-IN-ST77', 500.0, 30.0, true, 'Puri', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd8066feb-ed26-57dd-aaf4-b1470932f73f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('754afaad-855f-5cf2-a567-d16e68ce0fc6', 'd8066feb-ed26-57dd-aaf4-b1470932f73f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2ffeff5d-1950-52f5-b6f7-491fd04f1ba7', 'd8066feb-ed26-57dd-aaf4-b1470932f73f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 78: Ather Grid Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('88b53f52-c8a4-5266-a883-13855baedcc7', '00000000-0000-0000-0000-000000000000', 'st78@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st78@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('88b53f52-c8a4-5266-a883-13855baedcc7', '88b53f52-c8a4-5266-a883-13855baedcc7', '{"sub": "88b53f52-c8a4-5266-a883-13855baedcc7", "email": "st78@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '88b53f52-c8a4-5266-a883-13855baedcc7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('88b53f52-c8a4-5266-a883-13855baedcc7', 'admin', 'st78@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d0fae1d8-ae48-5b2d-bc8d-68a6a3ea8326', '88b53f52-c8a4-5266-a883-13855baedcc7', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.2416455, 81.4959004, 'India EV Network License', 'LIC-IN-ST78', 500.0, 3.3, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd0fae1d8-ae48-5b2d-bc8d-68a6a3ea8326';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('095ef149-378f-58ae-8817-84a795cf3a0a', 'd0fae1d8-ae48-5b2d-bc8d-68a6a3ea8326', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('86b620b3-ac48-5a88-bb7f-d7e825f493e7', 'd0fae1d8-ae48-5b2d-bc8d-68a6a3ea8326', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 79: BPCL Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('57626a21-ba40-5625-a135-3ac58c9a9b65', '00000000-0000-0000-0000-000000000000', 'st79@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st79@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('57626a21-ba40-5625-a135-3ac58c9a9b65', '57626a21-ba40-5625-a135-3ac58c9a9b65', '{"sub": "57626a21-ba40-5625-a135-3ac58c9a9b65", "email": "st79@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '57626a21-ba40-5625-a135-3ac58c9a9b65')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('57626a21-ba40-5625-a135-3ac58c9a9b65', 'admin', 'st79@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c35cf6a7-ce60-5c6b-9151-9c8c0bc05ff4', '57626a21-ba40-5625-a135-3ac58c9a9b65', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.335394, 81.621727, 'India EV Network License', 'LIC-IN-ST79', 500.0, 30.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c35cf6a7-ce60-5c6b-9151-9c8c0bc05ff4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ee618c55-9f5e-562b-8a8c-8f29c413bdf9', 'c35cf6a7-ce60-5c6b-9151-9c8c0bc05ff4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d0774c8f-f71e-59b9-b911-7fc183a50c5f', 'c35cf6a7-ce60-5c6b-9151-9c8c0bc05ff4', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 80: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a98e0dc7-6c6e-5093-ab0e-127405f6d65e', '00000000-0000-0000-0000-000000000000', 'st80@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st80@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a98e0dc7-6c6e-5093-ab0e-127405f6d65e', 'a98e0dc7-6c6e-5093-ab0e-127405f6d65e', '{"sub": "a98e0dc7-6c6e-5093-ab0e-127405f6d65e", "email": "st80@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a98e0dc7-6c6e-5093-ab0e-127405f6d65e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a98e0dc7-6c6e-5093-ab0e-127405f6d65e', 'admin', 'st80@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7663f2d6-abdb-5606-8a60-b4e5cfa74046', 'a98e0dc7-6c6e-5093-ab0e-127405f6d65e', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.2404095, 81.6577801, 'India EV Network License', 'LIC-IN-ST80', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7663f2d6-abdb-5606-8a60-b4e5cfa74046';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8ec827bd-135a-5030-8a77-84d7c7ed5325', '7663f2d6-abdb-5606-8a60-b4e5cfa74046', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b9046c68-a383-5b03-8bd0-734df43ef8ee', '7663f2d6-abdb-5606-8a60-b4e5cfa74046', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 81: Ather Grid Charging Station (Sambalpur, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('806b4ec9-c028-53bd-9c8b-eb9789a86b1a', '00000000-0000-0000-0000-000000000000', 'st81@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st81@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('806b4ec9-c028-53bd-9c8b-eb9789a86b1a', '806b4ec9-c028-53bd-9c8b-eb9789a86b1a', '{"sub": "806b4ec9-c028-53bd-9c8b-eb9789a86b1a", "email": "st81@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '806b4ec9-c028-53bd-9c8b-eb9789a86b1a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('806b4ec9-c028-53bd-9c8b-eb9789a86b1a', 'admin', 'st81@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('bb82b658-36c9-5ec6-bbab-455d6e19ba8c', '806b4ec9-c028-53bd-9c8b-eb9789a86b1a', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.2444126, 81.607608, 'India EV Network License', 'LIC-IN-ST81', 500.0, 3.3, true, 'Sambalpur', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'bb82b658-36c9-5ec6-bbab-455d6e19ba8c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('678ad667-ae3e-5dd2-97a3-7a091f1d24a8', 'bb82b658-36c9-5ec6-bbab-455d6e19ba8c', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('439a1d18-e5f2-5cdf-81d9-1cb366761767', 'bb82b658-36c9-5ec6-bbab-455d6e19ba8c', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 82: BPCL Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('129e94c5-40a3-51dd-8370-f7d13793e62d', '00000000-0000-0000-0000-000000000000', 'st82@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st82@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('129e94c5-40a3-51dd-8370-f7d13793e62d', '129e94c5-40a3-51dd-8370-f7d13793e62d', '{"sub": "129e94c5-40a3-51dd-8370-f7d13793e62d", "email": "st82@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '129e94c5-40a3-51dd-8370-f7d13793e62d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('129e94c5-40a3-51dd-8370-f7d13793e62d', 'admin', 'st82@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('af70b0bf-0f11-52e0-b37b-8fd27e9698e4', '129e94c5-40a3-51dd-8370-f7d13793e62d', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.315833, 81.639605, 'India EV Network License', 'LIC-IN-ST82', 500.0, 30.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'af70b0bf-0f11-52e0-b37b-8fd27e9698e4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6a8e531f-d9a4-5602-a9e8-847136d61c3c', 'af70b0bf-0f11-52e0-b37b-8fd27e9698e4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5aa628f5-cf8a-54ab-acf2-a01f12290029', 'af70b0bf-0f11-52e0-b37b-8fd27e9698e4', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 83: Laxmi E Bike Solution (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('38cbc662-4e41-531d-aeb3-81949041e612', '00000000-0000-0000-0000-000000000000', 'st83@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st83@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('38cbc662-4e41-531d-aeb3-81949041e612', '38cbc662-4e41-531d-aeb3-81949041e612', '{"sub": "38cbc662-4e41-531d-aeb3-81949041e612", "email": "st83@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '38cbc662-4e41-531d-aeb3-81949041e612')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('38cbc662-4e41-531d-aeb3-81949041e612', 'admin', 'st83@boss.com', 'Admin Laxmi E Bike Solution', 'Laxmi E Bike Solution', 'Laxmi E Bike Solution, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('69b67968-bfe3-5cb4-b0ba-dcb6a999937a', '38cbc662-4e41-531d-aeb3-81949041e612', 'Laxmi E Bike Solution', 'Laxmi E Bike Solution, Odisha, India', 21.2346227, 81.6644444, 'India EV Network License', 'LIC-IN-ST83', 500.0, 7.4, true, 'Puri', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '69b67968-bfe3-5cb4-b0ba-dcb6a999937a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('486d8843-820d-568b-af6a-a2a93159d51c', '69b67968-bfe3-5cb4-b0ba-dcb6a999937a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 84: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('22afc4a6-50f1-5138-885c-55f1de80f820', '00000000-0000-0000-0000-000000000000', 'st84@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st84@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('22afc4a6-50f1-5138-885c-55f1de80f820', '22afc4a6-50f1-5138-885c-55f1de80f820', '{"sub": "22afc4a6-50f1-5138-885c-55f1de80f820", "email": "st84@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '22afc4a6-50f1-5138-885c-55f1de80f820')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('22afc4a6-50f1-5138-885c-55f1de80f820', 'admin', 'st84@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7b34eeda-3842-523f-a3c1-7c8ef2d6a46d', '22afc4a6-50f1-5138-885c-55f1de80f820', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.2404001, 81.6029695, 'India EV Network License', 'LIC-IN-ST84', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7b34eeda-3842-523f-a3c1-7c8ef2d6a46d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('abdeb2f0-41a6-5b0f-ad6e-20baca17fc73', '7b34eeda-3842-523f-a3c1-7c8ef2d6a46d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('820430ee-25ce-5866-a0b8-9e4a059dfdd8', '7b34eeda-3842-523f-a3c1-7c8ef2d6a46d', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 85: BPCL Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b5c18060-51a5-5312-ac87-b2f994897ecb', '00000000-0000-0000-0000-000000000000', 'st85@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st85@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b5c18060-51a5-5312-ac87-b2f994897ecb', 'b5c18060-51a5-5312-ac87-b2f994897ecb', '{"sub": "b5c18060-51a5-5312-ac87-b2f994897ecb", "email": "st85@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b5c18060-51a5-5312-ac87-b2f994897ecb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b5c18060-51a5-5312-ac87-b2f994897ecb', 'admin', 'st85@boss.com', 'Admin BPCL Charging Station', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c2afc861-7af3-5421-ab2e-f70c2d2a2ed8', 'b5c18060-51a5-5312-ac87-b2f994897ecb', 'BPCL Charging Station', 'BPCL Charging Station, Odisha, India', 21.24332, 81.579622, 'India EV Network License', 'LIC-IN-ST85', 500.0, 30.0, true, 'Balasore', 'Odisha', 2, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c2afc861-7af3-5421-ab2e-f70c2d2a2ed8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cdc9f88e-9b58-521b-a606-485bf4a399d5', 'c2afc861-7af3-5421-ab2e-f70c2d2a2ed8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ddfea617-72dc-5c6e-a66b-78735e7e5b99', 'c2afc861-7af3-5421-ab2e-f70c2d2a2ed8', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 86: Electric Vehicle Charging Station (Puri, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('40ee5d90-5596-52b0-bd48-20da37c02747', '00000000-0000-0000-0000-000000000000', 'st86@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st86@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('40ee5d90-5596-52b0-bd48-20da37c02747', '40ee5d90-5596-52b0-bd48-20da37c02747', '{"sub": "40ee5d90-5596-52b0-bd48-20da37c02747", "email": "st86@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '40ee5d90-5596-52b0-bd48-20da37c02747')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('40ee5d90-5596-52b0-bd48-20da37c02747', 'admin', 'st86@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3a512bb6-cae2-5655-967b-71ef7cb633d2', '40ee5d90-5596-52b0-bd48-20da37c02747', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 21.2350671, 81.6309002, 'India EV Network License', 'LIC-IN-ST86', 500.0, 25.0, true, 'Puri', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3a512bb6-cae2-5655-967b-71ef7cb633d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e019c2f3-515b-5205-9a95-6983278c7db2', '3a512bb6-cae2-5655-967b-71ef7cb633d2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('63a3efb9-9097-5587-8f68-85048103d73e', '3a512bb6-cae2-5655-967b-71ef7cb633d2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 87: Ather Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3e408cb3-50bf-5d82-8e14-d218b9b41188', '00000000-0000-0000-0000-000000000000', 'st87@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st87@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3e408cb3-50bf-5d82-8e14-d218b9b41188', '3e408cb3-50bf-5d82-8e14-d218b9b41188', '{"sub": "3e408cb3-50bf-5d82-8e14-d218b9b41188", "email": "st87@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3e408cb3-50bf-5d82-8e14-d218b9b41188')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3e408cb3-50bf-5d82-8e14-d218b9b41188', 'admin', 'st87@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3cff6bb3-b80e-5142-8287-d49dd3a80927', '3e408cb3-50bf-5d82-8e14-d218b9b41188', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 21.2440004, 81.6347188, 'India EV Network License', 'LIC-IN-ST87', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3cff6bb3-b80e-5142-8287-d49dd3a80927';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ecb3290e-22e7-5e15-8895-3a67cb696771', '3cff6bb3-b80e-5142-8287-d49dd3a80927', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f6d90f00-d1c4-5815-a94f-45389309c6af', '3cff6bb3-b80e-5142-8287-d49dd3a80927', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 88: Ather Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ddbf40c5-2e28-561f-8eab-0ac5f0c247c0', '00000000-0000-0000-0000-000000000000', 'st88@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st88@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ddbf40c5-2e28-561f-8eab-0ac5f0c247c0', 'ddbf40c5-2e28-561f-8eab-0ac5f0c247c0', '{"sub": "ddbf40c5-2e28-561f-8eab-0ac5f0c247c0", "email": "st88@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ddbf40c5-2e28-561f-8eab-0ac5f0c247c0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ddbf40c5-2e28-561f-8eab-0ac5f0c247c0', 'admin', 'st88@boss.com', 'Admin Ather Charging Station', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8665f9bc-9eef-5e5b-8fc4-b267d300d552', 'ddbf40c5-2e28-561f-8eab-0ac5f0c247c0', 'Ather Charging Station', 'Ather Charging Station, Odisha, India', 21.225601, 81.6560523, 'India EV Network License', 'LIC-IN-ST88', 500.0, 3.3, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8665f9bc-9eef-5e5b-8fc4-b267d300d552';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('53f1c72f-c24a-5311-8626-d9e2dae54ceb', '8665f9bc-9eef-5e5b-8fc4-b267d300d552', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6babec69-3ef1-5605-9bb0-ff99407c88af', '8665f9bc-9eef-5e5b-8fc4-b267d300d552', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 89: Tata Power Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ef81e719-40d7-5c6c-bbbd-e55724991130', '00000000-0000-0000-0000-000000000000', 'st89@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st89@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ef81e719-40d7-5c6c-bbbd-e55724991130', 'ef81e719-40d7-5c6c-bbbd-e55724991130', '{"sub": "ef81e719-40d7-5c6c-bbbd-e55724991130", "email": "st89@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ef81e719-40d7-5c6c-bbbd-e55724991130')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ef81e719-40d7-5c6c-bbbd-e55724991130', 'admin', 'st89@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c8a08818-c5d2-5e4f-82d7-1b957117be9e', 'ef81e719-40d7-5c6c-bbbd-e55724991130', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.2553683, 81.6294531, 'India EV Network License', 'LIC-IN-ST89', 500.0, 60.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c8a08818-c5d2-5e4f-82d7-1b957117be9e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('26c167f8-dfa0-5a78-9006-fab24a8b1add', 'c8a08818-c5d2-5e4f-82d7-1b957117be9e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c61520bf-dd24-5341-8902-26c137f1da3b', 'c8a08818-c5d2-5e4f-82d7-1b957117be9e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 90: Ather Grid Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2e39fdc8-3b90-59f4-a9fa-998aa6d07fa5', '00000000-0000-0000-0000-000000000000', 'st90@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st90@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2e39fdc8-3b90-59f4-a9fa-998aa6d07fa5', '2e39fdc8-3b90-59f4-a9fa-998aa6d07fa5', '{"sub": "2e39fdc8-3b90-59f4-a9fa-998aa6d07fa5", "email": "st90@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2e39fdc8-3b90-59f4-a9fa-998aa6d07fa5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2e39fdc8-3b90-59f4-a9fa-998aa6d07fa5', 'admin', 'st90@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dd505c77-9295-5f7d-9a09-c01b0296353f', '2e39fdc8-3b90-59f4-a9fa-998aa6d07fa5', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.2402071, 81.6843083, 'India EV Network License', 'LIC-IN-ST90', 500.0, 3.3, true, 'Khordha', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dd505c77-9295-5f7d-9a09-c01b0296353f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('591f0b25-3a0d-533f-af26-a2070715e75c', 'dd505c77-9295-5f7d-9a09-c01b0296353f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('723ce335-5f61-50fc-bc0c-a473231ea3dc', 'dd505c77-9295-5f7d-9a09-c01b0296353f', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 91: Ola Charging Station (Khordha, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1e6cce8e-0eb5-594a-b24e-3df09a733d29', '00000000-0000-0000-0000-000000000000', 'st91@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st91@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1e6cce8e-0eb5-594a-b24e-3df09a733d29', '1e6cce8e-0eb5-594a-b24e-3df09a733d29', '{"sub": "1e6cce8e-0eb5-594a-b24e-3df09a733d29", "email": "st91@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1e6cce8e-0eb5-594a-b24e-3df09a733d29')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1e6cce8e-0eb5-594a-b24e-3df09a733d29', 'admin', 'st91@boss.com', 'Admin Ola Charging Station', 'Ola Charging Station', 'Ola Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9a4649a0-37a4-52f0-9bbf-7d66f13df091', '1e6cce8e-0eb5-594a-b24e-3df09a733d29', 'Ola Charging Station', 'Ola Charging Station, Odisha, India', 21.2395532, 81.6776714, 'India EV Network License', 'LIC-IN-ST91', 500.0, 3.3, true, 'Khordha', 'Odisha', 1, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9a4649a0-37a4-52f0-9bbf-7d66f13df091';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d3408df8-32e3-5d93-955f-1d46d5251136', '9a4649a0-37a4-52f0-9bbf-7d66f13df091', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 92: Bolt.Earth (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bdbd3d7a-1345-5c65-8088-fc79d5425c62', '00000000-0000-0000-0000-000000000000', 'st92@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st92@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bdbd3d7a-1345-5c65-8088-fc79d5425c62', 'bdbd3d7a-1345-5c65-8088-fc79d5425c62', '{"sub": "bdbd3d7a-1345-5c65-8088-fc79d5425c62", "email": "st92@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bdbd3d7a-1345-5c65-8088-fc79d5425c62')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bdbd3d7a-1345-5c65-8088-fc79d5425c62', 'admin', 'st92@boss.com', 'Admin Bolt.Earth', 'Bolt.Earth', 'Bolt.Earth, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c442c3f4-4b33-5cc5-baac-033116087368', 'bdbd3d7a-1345-5c65-8088-fc79d5425c62', 'Bolt.Earth', 'Bolt.Earth, Odisha, India', 21.0984032, 86.5266842, 'India EV Network License', 'LIC-IN-ST92', 500.0, 30.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c442c3f4-4b33-5cc5-baac-033116087368';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fc3c4a26-2bc7-513c-ad29-ec1659b8916f', 'c442c3f4-4b33-5cc5-baac-033116087368', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('65287232-d178-59e0-96b1-03be2183b95d', 'c442c3f4-4b33-5cc5-baac-033116087368', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 93: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('718cbfb0-236c-56b9-b4c5-5a85f3fd938c', '00000000-0000-0000-0000-000000000000', 'st93@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st93@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('718cbfb0-236c-56b9-b4c5-5a85f3fd938c', '718cbfb0-236c-56b9-b4c5-5a85f3fd938c', '{"sub": "718cbfb0-236c-56b9-b4c5-5a85f3fd938c", "email": "st93@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '718cbfb0-236c-56b9-b4c5-5a85f3fd938c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('718cbfb0-236c-56b9-b4c5-5a85f3fd938c', 'admin', 'st93@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('40a3b4cc-e5c0-5826-984b-b7a9da190081', '718cbfb0-236c-56b9-b4c5-5a85f3fd938c', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.071771, 86.49832, 'India EV Network License', 'LIC-IN-ST93', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '40a3b4cc-e5c0-5826-984b-b7a9da190081';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c479b584-944e-54fc-b825-5f2773d7ab07', '40a3b4cc-e5c0-5826-984b-b7a9da190081', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('50f0da42-0d24-5776-b491-267b14abb5ad', '40a3b4cc-e5c0-5826-984b-b7a9da190081', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 94: Jio-bp pulse Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4aeb7e4e-d676-5829-91f8-66fad2a3c2a7', '00000000-0000-0000-0000-000000000000', 'st94@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st94@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4aeb7e4e-d676-5829-91f8-66fad2a3c2a7', '4aeb7e4e-d676-5829-91f8-66fad2a3c2a7', '{"sub": "4aeb7e4e-d676-5829-91f8-66fad2a3c2a7", "email": "st94@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4aeb7e4e-d676-5829-91f8-66fad2a3c2a7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4aeb7e4e-d676-5829-91f8-66fad2a3c2a7', 'admin', 'st94@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c65506b6-ed26-521c-a77b-25c12fbfde46', '4aeb7e4e-d676-5829-91f8-66fad2a3c2a7', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 21.0702881, 86.4970845, 'India EV Network License', 'LIC-IN-ST94', 500.0, 60.0, true, 'Balasore', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c65506b6-ed26-521c-a77b-25c12fbfde46';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b3b7c607-2150-5d9e-867b-9e9f9adde7c9', 'c65506b6-ed26-521c-a77b-25c12fbfde46', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('020bb70a-7a29-586d-aaff-5aa5ddcea144', 'c65506b6-ed26-521c-a77b-25c12fbfde46', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e636b3ba-0400-5c8b-83b8-5693d588b911', 'c65506b6-ed26-521c-a77b-25c12fbfde46', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 95: Jio-bp pulse Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('50ab99b9-ba60-59d6-a8b7-662c6db354fc', '00000000-0000-0000-0000-000000000000', 'st95@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st95@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('50ab99b9-ba60-59d6-a8b7-662c6db354fc', '50ab99b9-ba60-59d6-a8b7-662c6db354fc', '{"sub": "50ab99b9-ba60-59d6-a8b7-662c6db354fc", "email": "st95@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '50ab99b9-ba60-59d6-a8b7-662c6db354fc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('50ab99b9-ba60-59d6-a8b7-662c6db354fc', 'admin', 'st95@boss.com', 'Admin Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('46ab674a-06f8-55fe-896a-a5d7cafd0b13', '50ab99b9-ba60-59d6-a8b7-662c6db354fc', 'Jio-bp pulse Charging Station', 'Jio-bp pulse Charging Station, Odisha, India', 20.9758779, 86.4012231, 'India EV Network License', 'LIC-IN-ST95', 500.0, 60.0, true, 'Ganjam', 'Odisha', 3, 'Unknown', '24 Hours (Fuel Station)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '46ab674a-06f8-55fe-896a-a5d7cafd0b13';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9fa30a2e-bb41-56ea-bf87-787d149f9a59', '46ab674a-06f8-55fe-896a-a5d7cafd0b13', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('54e9951b-605d-5f78-b5ad-4df72522e6ca', '46ab674a-06f8-55fe-896a-a5d7cafd0b13', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('06ad8a7c-179b-573e-a6f6-6ae3c19c0b0c', '46ab674a-06f8-55fe-896a-a5d7cafd0b13', 'Port C', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 96: Tata Power Charging Station (Cuttack, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cc1ff39b-a4e0-5b00-b1ce-6cd29c0b22d3', '00000000-0000-0000-0000-000000000000', 'st96@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st96@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cc1ff39b-a4e0-5b00-b1ce-6cd29c0b22d3', 'cc1ff39b-a4e0-5b00-b1ce-6cd29c0b22d3', '{"sub": "cc1ff39b-a4e0-5b00-b1ce-6cd29c0b22d3", "email": "st96@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cc1ff39b-a4e0-5b00-b1ce-6cd29c0b22d3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cc1ff39b-a4e0-5b00-b1ce-6cd29c0b22d3', 'admin', 'st96@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9d7a4324-ab0d-5f55-8b8d-3df7f2825b1a', 'cc1ff39b-a4e0-5b00-b1ce-6cd29c0b22d3', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 21.06981, 86.496256, 'India EV Network License', 'LIC-IN-ST96', 500.0, 60.0, true, 'Cuttack', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9d7a4324-ab0d-5f55-8b8d-3df7f2825b1a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c084172d-926e-5ba3-bbb4-51c99038c4b1', '9d7a4324-ab0d-5f55-8b8d-3df7f2825b1a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e2822186-f48f-5e5f-9759-3149eb1eda44', '9d7a4324-ab0d-5f55-8b8d-3df7f2825b1a', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 97: Ather Grid Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ed48e886-e699-5817-9ee4-ae14de10dd19', '00000000-0000-0000-0000-000000000000', 'st97@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st97@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ed48e886-e699-5817-9ee4-ae14de10dd19', 'ed48e886-e699-5817-9ee4-ae14de10dd19', '{"sub": "ed48e886-e699-5817-9ee4-ae14de10dd19", "email": "st97@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ed48e886-e699-5817-9ee4-ae14de10dd19')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ed48e886-e699-5817-9ee4-ae14de10dd19', 'admin', 'st97@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7bd8ed6d-abb5-546c-a702-19e2acd0cace', 'ed48e886-e699-5817-9ee4-ae14de10dd19', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 21.104305, 86.532646, 'India EV Network License', 'LIC-IN-ST97', 500.0, 3.3, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7bd8ed6d-abb5-546c-a702-19e2acd0cace';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b3bd0892-6ae2-574e-afcc-697361232d62', '7bd8ed6d-abb5-546c-a702-19e2acd0cace', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d9c3f351-8c44-50b6-85f2-093c36614853', '7bd8ed6d-abb5-546c-a702-19e2acd0cace', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 98: Ather Grid Charging Station (Balasore, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('34d38b0e-7340-508e-8a48-6fbf29a652e8', '00000000-0000-0000-0000-000000000000', 'st98@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st98@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('34d38b0e-7340-508e-8a48-6fbf29a652e8', '34d38b0e-7340-508e-8a48-6fbf29a652e8', '{"sub": "34d38b0e-7340-508e-8a48-6fbf29a652e8", "email": "st98@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '34d38b0e-7340-508e-8a48-6fbf29a652e8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('34d38b0e-7340-508e-8a48-6fbf29a652e8', 'admin', 'st98@boss.com', 'Admin Ather Grid Charging Station', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('07da8734-d1c5-5012-a67a-96f9605bebef', '34d38b0e-7340-508e-8a48-6fbf29a652e8', 'Ather Grid Charging Station', 'Ather Grid Charging Station, Odisha, India', 20.9362048, 86.1646624, 'India EV Network License', 'LIC-IN-ST98', 500.0, 3.3, true, 'Balasore', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '07da8734-d1c5-5012-a67a-96f9605bebef';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('75098e0f-44a9-567a-ba7c-c130ec2a440d', '07da8734-d1c5-5012-a67a-96f9605bebef', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('932159c5-b56c-51fc-bd9e-f5bbb9c049c8', '07da8734-d1c5-5012-a67a-96f9605bebef', 'Port B', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 99: Tata Power Charging Station (Sundargarh, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4ca900db-8f25-5e1a-a1d0-d6e9b1a41516', '00000000-0000-0000-0000-000000000000', 'st99@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st99@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4ca900db-8f25-5e1a-a1d0-d6e9b1a41516', '4ca900db-8f25-5e1a-a1d0-d6e9b1a41516', '{"sub": "4ca900db-8f25-5e1a-a1d0-d6e9b1a41516", "email": "st99@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4ca900db-8f25-5e1a-a1d0-d6e9b1a41516')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4ca900db-8f25-5e1a-a1d0-d6e9b1a41516', 'admin', 'st99@boss.com', 'Admin Tata Power Charging Station', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b4a70616-3607-5ea5-afc1-f8b92c81cd1b', '4ca900db-8f25-5e1a-a1d0-d6e9b1a41516', 'Tata Power Charging Station', 'Tata Power Charging Station, Odisha, India', 20.9189587, 86.2169684, 'India EV Network License', 'LIC-IN-ST99', 500.0, 60.0, true, 'Sundargarh', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b4a70616-3607-5ea5-afc1-f8b92c81cd1b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('106d77f8-0866-50ca-9df4-bced364317eb', 'b4a70616-3607-5ea5-afc1-f8b92c81cd1b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('48e0a70a-4a72-5030-96dd-81439dac991b', 'b4a70616-3607-5ea5-afc1-f8b92c81cd1b', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 100: Electric Vehicle Charging Station (Ganjam, Odisha)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('92e8d9ae-6d55-5a70-af1c-bbf5714f2e85', '00000000-0000-0000-0000-000000000000', 'st100@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st100@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('92e8d9ae-6d55-5a70-af1c-bbf5714f2e85', '92e8d9ae-6d55-5a70-af1c-bbf5714f2e85', '{"sub": "92e8d9ae-6d55-5a70-af1c-bbf5714f2e85", "email": "st100@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '92e8d9ae-6d55-5a70-af1c-bbf5714f2e85')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('92e8d9ae-6d55-5a70-af1c-bbf5714f2e85', 'admin', 'st100@boss.com', 'Admin Electric Vehicle Charging Station', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('99750f0f-09d2-5f1c-b33c-38d9e2a56abe', '92e8d9ae-6d55-5a70-af1c-bbf5714f2e85', 'Electric Vehicle Charging Station', 'Electric Vehicle Charging Station, Odisha, India', 20.9867242, 85.989196, 'India EV Network License', 'LIC-IN-ST100', 500.0, 25.0, true, 'Ganjam', 'Odisha', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '99750f0f-09d2-5f1c-b33c-38d9e2a56abe';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6c34b8cb-28de-51ec-a916-8b653d8f6909', '99750f0f-09d2-5f1c-b33c-38d9e2a56abe', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('25966258-0927-5ef2-add5-22a1f49ff265', '99750f0f-09d2-5f1c-b33c-38d9e2a56abe', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
