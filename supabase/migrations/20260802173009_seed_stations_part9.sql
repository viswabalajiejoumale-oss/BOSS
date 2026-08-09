-- Seed Stations Part 9 (Stations 801 to 900)
BEGIN;

-- Station 801: Evee Buddy - ChargeMOD (Lakkidi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e283de71-6fde-5907-936e-3d4efd6ec939', '00000000-0000-0000-0000-000000000000', 'st801@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st801@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e283de71-6fde-5907-936e-3d4efd6ec939', 'e283de71-6fde-5907-936e-3d4efd6ec939', '{"sub": "e283de71-6fde-5907-936e-3d4efd6ec939", "email": "st801@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e283de71-6fde-5907-936e-3d4efd6ec939')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e283de71-6fde-5907-936e-3d4efd6ec939', 'admin', 'st801@boss.com', 'Admin Evee Buddy - ChargeMOD', 'Evee Buddy - ChargeMOD', 'Evee Buddy - ChargeMOD, Lakkidi, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6bb36b82-c117-551b-8813-a70424a75424', 'e283de71-6fde-5907-936e-3d4efd6ec939', 'Evee Buddy - ChargeMOD', 'Evee Buddy - ChargeMOD, Lakkidi, Kerala, India', 10.77814249, 76.43743038, 'India EV Network License', 'LIC-IN-ST801', 500.0, 30.0, true, 'Lakkidi', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6bb36b82-c117-551b-8813-a70424a75424';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7443d7de-a78c-50c9-b8f1-288c14e867b3', '6bb36b82-c117-551b-8813-a70424a75424', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 802: Kulappully KSEB EVCS - ChargeMOD (Kulappully, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4d20f8b3-23ad-5224-87d8-c397254f766c', '00000000-0000-0000-0000-000000000000', 'st802@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st802@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4d20f8b3-23ad-5224-87d8-c397254f766c', '4d20f8b3-23ad-5224-87d8-c397254f766c', '{"sub": "4d20f8b3-23ad-5224-87d8-c397254f766c", "email": "st802@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4d20f8b3-23ad-5224-87d8-c397254f766c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4d20f8b3-23ad-5224-87d8-c397254f766c', 'admin', 'st802@boss.com', 'Admin Kulappully KSEB EVCS - ChargeMOD', 'Kulappully KSEB EVCS - ChargeMOD', 'Kulappully KSEB EVCS - ChargeMOD, Kulappully, Kerala, India', 500.0, 9, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3850aaee-4d65-5fd3-bb7b-df4528d7308d', '4d20f8b3-23ad-5224-87d8-c397254f766c', 'Kulappully KSEB EVCS - ChargeMOD', 'Kulappully KSEB EVCS - ChargeMOD, Kulappully, Kerala, India', 10.77974601, 76.28528086, 'India EV Network License', 'LIC-IN-ST802', 500.0, 30.0, true, 'Kulappully', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3850aaee-4d65-5fd3-bb7b-df4528d7308d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dfcfa4c2-aed1-5d82-b63a-1c7775f86799', '3850aaee-4d65-5fd3-bb7b-df4528d7308d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 803: Syndicate Mall and Cinemas (Koppam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('dff3d586-c2d6-59d5-9d7e-f79c601c0b83', '00000000-0000-0000-0000-000000000000', 'st803@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st803@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('dff3d586-c2d6-59d5-9d7e-f79c601c0b83', 'dff3d586-c2d6-59d5-9d7e-f79c601c0b83', '{"sub": "dff3d586-c2d6-59d5-9d7e-f79c601c0b83", "email": "st803@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'dff3d586-c2d6-59d5-9d7e-f79c601c0b83')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('dff3d586-c2d6-59d5-9d7e-f79c601c0b83', 'admin', 'st803@boss.com', 'Admin Syndicate Mall and Cinemas', 'Syndicate Mall and Cinemas', 'Syndicate Mall and Cinemas, Koppam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8516eb4c-5f3b-5910-801e-b175f0b7394b', 'dff3d586-c2d6-59d5-9d7e-f79c601c0b83', 'Syndicate Mall and Cinemas', 'Syndicate Mall and Cinemas, Koppam, Kerala, India', 10.87826592, 76.18760662, 'India EV Network License', 'LIC-IN-ST803', 500.0, 7.4, true, 'Koppam', 'Kerala', 1, 'ChargeMod (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8516eb4c-5f3b-5910-801e-b175f0b7394b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ded0ce63-3ab9-51fb-89b9-27ed2413a460', '8516eb4c-5f3b-5910-801e-b175f0b7394b', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 804: Medi Mall EVCS - ChargeMOD (Pattambi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3378ba7b-9e17-54dc-91cd-e86c13b3e96a', '00000000-0000-0000-0000-000000000000', 'st804@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st804@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3378ba7b-9e17-54dc-91cd-e86c13b3e96a', '3378ba7b-9e17-54dc-91cd-e86c13b3e96a', '{"sub": "3378ba7b-9e17-54dc-91cd-e86c13b3e96a", "email": "st804@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3378ba7b-9e17-54dc-91cd-e86c13b3e96a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3378ba7b-9e17-54dc-91cd-e86c13b3e96a', 'admin', 'st804@boss.com', 'Admin Medi Mall EVCS - ChargeMOD', 'Medi Mall EVCS - ChargeMOD', 'Medi Mall EVCS - ChargeMOD, Pattambi, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2a8ef871-faf8-51fa-9e8f-02daf411f598', '3378ba7b-9e17-54dc-91cd-e86c13b3e96a', 'Medi Mall EVCS - ChargeMOD', 'Medi Mall EVCS - ChargeMOD, Pattambi, Kerala, India', 10.80158611, 76.17840843, 'India EV Network License', 'LIC-IN-ST804', 500.0, 30.0, true, 'Pattambi', 'Kerala', 1, 'ChargeMod (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2a8ef871-faf8-51fa-9e8f-02daf411f598';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b4880aff-00e9-5087-ad5b-04b2f4affa85', '2a8ef871-faf8-51fa-9e8f-02daf411f598', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 805: Koottanad KSEB EVCS - ChargeMOD (Kootanad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e49f81da-2ce2-5775-a40c-f8aebb010f16', '00000000-0000-0000-0000-000000000000', 'st805@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st805@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e49f81da-2ce2-5775-a40c-f8aebb010f16', 'e49f81da-2ce2-5775-a40c-f8aebb010f16', '{"sub": "e49f81da-2ce2-5775-a40c-f8aebb010f16", "email": "st805@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e49f81da-2ce2-5775-a40c-f8aebb010f16')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e49f81da-2ce2-5775-a40c-f8aebb010f16', 'admin', 'st805@boss.com', 'Admin Koottanad KSEB EVCS - ChargeMOD', 'Koottanad KSEB EVCS - ChargeMOD', 'Koottanad KSEB EVCS - ChargeMOD, Kootanad, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fe700b66-7f24-5183-a576-256e28ebdf5d', 'e49f81da-2ce2-5775-a40c-f8aebb010f16', 'Koottanad KSEB EVCS - ChargeMOD', 'Koottanad KSEB EVCS - ChargeMOD, Kootanad, Kerala, India', 10.7582932, 76.13036645, 'India EV Network License', 'LIC-IN-ST805', 500.0, 30.0, true, 'Kootanad', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fe700b66-7f24-5183-a576-256e28ebdf5d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0b73942f-4951-5a6c-a7eb-82f86d678501', 'fe700b66-7f24-5183-a576-256e28ebdf5d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 806: Sihla Energy EVCS - ChargeMOD (Changaramkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5849bea0-52ef-5a15-ac8e-2597ee7b30b9', '00000000-0000-0000-0000-000000000000', 'st806@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st806@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5849bea0-52ef-5a15-ac8e-2597ee7b30b9', '5849bea0-52ef-5a15-ac8e-2597ee7b30b9', '{"sub": "5849bea0-52ef-5a15-ac8e-2597ee7b30b9", "email": "st806@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5849bea0-52ef-5a15-ac8e-2597ee7b30b9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5849bea0-52ef-5a15-ac8e-2597ee7b30b9', 'admin', 'st806@boss.com', 'Admin Sihla Energy EVCS - ChargeMOD', 'Sihla Energy EVCS - ChargeMOD', 'Sihla Energy EVCS - ChargeMOD, Changaramkulam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('79e50aba-12c2-5009-ba97-ecf9fe365ce7', '5849bea0-52ef-5a15-ac8e-2597ee7b30b9', 'Sihla Energy EVCS - ChargeMOD', 'Sihla Energy EVCS - ChargeMOD, Changaramkulam, Kerala, India', 10.73455196, 76.04864669, 'India EV Network License', 'LIC-IN-ST806', 500.0, 30.0, true, 'Changaramkulam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '79e50aba-12c2-5009-ba97-ecf9fe365ce7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2a6722c5-f5a3-5e54-8311-a99bc50bdd2c', '79e50aba-12c2-5009-ba97-ecf9fe365ce7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 807: Kadharkkante Chayakkada - ChargeMOD (Changaramkulam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9bc6fe0e-87a4-55b5-b491-8339da09edb7', '00000000-0000-0000-0000-000000000000', 'st807@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st807@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9bc6fe0e-87a4-55b5-b491-8339da09edb7', '9bc6fe0e-87a4-55b5-b491-8339da09edb7', '{"sub": "9bc6fe0e-87a4-55b5-b491-8339da09edb7", "email": "st807@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9bc6fe0e-87a4-55b5-b491-8339da09edb7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9bc6fe0e-87a4-55b5-b491-8339da09edb7', 'admin', 'st807@boss.com', 'Admin Kadharkkante Chayakkada - ChargeMOD', 'Kadharkkante Chayakkada - ChargeMOD', 'Kadharkkante Chayakkada - ChargeMOD, Changaramkulam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2f83d8ec-b205-531f-a68a-ee3271b8b0af', '9bc6fe0e-87a4-55b5-b491-8339da09edb7', 'Kadharkkante Chayakkada - ChargeMOD', 'Kadharkkante Chayakkada - ChargeMOD, Changaramkulam, Kerala, India', 10.73260554, 76.03743007, 'India EV Network License', 'LIC-IN-ST807', 500.0, 30.0, true, 'Changaramkulam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2f83d8ec-b205-531f-a68a-ee3271b8b0af';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4e050fb3-c6a9-5b13-afe1-4a7dd2e3d5c3', '2f83d8ec-b205-531f-a68a-ee3271b8b0af', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 808: Maranchery Bank EVCS - ChargeMOD (Maranchery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7afc55aa-466f-5ec6-a2d1-d0221638221d', '00000000-0000-0000-0000-000000000000', 'st808@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st808@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7afc55aa-466f-5ec6-a2d1-d0221638221d', '7afc55aa-466f-5ec6-a2d1-d0221638221d', '{"sub": "7afc55aa-466f-5ec6-a2d1-d0221638221d", "email": "st808@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7afc55aa-466f-5ec6-a2d1-d0221638221d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7afc55aa-466f-5ec6-a2d1-d0221638221d', 'admin', 'st808@boss.com', 'Admin Maranchery Bank EVCS - ChargeMOD', 'Maranchery Bank EVCS - ChargeMOD', 'Maranchery Bank EVCS - ChargeMOD, Maranchery, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('280cb994-c655-567f-a6b7-762f66cfbc28', '7afc55aa-466f-5ec6-a2d1-d0221638221d', 'Maranchery Bank EVCS - ChargeMOD', 'Maranchery Bank EVCS - ChargeMOD, Maranchery, Kerala, India', 10.73382407, 75.97481312, 'India EV Network License', 'LIC-IN-ST808', 500.0, 30.0, true, 'Maranchery', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '280cb994-c655-567f-a6b7-762f66cfbc28';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1e2cd954-88dd-5ea2-931c-7ed1b43c6a14', '280cb994-c655-567f-a6b7-762f66cfbc28', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 809: Sihla Energy CV Junction (Ponnanu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3b34623f-ba22-5339-93f8-b792a60fa5e9', '00000000-0000-0000-0000-000000000000', 'st809@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st809@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3b34623f-ba22-5339-93f8-b792a60fa5e9', '3b34623f-ba22-5339-93f8-b792a60fa5e9', '{"sub": "3b34623f-ba22-5339-93f8-b792a60fa5e9", "email": "st809@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3b34623f-ba22-5339-93f8-b792a60fa5e9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3b34623f-ba22-5339-93f8-b792a60fa5e9', 'admin', 'st809@boss.com', 'Admin Sihla Energy CV Junction', 'Sihla Energy CV Junction', 'Sihla Energy CV Junction, Ponnanu, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e52dc2ea-4840-5bc7-9a06-00b3e64de7ef', '3b34623f-ba22-5339-93f8-b792a60fa5e9', 'Sihla Energy CV Junction', 'Sihla Energy CV Junction, Ponnanu, Kerala, India', 10.78474624, 75.94715236, 'India EV Network License', 'LIC-IN-ST809', 500.0, 7.4, true, 'Ponnanu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e52dc2ea-4840-5bc7-9a06-00b3e64de7ef';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ce555c5b-ae6d-574b-a250-8fd24a362b78', 'e52dc2ea-4840-5bc7-9a06-00b3e64de7ef', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 810: Ponnani KSEB EVCS - ChargeMOD (Ponnani, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ca6b74f9-2c30-5606-85a8-04d650df72c8', '00000000-0000-0000-0000-000000000000', 'st810@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st810@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ca6b74f9-2c30-5606-85a8-04d650df72c8', 'ca6b74f9-2c30-5606-85a8-04d650df72c8', '{"sub": "ca6b74f9-2c30-5606-85a8-04d650df72c8", "email": "st810@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ca6b74f9-2c30-5606-85a8-04d650df72c8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ca6b74f9-2c30-5606-85a8-04d650df72c8', 'admin', 'st810@boss.com', 'Admin Ponnani KSEB EVCS - ChargeMOD', 'Ponnani KSEB EVCS - ChargeMOD', 'Ponnani KSEB EVCS - ChargeMOD, Ponnani, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7f13f63f-677e-56cb-be49-d62b07227a27', 'ca6b74f9-2c30-5606-85a8-04d650df72c8', 'Ponnani KSEB EVCS - ChargeMOD', 'Ponnani KSEB EVCS - ChargeMOD, Ponnani, Kerala, India', 10.77270263, 75.9471515, 'India EV Network License', 'LIC-IN-ST810', 500.0, 30.0, true, 'Ponnani', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7f13f63f-677e-56cb-be49-d62b07227a27';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bdefe929-0dc4-5e07-9de3-ad84098a55bb', '7f13f63f-677e-56cb-be49-d62b07227a27', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 811: Flash Charge EVCS - ChargeMOD (Erumappetti, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('41571872-37ee-5004-a7bf-466cad56244b', '00000000-0000-0000-0000-000000000000', 'st811@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st811@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('41571872-37ee-5004-a7bf-466cad56244b', '41571872-37ee-5004-a7bf-466cad56244b', '{"sub": "41571872-37ee-5004-a7bf-466cad56244b", "email": "st811@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '41571872-37ee-5004-a7bf-466cad56244b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('41571872-37ee-5004-a7bf-466cad56244b', 'admin', 'st811@boss.com', 'Admin Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD, Erumappetti, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0b451739-1bc1-5ef5-a059-be3c1698944b', '41571872-37ee-5004-a7bf-466cad56244b', 'Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD, Erumappetti, Kerala, India', 10.68134082, 76.16966999, 'India EV Network License', 'LIC-IN-ST811', 500.0, 30.0, true, 'Erumappetti', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0b451739-1bc1-5ef5-a059-be3c1698944b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('56fcf72b-d377-5750-8c58-fbb051c653de', '0b451739-1bc1-5ef5-a059-be3c1698944b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 812: SR Power Hub - ChargeMOD (Wadakkanchery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('681b46d9-ef4f-5de4-b9f4-b6cb136a0c54', '00000000-0000-0000-0000-000000000000', 'st812@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st812@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('681b46d9-ef4f-5de4-b9f4-b6cb136a0c54', '681b46d9-ef4f-5de4-b9f4-b6cb136a0c54', '{"sub": "681b46d9-ef4f-5de4-b9f4-b6cb136a0c54", "email": "st812@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '681b46d9-ef4f-5de4-b9f4-b6cb136a0c54')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('681b46d9-ef4f-5de4-b9f4-b6cb136a0c54', 'admin', 'st812@boss.com', 'Admin SR Power Hub - ChargeMOD', 'SR Power Hub - ChargeMOD', 'SR Power Hub - ChargeMOD, Wadakkanchery, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b2dd448d-5227-5ef3-b6b5-252adcef9978', '681b46d9-ef4f-5de4-b9f4-b6cb136a0c54', 'SR Power Hub - ChargeMOD', 'SR Power Hub - ChargeMOD, Wadakkanchery, Kerala, India', 10.64441131, 76.23665238, 'India EV Network License', 'LIC-IN-ST812', 500.0, 30.0, true, 'Wadakkanchery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b2dd448d-5227-5ef3-b6b5-252adcef9978';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('97795a07-c684-5e0d-b682-80d46eeb764a', 'b2dd448d-5227-5ef3-b6b5-252adcef9978', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 813: Executive EVCS - ChargeMOD (Kechery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7e1a9f66-b4d0-5a11-8f44-2d1bcb482b26', '00000000-0000-0000-0000-000000000000', 'st813@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st813@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7e1a9f66-b4d0-5a11-8f44-2d1bcb482b26', '7e1a9f66-b4d0-5a11-8f44-2d1bcb482b26', '{"sub": "7e1a9f66-b4d0-5a11-8f44-2d1bcb482b26", "email": "st813@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7e1a9f66-b4d0-5a11-8f44-2d1bcb482b26')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7e1a9f66-b4d0-5a11-8f44-2d1bcb482b26', 'admin', 'st813@boss.com', 'Admin Executive EVCS - ChargeMOD', 'Executive EVCS - ChargeMOD', 'Executive EVCS - ChargeMOD, Kechery, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('52ab54e4-dc51-5247-9632-338026ece160', '7e1a9f66-b4d0-5a11-8f44-2d1bcb482b26', 'Executive EVCS - ChargeMOD', 'Executive EVCS - ChargeMOD, Kechery, Kerala, India', 10.61662659, 76.12578392, 'India EV Network License', 'LIC-IN-ST813', 500.0, 30.0, true, 'Kechery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '52ab54e4-dc51-5247-9632-338026ece160';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6e851179-7f25-59ca-b015-d1716ac874e2', '52ab54e4-dc51-5247-9632-338026ece160', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 814: Core Multicusine Restaurant - ChargeMOD (Killannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fe606a47-6bee-57f0-8888-e5d5813a1b3c', '00000000-0000-0000-0000-000000000000', 'st814@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st814@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fe606a47-6bee-57f0-8888-e5d5813a1b3c', 'fe606a47-6bee-57f0-8888-e5d5813a1b3c', '{"sub": "fe606a47-6bee-57f0-8888-e5d5813a1b3c", "email": "st814@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fe606a47-6bee-57f0-8888-e5d5813a1b3c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fe606a47-6bee-57f0-8888-e5d5813a1b3c', 'admin', 'st814@boss.com', 'Admin Core Multicusine Restaurant - ChargeMOD', 'Core Multicusine Restaurant - ChargeMOD', 'Core Multicusine Restaurant - ChargeMOD, Killannur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('11f0edb0-1dc5-55fb-ab84-c3f35b50da66', 'fe606a47-6bee-57f0-8888-e5d5813a1b3c', 'Core Multicusine Restaurant - ChargeMOD', 'Core Multicusine Restaurant - ChargeMOD, Killannur, Kerala, India', 10.60582367, 76.21178763, 'India EV Network License', 'LIC-IN-ST814', 500.0, 30.0, true, 'Killannur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '11f0edb0-1dc5-55fb-ab84-c3f35b50da66';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d787d319-c91d-5a4d-996c-e35446f6dd31', '11f0edb0-1dc5-55fb-ab84-c3f35b50da66', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 815: Plug and Share Charge EVCS - ChargeMOD (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('30beac8d-75a6-5357-ba8a-dca8e2f5f9a4', '00000000-0000-0000-0000-000000000000', 'st815@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st815@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('30beac8d-75a6-5357-ba8a-dca8e2f5f9a4', '30beac8d-75a6-5357-ba8a-dca8e2f5f9a4', '{"sub": "30beac8d-75a6-5357-ba8a-dca8e2f5f9a4", "email": "st815@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '30beac8d-75a6-5357-ba8a-dca8e2f5f9a4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('30beac8d-75a6-5357-ba8a-dca8e2f5f9a4', 'admin', 'st815@boss.com', 'Admin Plug and Share Charge EVCS - ChargeMOD', 'Plug and Share Charge EVCS - ChargeMOD', 'Plug and Share Charge EVCS - ChargeMOD, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2307a599-5b0a-59e1-84fa-231d22ce6fb1', '30beac8d-75a6-5357-ba8a-dca8e2f5f9a4', 'Plug and Share Charge EVCS - ChargeMOD', 'Plug and Share Charge EVCS - ChargeMOD, Thrissur, Kerala, India', 10.54056179, 76.21568678, 'India EV Network License', 'LIC-IN-ST815', 500.0, 30.0, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2307a599-5b0a-59e1-84fa-231d22ce6fb1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b9b5bbc1-60a4-5af0-a336-72b771032371', '2307a599-5b0a-59e1-84fa-231d22ce6fb1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 816: Vydyuthi Bhavan KSEB EVCS - ChargeMOD (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5b9bc07e-61bc-5237-87b3-1271a946ed9d', '00000000-0000-0000-0000-000000000000', 'st816@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st816@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5b9bc07e-61bc-5237-87b3-1271a946ed9d', '5b9bc07e-61bc-5237-87b3-1271a946ed9d', '{"sub": "5b9bc07e-61bc-5237-87b3-1271a946ed9d", "email": "st816@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5b9bc07e-61bc-5237-87b3-1271a946ed9d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5b9bc07e-61bc-5237-87b3-1271a946ed9d', 'admin', 'st816@boss.com', 'Admin Vydyuthi Bhavan KSEB EVCS - ChargeMOD', 'Vydyuthi Bhavan KSEB EVCS - ChargeMOD', 'Vydyuthi Bhavan KSEB EVCS - ChargeMOD, Thrissur, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6299b68a-d432-5a79-a621-8488a9295a1d', '5b9bc07e-61bc-5237-87b3-1271a946ed9d', 'Vydyuthi Bhavan KSEB EVCS - ChargeMOD', 'Vydyuthi Bhavan KSEB EVCS - ChargeMOD, Thrissur, Kerala, India', 10.52779471, 76.20534385, 'India EV Network License', 'LIC-IN-ST816', 500.0, 30.0, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6299b68a-d432-5a79-a621-8488a9295a1d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('55b497e2-a672-5319-9ef6-1349fdfbe82e', '6299b68a-d432-5a79-a621-8488a9295a1d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 817: V8 Car Spa (EVOK) - ChargeMOD (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4433ba75-a37c-5d83-9782-6db5847d8f94', '00000000-0000-0000-0000-000000000000', 'st817@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st817@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4433ba75-a37c-5d83-9782-6db5847d8f94', '4433ba75-a37c-5d83-9782-6db5847d8f94', '{"sub": "4433ba75-a37c-5d83-9782-6db5847d8f94", "email": "st817@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4433ba75-a37c-5d83-9782-6db5847d8f94')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4433ba75-a37c-5d83-9782-6db5847d8f94', 'admin', 'st817@boss.com', 'Admin V8 Car Spa (EVOK) - ChargeMOD', 'V8 Car Spa (EVOK) - ChargeMOD', 'V8 Car Spa (EVOK) - ChargeMOD, Thrissur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7713faad-c7f6-5056-9046-2cd36bbf0559', '4433ba75-a37c-5d83-9782-6db5847d8f94', 'V8 Car Spa (EVOK) - ChargeMOD', 'V8 Car Spa (EVOK) - ChargeMOD, Thrissur, Kerala, India', 10.5213323, 76.23075685, 'India EV Network License', 'LIC-IN-ST817', 500.0, 30.0, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7713faad-c7f6-5056-9046-2cd36bbf0559';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('44468025-7909-552a-99d8-e4d43eb87733', '7713faad-c7f6-5056-9046-2cd36bbf0559', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 818: Guardian EV Charging Station by Imminent Future - ChargeMOD (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6920a3d5-c154-5f48-8563-06d878e1e0f4', '00000000-0000-0000-0000-000000000000', 'st818@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st818@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6920a3d5-c154-5f48-8563-06d878e1e0f4', '6920a3d5-c154-5f48-8563-06d878e1e0f4', '{"sub": "6920a3d5-c154-5f48-8563-06d878e1e0f4", "email": "st818@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6920a3d5-c154-5f48-8563-06d878e1e0f4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6920a3d5-c154-5f48-8563-06d878e1e0f4', 'admin', 'st818@boss.com', 'Admin Guardian EV Charging Station by Imminent Future - ChargeMOD', 'Guardian EV Charging Station by Imminent Future - ChargeMOD', 'Guardian EV Charging Station by Imminent Future - ChargeMOD, Thrissur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, created_at)
VALUES ('d145a430-7af2-59d2-a38d-6179372595d6', '6920a3d5-c154-5f48-8563-06d878e1e0f4', 'Guardian EV Charging Station by Imminent Future - ChargeMOD', 'Guardian EV Charging Station by Imminent Future - ChargeMOD, Thrissur, Kerala, India', 10.52203616, 76.2275689, 'India EV Network License', 'LIC-IN-ST818', 500.0, 24.0, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1e68e556-f81e-5225-b93d-3874c3d8d26f', 'd145a430-7af2-59d2-a38d-6179372595d6', 'Port A', 50, 'available', 0, 'CHAdeMO', now())
ON CONFLICT (id) DO NOTHING;

-- Station 819: Anchorage AC - ChargeMOD (Mundupalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('77b67a91-7902-514d-98dd-f7e06c4c69fc', '00000000-0000-0000-0000-000000000000', 'st819@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st819@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('77b67a91-7902-514d-98dd-f7e06c4c69fc', '77b67a91-7902-514d-98dd-f7e06c4c69fc', '{"sub": "77b67a91-7902-514d-98dd-f7e06c4c69fc", "email": "st819@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '77b67a91-7902-514d-98dd-f7e06c4c69fc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('77b67a91-7902-514d-98dd-f7e06c4c69fc', 'admin', 'st819@boss.com', 'Admin Anchorage AC - ChargeMOD', 'Anchorage AC - ChargeMOD', 'Anchorage AC - ChargeMOD, Mundupalam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9a2616a0-1003-5645-bbf6-09cfb27a7f24', '77b67a91-7902-514d-98dd-f7e06c4c69fc', 'Anchorage AC - ChargeMOD', 'Anchorage AC - ChargeMOD, Mundupalam, Kerala, India', 10.51150301, 76.22112426, 'India EV Network License', 'LIC-IN-ST819', 500.0, 30.0, true, 'Mundupalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9a2616a0-1003-5645-bbf6-09cfb27a7f24';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('41f2efa2-0b8d-5248-9689-2c7729319438', '9a2616a0-1003-5645-bbf6-09cfb27a7f24', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 820: Flash Hub EVCS - ChargeMOD (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('378d3e2d-0cca-5c1c-ae3e-051291a733c2', '00000000-0000-0000-0000-000000000000', 'st820@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st820@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('378d3e2d-0cca-5c1c-ae3e-051291a733c2', '378d3e2d-0cca-5c1c-ae3e-051291a733c2', '{"sub": "378d3e2d-0cca-5c1c-ae3e-051291a733c2", "email": "st820@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '378d3e2d-0cca-5c1c-ae3e-051291a733c2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('378d3e2d-0cca-5c1c-ae3e-051291a733c2', 'admin', 'st820@boss.com', 'Admin Flash Hub EVCS - ChargeMOD', 'Flash Hub EVCS - ChargeMOD', 'Flash Hub EVCS - ChargeMOD, Thrissur, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f7f14eb3-a38a-5d10-a64f-f4671c49130b', '378d3e2d-0cca-5c1c-ae3e-051291a733c2', 'Flash Hub EVCS - ChargeMOD', 'Flash Hub EVCS - ChargeMOD, Thrissur, Kerala, India', 10.50445167, 76.22534147, 'India EV Network License', 'LIC-IN-ST820', 500.0, 30.0, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f7f14eb3-a38a-5d10-a64f-f4671c49130b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('afcf0420-c3aa-5db7-ac9d-0933be994bc6', 'f7f14eb3-a38a-5d10-a64f-f4671c49130b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 821: Hotel Bhavan EVCS (EVOK) - ChargeMOD (Engandiyoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f6efd9fb-49b2-518a-b328-63a3ada9baa1', '00000000-0000-0000-0000-000000000000', 'st821@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st821@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f6efd9fb-49b2-518a-b328-63a3ada9baa1', 'f6efd9fb-49b2-518a-b328-63a3ada9baa1', '{"sub": "f6efd9fb-49b2-518a-b328-63a3ada9baa1", "email": "st821@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f6efd9fb-49b2-518a-b328-63a3ada9baa1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f6efd9fb-49b2-518a-b328-63a3ada9baa1', 'admin', 'st821@boss.com', 'Admin Hotel Bhavan EVCS (EVOK) - ChargeMOD', 'Hotel Bhavan EVCS (EVOK) - ChargeMOD', 'Hotel Bhavan EVCS (EVOK) - ChargeMOD, Engandiyoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ebff07a4-9b7c-5c47-9aab-2dfb0e739e34', 'f6efd9fb-49b2-518a-b328-63a3ada9baa1', 'Hotel Bhavan EVCS (EVOK) - ChargeMOD', 'Hotel Bhavan EVCS (EVOK) - ChargeMOD, Engandiyoor, Kerala, India', 10.49768853, 76.06464226, 'India EV Network License', 'LIC-IN-ST821', 500.0, 30.0, true, 'Engandiyoor', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ebff07a4-9b7c-5c47-9aab-2dfb0e739e34';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('24890158-9307-5a88-ab20-65ec45a5745d', 'ebff07a4-9b7c-5c47-9aab-2dfb0e739e34', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 822: Surya Hotel (EVOK) - ChargeMOD (Chazhoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c60f8e74-f91a-5ef4-9f8f-2f64c0c4ef07', '00000000-0000-0000-0000-000000000000', 'st822@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st822@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c60f8e74-f91a-5ef4-9f8f-2f64c0c4ef07', 'c60f8e74-f91a-5ef4-9f8f-2f64c0c4ef07', '{"sub": "c60f8e74-f91a-5ef4-9f8f-2f64c0c4ef07", "email": "st822@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c60f8e74-f91a-5ef4-9f8f-2f64c0c4ef07')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c60f8e74-f91a-5ef4-9f8f-2f64c0c4ef07', 'admin', 'st822@boss.com', 'Admin Surya Hotel (EVOK) - ChargeMOD', 'Surya Hotel (EVOK) - ChargeMOD', 'Surya Hotel (EVOK) - ChargeMOD, Chazhoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('761fac13-3783-56a7-b7db-dfa0762a7c2b', 'c60f8e74-f91a-5ef4-9f8f-2f64c0c4ef07', 'Surya Hotel (EVOK) - ChargeMOD', 'Surya Hotel (EVOK) - ChargeMOD, Chazhoor, Kerala, India', 10.43156926, 76.14255951, 'India EV Network License', 'LIC-IN-ST822', 500.0, 30.0, true, 'Chazhoor', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '761fac13-3783-56a7-b7db-dfa0762a7c2b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('107e3885-bd11-509b-9764-65dd5eab9c9a', '761fac13-3783-56a7-b7db-dfa0762a7c2b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 823: Valappad KSEB EVCS - ChargeMOD (Valappad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4f947068-99e8-5118-a2fe-632fe1e37137', '00000000-0000-0000-0000-000000000000', 'st823@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st823@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4f947068-99e8-5118-a2fe-632fe1e37137', '4f947068-99e8-5118-a2fe-632fe1e37137', '{"sub": "4f947068-99e8-5118-a2fe-632fe1e37137", "email": "st823@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4f947068-99e8-5118-a2fe-632fe1e37137')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4f947068-99e8-5118-a2fe-632fe1e37137', 'admin', 'st823@boss.com', 'Admin Valappad KSEB EVCS - ChargeMOD', 'Valappad KSEB EVCS - ChargeMOD', 'Valappad KSEB EVCS - ChargeMOD, Valappad, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('67cd8b54-3681-543b-8ba7-d6319b7d951a', '4f947068-99e8-5118-a2fe-632fe1e37137', 'Valappad KSEB EVCS - ChargeMOD', 'Valappad KSEB EVCS - ChargeMOD, Valappad, Kerala, India', 10.40173221, 76.11933512, 'India EV Network License', 'LIC-IN-ST823', 500.0, 30.0, true, 'Valappad', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '67cd8b54-3681-543b-8ba7-d6319b7d951a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f602b547-2844-5b63-9c63-b2f4d4c1fb7e', '67cd8b54-3681-543b-8ba7-d6319b7d951a', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 824: Nattika FIRKA Service Co-Operative Bank - ChargeMOD (Nattika, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('35475bb7-a8e1-512c-a88e-713b45a1e98a', '00000000-0000-0000-0000-000000000000', 'st824@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st824@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('35475bb7-a8e1-512c-a88e-713b45a1e98a', '35475bb7-a8e1-512c-a88e-713b45a1e98a', '{"sub": "35475bb7-a8e1-512c-a88e-713b45a1e98a", "email": "st824@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '35475bb7-a8e1-512c-a88e-713b45a1e98a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('35475bb7-a8e1-512c-a88e-713b45a1e98a', 'admin', 'st824@boss.com', 'Admin Nattika FIRKA Service Co-Operative Bank - ChargeMOD', 'Nattika FIRKA Service Co-Operative Bank - ChargeMOD', 'Nattika FIRKA Service Co-Operative Bank - ChargeMOD, Nattika, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f2c9fa0b-4983-5ea7-a726-f63f8d89d3e6', '35475bb7-a8e1-512c-a88e-713b45a1e98a', 'Nattika FIRKA Service Co-Operative Bank - ChargeMOD', 'Nattika FIRKA Service Co-Operative Bank - ChargeMOD, Nattika, Kerala, India', 10.40243778, 76.11263308, 'India EV Network License', 'LIC-IN-ST824', 500.0, 30.0, true, 'Nattika', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f2c9fa0b-4983-5ea7-a726-f63f8d89d3e6';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a72b196c-957c-58b7-ad0f-7b645ef39e48', 'f2c9fa0b-4983-5ea7-a726-f63f8d89d3e6', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 825: Sihla Energy EVCS - ChargeMOD (Karuvannur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e6ab6d55-65d1-5467-8a19-a344bef4dd1f', '00000000-0000-0000-0000-000000000000', 'st825@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st825@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e6ab6d55-65d1-5467-8a19-a344bef4dd1f', 'e6ab6d55-65d1-5467-8a19-a344bef4dd1f', '{"sub": "e6ab6d55-65d1-5467-8a19-a344bef4dd1f", "email": "st825@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e6ab6d55-65d1-5467-8a19-a344bef4dd1f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e6ab6d55-65d1-5467-8a19-a344bef4dd1f', 'admin', 'st825@boss.com', 'Admin Sihla Energy EVCS - ChargeMOD', 'Sihla Energy EVCS - ChargeMOD', 'Sihla Energy EVCS - ChargeMOD, Karuvannur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d3d5e333-49d0-50fe-bb7b-0ac4ecf46bcb', 'e6ab6d55-65d1-5467-8a19-a344bef4dd1f', 'Sihla Energy EVCS - ChargeMOD', 'Sihla Energy EVCS - ChargeMOD, Karuvannur, Kerala, India', 10.408609, 76.2140256, 'India EV Network License', 'LIC-IN-ST825', 500.0, 30.0, true, 'Karuvannur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd3d5e333-49d0-50fe-bb7b-0ac4ecf46bcb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4dd96a73-436d-5552-bb90-de6d1401aee8', 'd3d5e333-49d0-50fe-bb7b-0ac4ecf46bcb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 826: Irinjalakkuda KSEB EVCS - ChargeMOD (Irinjalakkuda, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('55e36827-28e3-5eea-a20a-79fce6986129', '00000000-0000-0000-0000-000000000000', 'st826@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st826@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('55e36827-28e3-5eea-a20a-79fce6986129', '55e36827-28e3-5eea-a20a-79fce6986129', '{"sub": "55e36827-28e3-5eea-a20a-79fce6986129", "email": "st826@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '55e36827-28e3-5eea-a20a-79fce6986129')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('55e36827-28e3-5eea-a20a-79fce6986129', 'admin', 'st826@boss.com', 'Admin Irinjalakkuda KSEB EVCS - ChargeMOD', 'Irinjalakkuda KSEB EVCS - ChargeMOD', 'Irinjalakkuda KSEB EVCS - ChargeMOD, Irinjalakkuda, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3688516c-bf30-5284-86c6-92451efe297f', '55e36827-28e3-5eea-a20a-79fce6986129', 'Irinjalakkuda KSEB EVCS - ChargeMOD', 'Irinjalakkuda KSEB EVCS - ChargeMOD, Irinjalakkuda, Kerala, India', 10.3314231, 76.21526077, 'India EV Network License', 'LIC-IN-ST826', 500.0, 30.0, true, 'Irinjalakkuda', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3688516c-bf30-5284-86c6-92451efe297f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('124302d5-7add-5ef3-b6eb-67e5d4828850', '3688516c-bf30-5284-86c6-92451efe297f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 827: Changathikoottam EVCS - ChargeMOD (Nenmara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f7ed1726-79e6-5858-a1ee-49fbb209de59', '00000000-0000-0000-0000-000000000000', 'st827@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st827@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f7ed1726-79e6-5858-a1ee-49fbb209de59', 'f7ed1726-79e6-5858-a1ee-49fbb209de59', '{"sub": "f7ed1726-79e6-5858-a1ee-49fbb209de59", "email": "st827@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f7ed1726-79e6-5858-a1ee-49fbb209de59')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f7ed1726-79e6-5858-a1ee-49fbb209de59', 'admin', 'st827@boss.com', 'Admin Changathikoottam EVCS - ChargeMOD', 'Changathikoottam EVCS - ChargeMOD', 'Changathikoottam EVCS - ChargeMOD, Nenmara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('1028d46a-162c-5b6e-9930-690ab5e6e67f', 'f7ed1726-79e6-5858-a1ee-49fbb209de59', 'Changathikoottam EVCS - ChargeMOD', 'Changathikoottam EVCS - ChargeMOD, Nenmara, Kerala, India', 10.59340334, 76.5835252, 'India EV Network License', 'LIC-IN-ST827', 500.0, 30.0, true, 'Nenmara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '1028d46a-162c-5b6e-9930-690ab5e6e67f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d911b304-79f6-5fc6-9ba2-a94ad7d320d2', '1028d46a-162c-5b6e-9930-690ab5e6e67f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 828: Vadakkenchery KSEB EVCS - ChargeMOD (Vadakkenchery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('35913781-eb29-5272-8e3b-ba302f00567c', '00000000-0000-0000-0000-000000000000', 'st828@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st828@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('35913781-eb29-5272-8e3b-ba302f00567c', '35913781-eb29-5272-8e3b-ba302f00567c', '{"sub": "35913781-eb29-5272-8e3b-ba302f00567c", "email": "st828@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '35913781-eb29-5272-8e3b-ba302f00567c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('35913781-eb29-5272-8e3b-ba302f00567c', 'admin', 'st828@boss.com', 'Admin Vadakkenchery KSEB EVCS - ChargeMOD', 'Vadakkenchery KSEB EVCS - ChargeMOD', 'Vadakkenchery KSEB EVCS - ChargeMOD, Vadakkenchery, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c2b5cb7d-32cf-5f7d-948d-9ddd1ee42c85', '35913781-eb29-5272-8e3b-ba302f00567c', 'Vadakkenchery KSEB EVCS - ChargeMOD', 'Vadakkenchery KSEB EVCS - ChargeMOD, Vadakkenchery, Kerala, India', 10.59723817, 76.47984937, 'India EV Network License', 'LIC-IN-ST828', 500.0, 30.0, true, 'Vadakkenchery', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c2b5cb7d-32cf-5f7d-948d-9ddd1ee42c85';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('effc19f8-9ecd-5c0e-a88d-1ce18da1812e', 'c2b5cb7d-32cf-5f7d-948d-9ddd1ee42c85', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 829: Evee Buddy - ChargeMOD (Vadakkencherry, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e3e4582e-ccf8-50db-bc07-02d6de2b0996', '00000000-0000-0000-0000-000000000000', 'st829@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st829@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e3e4582e-ccf8-50db-bc07-02d6de2b0996', 'e3e4582e-ccf8-50db-bc07-02d6de2b0996', '{"sub": "e3e4582e-ccf8-50db-bc07-02d6de2b0996", "email": "st829@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e3e4582e-ccf8-50db-bc07-02d6de2b0996')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e3e4582e-ccf8-50db-bc07-02d6de2b0996', 'admin', 'st829@boss.com', 'Admin Evee Buddy - ChargeMOD', 'Evee Buddy - ChargeMOD', 'Evee Buddy - ChargeMOD, Vadakkencherry, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('401b16db-51e7-5285-8b14-ca1189f11b4f', 'e3e4582e-ccf8-50db-bc07-02d6de2b0996', 'Evee Buddy - ChargeMOD', 'Evee Buddy - ChargeMOD, Vadakkencherry, Kerala, India', 10.59195731, 76.46571177, 'India EV Network License', 'LIC-IN-ST829', 500.0, 30.0, true, 'Vadakkencherry', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '401b16db-51e7-5285-8b14-ca1189f11b4f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f83c4625-58fa-5121-9305-14a116de2564', '401b16db-51e7-5285-8b14-ca1189f11b4f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 830: Plugin EVCS - ChargeMOD (Marathakkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('febb8c46-9b15-5fc3-950a-ddc061b6b107', '00000000-0000-0000-0000-000000000000', 'st830@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st830@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('febb8c46-9b15-5fc3-950a-ddc061b6b107', 'febb8c46-9b15-5fc3-950a-ddc061b6b107', '{"sub": "febb8c46-9b15-5fc3-950a-ddc061b6b107", "email": "st830@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'febb8c46-9b15-5fc3-950a-ddc061b6b107')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('febb8c46-9b15-5fc3-950a-ddc061b6b107', 'admin', 'st830@boss.com', 'Admin Plugin EVCS - ChargeMOD', 'Plugin EVCS - ChargeMOD', 'Plugin EVCS - ChargeMOD, Marathakkara, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7e9b2b2b-47cc-50c1-9c25-6cc0527943a1', 'febb8c46-9b15-5fc3-950a-ddc061b6b107', 'Plugin EVCS - ChargeMOD', 'Plugin EVCS - ChargeMOD, Marathakkara, Kerala, India', 10.47682692, 76.25758185, 'India EV Network License', 'LIC-IN-ST830', 500.0, 30.0, true, 'Marathakkara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7e9b2b2b-47cc-50c1-9c25-6cc0527943a1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('66be7d85-59e4-5856-9338-4208cf7cc0e2', '7e9b2b2b-47cc-50c1-9c25-6cc0527943a1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 831: Topup Zone EVCS - ChargeMOD (Amballur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('404276c4-5621-5b0c-94e9-39bf9841ed1b', '00000000-0000-0000-0000-000000000000', 'st831@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st831@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('404276c4-5621-5b0c-94e9-39bf9841ed1b', '404276c4-5621-5b0c-94e9-39bf9841ed1b', '{"sub": "404276c4-5621-5b0c-94e9-39bf9841ed1b", "email": "st831@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '404276c4-5621-5b0c-94e9-39bf9841ed1b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('404276c4-5621-5b0c-94e9-39bf9841ed1b', 'admin', 'st831@boss.com', 'Admin Topup Zone EVCS - ChargeMOD', 'Topup Zone EVCS - ChargeMOD', 'Topup Zone EVCS - ChargeMOD, Amballur, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6ddd658d-95fd-5bfb-a8d9-dd0e31c497ca', '404276c4-5621-5b0c-94e9-39bf9841ed1b', 'Topup Zone EVCS - ChargeMOD', 'Topup Zone EVCS - ChargeMOD, Amballur, Kerala, India', 10.43389238, 76.26514872, 'India EV Network License', 'LIC-IN-ST831', 500.0, 30.0, true, 'Amballur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6ddd658d-95fd-5bfb-a8d9-dd0e31c497ca';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('78400165-c834-5067-8789-7a236bbe8dad', '6ddd658d-95fd-5bfb-a8d9-dd0e31c497ca', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 832: EV Point EVCS - ChargeMOD (Kodakara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2b1d3478-6eff-540c-b8ae-954a67a6b28a', '00000000-0000-0000-0000-000000000000', 'st832@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st832@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2b1d3478-6eff-540c-b8ae-954a67a6b28a', '2b1d3478-6eff-540c-b8ae-954a67a6b28a', '{"sub": "2b1d3478-6eff-540c-b8ae-954a67a6b28a", "email": "st832@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2b1d3478-6eff-540c-b8ae-954a67a6b28a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2b1d3478-6eff-540c-b8ae-954a67a6b28a', 'admin', 'st832@boss.com', 'Admin EV Point EVCS - ChargeMOD', 'EV Point EVCS - ChargeMOD', 'EV Point EVCS - ChargeMOD, Kodakara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8bebcddc-5bc5-547e-926e-67a5622c23b4', '2b1d3478-6eff-540c-b8ae-954a67a6b28a', 'EV Point EVCS - ChargeMOD', 'EV Point EVCS - ChargeMOD, Kodakara, Kerala, India', 10.38066087, 76.29768618, 'India EV Network License', 'LIC-IN-ST832', 500.0, 30.0, true, 'Kodakara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8bebcddc-5bc5-547e-926e-67a5622c23b4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('97763353-f8ea-579a-b7b6-75ca5b6014c6', '8bebcddc-5bc5-547e-926e-67a5622c23b4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 833: Korner EVCS - ChargeMOD (Thrissur, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f5ac67d7-80d2-5401-a030-9e191cb33fdd', '00000000-0000-0000-0000-000000000000', 'st833@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st833@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f5ac67d7-80d2-5401-a030-9e191cb33fdd', 'f5ac67d7-80d2-5401-a030-9e191cb33fdd', '{"sub": "f5ac67d7-80d2-5401-a030-9e191cb33fdd", "email": "st833@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f5ac67d7-80d2-5401-a030-9e191cb33fdd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f5ac67d7-80d2-5401-a030-9e191cb33fdd', 'admin', 'st833@boss.com', 'Admin Korner EVCS - ChargeMOD', 'Korner EVCS - ChargeMOD', 'Korner EVCS - ChargeMOD, Thrissur, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b864c46a-4460-5610-a1e0-30848631425e', 'f5ac67d7-80d2-5401-a030-9e191cb33fdd', 'Korner EVCS - ChargeMOD', 'Korner EVCS - ChargeMOD, Thrissur, Kerala, India', 10.36704848, 76.31535658, 'India EV Network License', 'LIC-IN-ST833', 500.0, 30.0, true, 'Thrissur', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b864c46a-4460-5610-a1e0-30848631425e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3a016e26-f9d1-5b01-8045-b2e4c7fc3db4', 'b864c46a-4460-5610-a1e0-30848631425e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 834: Flash Charge EVCS - ChargeMOD (Chalakudy, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f0423b9d-eb43-5fbd-8917-99defb4dba5a', '00000000-0000-0000-0000-000000000000', 'st834@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st834@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f0423b9d-eb43-5fbd-8917-99defb4dba5a', 'f0423b9d-eb43-5fbd-8917-99defb4dba5a', '{"sub": "f0423b9d-eb43-5fbd-8917-99defb4dba5a", "email": "st834@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f0423b9d-eb43-5fbd-8917-99defb4dba5a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f0423b9d-eb43-5fbd-8917-99defb4dba5a', 'admin', 'st834@boss.com', 'Admin Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD, Chalakudy, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e4ab3741-59c0-50d6-be8e-cc4b80435987', 'f0423b9d-eb43-5fbd-8917-99defb4dba5a', 'Flash Charge EVCS - ChargeMOD', 'Flash Charge EVCS - ChargeMOD, Chalakudy, Kerala, India', 10.33960893, 76.32174631, 'India EV Network License', 'LIC-IN-ST834', 500.0, 30.0, true, 'Chalakudy', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e4ab3741-59c0-50d6-be8e-cc4b80435987';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('12721469-67ee-5584-8a6d-1817cf1f1a8e', 'e4ab3741-59c0-50d6-be8e-cc4b80435987', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 835: Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD (Chalakudy, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3d2726b1-2480-5503-8446-769cbdfadfb2', '00000000-0000-0000-0000-000000000000', 'st835@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st835@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3d2726b1-2480-5503-8446-769cbdfadfb2', '3d2726b1-2480-5503-8446-769cbdfadfb2', '{"sub": "3d2726b1-2480-5503-8446-769cbdfadfb2", "email": "st835@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3d2726b1-2480-5503-8446-769cbdfadfb2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3d2726b1-2480-5503-8446-769cbdfadfb2', 'admin', 'st835@boss.com', 'Admin Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD', 'Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD', 'Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD, Chalakudy, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f58386c8-2854-55b2-9786-c456fd485b73', '3d2726b1-2480-5503-8446-769cbdfadfb2', 'Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD', 'Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD, Chalakudy, Kerala, India', 10.30310177, 76.33704224, 'India EV Network License', 'LIC-IN-ST835', 500.0, 30.0, true, 'Chalakudy', 'Kerala', 1, 'ChargeMod (IN)', '10:00 AM - 10:00 PM (Mall/Retail Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f58386c8-2854-55b2-9786-c456fd485b73';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('698bebe0-eb90-51bb-a28a-46c2a39c5919', 'f58386c8-2854-55b2-9786-c456fd485b73', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 836: Indian Coffee House (EVOK) - ChargeMOD (Chalakkudy, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e8bfcdc0-e01c-5c07-9448-f2a710ac75cf', '00000000-0000-0000-0000-000000000000', 'st836@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st836@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e8bfcdc0-e01c-5c07-9448-f2a710ac75cf', 'e8bfcdc0-e01c-5c07-9448-f2a710ac75cf', '{"sub": "e8bfcdc0-e01c-5c07-9448-f2a710ac75cf", "email": "st836@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e8bfcdc0-e01c-5c07-9448-f2a710ac75cf')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e8bfcdc0-e01c-5c07-9448-f2a710ac75cf', 'admin', 'st836@boss.com', 'Admin Indian Coffee House (EVOK) - ChargeMOD', 'Indian Coffee House (EVOK) - ChargeMOD', 'Indian Coffee House (EVOK) - ChargeMOD, Chalakkudy, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d487887d-4180-5cf7-9c8d-9561d2bff233', 'e8bfcdc0-e01c-5c07-9448-f2a710ac75cf', 'Indian Coffee House (EVOK) - ChargeMOD', 'Indian Coffee House (EVOK) - ChargeMOD, Chalakkudy, Kerala, India', 10.2893433, 76.3370682, 'India EV Network License', 'LIC-IN-ST836', 500.0, 30.0, true, 'Chalakkudy', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd487887d-4180-5cf7-9c8d-9561d2bff233';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9acb6386-cd1c-568c-a5a1-dac15d53fe61', 'd487887d-4180-5cf7-9c8d-9561d2bff233', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 837: Clay House Hotel (Chalakkudy, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a3fa4fcd-1172-5887-832f-78eaf825a1df', '00000000-0000-0000-0000-000000000000', 'st837@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st837@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a3fa4fcd-1172-5887-832f-78eaf825a1df', 'a3fa4fcd-1172-5887-832f-78eaf825a1df', '{"sub": "a3fa4fcd-1172-5887-832f-78eaf825a1df", "email": "st837@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a3fa4fcd-1172-5887-832f-78eaf825a1df')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a3fa4fcd-1172-5887-832f-78eaf825a1df', 'admin', 'st837@boss.com', 'Admin Clay House Hotel', 'Clay House Hotel', 'Clay House Hotel, Chalakkudy, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('abed6d69-daa0-5384-8e89-29856ce6fe89', 'a3fa4fcd-1172-5887-832f-78eaf825a1df', 'Clay House Hotel', 'Clay House Hotel, Chalakkudy, Kerala, India', 10.28557423, 76.34237765, 'India EV Network License', 'LIC-IN-ST837', 500.0, 7.4, true, 'Chalakkudy', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'abed6d69-daa0-5384-8e89-29856ce6fe89';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c3e88b5c-1822-550f-ad6c-58048fdabcef', 'abed6d69-daa0-5384-8e89-29856ce6fe89', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 838: Hill View Resort (EVOK) - ChargeMOD (Athirappilly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('970bb384-5290-580f-8d90-6cd212311346', '00000000-0000-0000-0000-000000000000', 'st838@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st838@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('970bb384-5290-580f-8d90-6cd212311346', '970bb384-5290-580f-8d90-6cd212311346', '{"sub": "970bb384-5290-580f-8d90-6cd212311346", "email": "st838@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '970bb384-5290-580f-8d90-6cd212311346')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('970bb384-5290-580f-8d90-6cd212311346', 'admin', 'st838@boss.com', 'Admin Hill View Resort (EVOK) - ChargeMOD', 'Hill View Resort (EVOK) - ChargeMOD', 'Hill View Resort (EVOK) - ChargeMOD, Athirappilly, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('978f7da6-dbac-5b34-ab0b-6e5bec9705ff', '970bb384-5290-580f-8d90-6cd212311346', 'Hill View Resort (EVOK) - ChargeMOD', 'Hill View Resort (EVOK) - ChargeMOD, Athirappilly, Kerala, India', 10.28603965, 76.55851558, 'India EV Network License', 'LIC-IN-ST838', 500.0, 30.0, true, 'Athirappilly', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '978f7da6-dbac-5b34-ab0b-6e5bec9705ff';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('8224659f-4e30-5cb4-8929-116d41baa3a8', '978f7da6-dbac-5b34-ab0b-6e5bec9705ff', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 839: EVOK Charging Station - ChargeMOD (Angamaly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3ac8312b-ec3c-5ee7-80c1-da7fd6efa7ea', '00000000-0000-0000-0000-000000000000', 'st839@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st839@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3ac8312b-ec3c-5ee7-80c1-da7fd6efa7ea', '3ac8312b-ec3c-5ee7-80c1-da7fd6efa7ea', '{"sub": "3ac8312b-ec3c-5ee7-80c1-da7fd6efa7ea", "email": "st839@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3ac8312b-ec3c-5ee7-80c1-da7fd6efa7ea')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3ac8312b-ec3c-5ee7-80c1-da7fd6efa7ea', 'admin', 'st839@boss.com', 'Admin EVOK Charging Station - ChargeMOD', 'EVOK Charging Station - ChargeMOD', 'EVOK Charging Station - ChargeMOD, Angamaly, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('b5e4d531-2cff-5af9-8c03-d8de9e963867', '3ac8312b-ec3c-5ee7-80c1-da7fd6efa7ea', 'EVOK Charging Station - ChargeMOD', 'EVOK Charging Station - ChargeMOD, Angamaly, Kerala, India', 10.21406148, 76.37936729, 'India EV Network License', 'LIC-IN-ST839', 500.0, 30.0, true, 'Angamaly', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'b5e4d531-2cff-5af9-8c03-d8de9e963867';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('70cda3b1-3870-5af0-9f5c-3cc7469f0731', 'b5e4d531-2cff-5af9-8c03-d8de9e963867', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 840: Edassery Blue Bells EVCS - ChargeMOD (Angamaly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fa681625-416a-574d-ac32-25ae92cdb60d', '00000000-0000-0000-0000-000000000000', 'st840@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st840@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fa681625-416a-574d-ac32-25ae92cdb60d', 'fa681625-416a-574d-ac32-25ae92cdb60d', '{"sub": "fa681625-416a-574d-ac32-25ae92cdb60d", "email": "st840@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fa681625-416a-574d-ac32-25ae92cdb60d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fa681625-416a-574d-ac32-25ae92cdb60d', 'admin', 'st840@boss.com', 'Admin Edassery Blue Bells EVCS - ChargeMOD', 'Edassery Blue Bells EVCS - ChargeMOD', 'Edassery Blue Bells EVCS - ChargeMOD, Angamaly, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3beecb10-9472-5803-96e8-b80f404204c7', 'fa681625-416a-574d-ac32-25ae92cdb60d', 'Edassery Blue Bells EVCS - ChargeMOD', 'Edassery Blue Bells EVCS - ChargeMOD, Angamaly, Kerala, India', 10.19714412, 76.38410959, 'India EV Network License', 'LIC-IN-ST840', 500.0, 30.0, true, 'Angamaly', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3beecb10-9472-5803-96e8-b80f404204c7';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b6fb628a-2ef5-5969-8691-46b039892e45', '3beecb10-9472-5803-96e8-b80f404204c7', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 841: Hotel Elite Palazzo (Angamaly, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('58f60a69-6d4f-5082-a03a-a45fd4a8cc93', '00000000-0000-0000-0000-000000000000', 'st841@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st841@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('58f60a69-6d4f-5082-a03a-a45fd4a8cc93', '58f60a69-6d4f-5082-a03a-a45fd4a8cc93', '{"sub": "58f60a69-6d4f-5082-a03a-a45fd4a8cc93", "email": "st841@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '58f60a69-6d4f-5082-a03a-a45fd4a8cc93')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('58f60a69-6d4f-5082-a03a-a45fd4a8cc93', 'admin', 'st841@boss.com', 'Admin Hotel Elite Palazzo', 'Hotel Elite Palazzo', 'Hotel Elite Palazzo, Angamaly, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ff67d523-ebc0-5775-b015-451469e94e5f', '58f60a69-6d4f-5082-a03a-a45fd4a8cc93', 'Hotel Elite Palazzo', 'Hotel Elite Palazzo, Angamaly, Kerala, India', 10.1897534, 76.38664227, 'India EV Network License', 'LIC-IN-ST841', 500.0, 7.4, true, 'Angamaly', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ff67d523-ebc0-5775-b015-451469e94e5f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c0097724-67cd-5c3b-86da-1d22d7827f4b', 'ff67d523-ebc0-5775-b015-451469e94e5f', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 842: ChargeMOD EVCS Hub (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('15e8d0c9-9f7d-5b91-b30f-4c18e513f38a', '00000000-0000-0000-0000-000000000000', 'st842@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st842@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('15e8d0c9-9f7d-5b91-b30f-4c18e513f38a', '15e8d0c9-9f7d-5b91-b30f-4c18e513f38a', '{"sub": "15e8d0c9-9f7d-5b91-b30f-4c18e513f38a", "email": "st842@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '15e8d0c9-9f7d-5b91-b30f-4c18e513f38a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('15e8d0c9-9f7d-5b91-b30f-4c18e513f38a', 'admin', 'st842@boss.com', 'Admin ChargeMOD EVCS Hub', 'ChargeMOD EVCS Hub', 'ChargeMOD EVCS Hub, Nedumbassery, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e12a526b-e799-5168-8213-dc42f1baa3e8', '15e8d0c9-9f7d-5b91-b30f-4c18e513f38a', 'ChargeMOD EVCS Hub', 'ChargeMOD EVCS Hub, Nedumbassery, Kerala, India', 10.1695516, 76.37225561, 'India EV Network License', 'LIC-IN-ST842', 500.0, 30.0, true, 'Nedumbassery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e12a526b-e799-5168-8213-dc42f1baa3e8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3f55e268-3ea7-5f23-86f2-24f958e05d7f', 'e12a526b-e799-5168-8213-dc42f1baa3e8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 843: CIAL Terminal 3 (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5025fe24-925b-5c85-b59d-99c79db4fbe1', '00000000-0000-0000-0000-000000000000', 'st843@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st843@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5025fe24-925b-5c85-b59d-99c79db4fbe1', '5025fe24-925b-5c85-b59d-99c79db4fbe1', '{"sub": "5025fe24-925b-5c85-b59d-99c79db4fbe1", "email": "st843@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5025fe24-925b-5c85-b59d-99c79db4fbe1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5025fe24-925b-5c85-b59d-99c79db4fbe1', 'admin', 'st843@boss.com', 'Admin CIAL Terminal 3', 'CIAL Terminal 3', 'CIAL Terminal 3, Nedumbassery, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('643534d1-73e9-5189-9f5a-5952e919bcf4', '5025fe24-925b-5c85-b59d-99c79db4fbe1', 'CIAL Terminal 3', 'CIAL Terminal 3, Nedumbassery, Kerala, India', 10.15658638, 76.39193156, 'India EV Network License', 'LIC-IN-ST843', 500.0, 7.4, true, 'Nedumbassery', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Airport)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '643534d1-73e9-5189-9f5a-5952e919bcf4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('165167fa-a966-5f0f-83b3-cd4b785bebbe', '643534d1-73e9-5189-9f5a-5952e919bcf4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 844: CIAL Terminal 1 (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('0118a227-ced4-5cea-806c-420000f7e813', '00000000-0000-0000-0000-000000000000', 'st844@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st844@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('0118a227-ced4-5cea-806c-420000f7e813', '0118a227-ced4-5cea-806c-420000f7e813', '{"sub": "0118a227-ced4-5cea-806c-420000f7e813", "email": "st844@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '0118a227-ced4-5cea-806c-420000f7e813')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('0118a227-ced4-5cea-806c-420000f7e813', 'admin', 'st844@boss.com', 'Admin CIAL Terminal 1', 'CIAL Terminal 1', 'CIAL Terminal 1, Nedumbassery, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4e41eb08-ed24-5108-a196-4e9ee0d71eab', '0118a227-ced4-5cea-806c-420000f7e813', 'CIAL Terminal 1', 'CIAL Terminal 1, Nedumbassery, Kerala, India', 10.15686756, 76.3889799, 'India EV Network License', 'LIC-IN-ST844', 500.0, 7.4, true, 'Nedumbassery', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Airport)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4e41eb08-ed24-5108-a196-4e9ee0d71eab';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6b748e5b-751c-51de-86d8-e9fa7679bb30', '4e41eb08-ed24-5108-a196-4e9ee0d71eab', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 845: Capgo EVCS - ChargeMOD (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('9576d636-d542-5483-9bb0-4d3849a79693', '00000000-0000-0000-0000-000000000000', 'st845@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st845@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('9576d636-d542-5483-9bb0-4d3849a79693', '9576d636-d542-5483-9bb0-4d3849a79693', '{"sub": "9576d636-d542-5483-9bb0-4d3849a79693", "email": "st845@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '9576d636-d542-5483-9bb0-4d3849a79693')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('9576d636-d542-5483-9bb0-4d3849a79693', 'admin', 'st845@boss.com', 'Admin Capgo EVCS - ChargeMOD', 'Capgo EVCS - ChargeMOD', 'Capgo EVCS - ChargeMOD, Nedumbassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('500dbe53-3308-50b4-9060-0d4880070ffa', '9576d636-d542-5483-9bb0-4d3849a79693', 'Capgo EVCS - ChargeMOD', 'Capgo EVCS - ChargeMOD, Nedumbassery, Kerala, India', 10.15991448, 76.38915827, 'India EV Network License', 'LIC-IN-ST845', 500.0, 30.0, true, 'Nedumbassery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '500dbe53-3308-50b4-9060-0d4880070ffa';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('52a79491-b9fc-5d14-a94a-e380a2b2510f', '500dbe53-3308-50b4-9060-0d4880070ffa', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 846: Jippus Galaxy EVCS - ChargeMOD (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1e61cf46-1983-56b6-9c70-ada16b249048', '00000000-0000-0000-0000-000000000000', 'st846@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st846@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1e61cf46-1983-56b6-9c70-ada16b249048', '1e61cf46-1983-56b6-9c70-ada16b249048', '{"sub": "1e61cf46-1983-56b6-9c70-ada16b249048", "email": "st846@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1e61cf46-1983-56b6-9c70-ada16b249048')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1e61cf46-1983-56b6-9c70-ada16b249048', 'admin', 'st846@boss.com', 'Admin Jippus Galaxy EVCS - ChargeMOD', 'Jippus Galaxy EVCS - ChargeMOD', 'Jippus Galaxy EVCS - ChargeMOD, Nedumbassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('650d14a7-c41e-5d50-a649-f37951ef797e', '1e61cf46-1983-56b6-9c70-ada16b249048', 'Jippus Galaxy EVCS - ChargeMOD', 'Jippus Galaxy EVCS - ChargeMOD, Nedumbassery, Kerala, India', 10.16106206, 76.38563078, 'India EV Network License', 'LIC-IN-ST846', 500.0, 30.0, true, 'Nedumbassery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '650d14a7-c41e-5d50-a649-f37951ef797e';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('54c48ca4-deff-5b64-8c62-4e1b86f3d3ce', '650d14a7-c41e-5d50-a649-f37951ef797e', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 847: Airsuite Airport Hotel (Nedumbassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('87c3f1d7-75aa-5a71-ad6d-6bcefb6ee673', '00000000-0000-0000-0000-000000000000', 'st847@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st847@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('87c3f1d7-75aa-5a71-ad6d-6bcefb6ee673', '87c3f1d7-75aa-5a71-ad6d-6bcefb6ee673', '{"sub": "87c3f1d7-75aa-5a71-ad6d-6bcefb6ee673", "email": "st847@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '87c3f1d7-75aa-5a71-ad6d-6bcefb6ee673')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('87c3f1d7-75aa-5a71-ad6d-6bcefb6ee673', 'admin', 'st847@boss.com', 'Admin Airsuite Airport Hotel', 'Airsuite Airport Hotel', 'Airsuite Airport Hotel, Nedumbassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a027c754-34e5-53bc-a114-90976cb0b003', '87c3f1d7-75aa-5a71-ad6d-6bcefb6ee673', 'Airsuite Airport Hotel', 'Airsuite Airport Hotel, Nedumbassery, Kerala, India', 10.15929513, 76.37852288, 'India EV Network License', 'LIC-IN-ST847', 500.0, 7.4, true, 'Nedumbassery', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Airport)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a027c754-34e5-53bc-a114-90976cb0b003';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('745afd02-86f8-5d03-9528-620bba100566', 'a027c754-34e5-53bc-a114-90976cb0b003', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 848: North Paravoor KSEB EVCS - ChargeMOD (North Paravoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('fdc695ae-1bd9-5d57-8cf7-310a95a13f71', '00000000-0000-0000-0000-000000000000', 'st848@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st848@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('fdc695ae-1bd9-5d57-8cf7-310a95a13f71', 'fdc695ae-1bd9-5d57-8cf7-310a95a13f71', '{"sub": "fdc695ae-1bd9-5d57-8cf7-310a95a13f71", "email": "st848@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'fdc695ae-1bd9-5d57-8cf7-310a95a13f71')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('fdc695ae-1bd9-5d57-8cf7-310a95a13f71', 'admin', 'st848@boss.com', 'Admin North Paravoor KSEB EVCS - ChargeMOD', 'North Paravoor KSEB EVCS - ChargeMOD', 'North Paravoor KSEB EVCS - ChargeMOD, North Paravoor, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('2c2a488b-be0a-5bea-a9d4-65a0f7c370cb', 'fdc695ae-1bd9-5d57-8cf7-310a95a13f71', 'North Paravoor KSEB EVCS - ChargeMOD', 'North Paravoor KSEB EVCS - ChargeMOD, North Paravoor, Kerala, India', 10.14563298, 76.25690381, 'India EV Network License', 'LIC-IN-ST848', 500.0, 30.0, true, 'North Paravoor', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '2c2a488b-be0a-5bea-a9d4-65a0f7c370cb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('188fcd65-16f7-52b8-b2fb-b0dfb1ed91e3', '2c2a488b-be0a-5bea-a9d4-65a0f7c370cb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 849: Dhruv EVCS - ChargeMOD (Kunnukara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('2fa3adc5-1640-52da-911f-58c57af603a4', '00000000-0000-0000-0000-000000000000', 'st849@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st849@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('2fa3adc5-1640-52da-911f-58c57af603a4', '2fa3adc5-1640-52da-911f-58c57af603a4', '{"sub": "2fa3adc5-1640-52da-911f-58c57af603a4", "email": "st849@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '2fa3adc5-1640-52da-911f-58c57af603a4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('2fa3adc5-1640-52da-911f-58c57af603a4', 'admin', 'st849@boss.com', 'Admin Dhruv EVCS - ChargeMOD', 'Dhruv EVCS - ChargeMOD', 'Dhruv EVCS - ChargeMOD, Kunnukara, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('7db5d4da-6d78-514d-a12c-7686845d68cf', '2fa3adc5-1640-52da-911f-58c57af603a4', 'Dhruv EVCS - ChargeMOD', 'Dhruv EVCS - ChargeMOD, Kunnukara, Kerala, India', 10.15491305, 76.28601445, 'India EV Network License', 'LIC-IN-ST849', 500.0, 30.0, true, 'Kunnukara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '7db5d4da-6d78-514d-a12c-7686845d68cf';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6a87decb-ca7e-5fd4-a370-bead7598b7b6', '7db5d4da-6d78-514d-a12c-7686845d68cf', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 850: Sulfex Mattress (EVOK) - ChargeMOD (Choornikkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a70a04a2-f2c3-52ea-8c07-f33c91947bd0', '00000000-0000-0000-0000-000000000000', 'st850@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st850@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a70a04a2-f2c3-52ea-8c07-f33c91947bd0', 'a70a04a2-f2c3-52ea-8c07-f33c91947bd0', '{"sub": "a70a04a2-f2c3-52ea-8c07-f33c91947bd0", "email": "st850@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a70a04a2-f2c3-52ea-8c07-f33c91947bd0')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a70a04a2-f2c3-52ea-8c07-f33c91947bd0', 'admin', 'st850@boss.com', 'Admin Sulfex Mattress (EVOK) - ChargeMOD', 'Sulfex Mattress (EVOK) - ChargeMOD', 'Sulfex Mattress (EVOK) - ChargeMOD, Choornikkara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ad121441-0d6b-5156-b9d1-21b901baa0b4', 'a70a04a2-f2c3-52ea-8c07-f33c91947bd0', 'Sulfex Mattress (EVOK) - ChargeMOD', 'Sulfex Mattress (EVOK) - ChargeMOD, Choornikkara, Kerala, India', 10.08155965, 76.33986742, 'India EV Network License', 'LIC-IN-ST850', 500.0, 30.0, true, 'Choornikkara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ad121441-0d6b-5156-b9d1-21b901baa0b4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c798e83e-f362-5de6-ba1a-46d8edae7e12', 'ad121441-0d6b-5156-b9d1-21b901baa0b4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 851: EVM MG Motors Coastline Garage - ChargeMOD (Kochi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('19e33c3a-d965-546a-a495-8cb1f8f155e7', '00000000-0000-0000-0000-000000000000', 'st851@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st851@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('19e33c3a-d965-546a-a495-8cb1f8f155e7', '19e33c3a-d965-546a-a495-8cb1f8f155e7', '{"sub": "19e33c3a-d965-546a-a495-8cb1f8f155e7", "email": "st851@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '19e33c3a-d965-546a-a495-8cb1f8f155e7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('19e33c3a-d965-546a-a495-8cb1f8f155e7', 'admin', 'st851@boss.com', 'Admin EVM MG Motors Coastline Garage - ChargeMOD', 'EVM MG Motors Coastline Garage - ChargeMOD', 'EVM MG Motors Coastline Garage - ChargeMOD, Kochi, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4385325e-cd65-52a2-aca4-c250aaa369e1', '19e33c3a-d965-546a-a495-8cb1f8f155e7', 'EVM MG Motors Coastline Garage - ChargeMOD', 'EVM MG Motors Coastline Garage - ChargeMOD, Kochi, Kerala, India', 10.07728448, 76.33764123, 'India EV Network License', 'LIC-IN-ST851', 500.0, 30.0, true, 'Kochi', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4385325e-cd65-52a2-aca4-c250aaa369e1';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('86334833-30fd-595f-827f-89df4abc65a5', '4385325e-cd65-52a2-aca4-c250aaa369e1', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 852: Steelane (EVOK) - ChargeMOD (Kalamassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a1c0d000-5466-51fd-bd09-05eb59bbd4f7', '00000000-0000-0000-0000-000000000000', 'st852@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st852@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a1c0d000-5466-51fd-bd09-05eb59bbd4f7', 'a1c0d000-5466-51fd-bd09-05eb59bbd4f7', '{"sub": "a1c0d000-5466-51fd-bd09-05eb59bbd4f7", "email": "st852@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a1c0d000-5466-51fd-bd09-05eb59bbd4f7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a1c0d000-5466-51fd-bd09-05eb59bbd4f7', 'admin', 'st852@boss.com', 'Admin Steelane (EVOK) - ChargeMOD', 'Steelane (EVOK) - ChargeMOD', 'Steelane (EVOK) - ChargeMOD, Kalamassery, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f9be58d1-6d48-588e-b550-65d5a302490b', 'a1c0d000-5466-51fd-bd09-05eb59bbd4f7', 'Steelane (EVOK) - ChargeMOD', 'Steelane (EVOK) - ChargeMOD, Kalamassery, Kerala, India', 10.04043387, 76.33852407, 'India EV Network License', 'LIC-IN-ST852', 500.0, 30.0, true, 'Kalamassery', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f9be58d1-6d48-588e-b550-65d5a302490b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c2dc9d74-10ea-5e45-a0a8-76d8a8335f4e', 'f9be58d1-6d48-588e-b550-65d5a302490b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 853: Kalamassery KSEB EVCS - ChargeMOD (Kalamassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e844b2c8-607d-5b9b-86fa-c57b18a8d82c', '00000000-0000-0000-0000-000000000000', 'st853@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st853@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e844b2c8-607d-5b9b-86fa-c57b18a8d82c', 'e844b2c8-607d-5b9b-86fa-c57b18a8d82c', '{"sub": "e844b2c8-607d-5b9b-86fa-c57b18a8d82c", "email": "st853@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e844b2c8-607d-5b9b-86fa-c57b18a8d82c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e844b2c8-607d-5b9b-86fa-c57b18a8d82c', 'admin', 'st853@boss.com', 'Admin Kalamassery KSEB EVCS - ChargeMOD', 'Kalamassery KSEB EVCS - ChargeMOD', 'Kalamassery KSEB EVCS - ChargeMOD, Kalamassery, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('13477c1c-3d16-55ee-96f2-5b6d946c9134', 'e844b2c8-607d-5b9b-86fa-c57b18a8d82c', 'Kalamassery KSEB EVCS - ChargeMOD', 'Kalamassery KSEB EVCS - ChargeMOD, Kalamassery, Kerala, India', 10.05377003, 76.33086763, 'India EV Network License', 'LIC-IN-ST853', 500.0, 30.0, true, 'Kalamassery', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '13477c1c-3d16-55ee-96f2-5b6d946c9134';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0f5d616c-dc25-5517-8f20-0c34a8fe437a', '13477c1c-3d16-55ee-96f2-5b6d946c9134', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 854: Rajagiri College EVCS - ChargeMOD (Kalamassery, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('42557c15-a927-59db-9e5f-2df69a6a1764', '00000000-0000-0000-0000-000000000000', 'st854@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st854@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('42557c15-a927-59db-9e5f-2df69a6a1764', '42557c15-a927-59db-9e5f-2df69a6a1764', '{"sub": "42557c15-a927-59db-9e5f-2df69a6a1764", "email": "st854@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '42557c15-a927-59db-9e5f-2df69a6a1764')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('42557c15-a927-59db-9e5f-2df69a6a1764', 'admin', 'st854@boss.com', 'Admin Rajagiri College EVCS - ChargeMOD', 'Rajagiri College EVCS - ChargeMOD', 'Rajagiri College EVCS - ChargeMOD, Kalamassery, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8b32e758-dc99-5eeb-a7c4-3f4b2a8a9ce5', '42557c15-a927-59db-9e5f-2df69a6a1764', 'Rajagiri College EVCS - ChargeMOD', 'Rajagiri College EVCS - ChargeMOD, Kalamassery, Kerala, India', 10.05245925, 76.3146563, 'India EV Network License', 'LIC-IN-ST854', 500.0, 30.0, true, 'Kalamassery', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8b32e758-dc99-5eeb-a7c4-3f4b2a8a9ce5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b48f2d31-6de6-5e62-a1fe-8679fb3c74e6', '8b32e758-dc99-5eeb-a7c4-3f4b2a8a9ce5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 855: Flash Charge - ChargeMOD (Edappally, Keral)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e3946a96-44c9-5f66-a889-cca8101f61c7', '00000000-0000-0000-0000-000000000000', 'st855@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st855@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e3946a96-44c9-5f66-a889-cca8101f61c7', 'e3946a96-44c9-5f66-a889-cca8101f61c7', '{"sub": "e3946a96-44c9-5f66-a889-cca8101f61c7", "email": "st855@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e3946a96-44c9-5f66-a889-cca8101f61c7')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e3946a96-44c9-5f66-a889-cca8101f61c7', 'admin', 'st855@boss.com', 'Admin Flash Charge - ChargeMOD', 'Flash Charge - ChargeMOD', 'Flash Charge - ChargeMOD, Edappally, Keral, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('a3eac497-0d61-5145-a399-7687e04a240f', 'e3946a96-44c9-5f66-a889-cca8101f61c7', 'Flash Charge - ChargeMOD', 'Flash Charge - ChargeMOD, Edappally, Keral, India', 10.02776086, 76.31117444, 'India EV Network License', 'LIC-IN-ST855', 500.0, 30.0, true, 'Edappally', 'Keral', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'a3eac497-0d61-5145-a399-7687e04a240f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0c8c42b5-a9ad-5bcd-9647-840c14ae0102', 'a3eac497-0d61-5145-a399-7687e04a240f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 856: Kaloor KSEB EVCS - ChargeMOD (Kaloor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('98a68e4f-8980-5f3e-9f54-547717fb12a6', '00000000-0000-0000-0000-000000000000', 'st856@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st856@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('98a68e4f-8980-5f3e-9f54-547717fb12a6', '98a68e4f-8980-5f3e-9f54-547717fb12a6', '{"sub": "98a68e4f-8980-5f3e-9f54-547717fb12a6", "email": "st856@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '98a68e4f-8980-5f3e-9f54-547717fb12a6')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('98a68e4f-8980-5f3e-9f54-547717fb12a6', 'admin', 'st856@boss.com', 'Admin Kaloor KSEB EVCS - ChargeMOD', 'Kaloor KSEB EVCS - ChargeMOD', 'Kaloor KSEB EVCS - ChargeMOD, Kaloor, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('45baa941-bbe5-5c1c-aeef-296fd597be50', '98a68e4f-8980-5f3e-9f54-547717fb12a6', 'Kaloor KSEB EVCS - ChargeMOD', 'Kaloor KSEB EVCS - ChargeMOD, Kaloor, Kerala, India', 10.00024104, 76.29842982, 'India EV Network License', 'LIC-IN-ST856', 500.0, 30.0, true, 'Kaloor', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '45baa941-bbe5-5c1c-aeef-296fd597be50';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('292171c4-ac86-5d23-9287-079e355aeb9c', '45baa941-bbe5-5c1c-aeef-296fd597be50', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 857: Gandhinagar KSEB EVCS - ChargeMOD (Kochi, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b2a42df7-395b-5182-97dc-9447e3f47f98', '00000000-0000-0000-0000-000000000000', 'st857@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st857@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b2a42df7-395b-5182-97dc-9447e3f47f98', 'b2a42df7-395b-5182-97dc-9447e3f47f98', '{"sub": "b2a42df7-395b-5182-97dc-9447e3f47f98", "email": "st857@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b2a42df7-395b-5182-97dc-9447e3f47f98')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b2a42df7-395b-5182-97dc-9447e3f47f98', 'admin', 'st857@boss.com', 'Admin Gandhinagar KSEB EVCS - ChargeMOD', 'Gandhinagar KSEB EVCS - ChargeMOD', 'Gandhinagar KSEB EVCS - ChargeMOD, Kochi, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e30d7628-75ef-5a76-b0b4-779eca1635f2', 'b2a42df7-395b-5182-97dc-9447e3f47f98', 'Gandhinagar KSEB EVCS - ChargeMOD', 'Gandhinagar KSEB EVCS - ChargeMOD, Kochi, Kerala, India', 9.97419253, 76.2936817, 'India EV Network License', 'LIC-IN-ST857', 500.0, 30.0, true, 'Kochi', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e30d7628-75ef-5a76-b0b4-779eca1635f2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a12b1ac8-54dd-5fde-bcab-17d550399464', 'e30d7628-75ef-5a76-b0b4-779eca1635f2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 858: Chillax EVCS (EVOK) - ChargeMOD (Thammanam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5f9c5b16-6001-5952-8978-03bbdaf56c41', '00000000-0000-0000-0000-000000000000', 'st858@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st858@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5f9c5b16-6001-5952-8978-03bbdaf56c41', '5f9c5b16-6001-5952-8978-03bbdaf56c41', '{"sub": "5f9c5b16-6001-5952-8978-03bbdaf56c41", "email": "st858@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5f9c5b16-6001-5952-8978-03bbdaf56c41')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5f9c5b16-6001-5952-8978-03bbdaf56c41', 'admin', 'st858@boss.com', 'Admin Chillax EVCS (EVOK) - ChargeMOD', 'Chillax EVCS (EVOK) - ChargeMOD', 'Chillax EVCS (EVOK) - ChargeMOD, Thammanam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('51fcf4f5-86b8-572c-b1ec-a9e2a25bf423', '5f9c5b16-6001-5952-8978-03bbdaf56c41', 'Chillax EVCS (EVOK) - ChargeMOD', 'Chillax EVCS (EVOK) - ChargeMOD, Thammanam, Kerala, India', 9.985005178, 76.31606543, 'India EV Network License', 'LIC-IN-ST858', 500.0, 30.0, true, 'Thammanam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '51fcf4f5-86b8-572c-b1ec-a9e2a25bf423';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('efba2ed3-4278-5898-9756-0ad209b9976b', '51fcf4f5-86b8-572c-b1ec-a9e2a25bf423', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 859: Evee Buddy - Memaid EVCS - ChargeMOD (Vyttila, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('50928c17-5b4c-5a96-b209-67ccf8691feb', '00000000-0000-0000-0000-000000000000', 'st859@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st859@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('50928c17-5b4c-5a96-b209-67ccf8691feb', '50928c17-5b4c-5a96-b209-67ccf8691feb', '{"sub": "50928c17-5b4c-5a96-b209-67ccf8691feb", "email": "st859@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '50928c17-5b4c-5a96-b209-67ccf8691feb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('50928c17-5b4c-5a96-b209-67ccf8691feb', 'admin', 'st859@boss.com', 'Admin Evee Buddy - Memaid EVCS - ChargeMOD', 'Evee Buddy - Memaid EVCS - ChargeMOD', 'Evee Buddy - Memaid EVCS - ChargeMOD, Vyttila, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('33064b01-131e-5604-8fe1-681aeb24151f', '50928c17-5b4c-5a96-b209-67ccf8691feb', 'Evee Buddy - Memaid EVCS - ChargeMOD', 'Evee Buddy - Memaid EVCS - ChargeMOD, Vyttila, Kerala, India', 9.971684804, 76.32415963, 'India EV Network License', 'LIC-IN-ST859', 500.0, 30.0, true, 'Vyttila', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '33064b01-131e-5604-8fe1-681aeb24151f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('7c0652ad-5456-533a-b619-5934b0af2281', '33064b01-131e-5604-8fe1-681aeb24151f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 860: Broad Bean Hotel (EVOK) - ChargeMOD (Vyttila, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('88e4bdcc-4042-5a58-ab50-06d00bb308fb', '00000000-0000-0000-0000-000000000000', 'st860@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st860@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('88e4bdcc-4042-5a58-ab50-06d00bb308fb', '88e4bdcc-4042-5a58-ab50-06d00bb308fb', '{"sub": "88e4bdcc-4042-5a58-ab50-06d00bb308fb", "email": "st860@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '88e4bdcc-4042-5a58-ab50-06d00bb308fb')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('88e4bdcc-4042-5a58-ab50-06d00bb308fb', 'admin', 'st860@boss.com', 'Admin Broad Bean Hotel (EVOK) - ChargeMOD', 'Broad Bean Hotel (EVOK) - ChargeMOD', 'Broad Bean Hotel (EVOK) - ChargeMOD, Vyttila, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('56317733-225f-549c-bdfd-1cb551af4c8f', '88e4bdcc-4042-5a58-ab50-06d00bb308fb', 'Broad Bean Hotel (EVOK) - ChargeMOD', 'Broad Bean Hotel (EVOK) - ChargeMOD, Vyttila, Kerala, India', 9.962667763, 76.31821354, 'India EV Network License', 'LIC-IN-ST860', 500.0, 30.0, true, 'Vyttila', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '56317733-225f-549c-bdfd-1cb551af4c8f';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('906996e9-eb3b-51f9-8d95-f37655f333d5', '56317733-225f-549c-bdfd-1cb551af4c8f', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 861: Vyttila KSEB EVCS - ChargeMOD (Vyttila, Keral)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('48a07849-6b57-5f33-b587-161baecfbffe', '00000000-0000-0000-0000-000000000000', 'st861@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st861@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('48a07849-6b57-5f33-b587-161baecfbffe', '48a07849-6b57-5f33-b587-161baecfbffe', '{"sub": "48a07849-6b57-5f33-b587-161baecfbffe", "email": "st861@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '48a07849-6b57-5f33-b587-161baecfbffe')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('48a07849-6b57-5f33-b587-161baecfbffe', 'admin', 'st861@boss.com', 'Admin Vyttila KSEB EVCS - ChargeMOD', 'Vyttila KSEB EVCS - ChargeMOD', 'Vyttila KSEB EVCS - ChargeMOD, Vyttila, Keral, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6e13886c-3ec4-572b-9b2b-5930129330ca', '48a07849-6b57-5f33-b587-161baecfbffe', 'Vyttila KSEB EVCS - ChargeMOD', 'Vyttila KSEB EVCS - ChargeMOD, Vyttila, Keral, India', 9.962901963, 76.31922071, 'India EV Network License', 'LIC-IN-ST861', 500.0, 30.0, true, 'Vyttila', 'Keral', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6e13886c-3ec4-572b-9b2b-5930129330ca';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a1b87b63-8f06-55f1-91f8-36161a22ff66', '6e13886c-3ec4-572b-9b2b-5930129330ca', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 862: BYD EVM Southcoast Service Centre - ChargeMOD (Maradu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c5d200f2-155d-5802-8c65-aaf7123cde4e', '00000000-0000-0000-0000-000000000000', 'st862@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st862@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c5d200f2-155d-5802-8c65-aaf7123cde4e', 'c5d200f2-155d-5802-8c65-aaf7123cde4e', '{"sub": "c5d200f2-155d-5802-8c65-aaf7123cde4e", "email": "st862@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c5d200f2-155d-5802-8c65-aaf7123cde4e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c5d200f2-155d-5802-8c65-aaf7123cde4e', 'admin', 'st862@boss.com', 'Admin BYD EVM Southcoast Service Centre - ChargeMOD', 'BYD EVM Southcoast Service Centre - ChargeMOD', 'BYD EVM Southcoast Service Centre - ChargeMOD, Maradu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('97249ac7-b8d4-564a-bb25-beda36805627', 'c5d200f2-155d-5802-8c65-aaf7123cde4e', 'BYD EVM Southcoast Service Centre - ChargeMOD', 'BYD EVM Southcoast Service Centre - ChargeMOD, Maradu, Kerala, India', 9.948134986, 76.31850176, 'India EV Network License', 'LIC-IN-ST862', 500.0, 30.0, true, 'Maradu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '97249ac7-b8d4-564a-bb25-beda36805627';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('17770da7-cd92-5e0b-b945-8f23a464188d', '97249ac7-b8d4-564a-bb25-beda36805627', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 863: EVM La Maison Citroen Kochi - ChargeMOD (Maradu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('58d83c04-704c-522c-9158-ccfdff9f9c5a', '00000000-0000-0000-0000-000000000000', 'st863@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st863@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('58d83c04-704c-522c-9158-ccfdff9f9c5a', '58d83c04-704c-522c-9158-ccfdff9f9c5a', '{"sub": "58d83c04-704c-522c-9158-ccfdff9f9c5a", "email": "st863@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '58d83c04-704c-522c-9158-ccfdff9f9c5a')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('58d83c04-704c-522c-9158-ccfdff9f9c5a', 'admin', 'st863@boss.com', 'Admin EVM La Maison Citroen Kochi - ChargeMOD', 'EVM La Maison Citroen Kochi - ChargeMOD', 'EVM La Maison Citroen Kochi - ChargeMOD, Maradu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('06bd05c3-6d5c-580b-a252-721c7e2a22eb', '58d83c04-704c-522c-9158-ccfdff9f9c5a', 'EVM La Maison Citroen Kochi - ChargeMOD', 'EVM La Maison Citroen Kochi - ChargeMOD, Maradu, Kerala, India', 9.940155101, 76.31841841, 'India EV Network License', 'LIC-IN-ST863', 500.0, 30.0, true, 'Maradu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '06bd05c3-6d5c-580b-a252-721c7e2a22eb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c878a847-c14a-56e3-848a-2385c9fb5114', '06bd05c3-6d5c-580b-a252-721c7e2a22eb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 864: LiON EVCS - ChargeMOD (Maradu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('77bbb2e8-0cca-5138-95ef-33b5ec7c2879', '00000000-0000-0000-0000-000000000000', 'st864@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st864@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('77bbb2e8-0cca-5138-95ef-33b5ec7c2879', '77bbb2e8-0cca-5138-95ef-33b5ec7c2879', '{"sub": "77bbb2e8-0cca-5138-95ef-33b5ec7c2879", "email": "st864@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '77bbb2e8-0cca-5138-95ef-33b5ec7c2879')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('77bbb2e8-0cca-5138-95ef-33b5ec7c2879', 'admin', 'st864@boss.com', 'Admin LiON EVCS - ChargeMOD', 'LiON EVCS - ChargeMOD', 'LiON EVCS - ChargeMOD, Maradu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dee0cc9b-b11d-5a62-8e74-4cf4b3df6f2b', '77bbb2e8-0cca-5138-95ef-33b5ec7c2879', 'LiON EVCS - ChargeMOD', 'LiON EVCS - ChargeMOD, Maradu, Kerala, India', 9.942225213, 76.3338851, 'India EV Network License', 'LIC-IN-ST864', 500.0, 30.0, true, 'Maradu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dee0cc9b-b11d-5a62-8e74-4cf4b3df6f2b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fb4a9a60-bbf7-58b0-b64d-c4fd4493764a', 'dee0cc9b-b11d-5a62-8e74-4cf4b3df6f2b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 865: Rajagiri Hospital EVCS - ChargeMOD (Aluva, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f20fe5b8-8959-53d5-bdc8-c869a3e2de06', '00000000-0000-0000-0000-000000000000', 'st865@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st865@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f20fe5b8-8959-53d5-bdc8-c869a3e2de06', 'f20fe5b8-8959-53d5-bdc8-c869a3e2de06', '{"sub": "f20fe5b8-8959-53d5-bdc8-c869a3e2de06", "email": "st865@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f20fe5b8-8959-53d5-bdc8-c869a3e2de06')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f20fe5b8-8959-53d5-bdc8-c869a3e2de06', 'admin', 'st865@boss.com', 'Admin Rajagiri Hospital EVCS - ChargeMOD', 'Rajagiri Hospital EVCS - ChargeMOD', 'Rajagiri Hospital EVCS - ChargeMOD, Aluva, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('da9b9fa2-e9fd-5fa8-8bd3-b625a365123c', 'f20fe5b8-8959-53d5-bdc8-c869a3e2de06', 'Rajagiri Hospital EVCS - ChargeMOD', 'Rajagiri Hospital EVCS - ChargeMOD, Aluva, Kerala, India', 10.08803183, 76.38904221, 'India EV Network License', 'LIC-IN-ST865', 500.0, 30.0, true, 'Aluva', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hospital)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'da9b9fa2-e9fd-5fa8-8bd3-b625a365123c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2d18be1b-a119-532e-b0ed-d91dc3de147e', 'da9b9fa2-e9fd-5fa8-8bd3-b625a365123c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 866: Raos EVCS - ChargeMOD (Thrippunithara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('aaa64ad8-4d0b-51da-b23b-7be1bd1bb616', '00000000-0000-0000-0000-000000000000', 'st866@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st866@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('aaa64ad8-4d0b-51da-b23b-7be1bd1bb616', 'aaa64ad8-4d0b-51da-b23b-7be1bd1bb616', '{"sub": "aaa64ad8-4d0b-51da-b23b-7be1bd1bb616", "email": "st866@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'aaa64ad8-4d0b-51da-b23b-7be1bd1bb616')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('aaa64ad8-4d0b-51da-b23b-7be1bd1bb616', 'admin', 'st866@boss.com', 'Admin Raos EVCS - ChargeMOD', 'Raos EVCS - ChargeMOD', 'Raos EVCS - ChargeMOD, Thrippunithara, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('3fedec32-02e2-5f3f-a75e-60a55c52d269', 'aaa64ad8-4d0b-51da-b23b-7be1bd1bb616', 'Raos EVCS - ChargeMOD', 'Raos EVCS - ChargeMOD, Thrippunithara, Kerala, India', 9.932546342, 76.38829398, 'India EV Network License', 'LIC-IN-ST866', 500.0, 30.0, true, 'Thrippunithara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '3fedec32-02e2-5f3f-a75e-60a55c52d269';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('37a1c918-d597-508e-bc0d-490513ef496f', '3fedec32-02e2-5f3f-a75e-60a55c52d269', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 867: PPG Home EVCS - ChargeMOD (Thrippunithara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('d2d990fd-cc83-54d0-865b-603bfd1a39df', '00000000-0000-0000-0000-000000000000', 'st867@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st867@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('d2d990fd-cc83-54d0-865b-603bfd1a39df', 'd2d990fd-cc83-54d0-865b-603bfd1a39df', '{"sub": "d2d990fd-cc83-54d0-865b-603bfd1a39df", "email": "st867@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'd2d990fd-cc83-54d0-865b-603bfd1a39df')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('d2d990fd-cc83-54d0-865b-603bfd1a39df', 'admin', 'st867@boss.com', 'Admin PPG Home EVCS - ChargeMOD', 'PPG Home EVCS - ChargeMOD', 'PPG Home EVCS - ChargeMOD, Thrippunithara, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c09b1c4b-023e-5c16-a4d3-03e88a0c8c91', 'd2d990fd-cc83-54d0-865b-603bfd1a39df', 'PPG Home EVCS - ChargeMOD', 'PPG Home EVCS - ChargeMOD, Thrippunithara, Kerala, India', 9.932987602, 76.38873573, 'India EV Network License', 'LIC-IN-ST867', 500.0, 30.0, true, 'Thrippunithara', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c09b1c4b-023e-5c16-a4d3-03e88a0c8c91';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('dab04c0b-df43-536c-863c-a11525f5c109', 'c09b1c4b-023e-5c16-a4d3-03e88a0c8c91', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 868: Hound Mobility EVCS | Kakkanad (Kakkanad, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('43d3b33a-4980-50df-897d-8c261c957580', '00000000-0000-0000-0000-000000000000', 'st868@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st868@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('43d3b33a-4980-50df-897d-8c261c957580', '43d3b33a-4980-50df-897d-8c261c957580', '{"sub": "43d3b33a-4980-50df-897d-8c261c957580", "email": "st868@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '43d3b33a-4980-50df-897d-8c261c957580')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('43d3b33a-4980-50df-897d-8c261c957580', 'admin', 'st868@boss.com', 'Admin Hound Mobility EVCS | Kakkanad', 'Hound Mobility EVCS | Kakkanad', 'Hound Mobility EVCS | Kakkanad, Kakkanad, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('cdf16e0f-b77e-5481-b704-7bd14641750a', '43d3b33a-4980-50df-897d-8c261c957580', 'Hound Mobility EVCS | Kakkanad', 'Hound Mobility EVCS | Kakkanad, Kakkanad, Kerala, India', 10.00180181, 76.36151799, 'India EV Network License', 'LIC-IN-ST868', 500.0, 7.4, true, 'Kakkanad', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'cdf16e0f-b77e-5481-b704-7bd14641750a';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9cdd6ca4-db9d-539f-902b-407457ac1289', 'cdf16e0f-b77e-5481-b704-7bd14641750a', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 869: Wonderla - Statiq (Pallikkara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('729ddeab-824e-5a8e-adfc-dd1f99b00d9b', '00000000-0000-0000-0000-000000000000', 'st869@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st869@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('729ddeab-824e-5a8e-adfc-dd1f99b00d9b', '729ddeab-824e-5a8e-adfc-dd1f99b00d9b', '{"sub": "729ddeab-824e-5a8e-adfc-dd1f99b00d9b", "email": "st869@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '729ddeab-824e-5a8e-adfc-dd1f99b00d9b')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('729ddeab-824e-5a8e-adfc-dd1f99b00d9b', 'admin', 'st869@boss.com', 'Admin Wonderla - Statiq', 'Wonderla - Statiq', 'Wonderla - Statiq, Pallikkara, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('8ab5d340-01a4-5ee2-9a0f-04ebe54dfc38', '729ddeab-824e-5a8e-adfc-dd1f99b00d9b', 'Wonderla - Statiq', 'Wonderla - Statiq, Pallikkara, Kerala, India', 10.02602207, 76.39199597, 'India EV Network License', 'LIC-IN-ST869', 500.0, 30.0, true, 'Pallikkara', 'Kerala', 2, 'Statiq (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '8ab5d340-01a4-5ee2-9a0f-04ebe54dfc38';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('103d8258-c74b-5df4-8e1d-c0c933d21aeb', '8ab5d340-01a4-5ee2-9a0f-04ebe54dfc38', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('1643f8fa-2e87-5f3c-9677-19b0eb9e8b8e', '8ab5d340-01a4-5ee2-9a0f-04ebe54dfc38', 'Port B', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 870: Matha DC EVCS - ChargeMOD (Kizhakkambalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e9aa564b-c5ad-5c14-877d-f05e2145b54d', '00000000-0000-0000-0000-000000000000', 'st870@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st870@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e9aa564b-c5ad-5c14-877d-f05e2145b54d', 'e9aa564b-c5ad-5c14-877d-f05e2145b54d', '{"sub": "e9aa564b-c5ad-5c14-877d-f05e2145b54d", "email": "st870@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e9aa564b-c5ad-5c14-877d-f05e2145b54d')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e9aa564b-c5ad-5c14-877d-f05e2145b54d', 'admin', 'st870@boss.com', 'Admin Matha DC EVCS - ChargeMOD', 'Matha DC EVCS - ChargeMOD', 'Matha DC EVCS - ChargeMOD, Kizhakkambalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('0868c99a-9966-5c6d-beda-2c40be810eeb', 'e9aa564b-c5ad-5c14-877d-f05e2145b54d', 'Matha DC EVCS - ChargeMOD', 'Matha DC EVCS - ChargeMOD, Kizhakkambalam, Kerala, India', 10.03193693, 76.40749252, 'India EV Network License', 'LIC-IN-ST870', 500.0, 30.0, true, 'Kizhakkambalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '0868c99a-9966-5c6d-beda-2c40be810eeb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0c6e4e3d-1e13-5104-927d-8adcf05c8bdd', '0868c99a-9966-5c6d-beda-2c40be810eeb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 871: Hotel Oottupura (EVOK) - ChargeMOD (Perumbavoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('146fd198-7c91-5146-8af5-87ef859b6a63', '00000000-0000-0000-0000-000000000000', 'st871@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st871@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('146fd198-7c91-5146-8af5-87ef859b6a63', '146fd198-7c91-5146-8af5-87ef859b6a63', '{"sub": "146fd198-7c91-5146-8af5-87ef859b6a63", "email": "st871@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '146fd198-7c91-5146-8af5-87ef859b6a63')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('146fd198-7c91-5146-8af5-87ef859b6a63', 'admin', 'st871@boss.com', 'Admin Hotel Oottupura (EVOK) - ChargeMOD', 'Hotel Oottupura (EVOK) - ChargeMOD', 'Hotel Oottupura (EVOK) - ChargeMOD, Perumbavoor, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e53d3032-1ab8-550a-a2df-cb217c00657d', '146fd198-7c91-5146-8af5-87ef859b6a63', 'Hotel Oottupura (EVOK) - ChargeMOD', 'Hotel Oottupura (EVOK) - ChargeMOD, Perumbavoor, Kerala, India', 10.13017087, 76.47072021, 'India EV Network License', 'LIC-IN-ST871', 500.0, 30.0, true, 'Perumbavoor', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e53d3032-1ab8-550a-a2df-cb217c00657d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('15ea0974-aa83-5967-b53e-e0df59e9ae9b', 'e53d3032-1ab8-550a-a2df-cb217c00657d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 872: Renvolt (EVOK) - ChargeMOD (Kothamangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('f000df1a-3b86-56be-909d-e7fa4712c173', '00000000-0000-0000-0000-000000000000', 'st872@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st872@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('f000df1a-3b86-56be-909d-e7fa4712c173', 'f000df1a-3b86-56be-909d-e7fa4712c173', '{"sub": "f000df1a-3b86-56be-909d-e7fa4712c173", "email": "st872@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'f000df1a-3b86-56be-909d-e7fa4712c173')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('f000df1a-3b86-56be-909d-e7fa4712c173', 'admin', 'st872@boss.com', 'Admin Renvolt (EVOK) - ChargeMOD', 'Renvolt (EVOK) - ChargeMOD', 'Renvolt (EVOK) - ChargeMOD, Kothamangalam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('15260a54-06ab-5df0-b98e-92601cf6423d', 'f000df1a-3b86-56be-909d-e7fa4712c173', 'Renvolt (EVOK) - ChargeMOD', 'Renvolt (EVOK) - ChargeMOD, Kothamangalam, Kerala, India', 10.06947007, 76.60263007, 'India EV Network License', 'LIC-IN-ST872', 500.0, 30.0, true, 'Kothamangalam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '15260a54-06ab-5df0-b98e-92601cf6423d';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('84de9ab6-6574-5c27-8665-32b6fa41d7b1', '15260a54-06ab-5df0-b98e-92601cf6423d', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 873: Kothamangalam KSEB EVCS - ChargeMOD (Kothamangalam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('91c6e557-7252-5df4-95db-12d1db4e5c16', '00000000-0000-0000-0000-000000000000', 'st873@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st873@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('91c6e557-7252-5df4-95db-12d1db4e5c16', '91c6e557-7252-5df4-95db-12d1db4e5c16', '{"sub": "91c6e557-7252-5df4-95db-12d1db4e5c16", "email": "st873@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '91c6e557-7252-5df4-95db-12d1db4e5c16')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('91c6e557-7252-5df4-95db-12d1db4e5c16', 'admin', 'st873@boss.com', 'Admin Kothamangalam KSEB EVCS - ChargeMOD', 'Kothamangalam KSEB EVCS - ChargeMOD', 'Kothamangalam KSEB EVCS - ChargeMOD, Kothamangalam, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c2756eaf-b893-5168-b688-3e38e0476fe8', '91c6e557-7252-5df4-95db-12d1db4e5c16', 'Kothamangalam KSEB EVCS - ChargeMOD', 'Kothamangalam KSEB EVCS - ChargeMOD, Kothamangalam, Kerala, India', 10.05398054, 76.6153842, 'India EV Network License', 'LIC-IN-ST873', 500.0, 30.0, true, 'Kothamangalam', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c2756eaf-b893-5168-b688-3e38e0476fe8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('47e66eca-5886-5cf9-813e-deb5de5132b8', 'c2756eaf-b893-5168-b688-3e38e0476fe8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 874: GATR PowerFin EVCS - ChargeMOD (Muvattupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a9ad67a5-f15e-53fb-9087-73581cdd4713', '00000000-0000-0000-0000-000000000000', 'st874@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st874@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a9ad67a5-f15e-53fb-9087-73581cdd4713', 'a9ad67a5-f15e-53fb-9087-73581cdd4713', '{"sub": "a9ad67a5-f15e-53fb-9087-73581cdd4713", "email": "st874@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a9ad67a5-f15e-53fb-9087-73581cdd4713')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a9ad67a5-f15e-53fb-9087-73581cdd4713', 'admin', 'st874@boss.com', 'Admin GATR PowerFin EVCS - ChargeMOD', 'GATR PowerFin EVCS - ChargeMOD', 'GATR PowerFin EVCS - ChargeMOD, Muvattupuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f6bb4120-27f3-5541-ad97-ed1a4cc6a5f0', 'a9ad67a5-f15e-53fb-9087-73581cdd4713', 'GATR PowerFin EVCS - ChargeMOD', 'GATR PowerFin EVCS - ChargeMOD, Muvattupuzha, Kerala, India', 9.979468553, 76.55067813, 'India EV Network License', 'LIC-IN-ST874', 500.0, 30.0, true, 'Muvattupuzha', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f6bb4120-27f3-5541-ad97-ed1a4cc6a5f0';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c1372f5d-4dfc-5671-a746-80837c1f820f', 'f6bb4120-27f3-5541-ad97-ed1a4cc6a5f0', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 875: PlugMap EVCS by Evan and Eyan (Moovattupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('a3490219-bff3-5ddc-87c2-1180219d49e9', '00000000-0000-0000-0000-000000000000', 'st875@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st875@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('a3490219-bff3-5ddc-87c2-1180219d49e9', 'a3490219-bff3-5ddc-87c2-1180219d49e9', '{"sub": "a3490219-bff3-5ddc-87c2-1180219d49e9", "email": "st875@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'a3490219-bff3-5ddc-87c2-1180219d49e9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('a3490219-bff3-5ddc-87c2-1180219d49e9', 'admin', 'st875@boss.com', 'Admin PlugMap EVCS by Evan and Eyan', 'PlugMap EVCS by Evan and Eyan', 'PlugMap EVCS by Evan and Eyan, Moovattupuzha, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('29c297d0-64c0-5b5b-8135-79051368dbc4', 'a3490219-bff3-5ddc-87c2-1180219d49e9', 'PlugMap EVCS by Evan and Eyan', 'PlugMap EVCS by Evan and Eyan, Moovattupuzha, Kerala, India', 9.978862994, 76.58443995, 'India EV Network License', 'LIC-IN-ST875', 500.0, 7.4, true, 'Moovattupuzha', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '29c297d0-64c0-5b5b-8135-79051368dbc4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a34b8076-069c-52b4-858a-d8a1b2473fbc', '29c297d0-64c0-5b5b-8135-79051368dbc4', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 876: Kabani International (EVOK) - ChargeMOD (Moovattupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e6e2be33-7df3-5a04-9940-ca0bb45f5365', '00000000-0000-0000-0000-000000000000', 'st876@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st876@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e6e2be33-7df3-5a04-9940-ca0bb45f5365', 'e6e2be33-7df3-5a04-9940-ca0bb45f5365', '{"sub": "e6e2be33-7df3-5a04-9940-ca0bb45f5365", "email": "st876@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e6e2be33-7df3-5a04-9940-ca0bb45f5365')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e6e2be33-7df3-5a04-9940-ca0bb45f5365', 'admin', 'st876@boss.com', 'Admin Kabani International (EVOK) - ChargeMOD', 'Kabani International (EVOK) - ChargeMOD', 'Kabani International (EVOK) - ChargeMOD, Moovattupuzha, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('90be594d-6e5a-502f-9ae7-0d8108c953d2', 'e6e2be33-7df3-5a04-9940-ca0bb45f5365', 'Kabani International (EVOK) - ChargeMOD', 'Kabani International (EVOK) - ChargeMOD, Moovattupuzha, Kerala, India', 9.979118268, 76.58664023, 'India EV Network License', 'LIC-IN-ST876', 500.0, 30.0, true, 'Moovattupuzha', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '90be594d-6e5a-502f-9ae7-0d8108c953d2';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('0319b8ec-3c88-5d47-b4ef-84022bf515a0', '90be594d-6e5a-502f-9ae7-0d8108c953d2', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 877: Pineapple City EVCS - ChargeMOD (Thodupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e2f9cbc6-b5f2-5d65-b6e1-4482068c39e9', '00000000-0000-0000-0000-000000000000', 'st877@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st877@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e2f9cbc6-b5f2-5d65-b6e1-4482068c39e9', 'e2f9cbc6-b5f2-5d65-b6e1-4482068c39e9', '{"sub": "e2f9cbc6-b5f2-5d65-b6e1-4482068c39e9", "email": "st877@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e2f9cbc6-b5f2-5d65-b6e1-4482068c39e9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e2f9cbc6-b5f2-5d65-b6e1-4482068c39e9', 'admin', 'st877@boss.com', 'Admin Pineapple City EVCS - ChargeMOD', 'Pineapple City EVCS - ChargeMOD', 'Pineapple City EVCS - ChargeMOD, Thodupuzha, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('03033743-30a0-566e-9b77-b9836e9035dc', 'e2f9cbc6-b5f2-5d65-b6e1-4482068c39e9', 'Pineapple City EVCS - ChargeMOD', 'Pineapple City EVCS - ChargeMOD, Thodupuzha, Kerala, India', 9.94615736, 76.635631, 'India EV Network License', 'LIC-IN-ST877', 500.0, 30.0, true, 'Thodupuzha', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '03033743-30a0-566e-9b77-b9836e9035dc';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9f2d47ba-8c30-5be5-89f4-c1b9cf21c3df', '03033743-30a0-566e-9b77-b9836e9035dc', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 878: Hotel Woodlands - ChargeMOD (Thodupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b2ccf731-cf9f-5334-8200-8b1eb52f4a9f', '00000000-0000-0000-0000-000000000000', 'st878@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st878@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b2ccf731-cf9f-5334-8200-8b1eb52f4a9f', 'b2ccf731-cf9f-5334-8200-8b1eb52f4a9f', '{"sub": "b2ccf731-cf9f-5334-8200-8b1eb52f4a9f", "email": "st878@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b2ccf731-cf9f-5334-8200-8b1eb52f4a9f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b2ccf731-cf9f-5334-8200-8b1eb52f4a9f', 'admin', 'st878@boss.com', 'Admin Hotel Woodlands - ChargeMOD', 'Hotel Woodlands - ChargeMOD', 'Hotel Woodlands - ChargeMOD, Thodupuzha, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6f81491a-ba12-5e16-bc08-27fadc6a4ce5', 'b2ccf731-cf9f-5334-8200-8b1eb52f4a9f', 'Hotel Woodlands - ChargeMOD', 'Hotel Woodlands - ChargeMOD, Thodupuzha, Kerala, India', 9.917340697, 76.68758141, 'India EV Network License', 'LIC-IN-ST878', 500.0, 30.0, true, 'Thodupuzha', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6f81491a-ba12-5e16-bc08-27fadc6a4ce5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('20105446-c7a7-53f4-9b5f-512022f9e107', '6f81491a-ba12-5e16-bc08-27fadc6a4ce5', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 879: Thodupuzha KSEB EVCS - ChargeMOD (Thodupuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('cb74a481-5bb7-5b98-b491-a588bebf4358', '00000000-0000-0000-0000-000000000000', 'st879@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st879@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('cb74a481-5bb7-5b98-b491-a588bebf4358', 'cb74a481-5bb7-5b98-b491-a588bebf4358', '{"sub": "cb74a481-5bb7-5b98-b491-a588bebf4358", "email": "st879@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'cb74a481-5bb7-5b98-b491-a588bebf4358')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('cb74a481-5bb7-5b98-b491-a588bebf4358', 'admin', 'st879@boss.com', 'Admin Thodupuzha KSEB EVCS - ChargeMOD', 'Thodupuzha KSEB EVCS - ChargeMOD', 'Thodupuzha KSEB EVCS - ChargeMOD, Thodupuzha, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('6a0bdf86-d898-5f2e-b166-38a4cc374263', 'cb74a481-5bb7-5b98-b491-a588bebf4358', 'Thodupuzha KSEB EVCS - ChargeMOD', 'Thodupuzha KSEB EVCS - ChargeMOD, Thodupuzha, Kerala, India', 9.892123472, 76.70853053, 'India EV Network License', 'LIC-IN-ST879', 500.0, 30.0, true, 'Thodupuzha', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '6a0bdf86-d898-5f2e-b166-38a4cc374263';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c4f99fa7-6adf-5994-95e0-aa6f2bd3aa39', '6a0bdf86-d898-5f2e-b166-38a4cc374263', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 880: EQ EV Nest - ChargeMOD (Karimkunnam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('df4f498a-677e-583c-8f64-0f1122e2c3a9', '00000000-0000-0000-0000-000000000000', 'st880@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st880@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('df4f498a-677e-583c-8f64-0f1122e2c3a9', 'df4f498a-677e-583c-8f64-0f1122e2c3a9', '{"sub": "df4f498a-677e-583c-8f64-0f1122e2c3a9", "email": "st880@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'df4f498a-677e-583c-8f64-0f1122e2c3a9')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('df4f498a-677e-583c-8f64-0f1122e2c3a9', 'admin', 'st880@boss.com', 'Admin EQ EV Nest - ChargeMOD', 'EQ EV Nest - ChargeMOD', 'EQ EV Nest - ChargeMOD, Karimkunnam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e6bb49f5-5f57-5fdb-a3d6-97c68ee175ca', 'df4f498a-677e-583c-8f64-0f1122e2c3a9', 'EQ EV Nest - ChargeMOD', 'EQ EV Nest - ChargeMOD, Karimkunnam, Kerala, India', 9.863113531, 76.69709052, 'India EV Network License', 'LIC-IN-ST880', 500.0, 30.0, true, 'Karimkunnam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e6bb49f5-5f57-5fdb-a3d6-97c68ee175ca';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('f2ab9c3c-de98-5b89-9c05-4a929cedde14', 'e6bb49f5-5f57-5fdb-a3d6-97c68ee175ca', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 881: Royal EV Charging - ChargeMOD (Koothattukulam, Keraka)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('7f3478c2-06c1-5781-ae30-9bc11fd3a145', '00000000-0000-0000-0000-000000000000', 'st881@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st881@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('7f3478c2-06c1-5781-ae30-9bc11fd3a145', '7f3478c2-06c1-5781-ae30-9bc11fd3a145', '{"sub": "7f3478c2-06c1-5781-ae30-9bc11fd3a145", "email": "st881@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '7f3478c2-06c1-5781-ae30-9bc11fd3a145')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('7f3478c2-06c1-5781-ae30-9bc11fd3a145', 'admin', 'st881@boss.com', 'Admin Royal EV Charging - ChargeMOD', 'Royal EV Charging - ChargeMOD', 'Royal EV Charging - ChargeMOD, Koothattukulam, Keraka, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('504a9d53-fe9f-56c7-b103-86ae551b3726', '7f3478c2-06c1-5781-ae30-9bc11fd3a145', 'Royal EV Charging - ChargeMOD', 'Royal EV Charging - ChargeMOD, Koothattukulam, Keraka, India', 9.856562504, 76.5965698, 'India EV Network License', 'LIC-IN-ST881', 500.0, 30.0, true, 'Koothattukulam', 'Keraka', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '504a9d53-fe9f-56c7-b103-86ae551b3726';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('d471694e-5916-5e21-900a-b268b3fd115d', '504a9d53-fe9f-56c7-b103-86ae551b3726', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 882: EQ ChargeMate - ChargeMOD (Thalayolaparambu, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4b7361da-1f62-51a5-b2d2-4558a419bf23', '00000000-0000-0000-0000-000000000000', 'st882@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st882@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4b7361da-1f62-51a5-b2d2-4558a419bf23', '4b7361da-1f62-51a5-b2d2-4558a419bf23', '{"sub": "4b7361da-1f62-51a5-b2d2-4558a419bf23", "email": "st882@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4b7361da-1f62-51a5-b2d2-4558a419bf23')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4b7361da-1f62-51a5-b2d2-4558a419bf23', 'admin', 'st882@boss.com', 'Admin EQ ChargeMate - ChargeMOD', 'EQ ChargeMate - ChargeMOD', 'EQ ChargeMate - ChargeMOD, Thalayolaparambu, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('e2576b1d-0846-532f-bf51-02bfa18ea905', '4b7361da-1f62-51a5-b2d2-4558a419bf23', 'EQ ChargeMate - ChargeMOD', 'EQ ChargeMate - ChargeMOD, Thalayolaparambu, Kerala, India', 9.798850817, 76.45988738, 'India EV Network License', 'LIC-IN-ST882', 500.0, 30.0, true, 'Thalayolaparambu', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'e2576b1d-0846-532f-bf51-02bfa18ea905';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('2ce0f71a-f0cc-5937-98e5-d9f938694d89', 'e2576b1d-0846-532f-bf51-02bfa18ea905', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 883: Sihla Energy - ChargeMOD (Kumarakom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1b066006-1357-5f87-90b6-90925ae67a53', '00000000-0000-0000-0000-000000000000', 'st883@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st883@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1b066006-1357-5f87-90b6-90925ae67a53', '1b066006-1357-5f87-90b6-90925ae67a53', '{"sub": "1b066006-1357-5f87-90b6-90925ae67a53", "email": "st883@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1b066006-1357-5f87-90b6-90925ae67a53')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1b066006-1357-5f87-90b6-90925ae67a53', 'admin', 'st883@boss.com', 'Admin Sihla Energy - ChargeMOD', 'Sihla Energy - ChargeMOD', 'Sihla Energy - ChargeMOD, Kumarakom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('291f100c-e0d3-5d0a-89e3-da32c6951904', '1b066006-1357-5f87-90b6-90925ae67a53', 'Sihla Energy - ChargeMOD', 'Sihla Energy - ChargeMOD, Kumarakom, Kerala, India', 9.594581375, 76.42606942, 'India EV Network License', 'LIC-IN-ST883', 500.0, 30.0, true, 'Kumarakom', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '291f100c-e0d3-5d0a-89e3-da32c6951904';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('b8547a0c-acb4-59e0-a050-9ad5bc483285', '291f100c-e0d3-5d0a-89e3-da32c6951904', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 884: BMW EVM Autokraft Service Center - ChargeMOD (Kochuveli, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('b41f6611-3772-5dad-adf4-a4c39affc0ac', '00000000-0000-0000-0000-000000000000', 'st884@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st884@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('b41f6611-3772-5dad-adf4-a4c39affc0ac', 'b41f6611-3772-5dad-adf4-a4c39affc0ac', '{"sub": "b41f6611-3772-5dad-adf4-a4c39affc0ac", "email": "st884@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'b41f6611-3772-5dad-adf4-a4c39affc0ac')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('b41f6611-3772-5dad-adf4-a4c39affc0ac', 'admin', 'st884@boss.com', 'Admin BMW EVM Autokraft Service Center - ChargeMOD', 'BMW EVM Autokraft Service Center - ChargeMOD', 'BMW EVM Autokraft Service Center - ChargeMOD, Kochuveli, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('9f547d8e-ce1d-5020-baff-a655d3f21a75', 'b41f6611-3772-5dad-adf4-a4c39affc0ac', 'BMW EVM Autokraft Service Center - ChargeMOD', 'BMW EVM Autokraft Service Center - ChargeMOD, Kochuveli, Kerala, India', 8.502329328, 76.89772557, 'India EV Network License', 'LIC-IN-ST884', 500.0, 30.0, true, 'Kochuveli', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '9f547d8e-ce1d-5020-baff-a655d3f21a75';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4966cf7d-ec24-5ffd-9937-2816c5695f00', '9f547d8e-ce1d-5020-baff-a655d3f21a75', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 885: ChargeMOD EVCS (Thiruvananthapuram, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('4813e8f0-bbdb-5707-95e1-7f679d6cf37e', '00000000-0000-0000-0000-000000000000', 'st885@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st885@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('4813e8f0-bbdb-5707-95e1-7f679d6cf37e', '4813e8f0-bbdb-5707-95e1-7f679d6cf37e', '{"sub": "4813e8f0-bbdb-5707-95e1-7f679d6cf37e", "email": "st885@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '4813e8f0-bbdb-5707-95e1-7f679d6cf37e')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('4813e8f0-bbdb-5707-95e1-7f679d6cf37e', 'admin', 'st885@boss.com', 'Admin ChargeMOD EVCS', 'ChargeMOD EVCS', 'ChargeMOD EVCS, Thiruvananthapuram, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5d2c9750-2dba-56bd-aca2-5a0c0a05b672', '4813e8f0-bbdb-5707-95e1-7f679d6cf37e', 'ChargeMOD EVCS', 'ChargeMOD EVCS, Thiruvananthapuram, Kerala, India', 8.357873853, 77.07294498, 'India EV Network License', 'LIC-IN-ST885', 500.0, 30.0, true, 'Thiruvananthapuram', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5d2c9750-2dba-56bd-aca2-5a0c0a05b672';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ccdff511-4512-580d-a2f5-5f8e52f7a218', '5d2c9750-2dba-56bd-aca2-5a0c0a05b672', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 886: Emily By JDaniels (Poojappura, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('ad244696-cafc-58b0-9cc6-66afe554a3d4', '00000000-0000-0000-0000-000000000000', 'st886@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st886@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('ad244696-cafc-58b0-9cc6-66afe554a3d4', 'ad244696-cafc-58b0-9cc6-66afe554a3d4', '{"sub": "ad244696-cafc-58b0-9cc6-66afe554a3d4", "email": "st886@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'ad244696-cafc-58b0-9cc6-66afe554a3d4')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('ad244696-cafc-58b0-9cc6-66afe554a3d4', 'admin', 'st886@boss.com', 'Admin Emily By JDaniels', 'Emily By JDaniels', 'Emily By JDaniels, Poojappura, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('f909bdc2-d22a-5041-a5c3-7228acf221ee', 'ad244696-cafc-58b0-9cc6-66afe554a3d4', 'Emily By JDaniels', 'Emily By JDaniels, Poojappura, Kerala, India', 8.494974778, 76.97756798, 'India EV Network License', 'LIC-IN-ST886', 500.0, 7.4, true, 'Poojappura', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'f909bdc2-d22a-5041-a5c3-7228acf221ee';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('14aeaf66-185c-5222-9d8d-712012aa670f', 'f909bdc2-d22a-5041-a5c3-7228acf221ee', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 887: Nuke EVCS - ChargeMOD (Sreekaryam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('1731a2a2-0f09-559c-aa50-9a399d38c7cc', '00000000-0000-0000-0000-000000000000', 'st887@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st887@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('1731a2a2-0f09-559c-aa50-9a399d38c7cc', '1731a2a2-0f09-559c-aa50-9a399d38c7cc', '{"sub": "1731a2a2-0f09-559c-aa50-9a399d38c7cc", "email": "st887@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '1731a2a2-0f09-559c-aa50-9a399d38c7cc')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('1731a2a2-0f09-559c-aa50-9a399d38c7cc', 'admin', 'st887@boss.com', 'Admin Nuke EVCS - ChargeMOD', 'Nuke EVCS - ChargeMOD', 'Nuke EVCS - ChargeMOD, Sreekaryam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('4f94e8b7-a52f-5f6f-b124-ea43d97c50a8', '1731a2a2-0f09-559c-aa50-9a399d38c7cc', 'Nuke EVCS - ChargeMOD', 'Nuke EVCS - ChargeMOD, Sreekaryam, Kerala, India', 8.548542375, 76.91829328, 'India EV Network License', 'LIC-IN-ST887', 500.0, 30.0, true, 'Sreekaryam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '4f94e8b7-a52f-5f6f-b124-ea43d97c50a8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('ab809793-0a11-5fe2-90ed-12871ba61e79', '4f94e8b7-a52f-5f6f-b124-ea43d97c50a8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 888: Electro Zone EV Fast Charging Station - ChargeMOD (Karyavattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('29a1ce33-984b-5680-8f0e-af9b79df6579', '00000000-0000-0000-0000-000000000000', 'st888@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st888@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('29a1ce33-984b-5680-8f0e-af9b79df6579', '29a1ce33-984b-5680-8f0e-af9b79df6579', '{"sub": "29a1ce33-984b-5680-8f0e-af9b79df6579", "email": "st888@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '29a1ce33-984b-5680-8f0e-af9b79df6579')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('29a1ce33-984b-5680-8f0e-af9b79df6579', 'admin', 'st888@boss.com', 'Admin Electro Zone EV Fast Charging Station - ChargeMOD', 'Electro Zone EV Fast Charging Station - ChargeMOD', 'Electro Zone EV Fast Charging Station - ChargeMOD, Karyavattom, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('eae28603-9eed-524f-a4e7-f62890ab6bdd', '29a1ce33-984b-5680-8f0e-af9b79df6579', 'Electro Zone EV Fast Charging Station - ChargeMOD', 'Electro Zone EV Fast Charging Station - ChargeMOD, Karyavattom, Kerala, India', 8.560820152, 76.89816464, 'India EV Network License', 'LIC-IN-ST888', 500.0, 30.0, true, 'Karyavattom', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'eae28603-9eed-524f-a4e7-f62890ab6bdd';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('c5415a44-7626-5c58-a7eb-f719543c255f', 'eae28603-9eed-524f-a4e7-f62890ab6bdd', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 889: Akshaya EV Fast Charging Station - ChargeMOD (Kazhakuttom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('28dabe7c-3161-5de2-b512-04c467574c6c', '00000000-0000-0000-0000-000000000000', 'st889@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st889@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('28dabe7c-3161-5de2-b512-04c467574c6c', '28dabe7c-3161-5de2-b512-04c467574c6c', '{"sub": "28dabe7c-3161-5de2-b512-04c467574c6c", "email": "st889@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '28dabe7c-3161-5de2-b512-04c467574c6c')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('28dabe7c-3161-5de2-b512-04c467574c6c', 'admin', 'st889@boss.com', 'Admin Akshaya EV Fast Charging Station - ChargeMOD', 'Akshaya EV Fast Charging Station - ChargeMOD', 'Akshaya EV Fast Charging Station - ChargeMOD, Kazhakuttom, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5db3e80b-9825-5618-ad68-fca943f8e71c', '28dabe7c-3161-5de2-b512-04c467574c6c', 'Akshaya EV Fast Charging Station - ChargeMOD', 'Akshaya EV Fast Charging Station - ChargeMOD, Kazhakuttom, Kerala, India', 8.565300166, 76.87444738, 'India EV Network License', 'LIC-IN-ST889', 500.0, 30.0, true, 'Kazhakuttom', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5db3e80b-9825-5618-ad68-fca943f8e71c';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('9f242e68-5084-5d1f-a95e-44240a9bd1da', '5db3e80b-9825-5618-ad68-fca943f8e71c', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 890: Moolamattom KSEB EVCS - ChargeMOD (Moolamattom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('05cdc031-d49b-5f75-8a33-5151f57d0f28', '00000000-0000-0000-0000-000000000000', 'st890@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st890@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('05cdc031-d49b-5f75-8a33-5151f57d0f28', '05cdc031-d49b-5f75-8a33-5151f57d0f28', '{"sub": "05cdc031-d49b-5f75-8a33-5151f57d0f28", "email": "st890@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '05cdc031-d49b-5f75-8a33-5151f57d0f28')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('05cdc031-d49b-5f75-8a33-5151f57d0f28', 'admin', 'st890@boss.com', 'Admin Moolamattom KSEB EVCS - ChargeMOD', 'Moolamattom KSEB EVCS - ChargeMOD', 'Moolamattom KSEB EVCS - ChargeMOD, Moolamattom, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('ceb153fc-5870-5509-9b27-b6865cfcafeb', '05cdc031-d49b-5f75-8a33-5151f57d0f28', 'Moolamattom KSEB EVCS - ChargeMOD', 'Moolamattom KSEB EVCS - ChargeMOD, Moolamattom, Kerala, India', 9.789170222, 76.85385689, 'India EV Network License', 'LIC-IN-ST890', 500.0, 30.0, true, 'Moolamattom', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'ceb153fc-5870-5509-9b27-b6865cfcafeb';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('bfebb76c-0927-5a50-8329-876c13e15907', 'ceb153fc-5870-5509-9b27-b6865cfcafeb', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 891: EQ Vagamon EV Port - ChargeMOD (Vagamon, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('8643d43a-c9ec-5c52-97bf-4f5f01c3e086', '00000000-0000-0000-0000-000000000000', 'st891@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st891@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('8643d43a-c9ec-5c52-97bf-4f5f01c3e086', '8643d43a-c9ec-5c52-97bf-4f5f01c3e086', '{"sub": "8643d43a-c9ec-5c52-97bf-4f5f01c3e086", "email": "st891@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '8643d43a-c9ec-5c52-97bf-4f5f01c3e086')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('8643d43a-c9ec-5c52-97bf-4f5f01c3e086', 'admin', 'st891@boss.com', 'Admin EQ Vagamon EV Port - ChargeMOD', 'EQ Vagamon EV Port - ChargeMOD', 'EQ Vagamon EV Port - ChargeMOD, Vagamon, Kerala, India', 500.0, 3, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('12c5cbbd-f40a-559a-ad82-3f40d3c8c986', '8643d43a-c9ec-5c52-97bf-4f5f01c3e086', 'EQ Vagamon EV Port - ChargeMOD', 'EQ Vagamon EV Port - ChargeMOD, Vagamon, Kerala, India', 9.684303987, 76.89548264, 'India EV Network License', 'LIC-IN-ST891', 500.0, 30.0, true, 'Vagamon', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '12c5cbbd-f40a-559a-ad82-3f40d3c8c986';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('a453b3d7-ab05-5e34-9126-cae43e5eef8c', '12c5cbbd-f40a-559a-ad82-3f40d3c8c986', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 892: Palm Peats (EVOK) - ChargeMOD (Erattupetta, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('6f6b652b-f28b-56be-9f03-eae747b4a5a2', '00000000-0000-0000-0000-000000000000', 'st892@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st892@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('6f6b652b-f28b-56be-9f03-eae747b4a5a2', '6f6b652b-f28b-56be-9f03-eae747b4a5a2', '{"sub": "6f6b652b-f28b-56be-9f03-eae747b4a5a2", "email": "st892@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '6f6b652b-f28b-56be-9f03-eae747b4a5a2')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('6f6b652b-f28b-56be-9f03-eae747b4a5a2', 'admin', 'st892@boss.com', 'Admin Palm Peats (EVOK) - ChargeMOD', 'Palm Peats (EVOK) - ChargeMOD', 'Palm Peats (EVOK) - ChargeMOD, Erattupetta, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('288f61c7-48c7-559f-a03f-0bf2f638c633', '6f6b652b-f28b-56be-9f03-eae747b4a5a2', 'Palm Peats (EVOK) - ChargeMOD', 'Palm Peats (EVOK) - ChargeMOD, Erattupetta, Kerala, India', 9.690678968, 76.77458973, 'India EV Network License', 'LIC-IN-ST892', 500.0, 30.0, true, 'Erattupetta', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '288f61c7-48c7-559f-a03f-0bf2f638c633';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('43ab94bf-fa0a-546b-a518-3fcb05cceae6', '288f61c7-48c7-559f-a03f-0bf2f638c633', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 893: Flour Mill (EVOK) - ChargeMOD (Pala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('3290d9ec-cb92-5611-9718-5b21299880c1', '00000000-0000-0000-0000-000000000000', 'st893@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st893@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('3290d9ec-cb92-5611-9718-5b21299880c1', '3290d9ec-cb92-5611-9718-5b21299880c1', '{"sub": "3290d9ec-cb92-5611-9718-5b21299880c1", "email": "st893@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '3290d9ec-cb92-5611-9718-5b21299880c1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('3290d9ec-cb92-5611-9718-5b21299880c1', 'admin', 'st893@boss.com', 'Admin Flour Mill (EVOK) - ChargeMOD', 'Flour Mill (EVOK) - ChargeMOD', 'Flour Mill (EVOK) - ChargeMOD, Pala, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('d19d00f3-6062-5b2c-be34-482fb9a83f54', '3290d9ec-cb92-5611-9718-5b21299880c1', 'Flour Mill (EVOK) - ChargeMOD', 'Flour Mill (EVOK) - ChargeMOD, Pala, Kerala, India', 9.711918348, 76.6932445, 'India EV Network License', 'LIC-IN-ST893', 500.0, 30.0, true, 'Pala', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'd19d00f3-6062-5b2c-be34-482fb9a83f54';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('3552f80a-b3a5-5793-a901-8225f3525c08', 'd19d00f3-6062-5b2c-be34-482fb9a83f54', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 894: Jim and Jims EVCS - ChargeMOD (Pala, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('e34be320-593e-5c27-b46c-4c6326e3ccbd', '00000000-0000-0000-0000-000000000000', 'st894@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st894@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('e34be320-593e-5c27-b46c-4c6326e3ccbd', 'e34be320-593e-5c27-b46c-4c6326e3ccbd', '{"sub": "e34be320-593e-5c27-b46c-4c6326e3ccbd", "email": "st894@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'e34be320-593e-5c27-b46c-4c6326e3ccbd')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('e34be320-593e-5c27-b46c-4c6326e3ccbd', 'admin', 'st894@boss.com', 'Admin Jim and Jims EVCS - ChargeMOD', 'Jim and Jims EVCS - ChargeMOD', 'Jim and Jims EVCS - ChargeMOD, Pala, Kerala, India', 500.0, 4, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('be2ffd7b-71f2-5a33-bdcb-078fa7522bde', 'e34be320-593e-5c27-b46c-4c6326e3ccbd', 'Jim and Jims EVCS - ChargeMOD', 'Jim and Jims EVCS - ChargeMOD, Pala, Kerala, India', 9.691623798, 76.64031695, 'India EV Network License', 'LIC-IN-ST894', 500.0, 30.0, true, 'Pala', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'be2ffd7b-71f2-5a33-bdcb-078fa7522bde';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('6c21be17-98d8-5c1a-aed8-bb6223a8c5de', 'be2ffd7b-71f2-5a33-bdcb-078fa7522bde', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 895: Alpha Hangout Play World (Ettumanoor, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('98fbefbf-a9cb-5f5e-a325-875e5d92f0ce', '00000000-0000-0000-0000-000000000000', 'st895@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st895@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('98fbefbf-a9cb-5f5e-a325-875e5d92f0ce', '98fbefbf-a9cb-5f5e-a325-875e5d92f0ce', '{"sub": "98fbefbf-a9cb-5f5e-a325-875e5d92f0ce", "email": "st895@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '98fbefbf-a9cb-5f5e-a325-875e5d92f0ce')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('98fbefbf-a9cb-5f5e-a325-875e5d92f0ce', 'admin', 'st895@boss.com', 'Admin Alpha Hangout Play World', 'Alpha Hangout Play World', 'Alpha Hangout Play World, Ettumanoor, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('fd4d833e-d835-5a0f-950e-32b91b3066ac', '98fbefbf-a9cb-5f5e-a325-875e5d92f0ce', 'Alpha Hangout Play World', 'Alpha Hangout Play World, Ettumanoor, Kerala, India', 9.661163852, 76.55132833, 'India EV Network License', 'LIC-IN-ST895', 500.0, 7.4, true, 'Ettumanoor', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'fd4d833e-d835-5a0f-950e-32b91b3066ac';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('acaeec13-d3c4-567b-8e23-a4a08eb4995a', 'fd4d833e-d835-5a0f-950e-32b91b3066ac', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 896: Gandhi Nagar KSEB EVCS - ChargeMOD (Arpookara, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('c5159969-f4f6-51e3-a3a7-1d1a6ab9fd2f', '00000000-0000-0000-0000-000000000000', 'st896@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st896@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('c5159969-f4f6-51e3-a3a7-1d1a6ab9fd2f', 'c5159969-f4f6-51e3-a3a7-1d1a6ab9fd2f', '{"sub": "c5159969-f4f6-51e3-a3a7-1d1a6ab9fd2f", "email": "st896@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'c5159969-f4f6-51e3-a3a7-1d1a6ab9fd2f')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('c5159969-f4f6-51e3-a3a7-1d1a6ab9fd2f', 'admin', 'st896@boss.com', 'Admin Gandhi Nagar KSEB EVCS - ChargeMOD', 'Gandhi Nagar KSEB EVCS - ChargeMOD', 'Gandhi Nagar KSEB EVCS - ChargeMOD, Arpookara, Kerala, India', 500.0, 5, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('dc227f78-b2f3-5f28-a52d-b40356e9e5c4', 'c5159969-f4f6-51e3-a3a7-1d1a6ab9fd2f', 'Gandhi Nagar KSEB EVCS - ChargeMOD', 'Gandhi Nagar KSEB EVCS - ChargeMOD, Arpookara, Kerala, India', 9.632684209, 76.5244017, 'India EV Network License', 'LIC-IN-ST896', 500.0, 30.0, true, 'Arpookara', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'dc227f78-b2f3-5f28-a52d-b40356e9e5c4';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('36970b61-1775-5577-aef0-12cd5aa545e2', 'dc227f78-b2f3-5f28-a52d-b40356e9e5c4', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 897: Indraprastha Hotel (EVOK) - ChargeMOD (Kottayam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('39292adb-58a6-5fbf-b174-2ffe1a8539ca', '00000000-0000-0000-0000-000000000000', 'st897@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st897@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('39292adb-58a6-5fbf-b174-2ffe1a8539ca', '39292adb-58a6-5fbf-b174-2ffe1a8539ca', '{"sub": "39292adb-58a6-5fbf-b174-2ffe1a8539ca", "email": "st897@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '39292adb-58a6-5fbf-b174-2ffe1a8539ca')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('39292adb-58a6-5fbf-b174-2ffe1a8539ca', 'admin', 'st897@boss.com', 'Admin Indraprastha Hotel (EVOK) - ChargeMOD', 'Indraprastha Hotel (EVOK) - ChargeMOD', 'Indraprastha Hotel (EVOK) - ChargeMOD, Kottayam, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('caf881de-20ea-5e25-bf1b-db427b63c53b', '39292adb-58a6-5fbf-b174-2ffe1a8539ca', 'Indraprastha Hotel (EVOK) - ChargeMOD', 'Indraprastha Hotel (EVOK) - ChargeMOD, Kottayam, Kerala, India', 9.601836959, 76.53215901, 'India EV Network License', 'LIC-IN-ST897', 500.0, 30.0, true, 'Kottayam', 'Kerala', 1, 'ChargeMod (IN)', '24 Hours (Hotel/Resort Guest Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'caf881de-20ea-5e25-bf1b-db427b63c53b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('aaa536a6-824f-5056-8dff-1f3da5402f4f', 'caf881de-20ea-5e25-bf1b-db427b63c53b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 898: Charge n Fresh EVCS - ChargeMOD (Kottayam, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('45c71c9a-5f29-5c01-a8fa-7a5be09a34a1', '00000000-0000-0000-0000-000000000000', 'st898@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st898@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('45c71c9a-5f29-5c01-a8fa-7a5be09a34a1', '45c71c9a-5f29-5c01-a8fa-7a5be09a34a1', '{"sub": "45c71c9a-5f29-5c01-a8fa-7a5be09a34a1", "email": "st898@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '45c71c9a-5f29-5c01-a8fa-7a5be09a34a1')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('45c71c9a-5f29-5c01-a8fa-7a5be09a34a1', 'admin', 'st898@boss.com', 'Admin Charge n Fresh EVCS - ChargeMOD', 'Charge n Fresh EVCS - ChargeMOD', 'Charge n Fresh EVCS - ChargeMOD, Kottayam, Kerala, India', 500.0, 2, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('c53b5416-16ea-5dc6-ac4f-b50f27512aa8', '45c71c9a-5f29-5c01-a8fa-7a5be09a34a1', 'Charge n Fresh EVCS - ChargeMOD', 'Charge n Fresh EVCS - ChargeMOD, Kottayam, Kerala, India', 9.586257488, 76.58841522, 'India EV Network License', 'LIC-IN-ST898', 500.0, 30.0, true, 'Kottayam', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 10:00 PM (Typical Public Access)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = 'c53b5416-16ea-5dc6-ac4f-b50f27512aa8';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('4d5b4115-4012-5a8d-9823-452d9a3bace5', 'c53b5416-16ea-5dc6-ac4f-b50f27512aa8', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 899: Pallam KSEB EVCS - ChargeMOD (Pallom, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('5c49f58d-4187-5b45-8ff2-aab6546744be', '00000000-0000-0000-0000-000000000000', 'st899@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st899@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('5c49f58d-4187-5b45-8ff2-aab6546744be', '5c49f58d-4187-5b45-8ff2-aab6546744be', '{"sub": "5c49f58d-4187-5b45-8ff2-aab6546744be", "email": "st899@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), '5c49f58d-4187-5b45-8ff2-aab6546744be')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('5c49f58d-4187-5b45-8ff2-aab6546744be', 'admin', 'st899@boss.com', 'Admin Pallam KSEB EVCS - ChargeMOD', 'Pallam KSEB EVCS - ChargeMOD', 'Pallam KSEB EVCS - ChargeMOD, Pallom, Kerala, India', 500.0, 6, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('5deec2f8-56bc-53dd-8e0c-29c1afe4780b', '5c49f58d-4187-5b45-8ff2-aab6546744be', 'Pallam KSEB EVCS - ChargeMOD', 'Pallam KSEB EVCS - ChargeMOD, Pallom, Kerala, India', 9.543064907, 76.51423133, 'India EV Network License', 'LIC-IN-ST899', 500.0, 30.0, true, 'Pallom', 'Kerala', 1, 'ChargeMod (IN)', '09:00 AM - 06:00 PM (Business Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '5deec2f8-56bc-53dd-8e0c-29c1afe4780b';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('36257a22-a1d8-5a50-8026-8c32e31a90c3', '5deec2f8-56bc-53dd-8e0c-29c1afe4780b', 'Port A', 150, 'available', 0, 'CCS', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
-- Station 900: Amma Restaurant (Alappuzha, Kerala)
INSERT INTO auth.users (id, instance_id, email, encrypted_password, email_confirmed_at, raw_app_meta_data, raw_user_meta_data, role, aud, created_at, updated_at, confirmation_token, recovery_token, email_change_token_new, email_change, email_change_token_current, reauthentication_token, phone_change, phone_change_token)
VALUES ('aadf6922-e803-51b0-9018-69123cc6c3f8', '00000000-0000-0000-0000-000000000000', 'st900@boss.com', crypt('Viswa123#', gen_salt('bf', 10)), now(), '{"provider":"email","providers":["email"]}'::jsonb, '{"email": "st900@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'authenticated', 'authenticated', now(), now(), '', '', '', '', '', '', '', '')
ON CONFLICT (id) DO NOTHING;

INSERT INTO auth.identities (provider_id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at, id)
VALUES ('aadf6922-e803-51b0-9018-69123cc6c3f8', 'aadf6922-e803-51b0-9018-69123cc6c3f8', '{"sub": "aadf6922-e803-51b0-9018-69123cc6c3f8", "email": "st900@boss.com", "email_verified": true, "phone_verified": false}'::jsonb, 'email', now(), now(), now(), 'aadf6922-e803-51b0-9018-69123cc6c3f8')
ON CONFLICT (provider, provider_id) DO NOTHING;

INSERT INTO public.profiles (id, role, email, name, station_name, station_address, transformer_load_capacity_kva, charger_count, created_at)
VALUES ('aadf6922-e803-51b0-9018-69123cc6c3f8', 'admin', 'st900@boss.com', 'Admin Amma Restaurant', 'Amma Restaurant', 'Amma Restaurant, Alappuzha, Kerala, India', 500.0, 1, now())
ON CONFLICT (id) DO NOTHING;

INSERT INTO public.stations (id, admin_id, name, address, latitude, longitude, license_name, license_no, transformer_load_capacity_kva, current_load_kva, is_active, city, state, charging_points, operator, availability_timing, created_at)
VALUES ('68ce5e44-51ad-5474-9a29-e0089b62bfa5', 'aadf6922-e803-51b0-9018-69123cc6c3f8', 'Amma Restaurant', 'Amma Restaurant, Alappuzha, Kerala, India', 9.519932045, 76.32752164, 'India EV Network License', 'LIC-IN-ST900', 500.0, 7.4, true, 'Alappuzha', 'Kerala', 1, 'ChargeMod (IN)', '08:00 AM - 11:00 PM (Restaurant Hours)', now())
ON CONFLICT (id) DO UPDATE SET 
  current_load_kva = EXCLUDED.current_load_kva,
  charging_points = EXCLUDED.charging_points,
  availability_timing = EXCLUDED.availability_timing,
  city = EXCLUDED.city,
  state = EXCLUDED.state,
  operator = EXCLUDED.operator;

DELETE FROM public.chargers WHERE station_id = '68ce5e44-51ad-5474-9a29-e0089b62bfa5';
INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type, created_at)
VALUES ('fc1b1353-c5ba-5ee1-b9be-0595272457f5', '68ce5e44-51ad-5474-9a29-e0089b62bfa5', 'Port A', 22, 'available', 0, 'Type2', now())
ON CONFLICT (id) DO UPDATE SET
  power_kw = EXCLUDED.power_kw,
  connector_type = EXCLUDED.connector_type;
