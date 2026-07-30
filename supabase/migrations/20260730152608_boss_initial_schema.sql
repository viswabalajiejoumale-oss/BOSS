/*
# BOSS — Battery Optimization Software Service: initial schema

## Overview
Creates the full data model for an AI-based smart EV charging optimization
and grid load-balancing platform. Three actor types share the system:
EV Users, Charging Station Operators (Admins), and DISCOM grid operators.

## Tables
1. `profiles` — extends Supabase auth.users. One row per account.
   - `role` distinguishes user / admin / discom.
   - User fields: name, contact, address, vehicle details, onboarding answers.
   - Admin fields: station_name, contact, station_address, license, license_no,
     charger_count, transformer_load_capacity_kva.
2. `stations` — charging stations owned by an admin.
3. `chargers` — individual charger ports under a station, each with status and load.
4. `reservations` — booking slots created by users for a charger/station.
   Includes the 5-minute-valid booking code, queue position, charge current, status.
5. `ai_predictions` — explainable AI recommendation / prediction records.
6. `notifications` — admin-facing notifications (overload alerts, bookings, etc.).
7. `coupons` — discount / reward coupons issued for load-balancing incentives.

## Security (RLS)
- profiles: owner-scoped (auth.uid() = id). Users read/update own profile.
- stations: admins manage their own; authenticated users can SELECT (to browse).
- chargers: authenticated can SELECT; owning admin can INSERT/UPDATE/DELETE.
- reservations: owner user can CRUD own; station admin can SELECT for their station.
- ai_predictions: owner user SELECT; admin SELECT for their station.
- notifications: owning admin SELECT/UPDATE.
- coupons: owner user SELECT/UPDATE.
All tables ENABLE RLS. Owner columns default to auth.uid() where applicable.
*/

-- ===== profiles =====
CREATE TABLE IF NOT EXISTS profiles (
  id uuid PRIMARY KEY REFERENCES auth.users(id) ON DELETE CASCADE,
  role text NOT NULL DEFAULT 'user' CHECK (role IN ('user','admin','discom')),
  email text NOT NULL,
  name text,
  contact text,
  address text,
  -- user-specific
  vehicle_make text,
  vehicle_model text,
  vehicle_year int,
  battery_capacity_kwh numeric,
  has_ev boolean,
  usage_area text,
  work_preferred_time text,
  -- admin-specific
  station_name text,
  station_address text,
  license_name text,
  license_no text,
  charger_count int,
  transformer_load_capacity_kva numeric,
  created_at timestamptz DEFAULT now()
);
ALTER TABLE profiles ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_profile" ON profiles;
CREATE POLICY "select_own_profile" ON profiles FOR SELECT
  TO authenticated USING (auth.uid() = id);
DROP POLICY IF EXISTS "insert_own_profile" ON profiles;
CREATE POLICY "insert_own_profile" ON profiles FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = id);
DROP POLICY IF EXISTS "update_own_profile" ON profiles;
CREATE POLICY "update_own_profile" ON profiles FOR UPDATE
  TO authenticated USING (auth.uid() = id) WITH CHECK (auth.uid() = id);

-- ===== stations =====
CREATE TABLE IF NOT EXISTS stations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  admin_id uuid NOT NULL DEFAULT auth.uid() REFERENCES auth.users(id) ON DELETE CASCADE,
  name text NOT NULL,
  address text NOT NULL,
  latitude numeric NOT NULL,
  longitude numeric NOT NULL,
  license_name text,
  license_no text,
  transformer_load_capacity_kva numeric NOT NULL,
  current_load_kva numeric NOT NULL DEFAULT 0,
  is_active boolean DEFAULT true,
  created_at timestamptz DEFAULT now()
);
ALTER TABLE stations ENABLE ROW LEVEL SECURITY;

-- admins manage own; all authenticated can browse (SELECT)
DROP POLICY IF EXISTS "select_stations" ON stations;
CREATE POLICY "select_stations" ON stations FOR SELECT
  TO authenticated USING (true);
DROP POLICY IF EXISTS "insert_own_stations" ON stations;
CREATE POLICY "insert_own_stations" ON stations FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = admin_id);
DROP POLICY IF EXISTS "update_own_stations" ON stations;
CREATE POLICY "update_own_stations" ON stations FOR UPDATE
  TO authenticated USING (auth.uid() = admin_id) WITH CHECK (auth.uid() = admin_id);
DROP POLICY IF EXISTS "delete_own_stations" ON stations;
CREATE POLICY "delete_own_stations" ON stations FOR DELETE
  TO authenticated USING (auth.uid() = admin_id);

-- ===== chargers =====
CREATE TABLE IF NOT EXISTS chargers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  station_id uuid NOT NULL REFERENCES stations(id) ON DELETE CASCADE,
  label text NOT NULL,
  power_kw numeric NOT NULL DEFAULT 50,
  status text NOT NULL DEFAULT 'available' CHECK (status IN ('available','occupied','fault','reserved')),
  current_load_kw numeric NOT NULL DEFAULT 0,
  connector_type text DEFAULT 'CCS',
  created_at timestamptz DEFAULT now()
);
ALTER TABLE chargers ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_chargers" ON chargers;
CREATE POLICY "select_chargers" ON chargers FOR SELECT
  TO authenticated USING (true);
DROP POLICY IF EXISTS "insert_chargers" ON chargers;
CREATE POLICY "insert_chargers" ON chargers FOR INSERT
  TO authenticated WITH CHECK (
    EXISTS (SELECT 1 FROM stations WHERE stations.id = chargers.station_id AND stations.admin_id = auth.uid())
  );
DROP POLICY IF EXISTS "update_chargers" ON chargers;
CREATE POLICY "update_chargers" ON chargers FOR UPDATE
  TO authenticated USING (
    EXISTS (SELECT 1 FROM stations WHERE stations.id = chargers.station_id AND stations.admin_id = auth.uid())
  ) WITH CHECK (
    EXISTS (SELECT 1 FROM stations WHERE stations.id = chargers.station_id AND stations.admin_id = auth.uid())
  );
DROP POLICY IF EXISTS "delete_chargers" ON chargers;
CREATE POLICY "delete_chargers" ON chargers FOR DELETE
  TO authenticated USING (
    EXISTS (SELECT 1 FROM stations WHERE stations.id = chargers.station_id AND stations.admin_id = auth.uid())
  );

-- ===== reservations =====
CREATE TABLE IF NOT EXISTS reservations (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL DEFAULT auth.uid() REFERENCES auth.users(id) ON DELETE CASCADE,
  station_id uuid NOT NULL REFERENCES stations(id) ON DELETE CASCADE,
  charger_id uuid REFERENCES chargers(id) ON DELETE SET NULL,
  scheduled_time timestamptz NOT NULL,
  charge_current_a numeric NOT NULL DEFAULT 32,
  battery_percent numeric,
  status text NOT NULL DEFAULT 'pending' CHECK (status IN ('pending','confirmed','cancelled','completed','expired')),
  queue_position int,
  booking_code text,
  code_expires_at timestamptz,
  is_emergency boolean DEFAULT false,
  price numeric,
  created_at timestamptz DEFAULT now()
);
ALTER TABLE reservations ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_reservations" ON reservations;
CREATE POLICY "select_own_reservations" ON reservations FOR SELECT
  TO authenticated USING (
    auth.uid() = user_id
    OR EXISTS (SELECT 1 FROM stations WHERE stations.id = reservations.station_id AND stations.admin_id = auth.uid())
  );
DROP POLICY IF EXISTS "insert_own_reservations" ON reservations;
CREATE POLICY "insert_own_reservations" ON reservations FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = user_id);
DROP POLICY IF EXISTS "update_own_reservations" ON reservations;
CREATE POLICY "update_own_reservations" ON reservations FOR UPDATE
  TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
DROP POLICY IF EXISTS "delete_own_reservations" ON reservations;
CREATE POLICY "delete_own_reservations" ON reservations FOR DELETE
  TO authenticated USING (auth.uid() = user_id);

-- ===== ai_predictions =====
CREATE TABLE IF NOT EXISTS ai_predictions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid REFERENCES auth.users(id) ON DELETE SET NULL,
  station_id uuid REFERENCES stations(id) ON DELETE CASCADE,
  prediction_type text NOT NULL,
  score numeric,
  explanation jsonb,
  payload jsonb,
  created_at timestamptz DEFAULT now()
);
ALTER TABLE ai_predictions ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_ai_predictions" ON ai_predictions;
CREATE POLICY "select_ai_predictions" ON ai_predictions FOR SELECT
  TO authenticated USING (
    auth.uid() = user_id
    OR EXISTS (SELECT 1 FROM stations WHERE stations.id = ai_predictions.station_id AND stations.admin_id = auth.uid())
  );
DROP POLICY IF EXISTS "insert_ai_predictions" ON ai_predictions;
CREATE POLICY "insert_ai_predictions" ON ai_predictions FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = user_id OR auth.uid() IS NOT NULL);

-- ===== notifications =====
CREATE TABLE IF NOT EXISTS notifications (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  admin_id uuid NOT NULL DEFAULT auth.uid() REFERENCES auth.users(id) ON DELETE CASCADE,
  title text NOT NULL,
  body text,
  type text NOT NULL DEFAULT 'info',
  is_read boolean DEFAULT false,
  created_at timestamptz DEFAULT now()
);
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_notifications" ON notifications;
CREATE POLICY "select_own_notifications" ON notifications FOR SELECT
  TO authenticated USING (auth.uid() = admin_id);
DROP POLICY IF EXISTS "insert_own_notifications" ON notifications;
CREATE POLICY "insert_own_notifications" ON notifications FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = admin_id);
DROP POLICY IF EXISTS "update_own_notifications" ON notifications;
CREATE POLICY "update_own_notifications" ON notifications FOR UPDATE
  TO authenticated USING (auth.uid() = admin_id) WITH CHECK (auth.uid() = admin_id);

-- ===== coupons =====
CREATE TABLE IF NOT EXISTS coupons (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL DEFAULT auth.uid() REFERENCES auth.users(id) ON DELETE CASCADE,
  code text NOT NULL,
  discount_percent numeric NOT NULL DEFAULT 10,
  reason text,
  station_id uuid REFERENCES stations(id) ON DELETE SET NULL,
  is_used boolean DEFAULT false,
  expires_at timestamptz,
  created_at timestamptz DEFAULT now()
);
ALTER TABLE coupons ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "select_own_coupons" ON coupons;
CREATE POLICY "select_own_coupons" ON coupons FOR SELECT
  TO authenticated USING (auth.uid() = user_id);
DROP POLICY IF EXISTS "insert_own_coupons" ON coupons;
CREATE POLICY "insert_own_coupons" ON coupons FOR INSERT
  TO authenticated WITH CHECK (auth.uid() = user_id);
DROP POLICY IF EXISTS "update_own_coupons" ON coupons;
CREATE POLICY "update_own_coupons" ON coupons FOR UPDATE
  TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

-- Indexes
CREATE INDEX IF NOT EXISTS idx_stations_admin ON stations(admin_id);
CREATE INDEX IF NOT EXISTS idx_chargers_station ON chargers(station_id);
CREATE INDEX IF NOT EXISTS idx_reservations_user ON reservations(user_id);
CREATE INDEX IF NOT EXISTS idx_reservations_station ON reservations(station_id);
CREATE INDEX IF NOT EXISTS idx_notifications_admin ON notifications(admin_id);
CREATE INDEX IF NOT EXISTS idx_coupons_user ON coupons(user_id);