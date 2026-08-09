-- Migration to update station loads, port counts, availability timings and chargers based on enriched CSV data
BEGIN;

-- 1. Add availability_timing column to stations if not exists
ALTER TABLE public.stations ADD COLUMN IF NOT EXISTS availability_timing text;

-- Station: Adimali Rangers
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adimali Rangers')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nest Homestay EVOK | Adimali
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nest Homestay EVOK | Adimali')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ Kalayil EVCS | Adoor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ Kalayil EVCS | Adoor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JB Power EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JB Power EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Peninsula Park Residency EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Peninsula Park Residency EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Earth - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Earth - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: SR Auto Zone - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('SR Auto Zone - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bundelkhand Expressway 188 Km Rest Area
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bundelkhand Expressway 188 Km Rest Area')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Statiq Jaypee Agra
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Statiq Jaypee Agra')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: RG Nallanna EVCS (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('RG Nallanna EVCS (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Cassia Regency EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Cassia Regency EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Neo Charge EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Neo Charge EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jason Orchard Inn EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jason Orchard Inn EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Amma Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Amma Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thankamanys EV Fast Charging Station - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thankamanys EV Fast Charging Station - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Cassia Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Cassia Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Doctor Green EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Doctor Green EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Calvarymount Jerry Plaza
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Calvarymount Jerry Plaza')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Yash Square EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Yash Square EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Innate Convention Centre
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Innate Convention Centre')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Rajagiri Hospital EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Rajagiri Hospital EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hospital)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Gokulam Residency - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Gokulam Residency - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Topup Zone EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Topup Zone EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sree Gokulam Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sree Gokulam Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: V-Green EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('V-Green EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVOK Charging Station - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVOK Charging Station - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Edassery Blue Bells EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Edassery Blue Bells EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Elite Palazzo
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Elite Palazzo')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Maxx Inn M Star
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Maxx Inn M Star')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Power Drive EV Supercharging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Power Drive EV Supercharging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GO Green EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GO Green EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sugam Hospitality
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sugam Hospitality')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hospital)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JIO-BP Pulse
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JIO-BP Pulse')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Club Mahindra Aleppey Resort
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Club Mahindra Aleppey Resort')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Gandhi Nagar KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Gandhi Nagar KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: FC - TataPower - TMSC Chandrani Enterprises
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('FC - TataPower - TMSC Chandrani Enterprises')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Athani Energize EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Athani Energize EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Airlink Castle - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Airlink Castle - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hill View Resort (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hill View Resort (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Aeron EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Aeron EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Zenith EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Zenith EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Avananchery KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Avananchery KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: PCR Bank EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('PCR Bank EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Om sai corporation e rickshaw
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Om sai corporation e rickshaw')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bal Gopal Motors
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bal Gopal Motors')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: okinawa electric scooter
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('okinawa electric scooter')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: okinawa electric scooter
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('okinawa electric scooter')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Iris Mall EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Iris Mall EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Taj Bekkal - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Taj Bekkal - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Cargo Auto Hub EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Cargo Auto Hub EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Shivani
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Shivani')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Rest Area Jio BP RHS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Rest Area Jio BP RHS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: DME Bonli Jio BP LHS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('DME Bonli Jio BP LHS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ev
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ev')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Orion Plaza EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Orion Plaza EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Irrai EVCS | Chalakka
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Irrai EVCS | Chalakka')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Indian Coffee House (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Indian Coffee House (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Clay House Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Clay House Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Charge EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Charge EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Edassery Samrudhi Hypermarket (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Iongrid | Thuruthy
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Iongrid | Thuruthy')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ Charis EVCS | Cheeranchira
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ Charis EVCS | Cheeranchira')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: 160kW GREEN ENERGY EV CHARGING STATION
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('160kW GREEN ENERGY EV CHARGING STATION')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Changanassery Immaculate Mary EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Changanassery Immaculate Mary EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JJ E Fills - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JJ E Fills - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Environ EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Environ EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sihla Energy EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sihla Energy EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kadharkkante Chayakkada - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kadharkkante Chayakkada - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Panamthodil Bakers | Chavara
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Panamthodil Bakers | Chavara')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Panamthodil Bakers | Chavara
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Panamthodil Bakers | Chavara')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Surya Hotel (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Surya Hotel (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kunnamangalam Little Flower EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kunnamangalam Little Flower EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chendamangalam Combined Energy
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chendamangalam Combined Energy')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Apco Hyundai - ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Apco Hyundai - ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Quik Energy EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Quik Energy EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Amrutham Auto Care EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Amrutham Auto Care EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Plug EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Plug EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: PTC Arcade - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('PTC Arcade - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sheraton Grand Chennai Resort
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sheraton Grand Chennai Resort')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Club Mahindra Resort - Cherai Beach
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Club Mahindra Resort - Cherai Beach')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adithya Shree EVCS | Ponnamveli
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adithya Shree EVCS | Ponnamveli')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Huts Restaurant EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Huts Restaurant EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Autokast
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Autokast')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: AR Dine - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('AR Dine - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ammas Fast - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ammas Fast - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: VKJ | Flash Charge EVCS | Chettuva
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('VKJ | Flash Charge EVCS | Chettuva')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Empire ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Empire ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bishop Jerome Nagar (EVOK) EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chirakkal Bank EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chirakkal Bank EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata.ev Gokulam Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata.ev Gokulam Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sulfex Mattress (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sulfex Mattress (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Brunton Boatyard
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Brunton Boatyard')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lotus Hyundai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lotus Hyundai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hydra Charging
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hydra Charging')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ankush Vehicles
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ankush Vehicles')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adani Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adani Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thunder Plus Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thunder Plus Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: DIMILI VILLAGE
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('DIMILI VILLAGE')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Energy Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Energy Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JoulePoint Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JoulePoint Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: DIMILI VILLAGE
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('DIMILI VILLAGE')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Energy Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Energy Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JoulePoint Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JoulePoint Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Avantika Resort EV Cosmos
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Avantika Resort EV Cosmos')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: FC - TataPower - Hotel Sumandeep
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('FC - TataPower - Hotel Sumandeep')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL EV Dharamshala Road
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL EV Dharamshala Road')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hydra Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hydra Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Old Rao Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Old Rao Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Garden Family Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Garden Family Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Daffodils EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Daffodils EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Oberon Mall EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Oberon Mall EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lulu International Shopping Mall EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lulu International Shopping Mall EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Emirates Mall - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Emirates Mall - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Grand Mall
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Grand Mall')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Gokul Oottupura Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Gokul Oottupura Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata.ev Luxon Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata.ev Luxon Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: TML Sree Gokulam Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('TML Sree Gokulam Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Charge - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Charge - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Iongrid EV Spark - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Iongrid EV Spark - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: One Stop Automotive Cahrging Station - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('One Stop Automotive Cahrging Station - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bisluck Energy EVCS | Vattaparamba
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bisluck Energy EVCS | Vattaparamba')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Trends Edavannappara EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Trends Edavannappara EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ashva Hyundai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ashva Hyundai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Palakkad Ahalia Women and Childern Hospital EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Palakkad Ahalia Women and Childern Hospital EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hospital)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Palakkad Ahalia Eye Hospital EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Palakkad Ahalia Eye Hospital EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hospital)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Palakkad Ahalia Food Point EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Palakkad Ahalia Food Point EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Bhavan EVCS (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Bhavan EVCS (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: IOCL Engapuzha Fuel - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('IOCL Engapuzha Fuel - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Palm Peats (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Palm Peats (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EC City Centre EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EC City Centre EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Ernakulam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Ernakulam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Le Meridien - ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Le Meridien - ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: MB#Coastal Star
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('MB#Coastal Star')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Charge EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Charge EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ayyappa EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ayyappa EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Minerva EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Minerva EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Qwik Volt EVCS | Kothanalloor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Qwik Volt EVCS | Kothanalloor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ettumanur Skylight EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ettumanur Skylight EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Alpha Hangout Play World
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Alpha Hangout Play World')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Indus Motors - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Indus Motors - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KR RESORT
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KR RESORT')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KR RESORT
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KR RESORT')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: CharjKaro Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('CharjKaro Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: PRATIK E RICKSHAW
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('PRATIK E RICKSHAW')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EESL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EESL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kazam Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kazam Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE,
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('MIRZA RIYAZ HOUSE , CONNON XEROX SERVICE CENTRE,')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: G.K Rickshaw
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('G.K Rickshaw')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KACHERI SECTION TPCODL
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KACHERI SECTION TPCODL')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: AtherGrid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('AtherGrid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: G.K Rickshaw
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('G.K Rickshaw')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KACHERI SECTION TPCODL
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KACHERI SECTION TPCODL')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: AtherGrid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('AtherGrid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: DME Garoth Rest Area RHS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('DME Garoth Rest Area RHS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Volttic Delhi Mumbai Expressway LHS Garoth
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Volttic Delhi Mumbai Expressway LHS Garoth')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lulu Mall EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lulu Mall EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: K2 Highway Treat & Resort
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('K2 Highway Treat & Resort')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Mountain Resort
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Mountain Resort')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sree Krishna Hotel - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sree Krishna Hotel - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Guruvayoor Sreeja EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Guruvayoor Sreeja EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Gokulam Sabari - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Gokulam Sabari - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Devaragam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Devaragam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Home
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Home')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Shree Bihariji Filling Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Shree Bihariji Filling Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Royal Fuel Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Royal Fuel Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Fortune Walkway Mall
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Fortune Walkway Mall')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bikanerwala Sweets Haldwani (Aargo)
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bikanerwala Sweets Haldwani (Aargo)')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bharat Petroleum - Janta Petrol Pump
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bharat Petroleum - Janta Petrol Pump')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power - Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power - Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: V Volte EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('V Volte EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Muzhangodayil EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Muzhangodayil EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Periya A Star - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Periya A Star - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Charging station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Charging station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVee Buddy | Everest Hotel | Idukki
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVee Buddy | Everest Hotel | Idukki')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GO EC Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GO EC Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - DTPC Idukki Park
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - DTPC Idukki Park')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GreenVeel - ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GreenVeel - ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Vrindavan EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Vrindavan EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Irinjalakkuda KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Irinjalakkuda KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KVR Dream Vehicles Service Centre - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KVR Dream Vehicles Service Centre - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sky Penta EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sky Penta EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Highway King
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Highway King')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Prithvi EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Prithvi EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Park Residency EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Park Residency EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hound Mobility EVCS | Kakkanad
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hound Mobility EVCS | Kakkanad')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Smartvolt EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Smartvolt EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Steelane (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Steelane (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kalamassery KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kalamassery KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Rajagiri College EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Rajagiri College EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kaloor KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kaloor KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('TML Marina Motors Pvt. Ltd. Kalpetta - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Cafe Manoila - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Cafe Manoila - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Konfudha Resort - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Konfudha Resort - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Great Trails Wayanad by GRT Hotels
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Great Trails Wayanad by GRT Hotels')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nesto Hypermarket - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nesto Hypermarket - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JetEV Nest Developers | Kambalakkad
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JetEV Nest Developers | Kambalakkad')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kanhangad KSEB EVCS - ChangeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kanhangad KSEB EVCS - ChangeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Raj Residency - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Raj Residency - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Charge EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Charge EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVMOD EVCS | Pudussery
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVMOD EVCS | Pudussery')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Vijaya EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Vijaya EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata.ev KVR Dreams Kannur - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata.ev KVR Dreams Kannur - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Mandrin Sky - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Mandrin Sky - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: G Mall - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('G Mall - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Manjapalam KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Manjapalam KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Pinarayi Park
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Pinarayi Park')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Koodali SCB
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Koodali SCB')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sree Karpagamoorthy Automobiles
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sree Karpagamoorthy Automobiles')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Karthika Residency Hotel EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Karthika Residency Hotel EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KKP Renewables EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KKP Renewables EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ EV Nest - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ EV Nest - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Relax Point Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Relax Point Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Luxon Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Luxon Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: NE-4 KFC Parking
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('NE-4 KFC Parking')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Karulai Malayora Express EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Karulai Malayora Express EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Best EVCS | Karunagappalli
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Best EVCS | Karunagappalli')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Throw In Foodcourt | Karunagappalli
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Throw In Foodcourt | Karunagappalli')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Zufo EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Zufo EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Indraprastha
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Indraprastha')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Best EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Best EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Aravai Aanandas
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Aravai Aanandas')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: VSB Auto Care
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('VSB Auto Care')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: AKR Textiles
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('AKR Textiles')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sihla Energy EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sihla Energy EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: V Charge Hub - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('V Charge Hub - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Quick Charge EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Quick Charge EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electro Zone EV Fast Charging Station - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electro Zone EV Fast Charging Station - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: TML KVR Dream Vehicles EVCS - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('TML KVR Dream Vehicles EVCS - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: IOCL Top Fuels Karanthakkad Charging Station - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('IOCL Top Fuels Karanthakkad Charging Station - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Roshi EVCS (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Roshi EVCS (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Co-Operqative Bank - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Co-Operqative Bank - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Charge EVCS | Kattappana
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Charge EVCS | Kattappana')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Westgate Inn EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Westgate Inn EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: AR Square EVCS | Kavalayoor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('AR Square EVCS | Kavalayoor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sparkzone EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sparkzone EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Cartist - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Cartist - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - KTDC Aahar Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - KTDC Aahar Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GDM Auditorium - ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GDM Auditorium - ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Akshaya EV Fast Charging Station - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Akshaya EV Fast Charging Station - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Regen Energy
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Regen Energy')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Executive EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Executive EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Khajuraho Airport
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Khajuraho Airport')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Airport)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Bundela
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Bundela')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather charging station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather charging station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: NIKOL EV Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('NIKOL EV Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ola Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ola Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adani Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adani Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: DiodeEV Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('DiodeEV Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Relux Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Relux Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adani Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adani Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Maa Tara Tarini Tour And Travels
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Maa Tara Tarini Tour And Travels')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Relux Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Relux Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adani Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adani Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Maa Tara Tarini Tour And Travels
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Maa Tara Tarini Tour And Travels')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sagar Tranport Company
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sagar Tranport Company')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Yash Filling Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Yash Filling Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: 2012531-PRAKASH PETROLEUM
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('2012531-PRAKASH PETROLEUM')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nilas Magestic Arcade
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nilas Magestic Arcade')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Core Multicusine Restaurant - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Core Multicusine Restaurant - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: SK EVCS | Kizhakkambalam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('SK EVCS | Kizhakkambalam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Matha DC EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Matha DC EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Keys Select Kochi
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Keys Select Kochi')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVM MG Motors Coastline Garage - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVM MG Motors Coastline Garage - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Gandhinagar KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Gandhinagar KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kochi Marriot Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kochi Marriot Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Casino Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Casino Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BMW EVM Autokraft Service Center - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BMW EVM Autokraft Service Center - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EV Point EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EV Point EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: rajeEVam EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('rajeEVam EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Centro Mall Charging Station - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Centro Mall Charging Station - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kodungallur SVS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kodungallur SVS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: FUZO EV Super Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('FUZO EV Super Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Mughal Mall
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Mughal Mall')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nandanam EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nandanam EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Locus EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Locus EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVee Buddy | Mangalath EVCS | Mangalathunada
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVee Buddy | Mangalath EVCS | Mangalathunada')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Konnagar
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Konnagar')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: M Square EVOK | Kureepuzha
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('M Square EVOK | Kureepuzha')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sree Suprabhatham - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sree Suprabhatham - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: VOX Xpress Wash (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('VOX Xpress Wash (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Instacharge EV Fast Charging and Café
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Instacharge EV Fast Charging and Café')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chungath Sprise Hyundai - ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chungath Sprise Hyundai - ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Swathi EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Swathi EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Calicut Airport Charging Station - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Calicut Airport Charging Station - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Airport)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Anaswara Jewellers EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Anaswara Jewellers EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Koottanad KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Koottanad KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Savoi Complex EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Savoi Complex EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Haridwar EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Haridwar EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Royal EV Charging - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Royal EV Charging - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KVR Automotive - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KVR Automotive - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Syndicate Mall and Cinemas
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Syndicate Mall and Cinemas')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Koratty Chennai Anandabhavan EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Koratty Chennai Anandabhavan EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lakshya Water Park
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lakshya Water Park')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pattakulam EV Super Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pattakulam EV Super Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Renvolt (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Renvolt (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kothamangalam KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kothamangalam KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thirunilath ECVS Charging Station - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thirunilath ECVS Charging Station - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nesto Hypermarket - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nesto Hypermarket - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Club Sulaimani - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Club Sulaimani - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Planet EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Planet EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Delight Launch Cafe - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Delight Launch Cafe - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ente Veedu Interior (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ente Veedu Interior (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Plug N Pay EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Plug N Pay EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: The Grand Ambassador EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('The Grand Ambassador EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Athira Residency EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Athira Residency EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Indraprastha Hotel (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Indraprastha Hotel (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Charge n Fresh EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Charge n Fresh EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Athirampuzha
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Athirampuzha')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Aida
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Aida')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kottiyam KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kottiyam KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Solar Sparks EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Solar Sparks EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lemon Tree Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lemon Tree Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: SK Volt Hub Kovoor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('SK Volt Hub Kovoor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVM Citroen Calicut
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVM Citroen Calicut')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Shakti | EVOK Charging Hub
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Shakti | EVOK Charging Hub')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: TML Marina Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('TML Marina Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: IOCL Lakshmi Sales & Service - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('IOCL Lakshmi Sales & Service - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Gokulam Galleria Mall - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Gokulam Galleria Mall - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Hyson Heritage - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Hyson Heritage - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Taj The Gateway Hotel - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Taj The Gateway Hotel - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Taj The Gateway Hotel - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Taj The Gateway Hotel - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Reliance Fresh EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Reliance Fresh EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Amp EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Amp EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Calicut Malabar Gold - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Calicut Malabar Gold - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kuttoth Enterprises EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kuttoth Enterprises EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: RG Nallanna EVCS (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('RG Nallanna EVCS (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Gandhi Road KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Gandhi Road KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thiruvangoor EV Fast Charging Station - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thiruvangoor EV Fast Charging Station - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: MB#Bridgeway Motors
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('MB#Bridgeway Motors')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KVR Hyundai - ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KVR Hyundai - ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: HiLite Mall - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('HiLite Mall - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: HiLite Business Park - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('HiLite Business Park - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kulappully KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kulappully KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Poovar PNT EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Poovar PNT EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sora EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sora EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sihla Energy - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sihla Energy - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tamar Cafe
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tamar Cafe')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash EVCS | Kundannoor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash EVCS | Kundannoor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: RK EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('RK EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kundara KSEB - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kundara KSEB - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Yadav EV Charging Station - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Yadav EV Charging Station - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: K4 EV Fast Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('K4 EV Fast Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pontoor EVCS | Fill Nxt | Kunnicode
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pontoor EVCS | Fill Nxt | Kunnicode')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Dhruv EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Dhruv EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chaithanya Hospital EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chaithanya Hospital EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hospital)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Zap N Go
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Zap N Go')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Open Kitchen EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Open Kitchen EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVOK Charger - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVOK Charger - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GLIDA JANESHWAR MISHRA PARK
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GLIDA JANESHWAR MISHRA PARK')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GLIDA LOHIA PARK
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GLIDA LOHIA PARK')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: CGH Wayanad Wild EV Charging Station - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('CGH Wayanad Wild EV Charging Station - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Evee Buddy - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Evee Buddy - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Blaze Fast Charger For 2 Ev Wheeler
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Blaze Fast Charger For 2 Ev Wheeler')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bundelkhand Expressway Chitrakoot Toll
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bundelkhand Expressway Chitrakoot Toll')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Hotel Elite
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Hotel Elite')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Four Points By Sheraton
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Four Points By Sheraton')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Parekkats EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Parekkats EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata.ev Store Malappuram
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata.ev Store Malappuram')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: A M Tyres Malappuram - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('A M Tyres Malappuram - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jam Joom EV Charging Station - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jam Joom EV Charging Station - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chargify EV Super Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chargify EV Super Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JSR EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JSR EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Wayanad Square - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Wayanad Square - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ ChargeMate | Naalumanikkattu
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ ChargeMate | Naalumanikkattu')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Gokulam Relax Park
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Gokulam Relax Park')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: VP Mall EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('VP Mall EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Krishna Enterprises - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Krishna Enterprises - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Golden Baked EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Golden Baked EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Manjoor Beeza Clubhouse EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Manjoor Beeza Clubhouse EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: RK Mess & Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('RK Mess & Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Oasis EV Super Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Oasis EV Super Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Avenue Plaza - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Avenue Plaza - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Kanjirappuzha Garden
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Kanjirappuzha Garden')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Turbo EV Charge Hub | Mannuthi Bypass
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Turbo EV Charge Hub | Mannuthi Bypass')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVOK Charging Hub | Mannuthy
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVOK Charging Hub | Mannuthy')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hyundai EV Chg Stn Manor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hyundai EV Chg Stn Manor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tribute Royale EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tribute Royale EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BYD EVM Southcoast Service Centre - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BYD EVM Southcoast Service Centre - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVM La Maison Citroen Kochi - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVM La Maison Citroen Kochi - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: LiON EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('LiON EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Maranchery Bank EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Maranchery Bank EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: CGH Marari Beach
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('CGH Marari Beach')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Plugin EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Plugin EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Mathil Service Co-Operative Bank EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Mathil Service Co-Operative Bank EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Askar EV - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Askar EV - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Artemis EV Super Charger - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Artemis EV Super Charger - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Driftnation Food Court NH44
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Driftnation Food Court NH44')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Saugandhika Charging Station - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Saugandhika Charging Station - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Meenangadi EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Meenangadi EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Rotana Motors Meenchanda - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Rotana Motors Meenchanda - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVOK Charging Station | Meenkunnam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVOK Charging Station | Meenkunnam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: MKM Melattur (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('MKM Melattur (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kannur H&H
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kannur H&H')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hydra Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hydra Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: M. S. Shanmuganadar Mattai Kadai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('M. S. Shanmuganadar Mattai Kadai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Cube Stop NH-44
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Cube Stop NH-44')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Moolamattom KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Moolamattom KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: PlugMap EVCS by Evan and Eyan
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('PlugMap EVCS by Evan and Eyan')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kabani International (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kabani International (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Ganga Grand
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Ganga Grand')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lemon Tree Vembanad Lake Resort
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lemon Tree Vembanad Lake Resort')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Mall of Mukkom EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Mall of Mukkom EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Anchorage AC - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Anchorage AC - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Malappuram KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Malappuram KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sihla Energy - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sihla Energy - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hill View EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hill View EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Eastend Hotel and Resorts - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Eastend Hotel and Resorts - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Eden Wood Resorts
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Eden Wood Resorts')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Top Dines Hotel - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Top Dines Hotel - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GATR PowerFin EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GATR PowerFin EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: GreenVeel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('GreenVeel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Arcore
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Arcore')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Manipal Hospital Mysore
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Manipal Hospital Mysore')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hospital)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Viraj Junction EFill EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Viraj Junction EFill EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KVR Dream Vehicle - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KVR Dream Vehicle - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KKOH
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KKOH')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sai Restaurant & Cafe
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sai Restaurant & Cafe')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nattika FIRKA Service Co-Operative Bank - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nattika FIRKA Service Co-Operative Bank - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chargezone Hotel Rangoli
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chargezone Hotel Rangoli')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Taj Cochin Internation Airport Hotel - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Taj Cochin Internation Airport Hotel - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Airport)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: SAJ Earth Resort - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('SAJ Earth Resort - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ChargeMOD EVCS Hub
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ChargeMOD EVCS Hub')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: CIAL Terminal 3
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('CIAL Terminal 3')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Airport)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: CIAL Terminal 1
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('CIAL Terminal 1')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Airport)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Capgo EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Capgo EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jippus Galaxy EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jippus Galaxy EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Airsuite Airport Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Airsuite Airport Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Airport)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pathalil EVCS - Charge MOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pathalil EVCS - Charge MOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kalladanthiyil EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kalladanthiyil EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nellikkunnu Snopcap EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nellikkunnu Snopcap EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kavalangad Service Bank EVCS | EVOK
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kavalangad Service Bank EVCS | EVOK')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Changathikoottam EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Changathikoottam EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EcoPlug EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EcoPlug EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EESL - Devinder Collections
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EESL - Devinder Collections')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Rajco EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Rajco EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: New Kerala Hotel EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('New Kerala Hotel EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jam Joom Super Market - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jam Joom Super Market - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ABS Motors - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ABS Motors - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Indus EV Charging
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Indus EV Charging')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: North Paravoor KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('North Paravoor KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ideal EV Super Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ideal EV Super Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Power Zone EV Charging Station - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Power Zone EV Charging Station - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Royale Regency (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Royale Regency (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Plug N Pay EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Plug N Pay EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Anjaly EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Anjaly EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVDay EVCS | Ottappalam | Manissery
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVDay EVCS | Ottappalam | Manissery')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Taj Wayanad Resort and Spa- Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Taj Wayanad Resort and Spa- Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Banasura Sagar KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Banasura Sagar KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EV Point EVCS | Pala
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EV Point EVCS | Pala')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flour Mill (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flour Mill (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jim and Jims EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jim and Jims EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVee Buddy | Town Plug EVCS | Palakkad
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVee Buddy | Town Plug EVCS | Palakkad')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: IOCL Thiruvonam Fuels - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('IOCL Thiruvonam Fuels - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Le Sky Dine EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Le Sky Dine EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electrica EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electrica EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Chittur Thathamangalam Minicipality
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Chittur Thathamangalam Minicipality')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Grand Hyundai - ChargeZone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Grand Hyundai - ChargeZone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Monsoon Empress Hotel EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Monsoon Empress Hotel EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Max EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Max EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Wonderla - Statiq
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Wonderla - Statiq')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pallam KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pallam KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pamba KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pamba KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hi - Span EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hi - Span EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: VAN-V | EVOK | Panamaram
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('VAN-V | EVOK | Panamaram')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: CG Cafe EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('CG Cafe EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EcoCharge EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EcoCharge EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Reboost EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Reboost EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EcoVolt EVCS | EVOK | Pantheerankavu
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EcoVolt EVCS | EVOK | Pantheerankavu')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Earthtron EV
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Earthtron EV')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Earthtron EV
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Earthtron EV')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Mannat
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Mannat')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ Power Buzz EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ Power Buzz EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adhithya Green Power - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adhithya Green Power - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sam EVCV | Perinthalmanna
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sam EVCV | Perinthalmanna')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVOK Charging Stattion - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVOK Charging Stattion - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Paruthippara KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Paruthippara KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sihla Energy EVCS | Pathanadu
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sihla Energy EVCS | Pathanadu')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Evergreen Continental EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Evergreen Continental EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Phills Hub EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Phills Hub EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVOK Pathanamthitta - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVOK Pathanamthitta - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL Milma Diary Plant - EESL
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL Milma Diary Plant - EESL')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: SS Hyundai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('SS Hyundai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: SK EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('SK EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Anupama EVCS | Pathiyoor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Anupama EVCS | Pathiyoor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EV Super Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EV Super Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pattambi Power Bank - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pattambi Power Bank - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Medi Mall EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Medi Mall EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Dream City Convention Center
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Dream City Convention Center')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pattom KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pattom KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pavangad KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pavangad KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: V-Net Shopping Complex - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('V-Net Shopping Complex - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Exit 17 - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Exit 17 - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ Point EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ Point EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Al Ameemi Fast Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Al Ameemi Fast Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KVR Dream Vehicles Service Center - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KVR Dream Vehicles Service Center - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Mindful EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Mindful EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Duke Communications | Pazhuvil
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Duke Communications | Pazhuvil')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Amala Smart EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Amala Smart EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Elektron EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Elektron EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Elite EVOK Charging Hub | Perinthalmanna
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Elite EVOK Charging Hub | Perinthalmanna')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: InFour Wheel Care And Tyres - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('InFour Wheel Care And Tyres - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: TML KVR Automotive - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('TML KVR Automotive - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Shalimar EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Shalimar EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Mughal Park - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Mughal Park - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Moosakkutti Memorial Bus Stand
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Moosakkutti Memorial Bus Stand')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JP Complex EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JP Complex EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electro Spark EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electro Spark EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Future Clock EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Future Clock EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Prestige EV Super Charging Station - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Prestige EV Super Charging Station - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Oottupura (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Oottupura (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Calicut Malabar Gold HQ EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Calicut Malabar Gold HQ EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Barakah Tiles and Stones | EVOK | Thenhipalam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Barakah Tiles and Stones | EVOK | Thenhipalam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Annapura
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Annapura')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Clay Art Cafe - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Clay Art Cafe - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ponnani KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ponnani KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sihla Energy CV Junction
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sihla Energy CV Junction')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Emily By JDaniels
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Emily By JDaniels')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Eco Park EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Eco Park EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kay Pees Electricals (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kay Pees Electricals (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nikol EV Charging station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nikol EV Charging station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Shashtri Nagar
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Shashtri Nagar')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Punnapra KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Punnapra KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chavakkad Golden Tower EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chavakkad Golden Tower EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('WARIVO ELECTRIC SCOOTER SHOWROOM -PREMJIT MOTORS BARIPADA')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Laxmi E Bike Solution
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Laxmi E Bike Solution')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EESL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EESL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Ez Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Ez Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adani Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adani Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Urzza Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Urzza Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Voltran Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Voltran Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Charzer Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Charzer Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Urzza Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Urzza Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Voltran Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Voltran Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Charzer Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Charzer Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Erathu Motors EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Erathu Motors EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Volttic LHS DME
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Volttic LHS DME')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Dilkush EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Dilkush EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVee Buddy | Vedas Energy EVCS | Ramapuram
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVee Buddy | Vedas Energy EVCS | Ramapuram')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: NH44
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('NH44')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Shree Kanha International Chargezone
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Shree Kanha International Chargezone')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power- Ginger Hotel Pantnagar
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power- Ginger Hotel Pantnagar')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ecoplug Radisson Blu Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ecoplug Radisson Blu Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BP-RUDRAPUR
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BP-RUDRAPUR')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: PREM SINGH & SONS (BPCL Charging Station)
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('PREM SINGH & SONS (BPCL Charging Station)')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Rudra Continental
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Rudra Continental')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Midway Treat Khushi Inn Sakadehi Betul Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Midway Treat Khushi Inn Sakadehi Betul Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kovai Hyundai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kovai Hyundai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse EV Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse EV Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Statiq Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Statiq Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adani Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adani Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ola Electric Mobility Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ola Electric Mobility Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kazam Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kazam Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: DK MOTORS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('DK MOTORS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ParkNConnect Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ParkNConnect Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: DK MOTORS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('DK MOTORS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ParkNConnect Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ParkNConnect Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Rest Area Mumbai - Vadodara Expressway
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Rest Area Mumbai - Vadodara Expressway')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: NE4 Eest Area Saraswani
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('NE4 Eest Area Saraswani')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Amrai Resort Tata.Ev
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Amrai Resort Tata.Ev')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Shirdi
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Shirdi')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Kulappulli Bus Stand
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Kulappulli Bus Stand')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hydra Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hydra Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Kantara Dine
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Kantara Dine')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sreekandapuram Samudra EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sreekandapuram Samudra EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nuke EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nuke EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lakshmi KRS EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lakshmi KRS EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pondur - Oragadam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pondur - Oragadam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Fairfield By Marriott
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Fairfield By Marriott')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Issacs Centre Square - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Issacs Centre Square - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: IOCl Balaji Petroleum - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('IOCl Balaji Petroleum - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Adhithya (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Adhithya (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bolt.Earth
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bolt.Earth')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ampere EV by Greaves - Green Wheels
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ampere EV by Greaves - Green Wheels')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thunder Plus Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thunder Plus Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hindustan Petroleum Corporation Limited
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hindustan Petroleum Corporation Limited')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: kesannager electric office
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('kesannager electric office')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Statiq Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Statiq Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Statiq Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Statiq Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kazam Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kazam Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 50.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-bp pulse Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-bp pulse Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bolt.Earth Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bolt.Earth Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Electric Vehicle Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Electric Vehicle Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 25.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BPCL Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BPCL Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ather Grid Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ather Grid Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 3.3, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Bolt.Earth Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Bolt.Earth Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Down Town Mall - Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Down Town Mall - Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KVR Dream Vehicles Thalassery - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KVR Dream Vehicles Thalassery - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ ChargeMate - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ ChargeMate - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ Sprinkle EVCS | Thaliparamba
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ Sprinkle EVCS | Thaliparamba')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: HOTAG EV Charging Station - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('HOTAG EV Charging Station - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thamarassery KESEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thamarassery KESEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chillax EVCS (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chillax EVCS (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: D N R Fuel Point
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('D N R Fuel Point')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Vetri Hyundai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Vetri Hyundai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Empire Restaurant - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Empire Restaurant - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: IOCL - MK Petroleum - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('IOCL - MK Petroleum - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thenmala EVOK - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thenmala EVOK - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Valley - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Valley - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Charge EVCS | Thirivangoor
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Charge EVCS | Thirivangoor')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nesto Hypermarket Zeon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nesto Hypermarket Zeon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVOK Charging Station | Thiruvalla
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVOK Charging Station | Thiruvalla')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Wealfro EV Hub
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Wealfro EV Hub')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Anand Hypermarket - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Anand Hypermarket - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Key Select Thiruvananthapuram
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Key Select Thiruvananthapuram')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JKV Powern Hub EVCS | Palayam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JKV Powern Hub EVCS | Palayam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JKV Powern Hub EVCS | Palayam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JKV Powern Hub EVCS | Palayam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chandra EVCS | Pettah
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chandra EVCS | Pettah')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EV Park ECVS Kazhakkoottam | Karthika Park Hotel
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EV Park ECVS Kazhakkoottam | Karthika Park Hotel')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ Future Mobility Thakkaram
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ Future Mobility Thakkaram')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Eco Charge Hub - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Eco Charge Hub - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Appolo Dimora Hotel EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Appolo Dimora Hotel EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Lulu International Mall EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Lulu International Mall EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Trivandrum UST Campus EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Trivandrum UST Campus EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ChargeMOD EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ChargeMOD EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT - EESL Sangamukham - EESL
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT - EESL Sangamukham - EESL')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Marvel Paints
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Marvel Paints')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sanjeevani Green - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sanjeevani Green - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Pineapple City EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Pineapple City EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Woodlands - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Woodlands - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Thodupuzha KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Thodupuzha KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EVGO Hub - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EVGO Hub - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Raos EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Raos EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: PPG Home EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('PPG Home EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: MPA Tyres EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('MPA Tyres EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Central Talkies EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Central Talkies EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Popular Hyundai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Popular Hyundai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: M Star EVCS | Koorkenchery
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('M Star EVCS | Koorkenchery')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata.ev Hyson Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata.ev Hyson Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: PCK Centenary
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('PCK Centenary')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: TML Hyson Motors - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('TML Hyson Motors - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sree Rama EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sree Rama EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Daiz and Co. EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Daiz and Co. EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Shobha City Mall EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Shobha City Mall EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Plug and Share Charge EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Plug and Share Charge EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Vydyuthi Bhavan KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Vydyuthi Bhavan KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: V8 Car Spa (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('V8 Car Spa (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Hub EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Hub EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Korner EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Korner EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - KILA Thrissur
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - KILA Thrissur')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: MB#Bridgeway Motors
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('MB#Bridgeway Motors')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Nesto Hypermarket
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Nesto Hypermarket')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Chennai Ananda Bhavan
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Chennai Ananda Bhavan')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hilite Mall
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hilite Mall')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Illam Chacka
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Illam Chacka')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Courtyard By Marriott
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Courtyard By Marriott')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Oxina Hyundai
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Oxina Hyundai')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Veepees Bistro And Cafè
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Veepees Bistro And Cafè')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: JBS Bistro Cafe
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('JBS Bistro Cafe')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Page EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Page EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: BP Angadi | EVOK | Tirur
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('BP Angadi | EVOK | Tirur')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: AAK Mall
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('AAK Mall')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '10:00 AM - 10:00 PM (Mall/Retail Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tirur KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tirur KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Hotel Seasons
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Hotel Seasons')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ishyu Restaurant Jetcharge
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ishyu Restaurant Jetcharge')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Cherumattathil Agencies
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Cherumattathil Agencies')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Burger King
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Burger King')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ecozone EVCS | Ulliyeri
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ecozone EVCS | Ulliyeri')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: ANERT EESL - Aahar Restaurant Vadakara
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('ANERT EESL - Aahar Restaurant Vadakara')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 15.0, charging_points = 2, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jeevz - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jeevz - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Evee Buddy - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Evee Buddy - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Amigo EV Charge Hub | Marygiri | Vadakkenchery
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Amigo EV Charge Hub | Marygiri | Vadakkenchery')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Vadakkenchery KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Vadakkenchery KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sree Sankara EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sree Sankara EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Drive EV Super Charging Station
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Drive EV Super Charging Station')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Regenta Fairlark
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Regenta Fairlark')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Regenta Fairlark Jio
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Regenta Fairlark Jio')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Flash Charge EVCS | Vagamon
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Flash Charge EVCS | Vagamon')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ Vagamon EV Port - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ Vagamon EV Port - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Suryas Veggie Restaurant
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Suryas Veggie Restaurant')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 11:00 PM (Restaurant Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Gilgal EVCS | Fill Nxt | Valakom
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Gilgal EVCS | Fill Nxt | Valakom')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: IOCL Sigma Enterprises Charging Station - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('IOCL Sigma Enterprises Charging Station - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Zone EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Zone EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Valappad KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Valappad KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata.Ev Vapi
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata.Ev Vapi')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Power Up EVCS - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Power Up EVCS - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: KVE Charge
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('KVE Charge')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ie.On EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ie.On EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Mountainpass Residency - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Mountainpass Residency - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Velanthavalam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Velanthavalam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: EQ TP Power | Vellur
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('EQ TP Power | Vellur')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Kairali EVCS | Vengalam
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Kairali EVCS | Vengalam')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Green Drive EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Green Drive EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jayalakshmi Silks EVCS | CAPGO | Vennala
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jayalakshmi Silks EVCS | CAPGO | Vennala')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: HIQ Highway Market - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('HIQ Highway Market - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Royal Drive EVCS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Royal Drive EVCS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Vythiri KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Vythiri KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Sunvolt DLF Riverside | Vyttila
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Sunvolt DLF Riverside | Vyttila')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Evee Buddy - Memaid EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Evee Buddy - Memaid EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Broad Bean Hotel (EVOK) - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Broad Bean Hotel (EVOK) - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '24 Hours (Hotel/Resort Guest Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Vyttila KSEB EVCS - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Vyttila KSEB EVCS - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '09:00 AM - 06:00 PM (Business Hours)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: SR Power Hub - ChargeMOD
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('SR Power Hub - ChargeMOD')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 1, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Ahalia Walayar - GO EC
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Ahalia Walayar - GO EC')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 30.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Moto Town Auto Hub - Tata Power
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Moto Town Auto Hub - Tata Power')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '08:00 AM - 10:00 PM (Typical Public Access)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Driftnatuon Food Court NH44
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Driftnatuon Food Court NH44')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 7.4, charging_points = 1, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 22, 'available', 0, 'Type2') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata PowerYamuna Expressway Mathura RHS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata PowerYamuna Expressway Mathura RHS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Tata Power Yamuna Expressway Mathura Exit LHS
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Tata Power Yamuna Expressway Mathura Exit LHS')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 2, availability_timing = '24 Hours (Highway/Transit)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

-- Station: Jio-BP Pulse
DO $$
DECLARE
  v_station_id uuid;
BEGIN
  SELECT id INTO v_station_id FROM public.stations WHERE LOWER(TRIM(name)) = LOWER(TRIM('Jio-BP Pulse')) LIMIT 1;
  IF v_station_id IS NOT NULL THEN
    UPDATE public.stations SET current_load_kva = 60.0, charging_points = 3, availability_timing = '24 Hours (Fuel Station)' WHERE id = v_station_id;
    DELETE FROM public.chargers WHERE station_id = v_station_id;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port A', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port B', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
    INSERT INTO public.chargers (id, station_id, label, power_kw, status, current_load_kw, connector_type) VALUES (gen_random_uuid(), v_station_id, 'Port C', 150, 'available', 0, 'CCS') ON CONFLICT DO NOTHING;
  END IF;
END $$;

COMMIT;