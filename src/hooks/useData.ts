import { useEffect, useState, useCallback } from 'react';
import { supabase } from '@/lib/supabase';
import type { Station, Charger, Reservation, Notification } from '@/types';

export function useStations() {
  const [stations, setStations] = useState<Station[]>([]);
  const [chargers, setChargers] = useState<Charger[]>([]);
  const [loading, setLoading] = useState(true);

  const fetch = useCallback(async () => {
    const [{ data: sData, error: sErr }, { data: cData, error: cErr }] = await Promise.all([
      supabase.from('stations').select('*').eq('is_active', true),
      supabase.from('chargers').select('*'),
    ]);
    if (sErr || cErr) {
      console.error('Fetch stations error:', sErr?.message || cErr?.message);
      return;
    }
    setStations((sData ?? []) as Station[]);
    setChargers((cData ?? []) as Charger[]);
    setLoading(false);
  }, []);

  useEffect(() => {
    fetch();
  }, [fetch]);

  return { stations, chargers, loading, refetch: fetch };
}

export function useReservations(userId: string | undefined) {
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [loading, setLoading] = useState(true);

  const fetch = useCallback(async () => {
    if (!userId) return;
    const { data, error } = await supabase
      .from('reservations')
      .select('*')
      .eq('user_id', userId)
      .order('created_at', { ascending: false });
    if (error) {
      console.error('Fetch reservations error:', error.message);
      return;
    }
    setReservations((data ?? []) as Reservation[]);
    setLoading(false);
  }, [userId]);

  useEffect(() => {
    fetch();
  }, [fetch]);

  return { reservations, loading, refetch: fetch };
}

export function useAdminStations(adminId: string | undefined) {
  const [stations, setStations] = useState<Station[]>([]);
  const [chargers, setChargers] = useState<Charger[]>([]);
  const [loading, setLoading] = useState(true);

  const fetch = useCallback(async () => {
    if (!adminId) return;
    const { data: sData, error: sErr } = await supabase
      .from('stations')
      .select('*')
      .eq('admin_id', adminId);
    if (sErr) {
      console.error('Fetch admin stations error:', sErr.message);
      return;
    }
    setStations((sData ?? []) as Station[]);

    if (sData && sData.length > 0) {
      const stationIds = sData.map((s) => s.id);
      const { data: cData, error: cErr } = await supabase
        .from('chargers')
        .select('*')
        .in('station_id', stationIds);
      if (cErr) {
        console.error('Fetch admin chargers error:', cErr.message);
      } else {
        setChargers((cData ?? []) as Charger[]);
      }
    }
    setLoading(false);
  }, [adminId]);

  useEffect(() => {
    fetch();
  }, [fetch]);

  return { stations, chargers, loading, refetch: fetch };
}

export function useNotifications(adminId: string | undefined) {
  const [notifications, setNotifications] = useState<Notification[]>([]);
  const [loading, setLoading] = useState(true);

  const fetch = useCallback(async () => {
    if (!adminId) return;
    const { data, error } = await supabase
      .from('notifications')
      .select('*')
      .eq('admin_id', adminId)
      .order('created_at', { ascending: false });
    if (error) {
      console.error('Fetch notifications error:', error.message);
      return;
    }
    setNotifications((data ?? []) as Notification[]);
    setLoading(false);
  }, [adminId]);

  useEffect(() => {
    fetch();
  }, [fetch]);

  const markRead = useCallback(async (id: string) => {
    await supabase.from('notifications').update({ is_read: true }).eq('id', id);
    setNotifications((prev) => prev.map((n) => (n.id === id ? { ...n, is_read: true } : n)));
  }, []);

  return { notifications, loading, refetch: fetch, markRead };
}
