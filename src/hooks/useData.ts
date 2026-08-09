import { useEffect, useState, useCallback } from 'react';
import { supabase } from '@/lib/supabase';
import type { Station, Charger, Reservation, Notification } from '@/types';
import rawIndiaStations from '@/data/indiaEvStations.json';
import { getUserReservationsBackendService } from '@/lib/backendServices';
import { applyStationOverrides, applyChargerOverrides } from '@/lib/stationSync';

const connectorTypes = ['CCS', 'Type2', 'CHAdeMO', 'GB/T'];

function generateChargersForStations(stationsList: Station[]): Charger[] {
  const allChargers: Charger[] = [];
  stationsList.forEach((s) => {
    const charCode = s.id.charCodeAt(s.id.length - 1) || 5;
    // Respect updated port counts from station details
    const points = s.charging_points || Math.max(4, Math.min(8, (charCode % 5) + 4));
    for (let i = 1; i <= points; i++) {
      // 65% of ports set to occupied/busy for high demand simulation
      const isOcc = (charCode + i) % 5 !== 0;
      const isFault = (charCode + i) % 23 === 0;
      const status = isFault ? 'fault' : isOcc ? 'occupied' : 'available';
      const power_kw = i % 2 === 0 ? 150 : (i % 3 === 0 ? 60 : 30);
      allChargers.push({
        id: `c_${s.id}_${i}`,
        station_id: s.id,
        label: `Port ${String.fromCharCode(64 + i)}`,
        power_kw,
        status,
        current_load_kw: status === 'occupied' ? Math.round(power_kw * (0.75 + (i % 3) * 0.1)) : 0,
        connector_type: connectorTypes[(i + charCode) % connectorTypes.length],
        created_at: new Date().toISOString(),
      });
    }
  });
  return allChargers;
}

export function useStations() {
  const [stations, setStations] = useState<Station[]>([]);
  const [chargers, setChargers] = useState<Charger[]>([]);
  const [loading, setLoading] = useState(true);

  const fetch = useCallback(async () => {
    let combinedStations: Station[] = (rawIndiaStations as unknown as Station[]).map((s) => ({
      ...s,
      admin_id: s.admin_id || 'admin_india',
      license_name: 'India EV Network License',
      license_no: `LIC-IN-${s.id}`,
      created_at: s.created_at || new Date().toISOString(),
    }));

    try {
      const [{ data: sData }, { data: cData }] = await Promise.all([
        supabase.from('stations').select('*').eq('is_active', true),
        supabase.from('chargers').select('*'),
      ]);

      if (sData && sData.length > 0) {
        // Prepend Supabase stations to dataset
        const existingIds = new Set(sData.map((s) => s.id));
        combinedStations = [
          ...sData as Station[],
          ...combinedStations.filter((s) => !existingIds.has(s.id)),
        ];
      }

      const generatedChargers = generateChargersForStations(combinedStations);
      const dbChargers = (cData ?? []) as Charger[];
      const dbChargerIds = new Set(dbChargers.map((c) => c.id));
      let combinedChargers = [
        ...dbChargers,
        ...generatedChargers.filter((gc) => !dbChargerIds.has(gc.id)),
      ];

      combinedChargers = applyChargerOverrides(combinedChargers);

      // Ensure unique sequential labels per station (Port A, Port B, Port C...)
      const stationPortCounts: Record<string, number> = {};
      combinedChargers = combinedChargers.map((c) => {
        const currentIdx = (stationPortCounts[c.station_id] || 0) + 1;
        stationPortCounts[c.station_id] = currentIdx;
        return {
          ...c,
          label: `Port ${String.fromCharCode(64 + currentIdx)}`,
        };
      });

      // Dynamically sum active charger loads for the station
      combinedStations = combinedStations.map((s) => {
        const sChargers = combinedChargers.filter((c) => c.station_id === s.id);
        const sumLoad = sChargers.reduce((sum, c) => sum + (c.current_load_kw || 0), 0);
        return {
          ...s,
          current_load_kva: sumLoad > 0 ? sumLoad : s.current_load_kva,
        };
      });

      combinedStations = applyStationOverrides(combinedStations);
      setStations(combinedStations);
      setChargers(combinedChargers);
    } catch {
      let generatedChargers = generateChargersForStations(combinedStations);
      generatedChargers = applyChargerOverrides(generatedChargers);
      const stationPortCounts: Record<string, number> = {};
      generatedChargers = generatedChargers.map((c) => {
        const currentIdx = (stationPortCounts[c.station_id] || 0) + 1;
        stationPortCounts[c.station_id] = currentIdx;
        return {
          ...c,
          label: `Port ${String.fromCharCode(64 + currentIdx)}`,
        };
      });

      combinedStations = combinedStations.map((s) => {
        const sChargers = generatedChargers.filter((c) => c.station_id === s.id);
        const sumLoad = sChargers.reduce((sum, c) => sum + (c.current_load_kw || 0), 0);
        return {
          ...s,
          current_load_kva: sumLoad > 0 ? sumLoad : s.current_load_kva,
        };
      });
      combinedStations = applyStationOverrides(combinedStations);
      setStations(combinedStations);
      setChargers(generatedChargers);
    } finally {
      setLoading(false);
    }
  }, []);

  useEffect(() => {
    fetch();
    const interval = setInterval(() => {
      fetch();
    }, 3000);

    const handleOverride = () => fetch();
    window.addEventListener('boss_station_updated', handleOverride);
    window.addEventListener('boss_charger_updated', handleOverride);
    return () => {
      clearInterval(interval);
      window.removeEventListener('boss_station_updated', handleOverride);
      window.removeEventListener('boss_charger_updated', handleOverride);
    };
  }, [fetch]);

  return { stations, chargers, loading, refetch: fetch };
}

export function useReservations(userId: string | undefined) {
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [loading, setLoading] = useState(true);

  const fetch = useCallback(async () => {
    if (!userId) return;
    try {
      const data = await getUserReservationsBackendService(userId);
      setReservations(data);
    } catch {
      // Ignore
    } finally {
      setLoading(false);
    }
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
        setStations((sData ?? []) as Station[]);
      } else {
        const dbChargers = (cData ?? []) as Charger[];
        setChargers(dbChargers);
        
        // Dynamically sum active charger loads for the station
        const updatedStations = (sData ?? []).map((s) => {
          const sChargers = dbChargers.filter((c) => c.station_id === s.id);
          const sumLoad = sChargers.reduce((sum, c) => sum + (c.current_load_kw || 0), 0);
          return {
            ...s,
            current_load_kva: sumLoad > 0 ? sumLoad : s.current_load_kva,
          };
        });
        setStations(updatedStations as Station[]);
      }
    } else {
      setStations([]);
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

export function useStationReservations(stationId: string | undefined) {
  const [reservations, setReservations] = useState<Reservation[]>([]);
  const [loading, setLoading] = useState(true);

  const fetch = useCallback(async () => {
    if (!stationId) return;
    try {
      const { data, error } = await supabase
        .from('reservations')
        .select('*')
        .eq('station_id', stationId)
        .order('created_at', { ascending: false });
      if (error) {
        console.error('Fetch station reservations error:', error.message);
        return;
      }
      setReservations((data ?? []) as Reservation[]);
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  }, [stationId]);

  useEffect(() => {
    fetch();
  }, [fetch]);

  return { reservations, loading, refetch: fetch };
}

