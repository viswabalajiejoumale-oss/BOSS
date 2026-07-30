import type { Station, Charger, Recommendation } from '@/types';

const EARTH_RADIUS_KM = 6371;

export function haversineKm(
  lat1: number,
  lon1: number,
  lat2: number,
  lon2: number
): number {
  const toRad = (d: number) => (d * Math.PI) / 180;
  const dLat = toRad(lat2 - lat1);
  const dLon = toRad(lon2 - lon1);
  const a =
    Math.sin(dLat / 2) ** 2 +
    Math.cos(toRad(lat1)) * Math.cos(toRad(lat2)) * Math.sin(dLon / 2) ** 2;
  return EARTH_RADIUS_KM * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
}

export function getStationLoadPercent(station: Station): number {
  if (station.transformer_load_capacity_kva <= 0) return 0;
  return (station.current_load_kva / station.transformer_load_capacity_kva) * 100;
}

export function getAvailableChargers(chargers: Charger[]): Charger[] {
  return chargers.filter((c) => c.status === 'available');
}

export function getOccupiedChargers(chargers: Charger[]): Charger[] {
  return chargers.filter((c) => c.status === 'occupied');
}

/**
 * Waiting Time Prediction
 * Estimates wait time using queue size, charging speed, battery level,
 * number of chargers, and average session time.
 */
export function predictWaitTimeMin(
  chargers: Charger[],
  batteryPercent: number = 50,
  avgSessionMin: number = 30
): number {
  const available = getAvailableChargers(chargers);
  if (available.length > 0) return 0;

  const occupied = getOccupiedChargers(chargers);
  if (occupied.length === 0) return 0;

  // Estimate remaining time on occupied chargers based on battery level
  // Lower battery = more charge needed = longer session
  const batteryFactor = Math.max(0.2, 1 - batteryPercent / 100);
  const avgPowerKw =
    occupied.reduce((sum, c) => sum + c.power_kw, 0) / occupied.length || 50;

  // Rough: remaining minutes = avgSession * batteryFactor adjusted by power
  const remainingPerCharger = avgSessionMin * batteryFactor * (50 / avgPowerKw);
  // When a charger frees up, wait = min remaining across occupied chargers
  return Math.round(Math.min(...occupied.map(() => remainingPerCharger)));
}

/**
 * Dynamic Pricing
 * Low demand = cheap price; High demand = higher price.
 */
export function dynamicPricePerKwh(
  station: Station,
  chargers: Charger[],
  basePrice: number = 0.25
): number {
  const load = getStationLoadPercent(station);
  const available = getAvailableChargers(chargers).length;
  const total = chargers.length || 1;

  // Demand factor: high load + low availability = higher price
  const demandFactor = 1 + (load / 100) * 0.6 + ((total - available) / total) * 0.4;
  return Math.round(basePrice * demandFactor * 100) / 100;
}

/**
 * Smart AI Recommendation Engine
 * Recommends stations based on Distance, Traffic, Waiting time, Battery %,
 * Charging speed, Electricity price, and Transformer load.
 * Returns an Explainable AI score.
 */
export function recommendStations(
  stations: Station[],
  chargersByStation: Map<string, Charger[]>,
  userLat: number,
  userLon: number,
  batteryPercent: number = 50,
  isEmergency: boolean = false
): Recommendation[] {
  const results: Recommendation[] = stations
    .filter((s) => s.is_active)
    .map((station) => {
      const chargers = chargersByStation.get(station.id) ?? [];
      const distance = haversineKm(userLat, userLon, station.latitude, station.longitude);
      const waitTime = predictWaitTimeMin(chargers, batteryPercent);
      const price = dynamicPricePerKwh(station, chargers);
      const load = getStationLoadPercent(station);
      const available = getAvailableChargers(chargers).length;
      const avgPower =
        chargers.length > 0
          ? chargers.reduce((sum, c) => sum + c.power_kw, 0) / chargers.length
          : 0;

      // Factor scores (0-100, higher = better)
      const distScore = Math.max(0, 100 - distance * 5);
      const waitScore = Math.max(0, 100 - waitTime * 2);
      const priceScore = Math.max(0, 100 - (price - 0.25) * 200);
      const loadScore = Math.max(0, 100 - load);
      const speedScore = Math.min(100, (avgPower / 150) * 100);

      // Weighted composite score
      const weights = isEmergency
        ? { distance: 0.35, wait: 0.35, price: 0.0, load: 0.15, speed: 0.15 }
        : { distance: 0.25, wait: 0.25, price: 0.2, load: 0.15, speed: 0.15 };

      const score =
        distScore * weights.distance +
        waitScore * weights.wait +
        priceScore * weights.price +
        loadScore * weights.load +
        speedScore * weights.speed;

      const explanation: string[] = [];
      explanation.push(`${distance.toFixed(1)} km from your location`);
      explanation.push(`${available} of ${chargers.length} chargers available`);
      explanation.push(`Estimated wait: ${waitTime} min`);
      explanation.push(`Transformer load: ${load.toFixed(0)}%`);
      explanation.push(`Price: $${price.toFixed(2)}/kWh`);
      if (load >= 90) explanation.push('WARNING: Station near capacity — redirecting recommended');
      if (isEmergency) explanation.push('Emergency priority active — nearest available slot');

      return {
        station,
        chargers,
        score: Math.round(score * 10) / 10,
        waitTimeMin: waitTime,
        pricePerKwh: price,
        distanceKm: Math.round(distance * 10) / 10,
        loadPercent: Math.round(load),
        availableChargers: available,
        explanation,
        factors: {
          distance: Math.round(distScore),
          wait: Math.round(waitScore),
          price: Math.round(priceScore),
          load: Math.round(loadScore),
          speed: Math.round(speedScore),
        },
      };
    });

  return results.sort((a, b) => b.score - a.score);
}

/**
 * Transformer Overload Prevention
 * If total charging load reaches 90% utilization, flag for redirect.
 */
export function isOverloaded(station: Station): boolean {
  return getStationLoadPercent(station) >= 90;
}

export function shouldRedirect(station: Station): boolean {
  return getStationLoadPercent(station) >= 90;
}

/**
 * Load Balancing & Incentives
 * If Station A is at 95%+ load and Station B is significantly lower,
 * recommend redirect + reward with discount coupon.
 */
export function getRedirectWithIncentive(
  stations: Station[],
  chargersByStation: Map<string, Charger[]>,
  crowdedStationId: string
): { targetStation: Station | null; discountPercent: number; reason: string } {
  const crowded = stations.find((s) => s.id === crowdedStationId);
  if (!crowded) return { targetStation: null, discountPercent: 0, reason: '' };

  const crowdedLoad = getStationLoadPercent(crowded);
  if (crowdedLoad < 90) return { targetStation: null, discountPercent: 0, reason: '' };

  const alternatives = stations
    .filter((s) => s.id !== crowdedStationId && s.is_active)
    .map((s) => ({ station: s, load: getStationLoadPercent(s) }))
    .sort((a, b) => a.load - b.load);

  if (alternatives.length === 0) return { targetStation: null, discountPercent: 0, reason: '' };

  const best = alternatives[0];
  const discount = crowdedLoad >= 95 ? 20 : 10;
  const reason = `${crowded.name} is at ${crowdedLoad.toFixed(0)}% capacity. Redirect to ${best.station.name} (${best.load.toFixed(0)}% load) and receive a ${discount}% discount coupon.`;

  return { targetStation: best.station, discountPercent: discount, reason };
}

/**
 * Emergency Priority
 * If emergency vehicle or battery < 10%, allocate to priority queue.
 */
export function isEmergencyPriority(batteryPercent: number, isEmergencyVehicle: boolean): boolean {
  return isEmergencyVehicle || batteryPercent < 10;
}

/**
 * Generate a unique booking code (valid for 5 minutes).
 */
export function generateBookingCode(): string {
  const chars = 'ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  let code = 'BOSS-';
  for (let i = 0; i < 5; i++) {
    code += chars[Math.floor(Math.random() * chars.length)];
  }
  return code;
}

export function getCodeExpiry(): string {
  return new Date(Date.now() + 5 * 60 * 1000).toISOString();
}
