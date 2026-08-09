/*
  # BOSS SOC VERIFY — Database Schema & Security Migration
  
  Provides anti-fraud battery state of charge (SOC) verification database tables,
  indexes, RLS security policies, and anti-replay image hash tracking.
*/

-- 1. Create Status Enum if not exists
DO $$ BEGIN
    CREATE TYPE soc_verification_status_enum AS ENUM (
      'verified', 
      'mismatch', 
      'low_confidence', 
      'suspicious', 
      'failed', 
      'manual_review'
    );
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- 2. Create ev_soc_verifications Table
CREATE TABLE IF NOT EXISTS ev_soc_verifications (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  vehicle_id TEXT,
  booking_id UUID,
  station_id UUID,
  
  claimed_soc NUMERIC(5,2) NOT NULL,
  verified_soc NUMERIC(5,2),
  ocr_confidence NUMERIC(5,4) DEFAULT 0.0,
  
  verification_status TEXT NOT NULL DEFAULT 'failed',
  image_hash TEXT NOT NULL,
  image_url TEXT,
  
  captured_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  verified_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  expires_at TIMESTAMPTZ NOT NULL DEFAULT (NOW() + INTERVAL '5 minutes'),
  
  is_reused_image BOOLEAN DEFAULT FALSE,
  failure_reason TEXT,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- 3. Indexes for fast anti-replay and user query performance
CREATE INDEX IF NOT EXISTS idx_soc_verifications_user_id ON ev_soc_verifications(user_id);
CREATE INDEX IF NOT EXISTS idx_soc_verifications_booking_id ON ev_soc_verifications(booking_id);
CREATE INDEX IF NOT EXISTS idx_soc_verifications_station_id ON ev_soc_verifications(station_id);
CREATE INDEX IF NOT EXISTS idx_soc_verifications_image_hash ON ev_soc_verifications(image_hash);
CREATE INDEX IF NOT EXISTS idx_soc_verifications_status ON ev_soc_verifications(verification_status);

-- 4. Enable Row Level Security (RLS)
ALTER TABLE ev_soc_verifications ENABLE ROW LEVEL SECURITY;

-- 5. RLS Policies
-- Users can view their own verifications
CREATE POLICY "Users view own SOC verifications" 
ON ev_soc_verifications 
FOR SELECT 
USING (auth.uid() = user_id);

-- Users can insert their own verifications
CREATE POLICY "Users insert own SOC verifications" 
ON ev_soc_verifications 
FOR INSERT 
WITH CHECK (auth.uid() = user_id);

-- Station Admins can view verifications for their stations
CREATE POLICY "Admins view station SOC verifications" 
ON ev_soc_verifications 
FOR SELECT 
USING (
  EXISTS (
    SELECT 1 FROM stations 
    WHERE stations.id = ev_soc_verifications.station_id 
      AND stations.admin_id = auth.uid()
  )
);

-- Admins can update verification status (for manual review approvals)
CREATE POLICY "Admins update station SOC verifications" 
ON ev_soc_verifications 
FOR UPDATE 
USING (
  EXISTS (
    SELECT 1 FROM stations 
    WHERE stations.id = ev_soc_verifications.station_id 
      AND stations.admin_id = auth.uid()
  )
);

-- 6. Add SOC Verification Foreign Reference to Reservations table
ALTER TABLE IF EXISTS reservations 
ADD COLUMN IF NOT EXISTS soc_verification_id UUID REFERENCES ev_soc_verifications(id) ON DELETE SET NULL,
ADD COLUMN IF NOT EXISTS is_soc_verified BOOLEAN DEFAULT FALSE;
