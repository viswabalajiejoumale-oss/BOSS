-- Setup Database RPC and pgcrypto extension
CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- Admin Smart Meter Verification RPC Function
CREATE OR REPLACE FUNCTION verify_smart_meter_code_by_admin(
  p_admin_id uuid,
  p_booking_code text
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_reservation reservations%ROWTYPE;
BEGIN
  -- Find if the admin owns a station that matches the booking code
  SELECT r.* INTO v_reservation
  FROM reservations r
  JOIN stations s ON r.station_id = s.id
  WHERE r.booking_code = UPPER(TRIM(p_booking_code))
    AND s.admin_id = p_admin_id
    AND r.status = 'confirmed';

  IF NOT FOUND THEN
    RETURN jsonb_build_object(
      'success', false,
      'message', 'Invalid booking code or reservation not found for your station.'
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
      'message', 'Code Expired! The user exceeded the 5-minute verification limit. Reservation marked as expired.'
    );
  END IF;

  -- Update reservation to completed
  UPDATE reservations
  SET status = 'completed'
  WHERE id = v_reservation.id;

  RETURN jsonb_build_object(
    'success', true,
    'message', 'Smart Energy Meter verification successful! Dispensing power to client vehicle.',
    'reservation_id', v_reservation.id,
    'output_voltage_v', v_reservation.output_voltage_v,
    'output_power_kw', v_reservation.output_power_kw
  );
END;
$$;
