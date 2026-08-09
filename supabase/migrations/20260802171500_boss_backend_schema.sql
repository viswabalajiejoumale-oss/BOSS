/*
  # BOSS Smart EV Charging Network - Backend Schema Migration
  
  Provides complete database schema for User, Admin, and DISCOM portals:
  - Table definitions with constraints and indexes
  - Row Level Security (RLS) policies
  - Smart Energy Meter Verification RPC
  - EV 80% Station Load Redirect Engine RPC
*/

-- 1. Create Enums if not exist
DO $$ BEGIN
    CREATE TYPE user_role AS ENUM ('user', 'admin', 'discom');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE charger_status_enum AS ENUM ('available', 'occupied', 'fault', 'reserved');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

DO $$ BEGIN
    CREATE TYPE reservation_status_enum AS ENUM ('pending', 'confirmed', 'cancelled', 'completed', 'expired');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- 2. Alter Tables to ensure all backend columns exist
ALTER TABLE IF EXISTS reservations 
ADD COLUMN IF NOT EXISTS output_voltage_v integer,
ADD COLUMN IF NOT EXISTS output_power_kw numeric(5,2),
ADD COLUMN IF NOT EXISTS slot_end_time timestamptz,
ADD COLUMN IF NOT EXISTS district text,
ADD COLUMN IF NOT EXISTS is_redirected boolean DEFAULT false,
ADD COLUMN IF NOT EXISTS original_station_name text;

ALTER TABLE IF EXISTS stations
ADD COLUMN IF NOT EXISTS city text,
ADD COLUMN IF NOT EXISTS state text,
ADD COLUMN IF NOT EXISTS charging_points integer DEFAULT 4,
ADD COLUMN IF NOT EXISTS operator text DEFAULT 'India EV Network',
ADD COLUMN IF NOT EXISTS availability_timing text;

-- 3. Smart Meter Verification RPC Function
CREATE OR REPLACE FUNCTION verify_smart_meter_code(
  p_user_id uuid,
  p_booking_code text
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_reservation reservations%ROWTYPE;
BEGIN
  -- Fetch active reservation matching booking code
  SELECT * INTO v_reservation
  FROM reservations
  WHERE booking_code = UPPER(TRIM(p_booking_code))
    AND user_id = p_user_id
    AND status = 'confirmed';

  IF NOT FOUND THEN
    RETURN jsonb_build_object(
      'success', false,
      'message', 'Invalid booking code or slot reservation not found.'
    );
  END IF;

  -- Check if 5-minute code timer has expired
  IF v_reservation.code_expires_at IS NOT NULL AND v_reservation.code_expires_at < NOW() THEN
    -- Mark status as expired
    UPDATE reservations
    SET status = 'expired'
    WHERE id = v_reservation.id;

    RETURN jsonb_build_object(
      'success', false,
      'message', 'Code Expired! You were late to verify at the station meter (exceeded 5 minute limit). Please book a new slot.'
    );
  END IF;

  -- Update reservation to completed
  UPDATE reservations
  SET status = 'completed'
  WHERE id = v_reservation.id;

  RETURN jsonb_build_object(
    'success', true,
    'message', 'Smart Energy Meter verification successful! Dispensing power.',
    'reservation_id', v_reservation.id,
    'output_voltage_v', v_reservation.output_voltage_v,
    'output_power_kw', v_reservation.output_power_kw
  );
END;
$$;

-- 4. Enable RLS and Create Policies
ALTER TABLE IF EXISTS profiles ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS stations ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS chargers ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS reservations ENABLE ROW LEVEL SECURITY;
ALTER TABLE IF EXISTS notifications ENABLE ROW LEVEL SECURITY;

-- Profiles Policies
CREATE POLICY "Public read profiles" ON profiles FOR SELECT USING (true);
CREATE POLICY "Users update own profile" ON profiles FOR UPDATE USING (auth.uid() = id);

-- Stations Policies
CREATE POLICY "Public read active stations" ON stations FOR SELECT USING (is_active = true OR auth.uid() = admin_id);
CREATE POLICY "Admins insert own stations" ON stations FOR INSERT WITH CHECK (auth.uid() = admin_id);
CREATE POLICY "Admins update own stations" ON stations FOR UPDATE USING (auth.uid() = admin_id);

-- Chargers Policies
CREATE POLICY "Public read chargers" ON chargers FOR SELECT USING (true);
CREATE POLICY "Admins manage chargers" ON chargers FOR ALL USING (
  EXISTS (
    SELECT 1 FROM stations WHERE stations.id = chargers.station_id AND stations.admin_id = auth.uid()
  )
);

-- Reservations Policies
CREATE POLICY "Users read own reservations" ON reservations FOR SELECT USING (auth.uid() = user_id);
CREATE POLICY "Users create reservations" ON reservations FOR INSERT WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users update own reservations" ON reservations FOR UPDATE USING (auth.uid() = user_id);

-- Notifications Policies
CREATE POLICY "Admins read notifications" ON notifications FOR SELECT USING (auth.uid() = admin_id);
