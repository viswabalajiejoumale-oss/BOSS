-- Seed Stations Part 10 (Stations 901 to 1000)
BEGIN;

-- Station 901: Thankamanys EV Fast Charging Station - ChargeMOD (Alappuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('da312452-f3e2-5125-8b78-e9820ce02b41', '00000000-0000-0000-0000-000000000000', 'st901@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st901@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('da312452-f3e2-5125-8b78-e9820ce02b41', 'da312452-f3e2-5125-8b78-e9820ce02b41', '{"sub": "da312452-f3e2-5125-8b78-e9820ce02b41", "email": "st901@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'da312452-f3e2-5125-8b78-e9820ce02b41')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('da312452-f3e2-5125-8b78-e9820ce02b41', 'admin', 'st901@boss.com', 'Admin Thankamanys EV Fast Charging Station - ChargeMOD', 'Thankamanys EV Fast Charging Station - ChargeMOD', 'Thankamanys EV Fast Charging Station - ChargeMOD, Alappuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1970807f-30e7-54ee-aba0-b26502c0755c', 'da312452-f3e2-5125-8b78-e9820ce02b41', 'Thankamanys EV Fast Charging Station - ChargeMOD', 'Thankamanys EV Fast Charging Station - ChargeMOD, Alappuzha, Kerala, India', 9.505147465, 76.32832598, 'India EV Network License', 'LIC-IN-ST901', 500.0, 30.0, true, 'Alappuzha', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1970807f-30e7-54ee-aba0-b26502c0755c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('38000bdb-2663-50db-919d-b56a44d88a4f', '1970807f-30e7-54ee-aba0-b26502c0755c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 902: Punnapra KSEB EVCS - ChargeMOD (Punnapra, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f49db1aa-a5e6-538f-83bd-cfb6b06a2774', '00000000-0000-0000-0000-000000000000', 'st902@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st902@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f49db1aa-a5e6-538f-83bd-cfb6b06a2774', 'f49db1aa-a5e6-538f-83bd-cfb6b06a2774', '{"sub": "f49db1aa-a5e6-538f-83bd-cfb6b06a2774", "email": "st902@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f49db1aa-a5e6-538f-83bd-cfb6b06a2774')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f49db1aa-a5e6-538f-83bd-cfb6b06a2774', 'admin', 'st902@boss.com', 'Admin Punnapra KSEB EVCS - ChargeMOD', 'Punnapra KSEB EVCS - ChargeMOD', 'Punnapra KSEB EVCS - ChargeMOD, Punnapra, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d4b9d147-e361-502d-aa0d-34a9a896d17b', 'f49db1aa-a5e6-538f-83bd-cfb6b06a2774', 'Punnapra KSEB EVCS - ChargeMOD', 'Punnapra KSEB EVCS - ChargeMOD, Punnapra, Kerala, India', 9.425616903, 76.34677264, 'India EV Network License', 'LIC-IN-ST902', 500.0, 30.0, true, 'Punnapra', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd4b9d147-e361-502d-aa0d-34a9a896d17b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ac809181-4d59-5005-9733-de55ee348970', 'd4b9d147-e361-502d-aa0d-34a9a896d17b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 903: Pathalil EVCS - Charge MOD (Nedumkunnam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d3405fa5-9001-5e68-92e6-a9385c240c67', '00000000-0000-0000-0000-000000000000', 'st903@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st903@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d3405fa5-9001-5e68-92e6-a9385c240c67', 'd3405fa5-9001-5e68-92e6-a9385c240c67', '{"sub": "d3405fa5-9001-5e68-92e6-a9385c240c67", "email": "st903@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd3405fa5-9001-5e68-92e6-a9385c240c67')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d3405fa5-9001-5e68-92e6-a9385c240c67', 'admin', 'st903@boss.com', 'Admin Pathalil EVCS - Charge MOD', 'Pathalil EVCS - Charge MOD', 'Pathalil EVCS - Charge MOD, Nedumkunnam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('435c0cf4-3b3c-5990-a673-e0ed37a63a11', 'd3405fa5-9001-5e68-92e6-a9385c240c67', 'Pathalil EVCS - Charge MOD', 'Pathalil EVCS - Charge MOD, Nedumkunnam, Kerala, India', 9.506164436, 76.65233361, 'India EV Network License', 'LIC-IN-ST903', 500.0, 30.0, true, 'Nedumkunnam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '435c0cf4-3b3c-5990-a673-e0ed37a63a11';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('20cf2f40-bd1b-5a25-a09b-5fc4748c3ad4', '435c0cf4-3b3c-5990-a673-e0ed37a63a11', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 904: JJ E Fills - ChargeMOD (Changanassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ccf65f9c-c449-5ce3-9c1f-1d8fcf8c63de', '00000000-0000-0000-0000-000000000000', 'st904@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st904@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ccf65f9c-c449-5ce3-9c1f-1d8fcf8c63de', 'ccf65f9c-c449-5ce3-9c1f-1d8fcf8c63de', '{"sub": "ccf65f9c-c449-5ce3-9c1f-1d8fcf8c63de", "email": "st904@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ccf65f9c-c449-5ce3-9c1f-1d8fcf8c63de')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ccf65f9c-c449-5ce3-9c1f-1d8fcf8c63de', 'admin', 'st904@boss.com', 'Admin JJ E Fills - ChargeMOD', 'JJ E Fills - ChargeMOD', 'JJ E Fills - ChargeMOD, Changanassery, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4fff4122-91cb-54c2-908b-f11487e4e2d7', 'ccf65f9c-c449-5ce3-9c1f-1d8fcf8c63de', 'JJ E Fills - ChargeMOD', 'JJ E Fills - ChargeMOD, Changanassery, Kerala, India', 9.452250326, 76.5472389, 'India EV Network License', 'LIC-IN-ST904', 500.0, 30.0, true, 'Changanassery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4fff4122-91cb-54c2-908b-f11487e4e2d7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7356b719-8146-5b6d-8c2c-769041a9cd2f', '4fff4122-91cb-54c2-908b-f11487e4e2d7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 905: Wealfro EV Hub (Thiruvalla, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('30f471cb-7a78-5094-8107-5341e47b5140', '00000000-0000-0000-0000-000000000000', 'st905@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st905@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('30f471cb-7a78-5094-8107-5341e47b5140', '30f471cb-7a78-5094-8107-5341e47b5140', '{"sub": "30f471cb-7a78-5094-8107-5341e47b5140", "email": "st905@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '30f471cb-7a78-5094-8107-5341e47b5140')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('30f471cb-7a78-5094-8107-5341e47b5140', 'admin', 'st905@boss.com', 'Admin Wealfro EV Hub', 'Wealfro EV Hub', 'Wealfro EV Hub, Thiruvalla, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('18c0836b-c23c-5a94-8789-ec152e34a600', '30f471cb-7a78-5094-8107-5341e47b5140', 'Wealfro EV Hub', 'Wealfro EV Hub, Thiruvalla, Kerala, India', 9.421076267, 76.54613417, 'India EV Network License', 'LIC-IN-ST905', 500.0, 7.4, true, 'Thiruvalla', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '18c0836b-c23c-5a94-8789-ec152e34a600';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('39edcc14-f09e-5be2-a5a0-c94b1833839b', '18c0836b-c23c-5a94-8789-ec152e34a600', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 906: Anand Hypermarket - ChargeMOD (Thiruvalla, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b796cd51-ab2d-5a7c-ad31-c03ed3996896', '00000000-0000-0000-0000-000000000000', 'st906@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st906@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b796cd51-ab2d-5a7c-ad31-c03ed3996896', 'b796cd51-ab2d-5a7c-ad31-c03ed3996896', '{"sub": "b796cd51-ab2d-5a7c-ad31-c03ed3996896", "email": "st906@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b796cd51-ab2d-5a7c-ad31-c03ed3996896')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b796cd51-ab2d-5a7c-ad31-c03ed3996896', 'admin', 'st906@boss.com', 'Admin Anand Hypermarket - ChargeMOD', 'Anand Hypermarket - ChargeMOD', 'Anand Hypermarket - ChargeMOD, Thiruvalla, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9eadc694-99be-5ed5-bcae-40a160419b79', 'b796cd51-ab2d-5a7c-ad31-c03ed3996896', 'Anand Hypermarket - ChargeMOD', 'Anand Hypermarket - ChargeMOD, Thiruvalla, Kerala, India', 9.373321982, 76.56481065, 'India EV Network License', 'LIC-IN-ST906', 500.0, 30.0, true, 'Thiruvalla', 'Kerala', 1, 'ChargeMod (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9eadc694-99be-5ed5-bcae-40a160419b79';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b803afb2-1ef3-5b2e-b338-8191c28abb01', '9eadc694-99be-5ed5-bcae-40a160419b79', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 907: Iongrid EV Spark - ChargeMOD (Edathwa, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('82d803e0-c694-588f-855c-88ca0bd34487', '00000000-0000-0000-0000-000000000000', 'st907@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st907@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('82d803e0-c694-588f-855c-88ca0bd34487', '82d803e0-c694-588f-855c-88ca0bd34487', '{"sub": "82d803e0-c694-588f-855c-88ca0bd34487", "email": "st907@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '82d803e0-c694-588f-855c-88ca0bd34487')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('82d803e0-c694-588f-855c-88ca0bd34487', 'admin', 'st907@boss.com', 'Admin Iongrid EV Spark - ChargeMOD', 'Iongrid EV Spark - ChargeMOD', 'Iongrid EV Spark - ChargeMOD, Edathwa, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0aec1e7a-8839-5a44-b660-c8d8b1ff5386', '82d803e0-c694-588f-855c-88ca0bd34487', 'Iongrid EV Spark - ChargeMOD', 'Iongrid EV Spark - ChargeMOD, Edathwa, Kerala, India', 9.36752588, 76.49951806, 'India EV Network License', 'LIC-IN-ST907', 500.0, 30.0, true, 'Edathwa', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0aec1e7a-8839-5a44-b660-c8d8b1ff5386';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('90c5d5ad-7da5-55bc-bde4-7418cc5aef72', '0aec1e7a-8839-5a44-b660-c8d8b1ff5386', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 908: V Charge Hub - ChargeMOD (Karuvatta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ce776d1b-b765-5771-a4d1-10fc3a5b8bd9', '00000000-0000-0000-0000-000000000000', 'st908@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st908@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ce776d1b-b765-5771-a4d1-10fc3a5b8bd9', 'ce776d1b-b765-5771-a4d1-10fc3a5b8bd9', '{"sub": "ce776d1b-b765-5771-a4d1-10fc3a5b8bd9", "email": "st908@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ce776d1b-b765-5771-a4d1-10fc3a5b8bd9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ce776d1b-b765-5771-a4d1-10fc3a5b8bd9', 'admin', 'st908@boss.com', 'Admin V Charge Hub - ChargeMOD', 'V Charge Hub - ChargeMOD', 'V Charge Hub - ChargeMOD, Karuvatta, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('882f12b3-dc8a-5650-9b05-6707b55e6823', 'ce776d1b-b765-5771-a4d1-10fc3a5b8bd9', 'V Charge Hub - ChargeMOD', 'V Charge Hub - ChargeMOD, Karuvatta, Kerala, India', 9.314250283, 76.42910773, 'India EV Network License', 'LIC-IN-ST908', 500.0, 30.0, true, 'Karuvatta', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '882f12b3-dc8a-5650-9b05-6707b55e6823';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('cf12d9aa-ebd3-5c1c-802e-c54cae47a40f', '882f12b3-dc8a-5650-9b05-6707b55e6823', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 909: Quick Charge EVCS - ChargeMOD (Karuvatta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('555d2f28-7f2f-5feb-81fa-4f8682464e5e', '00000000-0000-0000-0000-000000000000', 'st909@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st909@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('555d2f28-7f2f-5feb-81fa-4f8682464e5e', '555d2f28-7f2f-5feb-81fa-4f8682464e5e', '{"sub": "555d2f28-7f2f-5feb-81fa-4f8682464e5e", "email": "st909@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '555d2f28-7f2f-5feb-81fa-4f8682464e5e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('555d2f28-7f2f-5feb-81fa-4f8682464e5e', 'admin', 'st909@boss.com', 'Admin Quick Charge EVCS - ChargeMOD', 'Quick Charge EVCS - ChargeMOD', 'Quick Charge EVCS - ChargeMOD, Karuvatta, Kerala, India', 500.0, 7, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fe7191b3-a6be-5774-9ba8-73b7759f53a2', '555d2f28-7f2f-5feb-81fa-4f8682464e5e', 'Quick Charge EVCS - ChargeMOD', 'Quick Charge EVCS - ChargeMOD, Karuvatta, Kerala, India', 9.315750049, 76.4012212, 'India EV Network License', 'LIC-IN-ST909', 500.0, 30.0, true, 'Karuvatta', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fe7191b3-a6be-5774-9ba8-73b7759f53a2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dc8c7644-9424-52c6-b32a-1976d7debad0', 'fe7191b3-a6be-5774-9ba8-73b7759f53a2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 910: Phills Hub EVCS - ChargeMOD (Pathanamthitta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('70e6aa63-56f5-5042-a069-34c3077bc36d', '00000000-0000-0000-0000-000000000000', 'st910@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st910@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('70e6aa63-56f5-5042-a069-34c3077bc36d', '70e6aa63-56f5-5042-a069-34c3077bc36d', '{"sub": "70e6aa63-56f5-5042-a069-34c3077bc36d", "email": "st910@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '70e6aa63-56f5-5042-a069-34c3077bc36d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('70e6aa63-56f5-5042-a069-34c3077bc36d', 'admin', 'st910@boss.com', 'Admin Phills Hub EVCS - ChargeMOD', 'Phills Hub EVCS - ChargeMOD', 'Phills Hub EVCS - ChargeMOD, Pathanamthitta, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7a76f1b9-45ac-5ab5-9a62-27dae6aa1710', '70e6aa63-56f5-5042-a069-34c3077bc36d', 'Phills Hub EVCS - ChargeMOD', 'Phills Hub EVCS - ChargeMOD, Pathanamthitta, Kerala, India', 9.316652369, 76.80090227, 'India EV Network License', 'LIC-IN-ST910', 500.0, 30.0, true, 'Pathanamthitta', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7a76f1b9-45ac-5ab5-9a62-27dae6aa1710';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0456cd0d-dcc7-5b6a-ae40-fbe85021e64c', '7a76f1b9-45ac-5ab5-9a62-27dae6aa1710', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 911: Pamba KSEB EVCS - ChargeMOD (Pamba, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a6321ebd-746c-52aa-8010-314e6f18e05b', '00000000-0000-0000-0000-000000000000', 'st911@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st911@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a6321ebd-746c-52aa-8010-314e6f18e05b', 'a6321ebd-746c-52aa-8010-314e6f18e05b', '{"sub": "a6321ebd-746c-52aa-8010-314e6f18e05b", "email": "st911@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a6321ebd-746c-52aa-8010-314e6f18e05b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a6321ebd-746c-52aa-8010-314e6f18e05b', 'admin', 'st911@boss.com', 'Admin Pamba KSEB EVCS - ChargeMOD', 'Pamba KSEB EVCS - ChargeMOD', 'Pamba KSEB EVCS - ChargeMOD, Pamba, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ecca9dbb-24e0-59c8-878e-146ddf590af1', 'a6321ebd-746c-52aa-8010-314e6f18e05b', 'Pamba KSEB EVCS - ChargeMOD', 'Pamba KSEB EVCS - ChargeMOD, Pamba, Kerala, India', 9.412378119, 77.06996856, 'India EV Network License', 'LIC-IN-ST911', 500.0, 30.0, true, 'Pamba', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ecca9dbb-24e0-59c8-878e-146ddf590af1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a7b93793-f071-5671-a928-7d7f6d0c94d6', 'ecca9dbb-24e0-59c8-878e-146ddf590af1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 912: EVOK Pathanamthitta - ChargeMOD (Pathanamthitta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('75b6435e-9942-5391-b569-36c8c4cf3598', '00000000-0000-0000-0000-000000000000', 'st912@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st912@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('75b6435e-9942-5391-b569-36c8c4cf3598', '75b6435e-9942-5391-b569-36c8c4cf3598', '{"sub": "75b6435e-9942-5391-b569-36c8c4cf3598", "email": "st912@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '75b6435e-9942-5391-b569-36c8c4cf3598')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('75b6435e-9942-5391-b569-36c8c4cf3598', 'admin', 'st912@boss.com', 'Admin EVOK Pathanamthitta - ChargeMOD', 'EVOK Pathanamthitta - ChargeMOD', 'EVOK Pathanamthitta - ChargeMOD, Pathanamthitta, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c1c8198f-14b1-54ca-aae5-9548fde2a178', '75b6435e-9942-5391-b569-36c8c4cf3598', 'EVOK Pathanamthitta - ChargeMOD', 'EVOK Pathanamthitta - ChargeMOD, Pathanamthitta, Kerala, India', 9.306222052, 76.80366578, 'India EV Network License', 'LIC-IN-ST912', 500.0, 30.0, true, 'Pathanamthitta', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c1c8198f-14b1-54ca-aae5-9548fde2a178';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6897290d-7bd0-5632-991b-83121b7858e4', 'c1c8198f-14b1-54ca-aae5-9548fde2a178', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 913: Green Plug EVCS - ChargeMOD (Chengannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('72435602-5331-5d86-8fc7-58f190bcedf4', '00000000-0000-0000-0000-000000000000', 'st913@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st913@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('72435602-5331-5d86-8fc7-58f190bcedf4', '72435602-5331-5d86-8fc7-58f190bcedf4', '{"sub": "72435602-5331-5d86-8fc7-58f190bcedf4", "email": "st913@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '72435602-5331-5d86-8fc7-58f190bcedf4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('72435602-5331-5d86-8fc7-58f190bcedf4', 'admin', 'st913@boss.com', 'Admin Green Plug EVCS - ChargeMOD', 'Green Plug EVCS - ChargeMOD', 'Green Plug EVCS - ChargeMOD, Chengannur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('acf267bf-2333-5315-885e-858db94d0f0c', '72435602-5331-5d86-8fc7-58f190bcedf4', 'Green Plug EVCS - ChargeMOD', 'Green Plug EVCS - ChargeMOD, Chengannur, Kerala, India', 9.271844657, 76.65508789, 'India EV Network License', 'LIC-IN-ST913', 500.0, 30.0, true, 'Chengannur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'acf267bf-2333-5315-885e-858db94d0f0c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('16b372d7-86bf-50f9-b1e1-1253f820a04a', 'acf267bf-2333-5315-885e-858db94d0f0c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 914: PTC Arcade - ChargeMOD (Chengannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b5e24aa1-fb10-5833-b276-e1448982cedf', '00000000-0000-0000-0000-000000000000', 'st914@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st914@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b5e24aa1-fb10-5833-b276-e1448982cedf', 'b5e24aa1-fb10-5833-b276-e1448982cedf', '{"sub": "b5e24aa1-fb10-5833-b276-e1448982cedf", "email": "st914@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b5e24aa1-fb10-5833-b276-e1448982cedf')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b5e24aa1-fb10-5833-b276-e1448982cedf', 'admin', 'st914@boss.com', 'Admin PTC Arcade - ChargeMOD', 'PTC Arcade - ChargeMOD', 'PTC Arcade - ChargeMOD, Chengannur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('66d7b25e-cd04-51bc-a82f-38a827af1f98', 'b5e24aa1-fb10-5833-b276-e1448982cedf', 'PTC Arcade - ChargeMOD', 'PTC Arcade - ChargeMOD, Chengannur, Kerala, India', 9.301293402, 76.63077878, 'India EV Network License', 'LIC-IN-ST914', 500.0, 30.0, true, 'Chengannur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '66d7b25e-cd04-51bc-a82f-38a827af1f98';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2c7d848d-a0a1-5a67-9353-f6b842109427', '66d7b25e-cd04-51bc-a82f-38a827af1f98', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 915: Muzhangodayil EVCS - ChargeMOD (Harippad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e6831e48-29f8-5d51-a275-ca6a2e3c888a', '00000000-0000-0000-0000-000000000000', 'st915@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st915@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e6831e48-29f8-5d51-a275-ca6a2e3c888a', 'e6831e48-29f8-5d51-a275-ca6a2e3c888a', '{"sub": "e6831e48-29f8-5d51-a275-ca6a2e3c888a", "email": "st915@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e6831e48-29f8-5d51-a275-ca6a2e3c888a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e6831e48-29f8-5d51-a275-ca6a2e3c888a', 'admin', 'st915@boss.com', 'Admin Muzhangodayil EVCS - ChargeMOD', 'Muzhangodayil EVCS - ChargeMOD', 'Muzhangodayil EVCS - ChargeMOD, Harippad, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d152bac2-7554-598d-9867-cd41ca647bcc', 'e6831e48-29f8-5d51-a275-ca6a2e3c888a', 'Muzhangodayil EVCS - ChargeMOD', 'Muzhangodayil EVCS - ChargeMOD, Harippad, India', 9.251673853, 76.48723264, 'India EV Network License', 'LIC-IN-ST915', 500.0, 30.0, true, 'Harippad', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd152bac2-7554-598d-9867-cd41ca647bcc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('84aa6a8a-90b1-5255-b7bc-0a2e58343ff3', 'd152bac2-7554-598d-9867-cd41ca647bcc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 916: Askar EV - ChargeMOD (Mavelikkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2300a53f-9c8a-56a8-b457-ecce9516b3e3', '00000000-0000-0000-0000-000000000000', 'st916@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st916@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2300a53f-9c8a-56a8-b457-ecce9516b3e3', '2300a53f-9c8a-56a8-b457-ecce9516b3e3', '{"sub": "2300a53f-9c8a-56a8-b457-ecce9516b3e3", "email": "st916@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2300a53f-9c8a-56a8-b457-ecce9516b3e3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2300a53f-9c8a-56a8-b457-ecce9516b3e3', 'admin', 'st916@boss.com', 'Admin Askar EV - ChargeMOD', 'Askar EV - ChargeMOD', 'Askar EV - ChargeMOD, Mavelikkara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c5a32c48-60c7-5d6b-94d3-f281098e2e7b', '2300a53f-9c8a-56a8-b457-ecce9516b3e3', 'Askar EV - ChargeMOD', 'Askar EV - ChargeMOD, Mavelikkara, Kerala, India', 9.23250558, 76.53790278, 'India EV Network License', 'LIC-IN-ST916', 500.0, 30.0, true, 'Mavelikkara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c5a32c48-60c7-5d6b-94d3-f281098e2e7b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('040f0ff5-0b71-503e-a43b-36c0451e3bc8', 'c5a32c48-60c7-5d6b-94d3-f281098e2e7b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 917: Anaswara Jewellers EVCS - ChargeMOD (Konni, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('61b29bfe-0e69-559f-81b2-6a9e1b2e9ba2', '00000000-0000-0000-0000-000000000000', 'st917@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st917@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('61b29bfe-0e69-559f-81b2-6a9e1b2e9ba2', '61b29bfe-0e69-559f-81b2-6a9e1b2e9ba2', '{"sub": "61b29bfe-0e69-559f-81b2-6a9e1b2e9ba2", "email": "st917@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '61b29bfe-0e69-559f-81b2-6a9e1b2e9ba2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('61b29bfe-0e69-559f-81b2-6a9e1b2e9ba2', 'admin', 'st917@boss.com', 'Admin Anaswara Jewellers EVCS - ChargeMOD', 'Anaswara Jewellers EVCS - ChargeMOD', 'Anaswara Jewellers EVCS - ChargeMOD, Konni, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ee593044-f378-550f-82f7-61f913666c19', '61b29bfe-0e69-559f-81b2-6a9e1b2e9ba2', 'Anaswara Jewellers EVCS - ChargeMOD', 'Anaswara Jewellers EVCS - ChargeMOD, Konni, Kerala, India', 9.229128424, 76.84839128, 'India EV Network License', 'LIC-IN-ST917', 500.0, 30.0, true, 'Konni', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ee593044-f378-550f-82f7-61f913666c19';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fe67c635-4282-56dd-b83d-fd7e827db133', 'ee593044-f378-550f-82f7-61f913666c19', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 918: EQ Power Buzz EVCS - ChargeMOD (Paranthal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4ad2ece6-e747-523c-8968-240eefdbd6e1', '00000000-0000-0000-0000-000000000000', 'st918@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st918@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4ad2ece6-e747-523c-8968-240eefdbd6e1', '4ad2ece6-e747-523c-8968-240eefdbd6e1', '{"sub": "4ad2ece6-e747-523c-8968-240eefdbd6e1", "email": "st918@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4ad2ece6-e747-523c-8968-240eefdbd6e1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4ad2ece6-e747-523c-8968-240eefdbd6e1', 'admin', 'st918@boss.com', 'Admin EQ Power Buzz EVCS - ChargeMOD', 'EQ Power Buzz EVCS - ChargeMOD', 'EQ Power Buzz EVCS - ChargeMOD, Paranthal, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cf0ab678-abd2-552a-8bbd-3b88f9433a25', '4ad2ece6-e747-523c-8968-240eefdbd6e1', 'EQ Power Buzz EVCS - ChargeMOD', 'EQ Power Buzz EVCS - ChargeMOD, Paranthal, Kerala, India', 9.187183741, 76.7092955, 'India EV Network License', 'LIC-IN-ST918', 500.0, 30.0, true, 'Paranthal', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cf0ab678-abd2-552a-8bbd-3b88f9433a25';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('995c721c-464b-50e7-8258-cdce90095932', 'cf0ab678-abd2-552a-8bbd-3b88f9433a25', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 919: Adhithya Green Power - ChargeMOD (Paranthal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('35a389a4-5f0a-556c-9a0b-80c405333a76', '00000000-0000-0000-0000-000000000000', 'st919@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st919@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('35a389a4-5f0a-556c-9a0b-80c405333a76', '35a389a4-5f0a-556c-9a0b-80c405333a76', '{"sub": "35a389a4-5f0a-556c-9a0b-80c405333a76", "email": "st919@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '35a389a4-5f0a-556c-9a0b-80c405333a76')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('35a389a4-5f0a-556c-9a0b-80c405333a76', 'admin', 'st919@boss.com', 'Admin Adhithya Green Power - ChargeMOD', 'Adhithya Green Power - ChargeMOD', 'Adhithya Green Power - ChargeMOD, Paranthal, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('254c7a19-af11-5a18-ada6-d6b513829718', '35a389a4-5f0a-556c-9a0b-80c405333a76', 'Adhithya Green Power - ChargeMOD', 'Adhithya Green Power - ChargeMOD, Paranthal, Kerala, India', 9.180307946, 76.70896676, 'India EV Network License', 'LIC-IN-ST919', 500.0, 30.0, true, 'Paranthal', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '254c7a19-af11-5a18-ada6-d6b513829718';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('11de448b-40d0-5ca2-a021-9972ecf2188f', '254c7a19-af11-5a18-ada6-d6b513829718', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 920: SR Auto Zone - ChargeMOD (Adoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4770bb40-179d-571a-9842-ffe1f04caa7c', '00000000-0000-0000-0000-000000000000', 'st920@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st920@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4770bb40-179d-571a-9842-ffe1f04caa7c', '4770bb40-179d-571a-9842-ffe1f04caa7c', '{"sub": "4770bb40-179d-571a-9842-ffe1f04caa7c", "email": "st920@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4770bb40-179d-571a-9842-ffe1f04caa7c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4770bb40-179d-571a-9842-ffe1f04caa7c', 'admin', 'st920@boss.com', 'Admin SR Auto Zone - ChargeMOD', 'SR Auto Zone - ChargeMOD', 'SR Auto Zone - ChargeMOD, Adoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e41f99f9-0764-5f49-a1fa-fa1674d21f10', '4770bb40-179d-571a-9842-ffe1f04caa7c', 'SR Auto Zone - ChargeMOD', 'SR Auto Zone - ChargeMOD, Adoor, Kerala, India', 9.162499405, 76.71051678, 'India EV Network License', 'LIC-IN-ST920', 500.0, 30.0, true, 'Adoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e41f99f9-0764-5f49-a1fa-fa1674d21f10';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fb19d9d3-eda8-5b2c-af1e-41b1d317c485', 'e41f99f9-0764-5f49-a1fa-fa1674d21f10', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 921: Artemis EV Super Charger - ChargeMOD (Mavelikkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6b03b19d-1b3c-5d76-a971-d3c105c7d5ca', '00000000-0000-0000-0000-000000000000', 'st921@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st921@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6b03b19d-1b3c-5d76-a971-d3c105c7d5ca', '6b03b19d-1b3c-5d76-a971-d3c105c7d5ca', '{"sub": "6b03b19d-1b3c-5d76-a971-d3c105c7d5ca", "email": "st921@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6b03b19d-1b3c-5d76-a971-d3c105c7d5ca')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6b03b19d-1b3c-5d76-a971-d3c105c7d5ca', 'admin', 'st921@boss.com', 'Admin Artemis EV Super Charger - ChargeMOD', 'Artemis EV Super Charger - ChargeMOD', 'Artemis EV Super Charger - ChargeMOD, Mavelikkara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3528261e-50fd-534c-82cf-603031578fb8', '6b03b19d-1b3c-5d76-a971-d3c105c7d5ca', 'Artemis EV Super Charger - ChargeMOD', 'Artemis EV Super Charger - ChargeMOD, Mavelikkara, Kerala, India', 9.198881109, 76.6001765, 'India EV Network License', 'LIC-IN-ST921', 500.0, 30.0, true, 'Mavelikkara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3528261e-50fd-534c-82cf-603031578fb8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e8dca0a5-be5d-59d9-8c83-d8b69f3e17c0', '3528261e-50fd-534c-82cf-603031578fb8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 922: Royale Regency (EVOK) - ChargeMOD (Ochira, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ee19de47-dada-57e4-bdfb-1c0173a8ad47', '00000000-0000-0000-0000-000000000000', 'st922@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st922@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ee19de47-dada-57e4-bdfb-1c0173a8ad47', 'ee19de47-dada-57e4-bdfb-1c0173a8ad47', '{"sub": "ee19de47-dada-57e4-bdfb-1c0173a8ad47", "email": "st922@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ee19de47-dada-57e4-bdfb-1c0173a8ad47')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ee19de47-dada-57e4-bdfb-1c0173a8ad47', 'admin', 'st922@boss.com', 'Admin Royale Regency (EVOK) - ChargeMOD', 'Royale Regency (EVOK) - ChargeMOD', 'Royale Regency (EVOK) - ChargeMOD, Ochira, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('492ae7c6-2ec9-5f43-95a1-86269d3fd4b4', 'ee19de47-dada-57e4-bdfb-1c0173a8ad47', 'Royale Regency (EVOK) - ChargeMOD', 'Royale Regency (EVOK) - ChargeMOD, Ochira, Kerala, India', 9.130625595, 76.51429714, 'India EV Network License', 'LIC-IN-ST922', 500.0, 30.0, true, 'Ochira', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '492ae7c6-2ec9-5f43-95a1-86269d3fd4b4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9c7bfcb5-4271-5132-8999-2182d9a5358e', '492ae7c6-2ec9-5f43-95a1-86269d3fd4b4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 923: Delight Launch Cafe - ChargeMOD (Kottarakkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('01df55ce-a8cf-5590-959e-7ec169703f11', '00000000-0000-0000-0000-000000000000', 'st923@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st923@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('01df55ce-a8cf-5590-959e-7ec169703f11', '01df55ce-a8cf-5590-959e-7ec169703f11', '{"sub": "01df55ce-a8cf-5590-959e-7ec169703f11", "email": "st923@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '01df55ce-a8cf-5590-959e-7ec169703f11')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('01df55ce-a8cf-5590-959e-7ec169703f11', 'admin', 'st923@boss.com', 'Admin Delight Launch Cafe - ChargeMOD', 'Delight Launch Cafe - ChargeMOD', 'Delight Launch Cafe - ChargeMOD, Kottarakkara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e3477af3-aa23-5efe-8da0-5c4491f3ce41', '01df55ce-a8cf-5590-959e-7ec169703f11', 'Delight Launch Cafe - ChargeMOD', 'Delight Launch Cafe - ChargeMOD, Kottarakkara, Kerala, India', 9.059350297, 76.76600397, 'India EV Network License', 'LIC-IN-ST923', 500.0, 30.0, true, 'Kottarakkara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e3477af3-aa23-5efe-8da0-5c4491f3ce41';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('253ec8ee-0b3a-562c-aa05-7fe1aa7862c4', 'e3477af3-aa23-5efe-8da0-5c4491f3ce41', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 924: Ente Veedu Interior (EVOK) - ChargeMOD (Kottarakkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b881990b-cd45-558e-8a93-f931844c2026', '00000000-0000-0000-0000-000000000000', 'st924@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st924@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b881990b-cd45-558e-8a93-f931844c2026', 'b881990b-cd45-558e-8a93-f931844c2026', '{"sub": "b881990b-cd45-558e-8a93-f931844c2026", "email": "st924@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b881990b-cd45-558e-8a93-f931844c2026')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b881990b-cd45-558e-8a93-f931844c2026', 'admin', 'st924@boss.com', 'Admin Ente Veedu Interior (EVOK) - ChargeMOD', 'Ente Veedu Interior (EVOK) - ChargeMOD', 'Ente Veedu Interior (EVOK) - ChargeMOD, Kottarakkara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1508b4c6-e987-5b31-8341-4e5201a3f8bf', 'b881990b-cd45-558e-8a93-f931844c2026', 'Ente Veedu Interior (EVOK) - ChargeMOD', 'Ente Veedu Interior (EVOK) - ChargeMOD, Kottarakkara, Kerala, India', 9.03035187, 76.78219777, 'India EV Network License', 'LIC-IN-ST924', 500.0, 30.0, true, 'Kottarakkara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1508b4c6-e987-5b31-8341-4e5201a3f8bf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7e9278e3-32b4-50ef-b69c-fccb3e9235eb', '1508b4c6-e987-5b31-8341-4e5201a3f8bf', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 925: Thenmala EVOK - ChargeMOD (Thenmala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cc3dfedc-592e-56f7-b837-fe6b060cc4b6', '00000000-0000-0000-0000-000000000000', 'st925@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st925@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cc3dfedc-592e-56f7-b837-fe6b060cc4b6', 'cc3dfedc-592e-56f7-b837-fe6b060cc4b6', '{"sub": "cc3dfedc-592e-56f7-b837-fe6b060cc4b6", "email": "st925@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cc3dfedc-592e-56f7-b837-fe6b060cc4b6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cc3dfedc-592e-56f7-b837-fe6b060cc4b6', 'admin', 'st925@boss.com', 'Admin Thenmala EVOK - ChargeMOD', 'Thenmala EVOK - ChargeMOD', 'Thenmala EVOK - ChargeMOD, Thenmala, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7a7be2c4-fdff-5883-9af4-eabe1164bf7d', 'cc3dfedc-592e-56f7-b837-fe6b060cc4b6', 'Thenmala EVOK - ChargeMOD', 'Thenmala EVOK - ChargeMOD, Thenmala, Kerala, India', 8.966824196, 77.05562963, 'India EV Network License', 'LIC-IN-ST925', 500.0, 30.0, true, 'Thenmala', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7a7be2c4-fdff-5883-9af4-eabe1164bf7d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dce62046-4e99-5bbf-886c-94c6b7c57540', '7a7be2c4-fdff-5883-9af4-eabe1164bf7d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 926: Plug N Pay EVCS - ChargeMOD (Odanavattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7eb21fe0-0b55-5f05-b5f1-76b13318851e', '00000000-0000-0000-0000-000000000000', 'st926@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st926@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7eb21fe0-0b55-5f05-b5f1-76b13318851e', '7eb21fe0-0b55-5f05-b5f1-76b13318851e', '{"sub": "7eb21fe0-0b55-5f05-b5f1-76b13318851e", "email": "st926@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7eb21fe0-0b55-5f05-b5f1-76b13318851e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7eb21fe0-0b55-5f05-b5f1-76b13318851e', 'admin', 'st926@boss.com', 'Admin Plug N Pay EVCS - ChargeMOD', 'Plug N Pay EVCS - ChargeMOD', 'Plug N Pay EVCS - ChargeMOD, Odanavattom, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0f87ea4a-fd17-53fc-b176-b0d39bea9a4e', '7eb21fe0-0b55-5f05-b5f1-76b13318851e', 'Plug N Pay EVCS - ChargeMOD', 'Plug N Pay EVCS - ChargeMOD, Odanavattom, Kerala, India', 8.93504521, 76.77241548, 'India EV Network License', 'LIC-IN-ST926', 500.0, 30.0, true, 'Odanavattom', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0f87ea4a-fd17-53fc-b176-b0d39bea9a4e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('936e75bb-5b5c-559b-8dd3-681265ab8d57', '0f87ea4a-fd17-53fc-b176-b0d39bea9a4e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 927: Kundara KSEB - ChargeMOD (Kundara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d522aa43-2bee-5120-b782-d85c1f76009b', '00000000-0000-0000-0000-000000000000', 'st927@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st927@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d522aa43-2bee-5120-b782-d85c1f76009b', 'd522aa43-2bee-5120-b782-d85c1f76009b', '{"sub": "d522aa43-2bee-5120-b782-d85c1f76009b", "email": "st927@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd522aa43-2bee-5120-b782-d85c1f76009b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d522aa43-2bee-5120-b782-d85c1f76009b', 'admin', 'st927@boss.com', 'Admin Kundara KSEB - ChargeMOD', 'Kundara KSEB - ChargeMOD', 'Kundara KSEB - ChargeMOD, Kundara, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ea201a9e-700d-51a7-a797-d021a0c8c5cd', 'd522aa43-2bee-5120-b782-d85c1f76009b', 'Kundara KSEB - ChargeMOD', 'Kundara KSEB - ChargeMOD, Kundara, Kerala, India', 8.957185858, 76.67133653, 'India EV Network License', 'LIC-IN-ST927', 500.0, 30.0, true, 'Kundara', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ea201a9e-700d-51a7-a797-d021a0c8c5cd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d54627b0-6628-5287-a7a3-c944a605d683', 'ea201a9e-700d-51a7-a797-d021a0c8c5cd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 928: Sree Suprabhatham - ChargeMOD (Kollam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dcf8cc4b-da63-522a-b1ba-1b40f1147f87', '00000000-0000-0000-0000-000000000000', 'st928@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st928@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dcf8cc4b-da63-522a-b1ba-1b40f1147f87', 'dcf8cc4b-da63-522a-b1ba-1b40f1147f87', '{"sub": "dcf8cc4b-da63-522a-b1ba-1b40f1147f87", "email": "st928@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dcf8cc4b-da63-522a-b1ba-1b40f1147f87')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dcf8cc4b-da63-522a-b1ba-1b40f1147f87', 'admin', 'st928@boss.com', 'Admin Sree Suprabhatham - ChargeMOD', 'Sree Suprabhatham - ChargeMOD', 'Sree Suprabhatham - ChargeMOD, Kollam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('499eacaa-c1b7-5135-9c7e-47d92cf75d72', 'dcf8cc4b-da63-522a-b1ba-1b40f1147f87', 'Sree Suprabhatham - ChargeMOD', 'Sree Suprabhatham - ChargeMOD, Kollam, Kerala, India', 8.926969524, 76.55280315, 'India EV Network License', 'LIC-IN-ST928', 500.0, 30.0, true, 'Kollam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '499eacaa-c1b7-5135-9c7e-47d92cf75d72';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bf8cf369-cea0-5872-9a11-32d470c83c6c', '499eacaa-c1b7-5135-9c7e-47d92cf75d72', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 929: Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD (Chinnakkada, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4f3099e2-88cd-52d6-b63d-eb7f78482983', '00000000-0000-0000-0000-000000000000', 'st929@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st929@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4f3099e2-88cd-52d6-b63d-eb7f78482983', '4f3099e2-88cd-52d6-b63d-eb7f78482983', '{"sub": "4f3099e2-88cd-52d6-b63d-eb7f78482983", "email": "st929@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4f3099e2-88cd-52d6-b63d-eb7f78482983')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4f3099e2-88cd-52d6-b63d-eb7f78482983', 'admin', 'st929@boss.com', 'Admin Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD', 'Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD', 'Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD, Chinnakkada, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dfef8821-24fa-5c3d-a659-cb5c706f5020', '4f3099e2-88cd-52d6-b63d-eb7f78482983', 'Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD', 'Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD, Chinnakkada, Kerala, India', 8.887577414, 76.58843661, 'India EV Network License', 'LIC-IN-ST929', 500.0, 30.0, true, 'Chinnakkada', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dfef8821-24fa-5c3d-a659-cb5c706f5020';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fed0c908-09b0-5121-a6b4-cf87f0feb6d3', 'dfef8821-24fa-5c3d-a659-cb5c706f5020', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 930: VOX Xpress Wash (EVOK) - ChargeMOD (Kollam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('68d47398-54a3-5223-a6ee-832317d003f4', '00000000-0000-0000-0000-000000000000', 'st930@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st930@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('68d47398-54a3-5223-a6ee-832317d003f4', '68d47398-54a3-5223-a6ee-832317d003f4', '{"sub": "68d47398-54a3-5223-a6ee-832317d003f4", "email": "st930@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '68d47398-54a3-5223-a6ee-832317d003f4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('68d47398-54a3-5223-a6ee-832317d003f4', 'admin', 'st930@boss.com', 'Admin VOX Xpress Wash (EVOK) - ChargeMOD', 'VOX Xpress Wash (EVOK) - ChargeMOD', 'VOX Xpress Wash (EVOK) - ChargeMOD, Kollam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f761aed4-d426-5098-a4b8-231ac8e5b8aa', '68d47398-54a3-5223-a6ee-832317d003f4', 'VOX Xpress Wash (EVOK) - ChargeMOD', 'VOX Xpress Wash (EVOK) - ChargeMOD, Kollam, Kerala, India', 8.873868016, 76.64100893, 'India EV Network License', 'LIC-IN-ST930', 500.0, 30.0, true, 'Kollam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f761aed4-d426-5098-a4b8-231ac8e5b8aa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9fd06a90-79e6-5bbb-ba9f-8f5b08a7be14', 'f761aed4-d426-5098-a4b8-231ac8e5b8aa', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 931: EVOK Charging Stattion - ChargeMOD (Parippalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f11f215a-676a-54af-902e-a408f1af37ba', '00000000-0000-0000-0000-000000000000', 'st931@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st931@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f11f215a-676a-54af-902e-a408f1af37ba', 'f11f215a-676a-54af-902e-a408f1af37ba', '{"sub": "f11f215a-676a-54af-902e-a408f1af37ba", "email": "st931@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f11f215a-676a-54af-902e-a408f1af37ba')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f11f215a-676a-54af-902e-a408f1af37ba', 'admin', 'st931@boss.com', 'Admin EVOK Charging Stattion - ChargeMOD', 'EVOK Charging Stattion - ChargeMOD', 'EVOK Charging Stattion - ChargeMOD, Parippalli, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('96d90a38-8762-52f7-8d2d-c58780b03938', 'f11f215a-676a-54af-902e-a408f1af37ba', 'EVOK Charging Stattion - ChargeMOD', 'EVOK Charging Stattion - ChargeMOD, Parippalli, Kerala, India', 8.819673868, 76.75363731, 'India EV Network License', 'LIC-IN-ST931', 500.0, 30.0, true, 'Parippalli', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '96d90a38-8762-52f7-8d2d-c58780b03938';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d83ed652-ece0-5bca-9dc4-fc24fd65dbea', '96d90a38-8762-52f7-8d2d-c58780b03938', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 932: Plug N Pay EVCS (Kottarakkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d703c7cb-b470-52aa-8468-7185d0e3c695', '00000000-0000-0000-0000-000000000000', 'st932@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st932@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d703c7cb-b470-52aa-8468-7185d0e3c695', 'd703c7cb-b470-52aa-8468-7185d0e3c695', '{"sub": "d703c7cb-b470-52aa-8468-7185d0e3c695", "email": "st932@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd703c7cb-b470-52aa-8468-7185d0e3c695')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d703c7cb-b470-52aa-8468-7185d0e3c695', 'admin', 'st932@boss.com', 'Admin Plug N Pay EVCS', 'Plug N Pay EVCS', 'Plug N Pay EVCS, Kottarakkara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e69274b9-e471-57fd-bb85-a708ced09469', 'd703c7cb-b470-52aa-8468-7185d0e3c695', 'Plug N Pay EVCS', 'Plug N Pay EVCS, Kottarakkara, Kerala, India', 8.935694035, 76.85104921, 'India EV Network License', 'LIC-IN-ST932', 500.0, 7.4, true, 'Kottarakkara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e69274b9-e471-57fd-bb85-a708ced09469';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7371f55b-3045-5855-b2db-3c0e2b304e0a', 'e69274b9-e471-57fd-bb85-a708ced09469', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 933: Kottiyam KSEB EVCS - ChargeMOD (Kottiyam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a5dafb1c-35fe-5866-bf92-106b9339d020', '00000000-0000-0000-0000-000000000000', 'st933@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st933@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a5dafb1c-35fe-5866-bf92-106b9339d020', 'a5dafb1c-35fe-5866-bf92-106b9339d020', '{"sub": "a5dafb1c-35fe-5866-bf92-106b9339d020", "email": "st933@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a5dafb1c-35fe-5866-bf92-106b9339d020')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a5dafb1c-35fe-5866-bf92-106b9339d020', 'admin', 'st933@boss.com', 'Admin Kottiyam KSEB EVCS - ChargeMOD', 'Kottiyam KSEB EVCS - ChargeMOD', 'Kottiyam KSEB EVCS - ChargeMOD, Kottiyam, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('72e74104-d369-5cfc-9427-2b3181b3bbc0', 'a5dafb1c-35fe-5866-bf92-106b9339d020', 'Kottiyam KSEB EVCS - ChargeMOD', 'Kottiyam KSEB EVCS - ChargeMOD, Kottiyam, Kerala, India', 8.866370095, 76.66887781, 'India EV Network License', 'LIC-IN-ST933', 500.0, 30.0, true, 'Kottiyam', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '72e74104-d369-5cfc-9427-2b3181b3bbc0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c43bc3fb-69e5-5eaf-b4c0-678ee9dbe6ad', '72e74104-d369-5cfc-9427-2b3181b3bbc0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 934: Avananchery KSEB EVCS - ChargeMOD (Attingal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c3abe28a-ce11-5eaa-b526-5e069fc00321', '00000000-0000-0000-0000-000000000000', 'st934@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st934@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c3abe28a-ce11-5eaa-b526-5e069fc00321', 'c3abe28a-ce11-5eaa-b526-5e069fc00321', '{"sub": "c3abe28a-ce11-5eaa-b526-5e069fc00321", "email": "st934@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c3abe28a-ce11-5eaa-b526-5e069fc00321')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c3abe28a-ce11-5eaa-b526-5e069fc00321', 'admin', 'st934@boss.com', 'Admin Avananchery KSEB EVCS - ChargeMOD', 'Avananchery KSEB EVCS - ChargeMOD', 'Avananchery KSEB EVCS - ChargeMOD, Attingal, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b0624167-6fce-5e4e-a28e-0517f80a0c16', 'c3abe28a-ce11-5eaa-b526-5e069fc00321', 'Avananchery KSEB EVCS - ChargeMOD', 'Avananchery KSEB EVCS - ChargeMOD, Attingal, Kerala, India', 8.690987764, 76.84839779, 'India EV Network License', 'LIC-IN-ST934', 500.0, 30.0, true, 'Attingal', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b0624167-6fce-5e4e-a28e-0517f80a0c16';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d96860ac-7544-5a96-a45b-a57ddb96b73a', 'b0624167-6fce-5e4e-a28e-0517f80a0c16', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 935: Paruthippara KSEB EVCS - ChargeMOD (Paruthippara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d5ccebf4-9ab4-5437-9f3b-46aa999175fa', '00000000-0000-0000-0000-000000000000', 'st935@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st935@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d5ccebf4-9ab4-5437-9f3b-46aa999175fa', 'd5ccebf4-9ab4-5437-9f3b-46aa999175fa', '{"sub": "d5ccebf4-9ab4-5437-9f3b-46aa999175fa", "email": "st935@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd5ccebf4-9ab4-5437-9f3b-46aa999175fa')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d5ccebf4-9ab4-5437-9f3b-46aa999175fa', 'admin', 'st935@boss.com', 'Admin Paruthippara KSEB EVCS - ChargeMOD', 'Paruthippara KSEB EVCS - ChargeMOD', 'Paruthippara KSEB EVCS - ChargeMOD, Paruthippara, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a62dd8ee-9c53-514f-ae30-fdcfbaa18bd0', 'd5ccebf4-9ab4-5437-9f3b-46aa999175fa', 'Paruthippara KSEB EVCS - ChargeMOD', 'Paruthippara KSEB EVCS - ChargeMOD, Paruthippara, Kerala, India', 8.534933841, 76.94198426, 'India EV Network License', 'LIC-IN-ST935', 500.0, 30.0, true, 'Paruthippara', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a62dd8ee-9c53-514f-ae30-fdcfbaa18bd0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1f201390-f562-5df9-ad76-868f5a8c3ac7', 'a62dd8ee-9c53-514f-ae30-fdcfbaa18bd0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 936: Pattom KSEB EVCS - ChargeMOD (Pattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('93cb9c38-1ebd-5853-b2d5-a66ee03c74a3', '00000000-0000-0000-0000-000000000000', 'st936@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st936@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('93cb9c38-1ebd-5853-b2d5-a66ee03c74a3', '93cb9c38-1ebd-5853-b2d5-a66ee03c74a3', '{"sub": "93cb9c38-1ebd-5853-b2d5-a66ee03c74a3", "email": "st936@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '93cb9c38-1ebd-5853-b2d5-a66ee03c74a3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('93cb9c38-1ebd-5853-b2d5-a66ee03c74a3', 'admin', 'st936@boss.com', 'Admin Pattom KSEB EVCS - ChargeMOD', 'Pattom KSEB EVCS - ChargeMOD', 'Pattom KSEB EVCS - ChargeMOD, Pattom, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('103e96f9-9e30-5d97-bf2e-651fc8d00897', '93cb9c38-1ebd-5853-b2d5-a66ee03c74a3', 'Pattom KSEB EVCS - ChargeMOD', 'Pattom KSEB EVCS - ChargeMOD, Pattom, Kerala, India', 8.516753527, 76.93968818, 'India EV Network License', 'LIC-IN-ST936', 500.0, 30.0, true, 'Pattom', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '103e96f9-9e30-5d97-bf2e-651fc8d00897';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a6fee8b5-e3be-5f37-bd87-a63d76449e55', '103e96f9-9e30-5d97-bf2e-651fc8d00897', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 937: ANERT EESL - Pinarayi Park (Kannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('82c18b5a-1295-5738-9128-0aac9fc29b8a', '00000000-0000-0000-0000-000000000000', 'st937@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st937@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('82c18b5a-1295-5738-9128-0aac9fc29b8a', '82c18b5a-1295-5738-9128-0aac9fc29b8a', '{"sub": "82c18b5a-1295-5738-9128-0aac9fc29b8a", "email": "st937@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '82c18b5a-1295-5738-9128-0aac9fc29b8a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('82c18b5a-1295-5738-9128-0aac9fc29b8a', 'admin', 'st937@boss.com', 'Admin ANERT EESL - Pinarayi Park', 'ANERT EESL - Pinarayi Park', 'ANERT EESL - Pinarayi Park, Kannur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a0f40561-125b-588e-bfe8-6cf4c96efcde', '82c18b5a-1295-5738-9128-0aac9fc29b8a', 'ANERT EESL - Pinarayi Park', 'ANERT EESL - Pinarayi Park, Kannur, Kerala, India', 11.7952321, 75.4902189, 'India EV Network License', 'LIC-IN-ST937', 500.0, 15.0, true, 'Kannur', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a0f40561-125b-588e-bfe8-6cf4c96efcde';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5fc640e9-351f-5690-868c-b6344ee604b0', 'a0f40561-125b-588e-bfe8-6cf4c96efcde', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8cea8152-0127-5c9d-acaf-b563fd90000a', 'a0f40561-125b-588e-bfe8-6cf4c96efcde', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 938: ANERT EESL - Aahar Restaurant Vadakara (Vadakara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('40132d67-2917-5e35-86ee-53ec1d527d35', '00000000-0000-0000-0000-000000000000', 'st938@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st938@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('40132d67-2917-5e35-86ee-53ec1d527d35', '40132d67-2917-5e35-86ee-53ec1d527d35', '{"sub": "40132d67-2917-5e35-86ee-53ec1d527d35", "email": "st938@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '40132d67-2917-5e35-86ee-53ec1d527d35')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('40132d67-2917-5e35-86ee-53ec1d527d35', 'admin', 'st938@boss.com', 'Admin ANERT EESL - Aahar Restaurant Vadakara', 'ANERT EESL - Aahar Restaurant Vadakara', 'ANERT EESL - Aahar Restaurant Vadakara, Vadakara, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9a30863b-8722-5389-a0f7-cfe67e030ab2', '40132d67-2917-5e35-86ee-53ec1d527d35', 'ANERT EESL - Aahar Restaurant Vadakara', 'ANERT EESL - Aahar Restaurant Vadakara, Vadakara, Kerala, India', 11.58636489, 75.59322034, 'India EV Network License', 'LIC-IN-ST938', 500.0, 15.0, true, 'Vadakara', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9a30863b-8722-5389-a0f7-cfe67e030ab2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3af923f1-8fbb-54b2-8b1c-b9e96c3f3082', '9a30863b-8722-5389-a0f7-cfe67e030ab2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bb4e6b0e-ddc6-52e5-9653-f1c783b5368d', '9a30863b-8722-5389-a0f7-cfe67e030ab2', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 939: ANERT EESL - Moosakkutti Memorial Bus Stand (Perinthalmanna, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c1559778-eb06-5fb3-a982-eaf07aef7aec', '00000000-0000-0000-0000-000000000000', 'st939@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st939@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c1559778-eb06-5fb3-a982-eaf07aef7aec', 'c1559778-eb06-5fb3-a982-eaf07aef7aec', '{"sub": "c1559778-eb06-5fb3-a982-eaf07aef7aec", "email": "st939@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c1559778-eb06-5fb3-a982-eaf07aef7aec')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c1559778-eb06-5fb3-a982-eaf07aef7aec', 'admin', 'st939@boss.com', 'Admin ANERT EESL - Moosakkutti Memorial Bus Stand', 'ANERT EESL - Moosakkutti Memorial Bus Stand', 'ANERT EESL - Moosakkutti Memorial Bus Stand, Perinthalmanna, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ae44f497-b4d6-5527-ac04-d93b53dc2315', 'c1559778-eb06-5fb3-a982-eaf07aef7aec', 'ANERT EESL - Moosakkutti Memorial Bus Stand', 'ANERT EESL - Moosakkutti Memorial Bus Stand, Perinthalmanna, Kerala, India', 10.97506931, 76.22228328, 'India EV Network License', 'LIC-IN-ST939', 500.0, 15.0, true, 'Perinthalmanna', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ae44f497-b4d6-5527-ac04-d93b53dc2315';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0f3877b0-fe37-543b-ab1b-f18f4c758cd1', 'ae44f497-b4d6-5527-ac04-d93b53dc2315', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5938da1f-7e02-5e55-a7de-b07d806d44fa', 'ae44f497-b4d6-5527-ac04-d93b53dc2315', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 940: ANERT EESL - Kanjirappuzha Garden (Mannarkkad, Keral)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e88b72ba-77cd-5bd1-9ccb-5d65d5692559', '00000000-0000-0000-0000-000000000000', 'st940@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st940@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e88b72ba-77cd-5bd1-9ccb-5d65d5692559', 'e88b72ba-77cd-5bd1-9ccb-5d65d5692559', '{"sub": "e88b72ba-77cd-5bd1-9ccb-5d65d5692559", "email": "st940@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e88b72ba-77cd-5bd1-9ccb-5d65d5692559')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e88b72ba-77cd-5bd1-9ccb-5d65d5692559', 'admin', 'st940@boss.com', 'Admin ANERT EESL - Kanjirappuzha Garden', 'ANERT EESL - Kanjirappuzha Garden', 'ANERT EESL - Kanjirappuzha Garden, Mannarkkad, Keral, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('87c4d209-a82b-5af7-8c44-ceb4eeda1f6d', 'e88b72ba-77cd-5bd1-9ccb-5d65d5692559', 'ANERT EESL - Kanjirappuzha Garden', 'ANERT EESL - Kanjirappuzha Garden, Mannarkkad, Keral, India', 10.98925926, 76.53701214, 'India EV Network License', 'LIC-IN-ST940', 500.0, 15.0, true, 'Mannarkkad', 'Keral', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '87c4d209-a82b-5af7-8c44-ceb4eeda1f6d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('790f54ce-5f8e-530f-9e2d-4effef63b03c', '87c4d209-a82b-5af7-8c44-ceb4eeda1f6d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5b3e8d77-2aa7-5f1c-9611-acb7656b1208', '87c4d209-a82b-5af7-8c44-ceb4eeda1f6d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 941: ANERT EESL - KTDC Aahar Restaurant (Kayamkulam, Lerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4b813d15-732c-5f35-a99e-be856269e06f', '00000000-0000-0000-0000-000000000000', 'st941@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st941@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4b813d15-732c-5f35-a99e-be856269e06f', '4b813d15-732c-5f35-a99e-be856269e06f', '{"sub": "4b813d15-732c-5f35-a99e-be856269e06f", "email": "st941@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4b813d15-732c-5f35-a99e-be856269e06f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4b813d15-732c-5f35-a99e-be856269e06f', 'admin', 'st941@boss.com', 'Admin ANERT EESL - KTDC Aahar Restaurant', 'ANERT EESL - KTDC Aahar Restaurant', 'ANERT EESL - KTDC Aahar Restaurant, Kayamkulam, Lerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('09c131b8-5ca3-5b4d-b262-199976a0b19c', '4b813d15-732c-5f35-a99e-be856269e06f', 'ANERT EESL - KTDC Aahar Restaurant', 'ANERT EESL - KTDC Aahar Restaurant, Kayamkulam, Lerala, India', 9.149021955, 76.51291823, 'India EV Network License', 'LIC-IN-ST941', 500.0, 15.0, true, 'Kayamkulam', 'Lerala', 2, 'EESL (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '09c131b8-5ca3-5b4d-b262-199976a0b19c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c4a5ac9e-3fed-5775-b219-6f97ae5b743c', '09c131b8-5ca3-5b4d-b262-199976a0b19c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7c336fa6-a749-5bc5-a48a-1b68c8cfeabb', '09c131b8-5ca3-5b4d-b262-199976a0b19c', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 942: ANERT EESL - Kulappulli Bus Stand (Shornur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('01f5e75a-82ce-5f37-8d4a-47570c0fc82e', '00000000-0000-0000-0000-000000000000', 'st942@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st942@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('01f5e75a-82ce-5f37-8d4a-47570c0fc82e', '01f5e75a-82ce-5f37-8d4a-47570c0fc82e', '{"sub": "01f5e75a-82ce-5f37-8d4a-47570c0fc82e", "email": "st942@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '01f5e75a-82ce-5f37-8d4a-47570c0fc82e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('01f5e75a-82ce-5f37-8d4a-47570c0fc82e', 'admin', 'st942@boss.com', 'Admin ANERT EESL - Kulappulli Bus Stand', 'ANERT EESL - Kulappulli Bus Stand', 'ANERT EESL - Kulappulli Bus Stand, Shornur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5907efc6-063a-5486-9d8c-fb693f30119e', '01f5e75a-82ce-5f37-8d4a-47570c0fc82e', 'ANERT EESL - Kulappulli Bus Stand', 'ANERT EESL - Kulappulli Bus Stand, Shornur, Kerala, India', 10.78101644, 76.27832766, 'India EV Network License', 'LIC-IN-ST942', 500.0, 15.0, true, 'Shornur', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5907efc6-063a-5486-9d8c-fb693f30119e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9b2348bc-253c-5b92-a5e7-5166b2401689', '5907efc6-063a-5486-9d8c-fb693f30119e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e7614b2f-bdb8-5a98-827a-ecda79e86537', '5907efc6-063a-5486-9d8c-fb693f30119e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 943: ANERT EESL - KILA Thrissur (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6057f5d1-01a1-5f1f-87f5-0e2769bb7d8b', '00000000-0000-0000-0000-000000000000', 'st943@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st943@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6057f5d1-01a1-5f1f-87f5-0e2769bb7d8b', '6057f5d1-01a1-5f1f-87f5-0e2769bb7d8b', '{"sub": "6057f5d1-01a1-5f1f-87f5-0e2769bb7d8b", "email": "st943@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6057f5d1-01a1-5f1f-87f5-0e2769bb7d8b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6057f5d1-01a1-5f1f-87f5-0e2769bb7d8b', 'admin', 'st943@boss.com', 'Admin ANERT EESL - KILA Thrissur', 'ANERT EESL - KILA Thrissur', 'ANERT EESL - KILA Thrissur, Thrissur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('25d42283-f49a-5f32-b3ec-c6fb42886723', '6057f5d1-01a1-5f1f-87f5-0e2769bb7d8b', 'ANERT EESL - KILA Thrissur', 'ANERT EESL - KILA Thrissur, Thrissur, Kerala, India', 10.60158189, 76.21488231, 'India EV Network License', 'LIC-IN-ST943', 500.0, 15.0, true, 'Thrissur', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '25d42283-f49a-5f32-b3ec-c6fb42886723';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6ae422df-31b6-5284-9c22-31e8bdb495b4', '25d42283-f49a-5f32-b3ec-c6fb42886723', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bae0b820-483f-5d69-b9b0-2f1600baaa52', '25d42283-f49a-5f32-b3ec-c6fb42886723', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 944: ANERT EESL - Chittur Thathamangalam Minicipality (Palakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5ecf7ea0-9f2a-5307-aa11-bf7dce3e03bd', '00000000-0000-0000-0000-000000000000', 'st944@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st944@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5ecf7ea0-9f2a-5307-aa11-bf7dce3e03bd', '5ecf7ea0-9f2a-5307-aa11-bf7dce3e03bd', '{"sub": "5ecf7ea0-9f2a-5307-aa11-bf7dce3e03bd", "email": "st944@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5ecf7ea0-9f2a-5307-aa11-bf7dce3e03bd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5ecf7ea0-9f2a-5307-aa11-bf7dce3e03bd', 'admin', 'st944@boss.com', 'Admin ANERT EESL - Chittur Thathamangalam Minicipality', 'ANERT EESL - Chittur Thathamangalam Minicipality', 'ANERT EESL - Chittur Thathamangalam Minicipality, Palakkad, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4b7ed57e-91dc-52e7-959a-000d441bec14', '5ecf7ea0-9f2a-5307-aa11-bf7dce3e03bd', 'ANERT EESL - Chittur Thathamangalam Minicipality', 'ANERT EESL - Chittur Thathamangalam Minicipality, Palakkad, Kerala, India', 10.69295155, 76.72626208, 'India EV Network License', 'LIC-IN-ST944', 500.0, 15.0, true, 'Palakkad', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4b7ed57e-91dc-52e7-959a-000d441bec14';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6f20a4d1-4cd1-52fd-ba4c-f6d46a86b474', '4b7ed57e-91dc-52e7-959a-000d441bec14', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c8d54242-6d69-5b25-86a0-a44fcac1cc04', '4b7ed57e-91dc-52e7-959a-000d441bec14', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 945: ANERT EESL - DTPC Idukki Park (Idukki, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2287511c-9d60-5f60-a6a7-60b3bb967d30', '00000000-0000-0000-0000-000000000000', 'st945@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st945@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2287511c-9d60-5f60-a6a7-60b3bb967d30', '2287511c-9d60-5f60-a6a7-60b3bb967d30', '{"sub": "2287511c-9d60-5f60-a6a7-60b3bb967d30", "email": "st945@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2287511c-9d60-5f60-a6a7-60b3bb967d30')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2287511c-9d60-5f60-a6a7-60b3bb967d30', 'admin', 'st945@boss.com', 'Admin ANERT EESL - DTPC Idukki Park', 'ANERT EESL - DTPC Idukki Park', 'ANERT EESL - DTPC Idukki Park, Idukki, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1b2f6de6-c3d2-5c55-af0e-48c473665e49', '2287511c-9d60-5f60-a6a7-60b3bb967d30', 'ANERT EESL - DTPC Idukki Park', 'ANERT EESL - DTPC Idukki Park, Idukki, Kerala, India', 9.849056509, 76.97740371, 'India EV Network License', 'LIC-IN-ST945', 500.0, 15.0, true, 'Idukki', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1b2f6de6-c3d2-5c55-af0e-48c473665e49';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ec871be2-1467-5e18-b8ff-74d0e9ab854b', '1b2f6de6-c3d2-5c55-af0e-48c473665e49', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('345681f4-d84b-5e54-a6c9-43ae5b53208e', '1b2f6de6-c3d2-5c55-af0e-48c473665e49', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 946: ANERT EESL - Ernakulam (Ernakulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e158c061-233d-5f71-be10-933ca57b1ed7', '00000000-0000-0000-0000-000000000000', 'st946@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st946@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e158c061-233d-5f71-be10-933ca57b1ed7', 'e158c061-233d-5f71-be10-933ca57b1ed7', '{"sub": "e158c061-233d-5f71-be10-933ca57b1ed7", "email": "st946@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e158c061-233d-5f71-be10-933ca57b1ed7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e158c061-233d-5f71-be10-933ca57b1ed7', 'admin', 'st946@boss.com', 'Admin ANERT EESL - Ernakulam', 'ANERT EESL - Ernakulam', 'ANERT EESL - Ernakulam, Ernakulam, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('490fa002-168c-514c-a007-be131f5aa8b9', 'e158c061-233d-5f71-be10-933ca57b1ed7', 'ANERT EESL - Ernakulam', 'ANERT EESL - Ernakulam, Ernakulam, Kerala, India', 9.976988501, 76.27781052, 'India EV Network License', 'LIC-IN-ST946', 500.0, 15.0, true, 'Ernakulam', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '490fa002-168c-514c-a007-be131f5aa8b9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('96f285f8-66a6-5b87-875c-6e1b494e44a0', '490fa002-168c-514c-a007-be131f5aa8b9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6332140f-f821-5fef-9889-b6b9b9cb92bc', '490fa002-168c-514c-a007-be131f5aa8b9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 947: ANERT EESL - Autokast (Cherthala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0a1b9c8f-fc95-564a-b9af-c4ff48a9032a', '00000000-0000-0000-0000-000000000000', 'st947@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st947@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0a1b9c8f-fc95-564a-b9af-c4ff48a9032a', '0a1b9c8f-fc95-564a-b9af-c4ff48a9032a', '{"sub": "0a1b9c8f-fc95-564a-b9af-c4ff48a9032a", "email": "st947@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0a1b9c8f-fc95-564a-b9af-c4ff48a9032a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0a1b9c8f-fc95-564a-b9af-c4ff48a9032a', 'admin', 'st947@boss.com', 'Admin ANERT EESL - Autokast', 'ANERT EESL - Autokast', 'ANERT EESL - Autokast, Cherthala, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c3439eb4-2114-517b-9f1f-f41940a49065', '0a1b9c8f-fc95-564a-b9af-c4ff48a9032a', 'ANERT EESL - Autokast', 'ANERT EESL - Autokast, Cherthala, Kerala, India', 9.63370013, 76.33372245, 'India EV Network License', 'LIC-IN-ST947', 500.0, 15.0, true, 'Cherthala', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c3439eb4-2114-517b-9f1f-f41940a49065';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c6f318ea-d1d4-5454-9088-aedf113b7436', 'c3439eb4-2114-517b-9f1f-f41940a49065', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1bc170b8-c959-566c-b6d3-d34353b5e1d9', 'c3439eb4-2114-517b-9f1f-f41940a49065', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 948: ANERT EESL Milma Diary Plant - EESL (Pathanamthitta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('538f279c-8942-5751-aa52-ff65ded2298b', '00000000-0000-0000-0000-000000000000', 'st948@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st948@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('538f279c-8942-5751-aa52-ff65ded2298b', '538f279c-8942-5751-aa52-ff65ded2298b', '{"sub": "538f279c-8942-5751-aa52-ff65ded2298b", "email": "st948@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '538f279c-8942-5751-aa52-ff65ded2298b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('538f279c-8942-5751-aa52-ff65ded2298b', 'admin', 'st948@boss.com', 'Admin ANERT EESL Milma Diary Plant - EESL', 'ANERT EESL Milma Diary Plant - EESL', 'ANERT EESL Milma Diary Plant - EESL, Pathanamthitta, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7ac472ac-f270-5159-893e-aca403e5b78d', '538f279c-8942-5751-aa52-ff65ded2298b', 'ANERT EESL Milma Diary Plant - EESL', 'ANERT EESL Milma Diary Plant - EESL, Pathanamthitta, Kerala, India', 9.218788692, 76.74875398, 'India EV Network License', 'LIC-IN-ST948', 500.0, 15.0, true, 'Pathanamthitta', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7ac472ac-f270-5159-893e-aca403e5b78d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e2751784-c4ff-5ac8-bcef-e392856355ad', '7ac472ac-f270-5159-893e-aca403e5b78d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('100f50e0-1f27-54af-8c47-5fe8ee8b9619', '7ac472ac-f270-5159-893e-aca403e5b78d', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 949: ANERT - EESL Sangamukham - EESL (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5ed97f46-4b5b-54d0-8294-6ab4f264a20a', '00000000-0000-0000-0000-000000000000', 'st949@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st949@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5ed97f46-4b5b-54d0-8294-6ab4f264a20a', '5ed97f46-4b5b-54d0-8294-6ab4f264a20a', '{"sub": "5ed97f46-4b5b-54d0-8294-6ab4f264a20a", "email": "st949@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5ed97f46-4b5b-54d0-8294-6ab4f264a20a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5ed97f46-4b5b-54d0-8294-6ab4f264a20a', 'admin', 'st949@boss.com', 'Admin ANERT - EESL Sangamukham - EESL', 'ANERT - EESL Sangamukham - EESL', 'ANERT - EESL Sangamukham - EESL, Thiruvananthapuram, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('db84c77c-de9a-5291-ac3d-248b72e8b439', '5ed97f46-4b5b-54d0-8294-6ab4f264a20a', 'ANERT - EESL Sangamukham - EESL', 'ANERT - EESL Sangamukham - EESL, Thiruvananthapuram, Kerala, India', 8.481014702, 76.91264314, 'India EV Network License', 'LIC-IN-ST949', 500.0, 15.0, true, 'Thiruvananthapuram', 'Kerala', 2, 'EESL (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'db84c77c-de9a-5291-ac3d-248b72e8b439';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('aca58a60-7d69-5733-98aa-e2cc2bcb571f', 'db84c77c-de9a-5291-ac3d-248b72e8b439', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0d98acb9-8449-5a04-879c-0fb8f1d36fc8', 'db84c77c-de9a-5291-ac3d-248b72e8b439', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 950: Apco Hyundai - ChargeZone (Chengala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7b37f1fa-dd0b-5ec5-8b8c-114e8e97fbf5', '00000000-0000-0000-0000-000000000000', 'st950@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st950@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7b37f1fa-dd0b-5ec5-8b8c-114e8e97fbf5', '7b37f1fa-dd0b-5ec5-8b8c-114e8e97fbf5', '{"sub": "7b37f1fa-dd0b-5ec5-8b8c-114e8e97fbf5", "email": "st950@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7b37f1fa-dd0b-5ec5-8b8c-114e8e97fbf5')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7b37f1fa-dd0b-5ec5-8b8c-114e8e97fbf5', 'admin', 'st950@boss.com', 'Admin Apco Hyundai - ChargeZone', 'Apco Hyundai - ChargeZone', 'Apco Hyundai - ChargeZone, Chengala, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('48cf9087-f6c7-5f87-9c27-c00fe1598727', '7b37f1fa-dd0b-5ec5-8b8c-114e8e97fbf5', 'Apco Hyundai - ChargeZone', 'Apco Hyundai - ChargeZone, Chengala, Kerala, India', 12.50891488, 75.04478426, 'India EV Network License', 'LIC-IN-ST950', 500.0, 60.0, true, 'Chengala', 'Kerala', 2, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '48cf9087-f6c7-5f87-9c27-c00fe1598727';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8b124ee9-ce5d-590d-8b53-6abaa13e36ff', '48cf9087-f6c7-5f87-9c27-c00fe1598727', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('86c00c88-b51e-5585-b3bc-994730dae1df', '48cf9087-f6c7-5f87-9c27-c00fe1598727', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 951: Thiruvangoor EV Fast Charging Station - ChargeMOD (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('36874246-f51f-5dcb-bd37-6dd3d1ecd20b', '00000000-0000-0000-0000-000000000000', 'st951@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st951@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('36874246-f51f-5dcb-bd37-6dd3d1ecd20b', '36874246-f51f-5dcb-bd37-6dd3d1ecd20b', '{"sub": "36874246-f51f-5dcb-bd37-6dd3d1ecd20b", "email": "st951@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '36874246-f51f-5dcb-bd37-6dd3d1ecd20b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('36874246-f51f-5dcb-bd37-6dd3d1ecd20b', 'admin', 'st951@boss.com', 'Admin Thiruvangoor EV Fast Charging Station - ChargeMOD', 'Thiruvangoor EV Fast Charging Station - ChargeMOD', 'Thiruvangoor EV Fast Charging Station - ChargeMOD, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c92102d8-d29f-55ac-8f77-6db54f74eaff', '36874246-f51f-5dcb-bd37-6dd3d1ecd20b', 'Thiruvangoor EV Fast Charging Station - ChargeMOD', 'Thiruvangoor EV Fast Charging Station - ChargeMOD, Kozhikode, Kerala, India', 11.38282724, 75.7359365, 'India EV Network License', 'LIC-IN-ST951', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c92102d8-d29f-55ac-8f77-6db54f74eaff';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bebfc1a0-1fcd-5c24-ba63-6d4c1351f875', 'c92102d8-d29f-55ac-8f77-6db54f74eaff', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 952: MB#Bridgeway Motors (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e87e0a4b-3703-565b-873e-9fe841f5aec9', '00000000-0000-0000-0000-000000000000', 'st952@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st952@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e87e0a4b-3703-565b-873e-9fe841f5aec9', 'e87e0a4b-3703-565b-873e-9fe841f5aec9', '{"sub": "e87e0a4b-3703-565b-873e-9fe841f5aec9", "email": "st952@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e87e0a4b-3703-565b-873e-9fe841f5aec9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e87e0a4b-3703-565b-873e-9fe841f5aec9', 'admin', 'st952@boss.com', 'Admin MB#Bridgeway Motors', 'MB#Bridgeway Motors', 'MB#Bridgeway Motors, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1018becc-29ec-5091-806d-4e8b0348e514', 'e87e0a4b-3703-565b-873e-9fe841f5aec9', 'MB#Bridgeway Motors', 'MB#Bridgeway Motors, Kozhikode, Kerala, India', 11.28249895, 75.7695995, 'India EV Network License', 'LIC-IN-ST952', 500.0, 7.4, true, 'Kozhikode', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1018becc-29ec-5091-806d-4e8b0348e514';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ddc8b337-9d66-5385-ab01-f14218b382da', '1018becc-29ec-5091-806d-4e8b0348e514', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 953: KVR Hyundai - ChargeZone (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d9c0f7e0-8c51-5dce-9f7a-b036e7e1707b', '00000000-0000-0000-0000-000000000000', 'st953@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st953@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d9c0f7e0-8c51-5dce-9f7a-b036e7e1707b', 'd9c0f7e0-8c51-5dce-9f7a-b036e7e1707b', '{"sub": "d9c0f7e0-8c51-5dce-9f7a-b036e7e1707b", "email": "st953@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd9c0f7e0-8c51-5dce-9f7a-b036e7e1707b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d9c0f7e0-8c51-5dce-9f7a-b036e7e1707b', 'admin', 'st953@boss.com', 'Admin KVR Hyundai - ChargeZone', 'KVR Hyundai - ChargeZone', 'KVR Hyundai - ChargeZone, Kozhikode, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('186bc9fc-a036-52ed-8887-a2ded64e3be9', 'd9c0f7e0-8c51-5dce-9f7a-b036e7e1707b', 'KVR Hyundai - ChargeZone', 'KVR Hyundai - ChargeZone, Kozhikode, Kerala, India', 11.27997831, 75.7704806, 'India EV Network License', 'LIC-IN-ST953', 500.0, 60.0, true, 'Kozhikode', 'Kerala', 2, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '186bc9fc-a036-52ed-8887-a2ded64e3be9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('754ad3de-d665-56b1-8a0e-c92331cf8ce8', '186bc9fc-a036-52ed-8887-a2ded64e3be9', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9ae85a2f-d31d-5564-a898-8538a790b97b', '186bc9fc-a036-52ed-8887-a2ded64e3be9', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 954: Grand Hyundai - ChargeZone (Palakkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('11675c99-81f4-5d2a-929b-b583e0ff6c3f', '00000000-0000-0000-0000-000000000000', 'st954@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st954@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('11675c99-81f4-5d2a-929b-b583e0ff6c3f', '11675c99-81f4-5d2a-929b-b583e0ff6c3f', '{"sub": "11675c99-81f4-5d2a-929b-b583e0ff6c3f", "email": "st954@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '11675c99-81f4-5d2a-929b-b583e0ff6c3f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('11675c99-81f4-5d2a-929b-b583e0ff6c3f', 'admin', 'st954@boss.com', 'Admin Grand Hyundai - ChargeZone', 'Grand Hyundai - ChargeZone', 'Grand Hyundai - ChargeZone, Palakkad, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d42c147a-769c-557b-ab7f-ed795b630a3f', '11675c99-81f4-5d2a-929b-b583e0ff6c3f', 'Grand Hyundai - ChargeZone', 'Grand Hyundai - ChargeZone, Palakkad, Kerala, India', 10.79047661, 76.65111939, 'India EV Network License', 'LIC-IN-ST954', 500.0, 60.0, true, 'Palakkad', 'Kerala', 2, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd42c147a-769c-557b-ab7f-ed795b630a3f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3bcde62d-032f-591c-8ec1-93b15dd95244', 'd42c147a-769c-557b-ab7f-ed795b630a3f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6a9364f1-0b21-5277-9ead-800bd4bac0a2', 'd42c147a-769c-557b-ab7f-ed795b630a3f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 955: MB#Bridgeway Motors (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1a11238a-3270-58e2-af8c-3cfa42b1b63a', '00000000-0000-0000-0000-000000000000', 'st955@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st955@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1a11238a-3270-58e2-af8c-3cfa42b1b63a', '1a11238a-3270-58e2-af8c-3cfa42b1b63a', '{"sub": "1a11238a-3270-58e2-af8c-3cfa42b1b63a", "email": "st955@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1a11238a-3270-58e2-af8c-3cfa42b1b63a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1a11238a-3270-58e2-af8c-3cfa42b1b63a', 'admin', 'st955@boss.com', 'Admin MB#Bridgeway Motors', 'MB#Bridgeway Motors', 'MB#Bridgeway Motors, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b82c1c4d-ba9c-5900-874f-108e814f31d5', '1a11238a-3270-58e2-af8c-3cfa42b1b63a', 'MB#Bridgeway Motors', 'MB#Bridgeway Motors, Thrissur, Kerala, India', 10.47104712, 76.25745903, 'India EV Network License', 'LIC-IN-ST955', 500.0, 7.4, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b82c1c4d-ba9c-5900-874f-108e814f31d5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('12d7ea97-8b16-5308-8de9-1cf27c304ea3', 'b82c1c4d-ba9c-5900-874f-108e814f31d5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 956: Kochi Marriot Hotel (Kochi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('064337fc-5d5e-54a6-b0f8-0986a2645b57', '00000000-0000-0000-0000-000000000000', 'st956@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st956@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('064337fc-5d5e-54a6-b0f8-0986a2645b57', '064337fc-5d5e-54a6-b0f8-0986a2645b57', '{"sub": "064337fc-5d5e-54a6-b0f8-0986a2645b57", "email": "st956@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '064337fc-5d5e-54a6-b0f8-0986a2645b57')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('064337fc-5d5e-54a6-b0f8-0986a2645b57', 'admin', 'st956@boss.com', 'Admin Kochi Marriot Hotel', 'Kochi Marriot Hotel', 'Kochi Marriot Hotel, Kochi, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('92defdb7-0442-5f58-80f3-a841250a0ae4', '064337fc-5d5e-54a6-b0f8-0986a2645b57', 'Kochi Marriot Hotel', 'Kochi Marriot Hotel, Kochi, Kerala, India', 10.02982815, 76.30813431, 'India EV Network License', 'LIC-IN-ST956', 500.0, 7.4, true, 'Kochi', 'Kerala', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '92defdb7-0442-5f58-80f3-a841250a0ae4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('54f51a2a-43d3-53af-882a-30e70d98d099', '92defdb7-0442-5f58-80f3-a841250a0ae4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 957: Le Meridien - ChargeZone (Ernakulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('63f3abb0-5565-5b62-b1d8-b6f913f1d108', '00000000-0000-0000-0000-000000000000', 'st957@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st957@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('63f3abb0-5565-5b62-b1d8-b6f913f1d108', '63f3abb0-5565-5b62-b1d8-b6f913f1d108', '{"sub": "63f3abb0-5565-5b62-b1d8-b6f913f1d108", "email": "st957@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '63f3abb0-5565-5b62-b1d8-b6f913f1d108')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('63f3abb0-5565-5b62-b1d8-b6f913f1d108', 'admin', 'st957@boss.com', 'Admin Le Meridien - ChargeZone', 'Le Meridien - ChargeZone', 'Le Meridien - ChargeZone, Ernakulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a1803cca-2490-563b-af26-29e7b556b0cc', '63f3abb0-5565-5b62-b1d8-b6f913f1d108', 'Le Meridien - ChargeZone', 'Le Meridien - ChargeZone, Ernakulam, Kerala, India', 9.933863177, 76.31687406, 'India EV Network License', 'LIC-IN-ST957', 500.0, 60.0, true, 'Ernakulam', 'Kerala', 2, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a1803cca-2490-563b-af26-29e7b556b0cc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e39459b2-1c27-5f2a-96f3-34ae8670f642', 'a1803cca-2490-563b-af26-29e7b556b0cc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a047db21-179d-5d9f-b2af-0d9307355129', 'a1803cca-2490-563b-af26-29e7b556b0cc', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 958: MB#Coastal Star (Ernakulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5f47a83d-38e1-5833-94ba-e2a344c7cda1', '00000000-0000-0000-0000-000000000000', 'st958@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st958@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5f47a83d-38e1-5833-94ba-e2a344c7cda1', '5f47a83d-38e1-5833-94ba-e2a344c7cda1', '{"sub": "5f47a83d-38e1-5833-94ba-e2a344c7cda1", "email": "st958@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5f47a83d-38e1-5833-94ba-e2a344c7cda1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5f47a83d-38e1-5833-94ba-e2a344c7cda1', 'admin', 'st958@boss.com', 'Admin MB#Coastal Star', 'MB#Coastal Star', 'MB#Coastal Star, Ernakulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('54769888-abc4-5f41-9b92-82fcd9b4a5ba', '5f47a83d-38e1-5833-94ba-e2a344c7cda1', 'MB#Coastal Star', 'MB#Coastal Star, Ernakulam, Kerala, India', 9.92299022, 76.31768925, 'India EV Network License', 'LIC-IN-ST958', 500.0, 7.4, true, 'Ernakulam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '54769888-abc4-5f41-9b92-82fcd9b4a5ba';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('58ff216f-4f57-587f-88d9-840d7cc785f6', '54769888-abc4-5f41-9b92-82fcd9b4a5ba', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 959: GreenVeel (Muvattupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a50735e9-20aa-55f1-9f6c-fba6ba82e351', '00000000-0000-0000-0000-000000000000', 'st959@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st959@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a50735e9-20aa-55f1-9f6c-fba6ba82e351', 'a50735e9-20aa-55f1-9f6c-fba6ba82e351', '{"sub": "a50735e9-20aa-55f1-9f6c-fba6ba82e351", "email": "st959@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a50735e9-20aa-55f1-9f6c-fba6ba82e351')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a50735e9-20aa-55f1-9f6c-fba6ba82e351', 'admin', 'st959@boss.com', 'Admin GreenVeel', 'GreenVeel', 'GreenVeel, Muvattupuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4a15619c-573b-57af-8c84-0f9cf43fdd05', 'a50735e9-20aa-55f1-9f6c-fba6ba82e351', 'GreenVeel', 'GreenVeel, Muvattupuzha, Kerala, India', 9.973783778, 76.60069409, 'India EV Network License', 'LIC-IN-ST959', 500.0, 7.4, true, 'Muvattupuzha', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4a15619c-573b-57af-8c84-0f9cf43fdd05';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('96807af7-8cb0-5ca8-8c24-597bdd04dea9', '4a15619c-573b-57af-8c84-0f9cf43fdd05', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 960: GreenVeel - ChargeZone (Idukki, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2ae3071e-5851-5878-b5fb-80aa7d0f6fd6', '00000000-0000-0000-0000-000000000000', 'st960@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st960@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2ae3071e-5851-5878-b5fb-80aa7d0f6fd6', '2ae3071e-5851-5878-b5fb-80aa7d0f6fd6', '{"sub": "2ae3071e-5851-5878-b5fb-80aa7d0f6fd6", "email": "st960@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2ae3071e-5851-5878-b5fb-80aa7d0f6fd6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2ae3071e-5851-5878-b5fb-80aa7d0f6fd6', 'admin', 'st960@boss.com', 'Admin GreenVeel - ChargeZone', 'GreenVeel - ChargeZone', 'GreenVeel - ChargeZone, Idukki, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a00794b4-5e1f-5763-ac33-c8bd5a6d6306', '2ae3071e-5851-5878-b5fb-80aa7d0f6fd6', 'GreenVeel - ChargeZone', 'GreenVeel - ChargeZone, Idukki, Kerala, India', 9.89265954, 76.71176414, 'India EV Network License', 'LIC-IN-ST960', 500.0, 60.0, true, 'Idukki', 'Kerala', 2, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a00794b4-5e1f-5763-ac33-c8bd5a6d6306';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2d9b5f4a-c90b-53a1-a903-f78d0bfaa061', 'a00794b4-5e1f-5763-ac33-c8bd5a6d6306', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6c391171-e8e7-5f7b-9529-de2e064bb22c', 'a00794b4-5e1f-5763-ac33-c8bd5a6d6306', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 961: Athirampuzha (Kottayam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fdf5bef5-5b33-5d09-983c-f4cf7e2fb44b', '00000000-0000-0000-0000-000000000000', 'st961@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st961@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fdf5bef5-5b33-5d09-983c-f4cf7e2fb44b', 'fdf5bef5-5b33-5d09-983c-f4cf7e2fb44b', '{"sub": "fdf5bef5-5b33-5d09-983c-f4cf7e2fb44b", "email": "st961@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fdf5bef5-5b33-5d09-983c-f4cf7e2fb44b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fdf5bef5-5b33-5d09-983c-f4cf7e2fb44b', 'admin', 'st961@boss.com', 'Admin Athirampuzha', 'Athirampuzha', 'Athirampuzha, Kottayam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a17da8bd-4df5-509f-8318-682d22812f92', 'fdf5bef5-5b33-5d09-983c-f4cf7e2fb44b', 'Athirampuzha', 'Athirampuzha, Kottayam, Kerala, India', 9.661688306, 76.55113746, 'India EV Network License', 'LIC-IN-ST961', 500.0, 7.4, true, 'Kottayam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a17da8bd-4df5-509f-8318-682d22812f92';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5797c003-9ee3-555a-b6f8-5b5facc7b725', 'a17da8bd-4df5-509f-8318-682d22812f92', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 962: SS Hyundai (Pathanamthitta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e69efa1d-6b44-5db6-b72a-e8fcd45086de', '00000000-0000-0000-0000-000000000000', 'st962@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st962@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e69efa1d-6b44-5db6-b72a-e8fcd45086de', 'e69efa1d-6b44-5db6-b72a-e8fcd45086de', '{"sub": "e69efa1d-6b44-5db6-b72a-e8fcd45086de", "email": "st962@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e69efa1d-6b44-5db6-b72a-e8fcd45086de')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e69efa1d-6b44-5db6-b72a-e8fcd45086de', 'admin', 'st962@boss.com', 'Admin SS Hyundai', 'SS Hyundai', 'SS Hyundai, Pathanamthitta, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('94e36906-ca2d-51b9-96c4-8016fe750dcb', 'e69efa1d-6b44-5db6-b72a-e8fcd45086de', 'SS Hyundai', 'SS Hyundai, Pathanamthitta, Kerala, India', 9.277744925, 76.75468311, 'India EV Network License', 'LIC-IN-ST962', 500.0, 7.4, true, 'Pathanamthitta', 'Kerala', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '94e36906-ca2d-51b9-96c4-8016fe750dcb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('18d68604-f569-57d7-bd42-cc4ca38b408b', '94e36906-ca2d-51b9-96c4-8016fe750dcb', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 963: GDM Auditorium - ChargeZone (Kayamkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('df9aa9e1-8195-5423-a45b-eb3183898328', '00000000-0000-0000-0000-000000000000', 'st963@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st963@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('df9aa9e1-8195-5423-a45b-eb3183898328', 'df9aa9e1-8195-5423-a45b-eb3183898328', '{"sub": "df9aa9e1-8195-5423-a45b-eb3183898328", "email": "st963@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'df9aa9e1-8195-5423-a45b-eb3183898328')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('df9aa9e1-8195-5423-a45b-eb3183898328', 'admin', 'st963@boss.com', 'Admin GDM Auditorium - ChargeZone', 'GDM Auditorium - ChargeZone', 'GDM Auditorium - ChargeZone, Kayamkulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ec5567bc-32d3-5787-bd16-7a6115d56dfa', 'df9aa9e1-8195-5423-a45b-eb3183898328', 'GDM Auditorium - ChargeZone', 'GDM Auditorium - ChargeZone, Kayamkulam, Kerala, India', 9.169962389, 76.49808792, 'India EV Network License', 'LIC-IN-ST963', 500.0, 60.0, true, 'Kayamkulam', 'Kerala', 2, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ec5567bc-32d3-5787-bd16-7a6115d56dfa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bd0773b0-aff4-5205-9419-5c1f479453c5', 'ec5567bc-32d3-5787-bd16-7a6115d56dfa', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('349b5aca-b136-5585-9612-dbb14392a660', 'ec5567bc-32d3-5787-bd16-7a6115d56dfa', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 964: Hotel Indraprastha (Karunagappalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c92e8b05-0333-50f1-9898-9ee6f2f99a86', '00000000-0000-0000-0000-000000000000', 'st964@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st964@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c92e8b05-0333-50f1-9898-9ee6f2f99a86', 'c92e8b05-0333-50f1-9898-9ee6f2f99a86', '{"sub": "c92e8b05-0333-50f1-9898-9ee6f2f99a86", "email": "st964@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c92e8b05-0333-50f1-9898-9ee6f2f99a86')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c92e8b05-0333-50f1-9898-9ee6f2f99a86', 'admin', 'st964@boss.com', 'Admin Hotel Indraprastha', 'Hotel Indraprastha', 'Hotel Indraprastha, Karunagappalli, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('82a32ab1-b5a0-5c69-ab67-f0e84ac95617', 'c92e8b05-0333-50f1-9898-9ee6f2f99a86', 'Hotel Indraprastha', 'Hotel Indraprastha, Karunagappalli, Kerala, India', 9.052355042, 76.53546081, 'India EV Network License', 'LIC-IN-ST964', 500.0, 7.4, true, 'Karunagappalli', 'Kerala', 1, 'Chargezone (India)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '82a32ab1-b5a0-5c69-ab67-f0e84ac95617';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ec42b06e-038f-5756-bca0-69e378906107', '82a32ab1-b5a0-5c69-ab67-f0e84ac95617', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 965: Best EVCS - ChargeMOD (Karunagappalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('df648522-c62d-5be3-b43d-294621502947', '00000000-0000-0000-0000-000000000000', 'st965@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st965@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('df648522-c62d-5be3-b43d-294621502947', 'df648522-c62d-5be3-b43d-294621502947', '{"sub": "df648522-c62d-5be3-b43d-294621502947", "email": "st965@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'df648522-c62d-5be3-b43d-294621502947')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('df648522-c62d-5be3-b43d-294621502947', 'admin', 'st965@boss.com', 'Admin Best EVCS - ChargeMOD', 'Best EVCS - ChargeMOD', 'Best EVCS - ChargeMOD, Karunagappalli, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0f793557-370f-5bce-8277-3bd2d7ea9bc5', 'df648522-c62d-5be3-b43d-294621502947', 'Best EVCS - ChargeMOD', 'Best EVCS - ChargeMOD, Karunagappalli, Kerala, India', 9.046053009, 76.53663078, 'India EV Network License', 'LIC-IN-ST965', 500.0, 30.0, true, 'Karunagappalli', 'Kerala', 1, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0f793557-370f-5bce-8277-3bd2d7ea9bc5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1b5aba26-a0a2-5005-9522-1b0b0ba521d7', '0f793557-370f-5bce-8277-3bd2d7ea9bc5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 966: Instacharge EV Fast Charging and Café (Kollam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a3569353-3c2b-5a6d-bdbf-9a4e2e801d4f', '00000000-0000-0000-0000-000000000000', 'st966@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st966@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a3569353-3c2b-5a6d-bdbf-9a4e2e801d4f', 'a3569353-3c2b-5a6d-bdbf-9a4e2e801d4f', '{"sub": "a3569353-3c2b-5a6d-bdbf-9a4e2e801d4f", "email": "st966@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a3569353-3c2b-5a6d-bdbf-9a4e2e801d4f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a3569353-3c2b-5a6d-bdbf-9a4e2e801d4f', 'admin', 'st966@boss.com', 'Admin Instacharge EV Fast Charging and Café', 'Instacharge EV Fast Charging and Café', 'Instacharge EV Fast Charging and Café, Kollam, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5337b4da-7194-59b6-bdff-eb62ef662566', 'a3569353-3c2b-5a6d-bdbf-9a4e2e801d4f', 'Instacharge EV Fast Charging and Café', 'Instacharge EV Fast Charging and Café, Kollam, Kerala, India', 8.915427161, 76.61486887, 'India EV Network License', 'LIC-IN-ST966', 500.0, 7.4, true, 'Kollam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5337b4da-7194-59b6-bdff-eb62ef662566';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('88b411f8-bd1f-53ef-a4c9-f17210af98ec', '5337b4da-7194-59b6-bdff-eb62ef662566', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 967: Chungath Sprise Hyundai - ChargeZone (Kollam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('26078971-1c1b-57f2-8b28-aaf5987fed4f', '00000000-0000-0000-0000-000000000000', 'st967@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st967@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('26078971-1c1b-57f2-8b28-aaf5987fed4f', '26078971-1c1b-57f2-8b28-aaf5987fed4f', '{"sub": "26078971-1c1b-57f2-8b28-aaf5987fed4f", "email": "st967@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '26078971-1c1b-57f2-8b28-aaf5987fed4f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('26078971-1c1b-57f2-8b28-aaf5987fed4f', 'admin', 'st967@boss.com', 'Admin Chungath Sprise Hyundai - ChargeZone', 'Chungath Sprise Hyundai - ChargeZone', 'Chungath Sprise Hyundai - ChargeZone, Kollam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('38ee4283-cf29-574c-8deb-4b868b38f7db', '26078971-1c1b-57f2-8b28-aaf5987fed4f', 'Chungath Sprise Hyundai - ChargeZone', 'Chungath Sprise Hyundai - ChargeZone, Kollam, Kerala, India', 8.911104862, 76.62735316, 'India EV Network License', 'LIC-IN-ST967', 500.0, 60.0, true, 'Kollam', 'Kerala', 2, 'Chargezone (India)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '38ee4283-cf29-574c-8deb-4b868b38f7db';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('5035a5f3-9715-5122-b7dc-ca5fd69d32b4', '38ee4283-cf29-574c-8deb-4b868b38f7db', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('45dff21d-a181-54fc-8f1b-618ce6dc2f7d', '38ee4283-cf29-574c-8deb-4b868b38f7db', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 968: KVE Charge (Varkala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('965b9a25-7eaa-5a54-9eeb-71a1498147d3', '00000000-0000-0000-0000-000000000000', 'st968@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st968@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('965b9a25-7eaa-5a54-9eeb-71a1498147d3', '965b9a25-7eaa-5a54-9eeb-71a1498147d3', '{"sub": "965b9a25-7eaa-5a54-9eeb-71a1498147d3", "email": "st968@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '965b9a25-7eaa-5a54-9eeb-71a1498147d3')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('965b9a25-7eaa-5a54-9eeb-71a1498147d3', 'admin', 'st968@boss.com', 'Admin KVE Charge', 'KVE Charge', 'KVE Charge, Varkala, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('af86f9c6-b821-58c9-8674-eae8190d0e68', '965b9a25-7eaa-5a54-9eeb-71a1498147d3', 'KVE Charge', 'KVE Charge, Varkala, Kerala, India', 8.737548356, 76.70789801, 'India EV Network License', 'LIC-IN-ST968', 500.0, 7.4, true, 'Varkala', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'af86f9c6-b821-58c9-8674-eae8190d0e68';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9220cb1e-f6a4-5112-8235-121aecc39b3e', 'af86f9c6-b821-58c9-8674-eae8190d0e68', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 969: Marvel Paints (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dcc47512-6f34-5d83-9d1a-67b623e38002', '00000000-0000-0000-0000-000000000000', 'st969@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st969@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dcc47512-6f34-5d83-9d1a-67b623e38002', 'dcc47512-6f34-5d83-9d1a-67b623e38002', '{"sub": "dcc47512-6f34-5d83-9d1a-67b623e38002", "email": "st969@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dcc47512-6f34-5d83-9d1a-67b623e38002')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dcc47512-6f34-5d83-9d1a-67b623e38002', 'admin', 'st969@boss.com', 'Admin Marvel Paints', 'Marvel Paints', 'Marvel Paints, Thiruvananthapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c34491f2-e49f-5b82-abf4-6503bf3060fe', 'dcc47512-6f34-5d83-9d1a-67b623e38002', 'Marvel Paints', 'Marvel Paints, Thiruvananthapuram, Kerala, India', 8.535706208, 76.96526204, 'India EV Network License', 'LIC-IN-ST969', 500.0, 7.4, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c34491f2-e49f-5b82-abf4-6503bf3060fe';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c82a639e-d47a-5039-89b5-26cb33e2d6bb', 'c34491f2-e49f-5b82-abf4-6503bf3060fe', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 970: Raj Residency - Zeon (Kanhangad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('850d0bad-4a70-5302-a1bc-ca50670ab100', '00000000-0000-0000-0000-000000000000', 'st970@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st970@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('850d0bad-4a70-5302-a1bc-ca50670ab100', '850d0bad-4a70-5302-a1bc-ca50670ab100', '{"sub": "850d0bad-4a70-5302-a1bc-ca50670ab100", "email": "st970@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '850d0bad-4a70-5302-a1bc-ca50670ab100')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('850d0bad-4a70-5302-a1bc-ca50670ab100', 'admin', 'st970@boss.com', 'Admin Raj Residency - Zeon', 'Raj Residency - Zeon', 'Raj Residency - Zeon, Kanhangad, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9ed29c37-e6d3-5bf7-b6f9-c870696dc4c0', '850d0bad-4a70-5302-a1bc-ca50670ab100', 'Raj Residency - Zeon', 'Raj Residency - Zeon, Kanhangad, Kerala, India', 12.30424174, 75.09704178, 'India EV Network License', 'LIC-IN-ST970', 500.0, 30.0, true, 'Kanhangad', 'Kerala', 2, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9ed29c37-e6d3-5bf7-b6f9-c870696dc4c0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d691690f-c4a6-580e-b257-0638f33c0181', '9ed29c37-e6d3-5bf7-b6f9-c870696dc4c0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f8daa4fd-97a3-540d-a24d-259a97965f68', '9ed29c37-e6d3-5bf7-b6f9-c870696dc4c0', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 971: Koodali SCB (Kannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('904be072-9282-5308-8fbb-e9c1799cda23', '00000000-0000-0000-0000-000000000000', 'st971@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st971@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('904be072-9282-5308-8fbb-e9c1799cda23', '904be072-9282-5308-8fbb-e9c1799cda23', '{"sub": "904be072-9282-5308-8fbb-e9c1799cda23", "email": "st971@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '904be072-9282-5308-8fbb-e9c1799cda23')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('904be072-9282-5308-8fbb-e9c1799cda23', 'admin', 'st971@boss.com', 'Admin Koodali SCB', 'Koodali SCB', 'Koodali SCB, Kannur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('60262e48-d969-5f47-b5df-94edc5072b68', '904be072-9282-5308-8fbb-e9c1799cda23', 'Koodali SCB', 'Koodali SCB, Kannur, Kerala, India', 11.9270166, 75.50042206, 'India EV Network License', 'LIC-IN-ST971', 500.0, 7.4, true, 'Kannur', 'Kerala', 1, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '60262e48-d969-5f47-b5df-94edc5072b68';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('118443e2-4342-5be0-a7e6-03accd6c966d', '60262e48-d969-5f47-b5df-94edc5072b68', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 972: Co-Operqative Bank - Zeon (Kathirur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b6263047-7c8f-57e8-8d69-4d0f74a6778d', '00000000-0000-0000-0000-000000000000', 'st972@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st972@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b6263047-7c8f-57e8-8d69-4d0f74a6778d', 'b6263047-7c8f-57e8-8d69-4d0f74a6778d', '{"sub": "b6263047-7c8f-57e8-8d69-4d0f74a6778d", "email": "st972@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b6263047-7c8f-57e8-8d69-4d0f74a6778d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b6263047-7c8f-57e8-8d69-4d0f74a6778d', 'admin', 'st972@boss.com', 'Admin Co-Operqative Bank - Zeon', 'Co-Operqative Bank - Zeon', 'Co-Operqative Bank - Zeon, Kathirur, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7913c185-f267-5882-9e3a-dfd36a39328f', 'b6263047-7c8f-57e8-8d69-4d0f74a6778d', 'Co-Operqative Bank - Zeon', 'Co-Operqative Bank - Zeon, Kathirur, Kerala, India', 11.78788559, 75.53302105, 'India EV Network License', 'LIC-IN-ST972', 500.0, 30.0, true, 'Kathirur', 'Kerala', 2, 'Zeon Charging', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7913c185-f267-5882-9e3a-dfd36a39328f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('aea7a916-040a-54b7-b5b6-aa57cd5a60c3', '7913c185-f267-5882-9e3a-dfd36a39328f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d188bc60-5427-51a6-98f7-57337fa19930', '7913c185-f267-5882-9e3a-dfd36a39328f', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 973: Down Town Mall - Zeon (Thalasseri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('eb00d718-8e86-5431-a65f-d2fda726f412', '00000000-0000-0000-0000-000000000000', 'st973@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st973@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('eb00d718-8e86-5431-a65f-d2fda726f412', 'eb00d718-8e86-5431-a65f-d2fda726f412', '{"sub": "eb00d718-8e86-5431-a65f-d2fda726f412", "email": "st973@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'eb00d718-8e86-5431-a65f-d2fda726f412')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('eb00d718-8e86-5431-a65f-d2fda726f412', 'admin', 'st973@boss.com', 'Admin Down Town Mall - Zeon', 'Down Town Mall - Zeon', 'Down Town Mall - Zeon, Thalasseri, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b4dcfc0c-3b8b-5acc-9856-ff9996f66086', 'eb00d718-8e86-5431-a65f-d2fda726f412', 'Down Town Mall - Zeon', 'Down Town Mall - Zeon, Thalasseri, Kerala, India', 11.74512339, 75.49541917, 'India EV Network License', 'LIC-IN-ST973', 500.0, 30.0, true, 'Thalasseri', 'Kerala', 2, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b4dcfc0c-3b8b-5acc-9856-ff9996f66086';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('00442672-df99-5cd8-8f20-13b8d0439fd9', 'b4dcfc0c-3b8b-5acc-9856-ff9996f66086', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ff9e6ef9-79bd-558a-8c2c-3ebfbdaddc4a', 'b4dcfc0c-3b8b-5acc-9856-ff9996f66086', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 974: Issacs Centre Square - Zeon (Sulthan Batheri, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b1dce1e7-054f-56eb-bb2f-ed3cc1e3d36d', '00000000-0000-0000-0000-000000000000', 'st974@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st974@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b1dce1e7-054f-56eb-bb2f-ed3cc1e3d36d', 'b1dce1e7-054f-56eb-bb2f-ed3cc1e3d36d', '{"sub": "b1dce1e7-054f-56eb-bb2f-ed3cc1e3d36d", "email": "st974@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b1dce1e7-054f-56eb-bb2f-ed3cc1e3d36d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b1dce1e7-054f-56eb-bb2f-ed3cc1e3d36d', 'admin', 'st974@boss.com', 'Admin Issacs Centre Square - Zeon', 'Issacs Centre Square - Zeon', 'Issacs Centre Square - Zeon, Sulthan Batheri, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b63c30b0-bcfc-5b66-a4b1-7dfc395f0d40', 'b1dce1e7-054f-56eb-bb2f-ed3cc1e3d36d', 'Issacs Centre Square - Zeon', 'Issacs Centre Square - Zeon, Sulthan Batheri, Kerala, India', 11.66124226, 76.25568142, 'India EV Network License', 'LIC-IN-ST974', 500.0, 30.0, true, 'Sulthan Batheri', 'Kerala', 2, 'Unknown', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b63c30b0-bcfc-5b66-a4b1-7dfc395f0d40';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('33deafba-075b-5457-a010-15640c1eabf9', 'b63c30b0-bcfc-5b66-a4b1-7dfc395f0d40', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c0f1c495-d710-51da-8888-0ad3611e095c', 'b63c30b0-bcfc-5b66-a4b1-7dfc395f0d40', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 975: Great Trails Wayanad by GRT Hotels (Kalpetta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('00a1dc83-80b9-5ad4-acce-76dc3d3982ad', '00000000-0000-0000-0000-000000000000', 'st975@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st975@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('00a1dc83-80b9-5ad4-acce-76dc3d3982ad', '00a1dc83-80b9-5ad4-acce-76dc3d3982ad', '{"sub": "00a1dc83-80b9-5ad4-acce-76dc3d3982ad", "email": "st975@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '00a1dc83-80b9-5ad4-acce-76dc3d3982ad')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('00a1dc83-80b9-5ad4-acce-76dc3d3982ad', 'admin', 'st975@boss.com', 'Admin Great Trails Wayanad by GRT Hotels', 'Great Trails Wayanad by GRT Hotels', 'Great Trails Wayanad by GRT Hotels, Kalpetta, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b7d01ea8-6964-5da6-ad7f-d5f70eb84950', '00a1dc83-80b9-5ad4-acce-76dc3d3982ad', 'Great Trails Wayanad by GRT Hotels', 'Great Trails Wayanad by GRT Hotels, Kalpetta, Kerala, India', 11.63045584, 76.01814584, 'India EV Network License', 'LIC-IN-ST975', 500.0, 7.4, true, 'Kalpetta', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b7d01ea8-6964-5da6-ad7f-d5f70eb84950';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b6764385-783c-5bce-8a2d-ceb3e3240971', 'b7d01ea8-6964-5da6-ad7f-d5f70eb84950', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 976: Nesto Hypermarket - Zeon (Kalpetta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('95eca887-6ab5-5722-94e8-55ec83ed0ddf', '00000000-0000-0000-0000-000000000000', 'st976@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st976@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('95eca887-6ab5-5722-94e8-55ec83ed0ddf', '95eca887-6ab5-5722-94e8-55ec83ed0ddf', '{"sub": "95eca887-6ab5-5722-94e8-55ec83ed0ddf", "email": "st976@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '95eca887-6ab5-5722-94e8-55ec83ed0ddf')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('95eca887-6ab5-5722-94e8-55ec83ed0ddf', 'admin', 'st976@boss.com', 'Admin Nesto Hypermarket - Zeon', 'Nesto Hypermarket - Zeon', 'Nesto Hypermarket - Zeon, Kalpetta, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('071ce884-f1ad-5781-87b8-99fa7d1c3734', '95eca887-6ab5-5722-94e8-55ec83ed0ddf', 'Nesto Hypermarket - Zeon', 'Nesto Hypermarket - Zeon, Kalpetta, Kerala, India', 11.60311373, 76.08314904, 'India EV Network License', 'LIC-IN-ST976', 500.0, 30.0, true, 'Kalpetta', 'Kerala', 2, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '071ce884-f1ad-5781-87b8-99fa7d1c3734';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d3553653-45c3-57a3-b5d6-a9d837a12c9e', '071ce884-f1ad-5781-87b8-99fa7d1c3734', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4af9147a-dd92-5b0b-8293-1b595a96cc44', '071ce884-f1ad-5781-87b8-99fa7d1c3734', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 977: HiLite Mall - Zeon (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f0a7b176-340f-5c21-b8ce-5786e2d3613d', '00000000-0000-0000-0000-000000000000', 'st977@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st977@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f0a7b176-340f-5c21-b8ce-5786e2d3613d', 'f0a7b176-340f-5c21-b8ce-5786e2d3613d', '{"sub": "f0a7b176-340f-5c21-b8ce-5786e2d3613d", "email": "st977@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f0a7b176-340f-5c21-b8ce-5786e2d3613d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f0a7b176-340f-5c21-b8ce-5786e2d3613d', 'admin', 'st977@boss.com', 'Admin HiLite Mall - Zeon', 'HiLite Mall - Zeon', 'HiLite Mall - Zeon, Kozhikode, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4d26869c-1870-5db6-917c-61f31c3a5381', 'f0a7b176-340f-5c21-b8ce-5786e2d3613d', 'HiLite Mall - Zeon', 'HiLite Mall - Zeon, Kozhikode, Kerala, India', 11.24810247, 75.83413592, 'India EV Network License', 'LIC-IN-ST977', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 2, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4d26869c-1870-5db6-917c-61f31c3a5381';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f05ed3ae-3fef-5981-ae6b-4851fb8da62f', '4d26869c-1870-5db6-917c-61f31c3a5381', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c8b6167b-c003-56cf-81a5-3e78b1650c96', '4d26869c-1870-5db6-917c-61f31c3a5381', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 978: HiLite Business Park - Zeon (Kozhikode, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('64c42e8e-4ee6-523f-a02e-572f7e629659', '00000000-0000-0000-0000-000000000000', 'st978@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st978@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('64c42e8e-4ee6-523f-a02e-572f7e629659', '64c42e8e-4ee6-523f-a02e-572f7e629659', '{"sub": "64c42e8e-4ee6-523f-a02e-572f7e629659", "email": "st978@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '64c42e8e-4ee6-523f-a02e-572f7e629659')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('64c42e8e-4ee6-523f-a02e-572f7e629659', 'admin', 'st978@boss.com', 'Admin HiLite Business Park - Zeon', 'HiLite Business Park - Zeon', 'HiLite Business Park - Zeon, Kozhikode, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('33c5d7e2-d972-584a-94c6-64dd4b10a44e', '64c42e8e-4ee6-523f-a02e-572f7e629659', 'HiLite Business Park - Zeon', 'HiLite Business Park - Zeon, Kozhikode, Kerala, India', 11.24701616, 75.83467864, 'India EV Network License', 'LIC-IN-ST978', 500.0, 30.0, true, 'Kozhikode', 'Kerala', 2, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '33c5d7e2-d972-584a-94c6-64dd4b10a44e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('18a59054-fd5b-5b44-8eb4-e5d5c5bafb8c', '33c5d7e2-d972-584a-94c6-64dd4b10a44e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dd421c99-b4f0-593b-b52b-e5ca3ede84ab', '33c5d7e2-d972-584a-94c6-64dd4b10a44e', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 979: Nesto Hypermarket - Zeon (Kottakkal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('43f3fa3f-3af3-535a-8937-49c111550901', '00000000-0000-0000-0000-000000000000', 'st979@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st979@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('43f3fa3f-3af3-535a-8937-49c111550901', '43f3fa3f-3af3-535a-8937-49c111550901', '{"sub": "43f3fa3f-3af3-535a-8937-49c111550901", "email": "st979@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '43f3fa3f-3af3-535a-8937-49c111550901')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('43f3fa3f-3af3-535a-8937-49c111550901', 'admin', 'st979@boss.com', 'Admin Nesto Hypermarket - Zeon', 'Nesto Hypermarket - Zeon', 'Nesto Hypermarket - Zeon, Kottakkal, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b96955ff-f0b2-51e1-a52d-0d50fcebd341', '43f3fa3f-3af3-535a-8937-49c111550901', 'Nesto Hypermarket - Zeon', 'Nesto Hypermarket - Zeon, Kottakkal, Kerala, India', 10.99573941, 75.99210994, 'India EV Network License', 'LIC-IN-ST979', 500.0, 30.0, true, 'Kottakkal', 'Kerala', 2, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b96955ff-f0b2-51e1-a52d-0d50fcebd341';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6ba10ae3-e335-550a-af72-8642e733df70', 'b96955ff-f0b2-51e1-a52d-0d50fcebd341', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('14d70753-62d4-56db-8e26-59482172fdf7', 'b96955ff-f0b2-51e1-a52d-0d50fcebd341', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 980: Club Sulaimani - Zeon (Kottakkal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('14b06e5b-2624-5576-91da-c7357d66d138', '00000000-0000-0000-0000-000000000000', 'st980@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st980@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('14b06e5b-2624-5576-91da-c7357d66d138', '14b06e5b-2624-5576-91da-c7357d66d138', '{"sub": "14b06e5b-2624-5576-91da-c7357d66d138", "email": "st980@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '14b06e5b-2624-5576-91da-c7357d66d138')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('14b06e5b-2624-5576-91da-c7357d66d138', 'admin', 'st980@boss.com', 'Admin Club Sulaimani - Zeon', 'Club Sulaimani - Zeon', 'Club Sulaimani - Zeon, Kottakkal, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4941a3d4-2dec-571e-897a-76666cc358b7', '14b06e5b-2624-5576-91da-c7357d66d138', 'Club Sulaimani - Zeon', 'Club Sulaimani - Zeon, Kottakkal, Kerala, India', 10.98386743, 75.9980295, 'India EV Network License', 'LIC-IN-ST980', 500.0, 30.0, true, 'Kottakkal', 'Kerala', 2, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4941a3d4-2dec-571e-897a-76666cc358b7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e0192a18-187d-54be-8cd3-0cbfff6d02c8', '4941a3d4-2dec-571e-897a-76666cc358b7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b578cecf-3df7-5a95-adc0-1e45c8c2f6d2', '4941a3d4-2dec-571e-897a-76666cc358b7', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 981: Nesto Hypermarket Zeon (Thirur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9f6990f1-016a-57c5-a0a9-f64227ff160e', '00000000-0000-0000-0000-000000000000', 'st981@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st981@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9f6990f1-016a-57c5-a0a9-f64227ff160e', '9f6990f1-016a-57c5-a0a9-f64227ff160e', '{"sub": "9f6990f1-016a-57c5-a0a9-f64227ff160e", "email": "st981@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9f6990f1-016a-57c5-a0a9-f64227ff160e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9f6990f1-016a-57c5-a0a9-f64227ff160e', 'admin', 'st981@boss.com', 'Admin Nesto Hypermarket Zeon', 'Nesto Hypermarket Zeon', 'Nesto Hypermarket Zeon, Thirur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2cac6441-ab17-5742-af14-7b6f47036886', '9f6990f1-016a-57c5-a0a9-f64227ff160e', 'Nesto Hypermarket Zeon', 'Nesto Hypermarket Zeon, Thirur, Kerala, India', 10.90772625, 75.92032568, 'India EV Network License', 'LIC-IN-ST981', 500.0, 30.0, true, 'Thirur', 'Kerala', 2, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2cac6441-ab17-5742-af14-7b6f47036886';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6080066a-9e34-5d8d-a96d-c5ba9d49b147', '2cac6441-ab17-5742-af14-7b6f47036886', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('33ab4dcb-6f5a-546a-97f2-20ce69ac6690', '2cac6441-ab17-5742-af14-7b6f47036886', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 982: Emirates Mall - Zeon (Edappal, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c1974a50-5360-5773-b422-d43a61dcb790', '00000000-0000-0000-0000-000000000000', 'st982@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st982@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c1974a50-5360-5773-b422-d43a61dcb790', 'c1974a50-5360-5773-b422-d43a61dcb790', '{"sub": "c1974a50-5360-5773-b422-d43a61dcb790", "email": "st982@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c1974a50-5360-5773-b422-d43a61dcb790')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c1974a50-5360-5773-b422-d43a61dcb790', 'admin', 'st982@boss.com', 'Admin Emirates Mall - Zeon', 'Emirates Mall - Zeon', 'Emirates Mall - Zeon, Edappal, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3fdeca1d-82c3-5428-8a1c-df23ccf9d576', 'c1974a50-5360-5773-b422-d43a61dcb790', 'Emirates Mall - Zeon', 'Emirates Mall - Zeon, Edappal, Kerala, India', 10.78602051, 76.00816182, 'India EV Network License', 'LIC-IN-ST982', 500.0, 30.0, true, 'Edappal', 'Kerala', 2, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3fdeca1d-82c3-5428-8a1c-df23ccf9d576';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d86b5959-7d1c-5d66-b07c-fb35f2c65b31', '3fdeca1d-82c3-5428-8a1c-df23ccf9d576', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('42e32c4f-2496-58b8-9074-08807c241ab9', '3fdeca1d-82c3-5428-8a1c-df23ccf9d576', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 983: Hotel Devaragam (Guruvayur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fd0d09b8-d1c6-50b3-9cfb-4157700061fe', '00000000-0000-0000-0000-000000000000', 'st983@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st983@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fd0d09b8-d1c6-50b3-9cfb-4157700061fe', 'fd0d09b8-d1c6-50b3-9cfb-4157700061fe', '{"sub": "fd0d09b8-d1c6-50b3-9cfb-4157700061fe", "email": "st983@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fd0d09b8-d1c6-50b3-9cfb-4157700061fe')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fd0d09b8-d1c6-50b3-9cfb-4157700061fe', 'admin', 'st983@boss.com', 'Admin Hotel Devaragam', 'Hotel Devaragam', 'Hotel Devaragam, Guruvayur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('332743bc-b853-5a8b-ad62-a0ed1f63d7f9', 'fd0d09b8-d1c6-50b3-9cfb-4157700061fe', 'Hotel Devaragam', 'Hotel Devaragam, Guruvayur, Kerala, India', 10.59562258, 76.04459843, 'India EV Network License', 'LIC-IN-ST983', 500.0, 7.4, true, 'Guruvayur', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '332743bc-b853-5a8b-ad62-a0ed1f63d7f9';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3f68e93f-208c-56c0-8824-74647d693ffe', '332743bc-b853-5a8b-ad62-a0ed1f63d7f9', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 984: Nesto Hypermarket (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('26378b99-8dbc-5424-bb38-d707c8e6d506', '00000000-0000-0000-0000-000000000000', 'st984@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st984@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('26378b99-8dbc-5424-bb38-d707c8e6d506', '26378b99-8dbc-5424-bb38-d707c8e6d506', '{"sub": "26378b99-8dbc-5424-bb38-d707c8e6d506", "email": "st984@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '26378b99-8dbc-5424-bb38-d707c8e6d506')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('26378b99-8dbc-5424-bb38-d707c8e6d506', 'admin', 'st984@boss.com', 'Admin Nesto Hypermarket', 'Nesto Hypermarket', 'Nesto Hypermarket, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('028c126d-a5cd-5a4f-b1e7-877a1905342d', '26378b99-8dbc-5424-bb38-d707c8e6d506', 'Nesto Hypermarket', 'Nesto Hypermarket, Thrissur, Kerala, India', 10.53992625, 76.19288758, 'India EV Network License', 'LIC-IN-ST984', 500.0, 7.4, true, 'Thrissur', 'Kerala', 1, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '028c126d-a5cd-5a4f-b1e7-877a1905342d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ebba92aa-86e7-541d-8435-3fb4792da4eb', '028c126d-a5cd-5a4f-b1e7-877a1905342d', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 985: Dream City Convention Center (Pattikkad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d309e6a6-3a0b-5e17-ad34-4cbe7acf5588', '00000000-0000-0000-0000-000000000000', 'st985@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st985@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d309e6a6-3a0b-5e17-ad34-4cbe7acf5588', 'd309e6a6-3a0b-5e17-ad34-4cbe7acf5588', '{"sub": "d309e6a6-3a0b-5e17-ad34-4cbe7acf5588", "email": "st985@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd309e6a6-3a0b-5e17-ad34-4cbe7acf5588')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d309e6a6-3a0b-5e17-ad34-4cbe7acf5588', 'admin', 'st985@boss.com', 'Admin Dream City Convention Center', 'Dream City Convention Center', 'Dream City Convention Center, Pattikkad, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('77c83a11-02dc-5514-9815-7f603277dde6', 'd309e6a6-3a0b-5e17-ad34-4cbe7acf5588', 'Dream City Convention Center', 'Dream City Convention Center, Pattikkad, Kerala, India', 10.55587199, 76.32282252, 'India EV Network License', 'LIC-IN-ST985', 500.0, 7.4, true, 'Pattikkad', 'Kerala', 1, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '77c83a11-02dc-5514-9815-7f603277dde6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c356fe0b-495e-59a2-a158-61ca84e48843', '77c83a11-02dc-5514-9815-7f603277dde6', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 986: Chennai Ananda Bhavan (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('bf238fb0-9e66-534d-8791-eaf7c36db860', '00000000-0000-0000-0000-000000000000', 'st986@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st986@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('bf238fb0-9e66-534d-8791-eaf7c36db860', 'bf238fb0-9e66-534d-8791-eaf7c36db860', '{"sub": "bf238fb0-9e66-534d-8791-eaf7c36db860", "email": "st986@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'bf238fb0-9e66-534d-8791-eaf7c36db860')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('bf238fb0-9e66-534d-8791-eaf7c36db860', 'admin', 'st986@boss.com', 'Admin Chennai Ananda Bhavan', 'Chennai Ananda Bhavan', 'Chennai Ananda Bhavan, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8cd5ea6f-b5ad-562e-9a6e-30e70c6380c8', 'bf238fb0-9e66-534d-8791-eaf7c36db860', 'Chennai Ananda Bhavan', 'Chennai Ananda Bhavan, Thrissur, Kerala, India', 10.5127597, 76.25891675, 'India EV Network License', 'LIC-IN-ST986', 500.0, 7.4, true, 'Thrissur', 'Kerala', 1, 'Zeon Charging', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8cd5ea6f-b5ad-562e-9a6e-30e70c6380c8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6e848305-9568-51c3-b5cf-d0fc8d6b2211', '8cd5ea6f-b5ad-562e-9a6e-30e70c6380c8', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 987: Hilite Mall (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('63b5d3de-3430-515d-b7f5-a609b7717445', '00000000-0000-0000-0000-000000000000', 'st987@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st987@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('63b5d3de-3430-515d-b7f5-a609b7717445', '63b5d3de-3430-515d-b7f5-a609b7717445', '{"sub": "63b5d3de-3430-515d-b7f5-a609b7717445", "email": "st987@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '63b5d3de-3430-515d-b7f5-a609b7717445')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('63b5d3de-3430-515d-b7f5-a609b7717445', 'admin', 'st987@boss.com', 'Admin Hilite Mall', 'Hilite Mall', 'Hilite Mall, Thrissur, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('12b63a11-b88e-56d5-9ce5-2b75b6c7b869', '63b5d3de-3430-515d-b7f5-a609b7717445', 'Hilite Mall', 'Hilite Mall, Thrissur, Kerala, India', 10.49548871, 76.25680253, 'India EV Network License', 'LIC-IN-ST987', 500.0, 7.4, true, 'Thrissur', 'Kerala', 1, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '12b63a11-b88e-56d5-9ce5-2b75b6c7b869';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6b91f289-8fc7-53e0-aa61-3044c357d1ee', '12b63a11-b88e-56d5-9ce5-2b75b6c7b869', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 988: Mughal Mall (Kodungallur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cdc43a1a-1484-526f-ae70-0fb61f2cc23b', '00000000-0000-0000-0000-000000000000', 'st988@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st988@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cdc43a1a-1484-526f-ae70-0fb61f2cc23b', 'cdc43a1a-1484-526f-ae70-0fb61f2cc23b', '{"sub": "cdc43a1a-1484-526f-ae70-0fb61f2cc23b", "email": "st988@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cdc43a1a-1484-526f-ae70-0fb61f2cc23b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cdc43a1a-1484-526f-ae70-0fb61f2cc23b', 'admin', 'st988@boss.com', 'Admin Mughal Mall', 'Mughal Mall', 'Mughal Mall, Kodungallur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3ce57606-0ff5-5968-86ef-1f3576116330', 'cdc43a1a-1484-526f-ae70-0fb61f2cc23b', 'Mughal Mall', 'Mughal Mall, Kodungallur, Kerala, India', 10.23131902, 76.1972431, 'India EV Network License', 'LIC-IN-ST988', 500.0, 7.4, true, 'Kodungallur', 'Kerala', 1, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3ce57606-0ff5-5968-86ef-1f3576116330';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ed83a0b9-ea09-5981-911c-31b4c61c7b86', '3ce57606-0ff5-5968-86ef-1f3576116330', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 989: Maxx Inn M Star (Angamaly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('11d863aa-9a2a-5f02-a8bf-b9018c70a34f', '00000000-0000-0000-0000-000000000000', 'st989@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st989@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('11d863aa-9a2a-5f02-a8bf-b9018c70a34f', '11d863aa-9a2a-5f02-a8bf-b9018c70a34f', '{"sub": "11d863aa-9a2a-5f02-a8bf-b9018c70a34f", "email": "st989@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '11d863aa-9a2a-5f02-a8bf-b9018c70a34f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('11d863aa-9a2a-5f02-a8bf-b9018c70a34f', 'admin', 'st989@boss.com', 'Admin Maxx Inn M Star', 'Maxx Inn M Star', 'Maxx Inn M Star, Angamaly, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e2823876-354b-573e-85e5-3b170d792ddf', '11d863aa-9a2a-5f02-a8bf-b9018c70a34f', 'Maxx Inn M Star', 'Maxx Inn M Star, Angamaly, Kerala, India', 10.22272376, 76.37569774, 'India EV Network License', 'LIC-IN-ST989', 500.0, 7.4, true, 'Angamaly', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e2823876-354b-573e-85e5-3b170d792ddf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('be2376b9-f197-5e9a-8010-db5ffa8f4111', 'e2823876-354b-573e-85e5-3b170d792ddf', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 990: Club Mahindra Resort - Cherai Beach (Cherai, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('75020295-1ab0-576f-9cb0-325f82137b68', '00000000-0000-0000-0000-000000000000', 'st990@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st990@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('75020295-1ab0-576f-9cb0-325f82137b68', '75020295-1ab0-576f-9cb0-325f82137b68', '{"sub": "75020295-1ab0-576f-9cb0-325f82137b68", "email": "st990@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '75020295-1ab0-576f-9cb0-325f82137b68')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('75020295-1ab0-576f-9cb0-325f82137b68', 'admin', 'st990@boss.com', 'Admin Club Mahindra Resort - Cherai Beach', 'Club Mahindra Resort - Cherai Beach', 'Club Mahindra Resort - Cherai Beach, Cherai, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('716f1e79-cbf1-5fe3-88a9-2c6d8c58bd1a', '75020295-1ab0-576f-9cb0-325f82137b68', 'Club Mahindra Resort - Cherai Beach', 'Club Mahindra Resort - Cherai Beach, Cherai, Kerala, India', 10.137094, 76.18028953, 'India EV Network License', 'LIC-IN-ST990', 500.0, 7.4, true, 'Cherai', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '716f1e79-cbf1-5fe3-88a9-2c6d8c58bd1a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f3d17224-e98c-530b-bd6c-acbe13eab91f', '716f1e79-cbf1-5fe3-88a9-2c6d8c58bd1a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 991: Grand Mall (Edappalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ffed822d-d6d2-5e00-8e12-b38f80a71977', '00000000-0000-0000-0000-000000000000', 'st991@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st991@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ffed822d-d6d2-5e00-8e12-b38f80a71977', 'ffed822d-d6d2-5e00-8e12-b38f80a71977', '{"sub": "ffed822d-d6d2-5e00-8e12-b38f80a71977", "email": "st991@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ffed822d-d6d2-5e00-8e12-b38f80a71977')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ffed822d-d6d2-5e00-8e12-b38f80a71977', 'admin', 'st991@boss.com', 'Admin Grand Mall', 'Grand Mall', 'Grand Mall, Edappalli, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('234a0a1a-5be3-5838-8ee5-473dd0365604', 'ffed822d-d6d2-5e00-8e12-b38f80a71977', 'Grand Mall', 'Grand Mall, Edappalli, Kerala, India', 10.02416042, 76.30871193, 'India EV Network License', 'LIC-IN-ST991', 500.0, 7.4, true, 'Edappalli', 'Kerala', 1, 'Zeon Charging', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '234a0a1a-5be3-5838-8ee5-473dd0365604';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7cf5fb6c-ea11-584a-8ebe-17fcca49d5c6', '234a0a1a-5be3-5838-8ee5-473dd0365604', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 992: Gokul Oottupura Restaurant (Edappalli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6ddd9480-23b1-5dc6-bcae-226ff675b0a2', '00000000-0000-0000-0000-000000000000', 'st992@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st992@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6ddd9480-23b1-5dc6-bcae-226ff675b0a2', '6ddd9480-23b1-5dc6-bcae-226ff675b0a2', '{"sub": "6ddd9480-23b1-5dc6-bcae-226ff675b0a2", "email": "st992@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6ddd9480-23b1-5dc6-bcae-226ff675b0a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6ddd9480-23b1-5dc6-bcae-226ff675b0a2', 'admin', 'st992@boss.com', 'Admin Gokul Oottupura Restaurant', 'Gokul Oottupura Restaurant', 'Gokul Oottupura Restaurant, Edappalli, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e6d8f680-b8df-5124-a881-e9b23a8d5282', '6ddd9480-23b1-5dc6-bcae-226ff675b0a2', 'Gokul Oottupura Restaurant', 'Gokul Oottupura Restaurant, Edappalli, Kerala, India', 10.01114482, 76.31249741, 'India EV Network License', 'LIC-IN-ST992', 500.0, 7.4, true, 'Edappalli', 'Kerala', 1, 'Zeon Charging', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e6d8f680-b8df-5124-a881-e9b23a8d5282';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4a857abe-3d5d-5fa7-9360-abe864f83178', 'e6d8f680-b8df-5124-a881-e9b23a8d5282', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 993: Brunton Boatyard (Cochin, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('68b332cc-30f9-5955-be13-620542912728', '00000000-0000-0000-0000-000000000000', 'st993@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st993@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('68b332cc-30f9-5955-be13-620542912728', '68b332cc-30f9-5955-be13-620542912728', '{"sub": "68b332cc-30f9-5955-be13-620542912728", "email": "st993@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '68b332cc-30f9-5955-be13-620542912728')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('68b332cc-30f9-5955-be13-620542912728', 'admin', 'st993@boss.com', 'Admin Brunton Boatyard', 'Brunton Boatyard', 'Brunton Boatyard, Cochin, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4d3d83ca-dd24-5d16-bee3-e102819447b4', '68b332cc-30f9-5955-be13-620542912728', 'Brunton Boatyard', 'Brunton Boatyard, Cochin, Kerala, India', 9.968304525, 76.24570948, 'India EV Network License', 'LIC-IN-ST993', 500.0, 7.4, true, 'Cochin', 'Kerala', 1, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4d3d83ca-dd24-5d16-bee3-e102819447b4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bc3afe64-194c-587a-ad33-9f974c145de3', '4d3d83ca-dd24-5d16-bee3-e102819447b4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 994: Casino Hotel (Kochi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f2093c07-d44e-5365-a9b3-74534d09f786', '00000000-0000-0000-0000-000000000000', 'st994@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st994@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f2093c07-d44e-5365-a9b3-74534d09f786', 'f2093c07-d44e-5365-a9b3-74534d09f786', '{"sub": "f2093c07-d44e-5365-a9b3-74534d09f786", "email": "st994@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f2093c07-d44e-5365-a9b3-74534d09f786')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f2093c07-d44e-5365-a9b3-74534d09f786', 'admin', 'st994@boss.com', 'Admin Casino Hotel', 'Casino Hotel', 'Casino Hotel, Kochi, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('82936c8d-efd9-5d9b-94d2-8fc4a761c8b4', 'f2093c07-d44e-5365-a9b3-74534d09f786', 'Casino Hotel', 'Casino Hotel, Kochi, Kerala, India', 9.961431244, 76.26949095, 'India EV Network License', 'LIC-IN-ST994', 500.0, 7.4, true, 'Kochi', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '82936c8d-efd9-5d9b-94d2-8fc4a761c8b4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e30afc92-e23d-5870-9987-b90e290a5a21', '82936c8d-efd9-5d9b-94d2-8fc4a761c8b4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 995: Hotel Ganga Grand (Moovattupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e730377c-cbe8-50a2-a439-bc7b576a9f24', '00000000-0000-0000-0000-000000000000', 'st995@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st995@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e730377c-cbe8-50a2-a439-bc7b576a9f24', 'e730377c-cbe8-50a2-a439-bc7b576a9f24', '{"sub": "e730377c-cbe8-50a2-a439-bc7b576a9f24", "email": "st995@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e730377c-cbe8-50a2-a439-bc7b576a9f24')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e730377c-cbe8-50a2-a439-bc7b576a9f24', 'admin', 'st995@boss.com', 'Admin Hotel Ganga Grand', 'Hotel Ganga Grand', 'Hotel Ganga Grand, Moovattupuzha, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8814ffc6-a41f-5ee1-b7d8-3ebb9ebe5046', 'e730377c-cbe8-50a2-a439-bc7b576a9f24', 'Hotel Ganga Grand', 'Hotel Ganga Grand, Moovattupuzha, Kerala, India', 9.981770566, 76.57830423, 'India EV Network License', 'LIC-IN-ST995', 500.0, 7.4, true, 'Moovattupuzha', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8814ffc6-a41f-5ee1-b7d8-3ebb9ebe5046';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('53dcdf06-5057-5984-94bb-69a97d62e66c', '8814ffc6-a41f-5ee1-b7d8-3ebb9ebe5046', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 996: Eden Wood Resorts (Munnar, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dcd9a4f9-d04f-5abe-988b-34001d60481b', '00000000-0000-0000-0000-000000000000', 'st996@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st996@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dcd9a4f9-d04f-5abe-988b-34001d60481b', 'dcd9a4f9-d04f-5abe-988b-34001d60481b', '{"sub": "dcd9a4f9-d04f-5abe-988b-34001d60481b", "email": "st996@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dcd9a4f9-d04f-5abe-988b-34001d60481b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dcd9a4f9-d04f-5abe-988b-34001d60481b', 'admin', 'st996@boss.com', 'Admin Eden Wood Resorts', 'Eden Wood Resorts', 'Eden Wood Resorts, Munnar, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6ba46b3b-d314-5ab5-bd6f-a91205536a16', 'dcd9a4f9-d04f-5abe-988b-34001d60481b', 'Eden Wood Resorts', 'Eden Wood Resorts, Munnar, Kerala, India', 10.02567632, 77.05377106, 'India EV Network License', 'LIC-IN-ST996', 500.0, 7.4, true, 'Munnar', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6ba46b3b-d314-5ab5-bd6f-a91205536a16';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('883ccc6b-1f17-52b0-9fa8-88f8b2592db5', '6ba46b3b-d314-5ab5-bd6f-a91205536a16', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 997: Club Mahindra Aleppey Resort (Arookutty, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6028c91d-edb9-526f-8cde-33548c75cb19', '00000000-0000-0000-0000-000000000000', 'st997@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st997@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6028c91d-edb9-526f-8cde-33548c75cb19', '6028c91d-edb9-526f-8cde-33548c75cb19', '{"sub": "6028c91d-edb9-526f-8cde-33548c75cb19", "email": "st997@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6028c91d-edb9-526f-8cde-33548c75cb19')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6028c91d-edb9-526f-8cde-33548c75cb19', 'admin', 'st997@boss.com', 'Admin Club Mahindra Aleppey Resort', 'Club Mahindra Aleppey Resort', 'Club Mahindra Aleppey Resort, Arookutty, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8364118d-9c7a-57de-bb9d-d177d27dda4f', '6028c91d-edb9-526f-8cde-33548c75cb19', 'Club Mahindra Aleppey Resort', 'Club Mahindra Aleppey Resort, Arookutty, Kerala, India', 9.859751104, 76.33582417, 'India EV Network License', 'LIC-IN-ST997', 500.0, 7.4, true, 'Arookutty', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8364118d-9c7a-57de-bb9d-d177d27dda4f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9aec5fea-0f0d-5ca2-ada1-b5f067a8e0f6', '8364118d-9c7a-57de-bb9d-d177d27dda4f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 998: CGH Marari Beach (Mararikulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('63c3e435-9f9e-5b10-8dd5-8455b3aa189c', '00000000-0000-0000-0000-000000000000', 'st998@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st998@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('63c3e435-9f9e-5b10-8dd5-8455b3aa189c', '63c3e435-9f9e-5b10-8dd5-8455b3aa189c', '{"sub": "63c3e435-9f9e-5b10-8dd5-8455b3aa189c", "email": "st998@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '63c3e435-9f9e-5b10-8dd5-8455b3aa189c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('63c3e435-9f9e-5b10-8dd5-8455b3aa189c', 'admin', 'st998@boss.com', 'Admin CGH Marari Beach', 'CGH Marari Beach', 'CGH Marari Beach, Mararikulam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f61f62dd-ef67-5378-8db8-821490ba879b', '63c3e435-9f9e-5b10-8dd5-8455b3aa189c', 'CGH Marari Beach', 'CGH Marari Beach, Mararikulam, Kerala, India', 9.596033619, 76.30277024, 'India EV Network License', 'LIC-IN-ST998', 500.0, 7.4, true, 'Mararikulam', 'Kerala', 1, 'Zeon Charging', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f61f62dd-ef67-5378-8db8-821490ba879b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('e4d244ec-4a20-5dfc-ad43-eb086fcd449a', 'f61f62dd-ef67-5378-8db8-821490ba879b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 999: Cassia Restaurant (Alappuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cf8753ff-6519-5dcc-83fe-ce14d248de3b', '00000000-0000-0000-0000-000000000000', 'st999@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st999@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cf8753ff-6519-5dcc-83fe-ce14d248de3b', 'cf8753ff-6519-5dcc-83fe-ce14d248de3b', '{"sub": "cf8753ff-6519-5dcc-83fe-ce14d248de3b", "email": "st999@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cf8753ff-6519-5dcc-83fe-ce14d248de3b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cf8753ff-6519-5dcc-83fe-ce14d248de3b', 'admin', 'st999@boss.com', 'Admin Cassia Restaurant', 'Cassia Restaurant', 'Cassia Restaurant, Alappuzha, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a505fcbf-2401-5640-bb33-91caa2a27e14', 'cf8753ff-6519-5dcc-83fe-ce14d248de3b', 'Cassia Restaurant', 'Cassia Restaurant, Alappuzha, Kerala, India', 9.518713883, 76.32748515, 'India EV Network License', 'LIC-IN-ST999', 500.0, 7.4, true, 'Alappuzha', 'Kerala', 1, 'Zeon Charging', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a505fcbf-2401-5640-bb33-91caa2a27e14';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a19c3da5-22d5-519c-9cfe-7027ae14b795', 'a505fcbf-2401-5640-bb33-91caa2a27e14', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 1000: Hotel Aida (Kottayam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d82fc25f-6cb5-5a00-8e0e-9acb7f8c19cd', '00000000-0000-0000-0000-000000000000', 'st1000@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st1000@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d82fc25f-6cb5-5a00-8e0e-9acb7f8c19cd', 'd82fc25f-6cb5-5a00-8e0e-9acb7f8c19cd', '{"sub": "d82fc25f-6cb5-5a00-8e0e-9acb7f8c19cd", "email": "st1000@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd82fc25f-6cb5-5a00-8e0e-9acb7f8c19cd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d82fc25f-6cb5-5a00-8e0e-9acb7f8c19cd', 'admin', 'st1000@boss.com', 'Admin Hotel Aida', 'Hotel Aida', 'Hotel Aida, Kottayam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6ebbdc60-23ad-5721-8f91-3fdc11304cde', 'd82fc25f-6cb5-5a00-8e0e-9acb7f8c19cd', 'Hotel Aida', 'Hotel Aida, Kottayam, Kerala, India', 9.582880476, 76.52168622, 'India EV Network License', 'LIC-IN-ST1000', 500.0, 7.4, true, 'Kottayam', 'Kerala', 1, 'Zeon Charging', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6ebbdc60-23ad-5721-8f91-3fdc11304cde';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b0ca2ff6-370c-5a9a-a835-6368d6ca28e6', '6ebbdc60-23ad-5721-8f91-3fdc11304cde', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
