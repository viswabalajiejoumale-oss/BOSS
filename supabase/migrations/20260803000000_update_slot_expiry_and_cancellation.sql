/*
  # BOSS Smart EV Network - Slot Expiry & Cancellation Migration
  - Updates verify_smart_meter_code and verify_smart_meter_code_by_admin to check slot expiry
  - Adds cancel_reservation RPC function
*/

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

  -- Check if slot timing window has expired
  IF v_reservation.code_expires_at IS NOT NULL AND v_reservation.code_expires_at < NOW() THEN
    -- Mark status as expired
    UPDATE reservations
    SET status = 'expired'
    WHERE id = v_reservation.id;

    RETURN jsonb_build_object(
      'success', false,
      'message', 'Code Expired! The reserved 1-hour slot timing has ended. Please book a new slot.'
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

  -- Check if slot timing window has expired
  IF v_reservation.code_expires_at IS NOT NULL AND v_reservation.code_expires_at < NOW() THEN
    -- Mark status as expired
    UPDATE reservations
    SET status = 'expired'
    WHERE id = v_reservation.id;

    RETURN jsonb_build_object(
      'success', false,
      'message', 'Code Expired! The 1-hour slot timing has ended. Reservation marked as expired.'
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

CREATE OR REPLACE FUNCTION cancel_reservation(
  p_user_id uuid,
  p_reservation_id uuid
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
AS $$
DECLARE
  v_res reservations%ROWTYPE;
BEGIN
  SELECT * INTO v_res
  FROM reservations
  WHERE id = p_reservation_id AND user_id = p_user_id;

  IF NOT FOUND THEN
    RETURN jsonb_build_object('success', false, 'message', 'Reservation not found.');
  END IF;

  IF v_res.status = 'completed' THEN
    RETURN jsonb_build_object('success', false, 'message', 'Cannot cancel a completed charging session.');
  END IF;

  UPDATE reservations
  SET status = 'cancelled'
  WHERE id = p_reservation_id;

  RETURN jsonb_build_object('success', true, 'message', 'Booking slot code cancelled successfully.');
END;
$$;
