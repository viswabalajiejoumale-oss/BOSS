import type { Station } from '@/types';

const OVERRIDES_KEY = 'boss_station_overrides';

export function getStationOverrides(): Record<string, Partial<Station>> {
  try {
    const raw = localStorage.getItem(OVERRIDES_KEY);
    return raw ? JSON.parse(raw) : {};
  } catch {
    return {};
  }
}

export function updateStationOverride(stationId: string, updates: Partial<Station>) {
  try {
    const existing = getStationOverrides();
    existing[stationId] = { ...(existing[stationId] || {}), ...updates };
    localStorage.setItem(OVERRIDES_KEY, JSON.stringify(existing));
    window.dispatchEvent(new CustomEvent('boss_station_updated', { detail: { stationId, updates } }));
  } catch (err) {
    console.error('Failed to save station override:', err);
  }
}

export function applyStationOverrides(stations: Station[]): Station[] {
  const overrides = getStationOverrides();
  if (Object.keys(overrides).length === 0) return stations;

  return stations.map((s) => {
    if (overrides[s.id]) {
      return { ...s, ...overrides[s.id] };
    }
    return s;
  });
}

const CHARGER_OVERRIDES_KEY = 'boss_charger_overrides';

export function getChargerOverrides(): Record<string, any> {
  try {
    const raw = localStorage.getItem(CHARGER_OVERRIDES_KEY);
    return raw ? JSON.parse(raw) : {};
  } catch {
    return {};
  }
}

export function updateChargerOverride(chargerId: string, updates: any) {
  try {
    const existing = getChargerOverrides();
    existing[chargerId] = { ...(existing[chargerId] || {}), ...updates };
    localStorage.setItem(CHARGER_OVERRIDES_KEY, JSON.stringify(existing));
    window.dispatchEvent(new CustomEvent('boss_charger_updated', { detail: { chargerId, updates } }));
  } catch (err) {
    console.error('Failed to save charger override:', err);
  }
}

export function applyChargerOverrides<T extends { id: string }>(chargers: T[]): T[] {
  const overrides = getChargerOverrides();
  if (Object.keys(overrides).length === 0) return chargers;

  return chargers.map((c) => {
    if (overrides[c.id]) {
      return { ...c, ...overrides[c.id] };
    }
    return c;
  });
}
