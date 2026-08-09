export type Role = 'user' | 'admin' | 'discom';

export type ChargerStatus = 'available' | 'occupied' | 'fault' | 'reserved' | 'maintenance' | 'disabled';
export type ReservationStatus = 'pending' | 'confirmed' | 'cancelled' | 'completed' | 'expired' | 'rejected';

export interface Profile {
  id: string;
  role: Role;
  email: string;
  name: string | null;
  contact: string | null;
  address: string | null;
  vehicle_make: string | null;
  vehicle_model: string | null;
  vehicle_year: number | null;
  battery_capacity_kwh: number | null;
  has_ev: boolean | null;
  usage_area: string | null;
  work_preferred_time: string | null;
  station_name: string | null;
  station_address: string | null;
  license_name: string | null;
  license_no: string | null;
  charger_count: number | null;
  transformer_load_capacity_kva: number | null;
  created_at: string;
}

export interface Station {
  id: string;
  admin_id: string;
  name: string;
  address: string;
  latitude: number;
  longitude: number;
  license_name: string | null;
  license_no: string | null;
  transformer_load_capacity_kva: number;
  current_load_kva: number;
  is_active: boolean;
  created_at: string;
  charging_points?: number;
  status?: string;
  city?: string;
  state?: string;
  operator?: string;
  availability_timing?: string;
}

export interface Charger {
  id: string;
  station_id: string;
  label: string;
  power_kw: number;
  status: ChargerStatus;
  current_load_kw: number;
  connector_type: string;
  created_at: string;
}

export interface Reservation {
  id: string;
  user_id: string;
  station_id: string;
  charger_id: string | null;
  scheduled_time: string;
  charge_current_a: number;
  battery_percent: number | null;
  status: ReservationStatus;
  queue_position: number | null;
  booking_code: string | null;
  code_expires_at: string | null;
  is_emergency: boolean;
  price: number | null;
  created_at: string;
  output_voltage_v?: number;
  output_power_kw?: number;
  slot_end_time?: string;
  district?: string;
  is_redirected?: boolean;
  original_station_name?: string;
  soc_verification_id?: string;
  is_soc_verified?: boolean;
}

export type SOCVerificationStatus =
  | 'verified'
  | 'mismatch'
  | 'low_confidence'
  | 'suspicious'
  | 'failed'
  | 'manual_review';

export interface SOCVerificationResult {
  extractedSOC: number | null;
  claimedSOC: number | null;
  confidence: number;
  status: SOCVerificationStatus;
  reason: string;
  imageHash?: string;
  verifiedAt?: string;
  expiresAt?: string;
  verificationId?: string;
  isReusedImage?: boolean;
  requiredVoltageV?: number;
  captureTimestamp?: string;
}

export interface EVSOCVerification {
  id: string;
  user_id: string;
  vehicle_id?: string | null;
  booking_id?: string | null;
  station_id?: string | null;
  claimed_soc: number;
  verified_soc?: number | null;
  ocr_confidence: number;
  verification_status: SOCVerificationStatus;
  image_hash: string;
  image_url?: string | null;
  captured_at: string;
  verified_at: string;
  expires_at: string;
  is_reused_image: boolean;
  failure_reason?: string | null;
  created_at: string;
}

export interface Notification {
  id: string;
  admin_id: string;
  title: string;
  body: string | null;
  type: string;
  is_read: boolean;
  created_at: string;
}

export interface Coupon {
  id: string;
  user_id: string;
  code: string;
  discount_percent: number;
  reason: string | null;
  station_id: string | null;
  is_used: boolean;
  expires_at: string | null;
  created_at: string;
}

export interface StationWithChargers extends Station {
  chargers: Charger[];
}

export interface Recommendation {
  station: Station;
  chargers: Charger[];
  score: number;
  waitTimeMin: number;
  pricePerKwh: number;
  distanceKm: number;
  loadPercent: number;
  availableChargers: number;
  explanation: string[];
  factors: {
    distance: number;
    wait: number;
    price: number;
    load: number;
    speed: number;
  };
}

export interface BookingResult {
  success: boolean;
  message: string;
  reservation?: Reservation;
  station?: Station;
  qrData?: string;
  output_voltage_v?: number;
  output_power_kw?: number;
  slot_end_time?: string;
  district?: string;
  is_redirected?: boolean;
  original_station_name?: string;
  soc_verification_id?: string;
  is_soc_verified?: boolean;
}
