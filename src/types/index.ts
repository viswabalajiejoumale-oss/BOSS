export type Role = 'user' | 'admin' | 'discom';

export type ChargerStatus = 'available' | 'occupied' | 'fault' | 'reserved';
export type ReservationStatus = 'pending' | 'confirmed' | 'cancelled' | 'completed' | 'expired';

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
}
