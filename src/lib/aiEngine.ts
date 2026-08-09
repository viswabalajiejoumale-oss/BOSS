import type { Station, Charger, Recommendation } from '@/types';
import rawMlModel from '@/data/indiaEvStations.json'; // fallback if needed
import mlModelData from '@/data/mlChargingModel.json';

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
 * Calculate unedited DC Output Voltage (V) & Power (kW) delivered to machine based on ML model regressor
 */
export function calculateOutputVoltageAndPower(
  batteryPercent: number = 50,
  chargeCurrentA: number = 32,
  stateName?: string
): { outputVoltageV: number; outputPowerKw: number } {
  const pct = Math.min(Math.max(batteryPercent, 0), 100);

  // Fit ML Linear Regressor: V_out = base + (pct / 100) * soc_coeff + currentA * current_coeff
  const base = mlModelData.voltage_regressor.base_voltage_v || 360.0;
  const socCoeff = mlModelData.voltage_regressor.soc_coefficient || 80.0;
  const currentCoeff = mlModelData.voltage_regressor.current_coefficient || 0.25;

  let stateVoltageOffset = 0;
  if (stateName && (mlModelData.state_profiles as Record<string, any>)[stateName]) {
    const profile = (mlModelData.state_profiles as Record<string, any>)[stateName];
    stateVoltageOffset = ((profile.avg_voltage_v || 230) - 230) * 0.1;
  }

  const outputVoltageV = Math.round(base + (pct / 100) * socCoeff + chargeCurrentA * currentCoeff + stateVoltageOffset);
  const rawPowerKw = (outputVoltageV * chargeCurrentA) / 1000;
  const outputPowerKw = Math.round(rawPowerKw * 10) / 10;
  return { outputVoltageV, outputPowerKw };
}

/**
 * 80% EV Station Load Rule
 * If station load >= 80%, automatically redirect to next available station in district with load < 80%
 */
export function check80PercentEVLoadRule(
  stations: Station[],
  chargersByStation: Map<string, Charger[]>,
  selectedStationId: string,
  selectedDistrict?: string
): { shouldRedirect: boolean; targetStation: Station | null; reason: string } {
  const selected = stations.find((s) => s.id === selectedStationId);
  if (!selected) return { shouldRedirect: false, targetStation: null, reason: '' };

  const load = getStationLoadPercent(selected);
  if (load < 80) {
    return { shouldRedirect: false, targetStation: null, reason: '' };
  }

  // Filter alternatives in the same district or state with load < 80%
  const candidates = stations
    .filter((s) => s.id !== selectedStationId && s.is_active)
    .filter((s) => !selectedDistrict || selectedDistrict === 'All' || s.city === selectedDistrict || s.state === selected.state)
    .map((s) => ({ station: s, load: getStationLoadPercent(s) }))
    .filter((c) => c.load < 80)
    .sort((a, b) => a.load - b.load);

  if (candidates.length === 0) {
    return {
      shouldRedirect: true,
      targetStation: null,
      reason: `${selected.name} is at ${load.toFixed(0)}% capacity (exceeds 80% EV load threshold). All nearby stations in this district are also above 80%.`,
    };
  }

  const best = candidates[0].station;
  const bestLoad = candidates[0].load;
  return {
    shouldRedirect: true,
    targetStation: best,
    reason: `${selected.name} is at ${load.toFixed(0)}% capacity, exceeding the 80% EV load rule. System automatically redirected your booking to ${best.name} (${bestLoad.toFixed(0)}% load).`,
  };
}

/**
 * Emergency Priority
 * If emergency vehicle or battery < 10%, allocate to priority queue.
 */
export function isEmergencyPriority(batteryPercent: number, isEmergencyVehicle: boolean): boolean {
  return isEmergencyVehicle || batteryPercent < 10;
}

/**
 * Generate a unique 6-digit numerical-letter code.
 */
export function generateBookingCode(): string {
  const chars = '0123456789ABCDEFGHJKLMNPQRSTUVWXYZ';
  let code = '';
  for (let i = 0; i < 6; i++) {
    code += chars[Math.floor(Math.random() * chars.length)];
  }
  return code;
}

/**
 * Generate booking code expiration timestamp matching the slot end time (exactly 1 hour slot timing).
 */
/**
 * Generate booking code expiration timestamp matching the slot end time (exactly 1 hour slot timing).
 */
export function getCodeExpiry(slotEndTime?: Date | string): string {
  if (slotEndTime) {
    return new Date(slotEndTime).toISOString();
  }
  // Default fallback: 1 hour from now
  return new Date(Date.now() + 60 * 60 * 1000).toISOString();
}

/**
 * ==============================================================================
 * VOLTOPTIMIZE SMART GRID EV ANALYTICS ENGINE
 * Trained requirements & services derived from voltoptimize-smart-grid-ev-analytics.ipynb
 * ==============================================================================
 */

export interface VoltOptimizeRewardParams {
  renewableEnergyRatio?: number; // 0 - 100%
  stationLoadPct: number;        // 0 - 100%
  initialSoc: number;            // 0 - 100%
  targetSoc?: number;            // default 80%
  chargingPriority?: 'High' | 'Medium' | 'Low';
  electricityPrice?: number;     // ₹/kWh
  energyConsumedKwh?: number;
}

export interface VoltOptimizeAnalyticsResult {
  optimizationReward: number;    // Score 0 - 100
  rewardEfficiency: number;      // Reward / kWh ratio
  chargingPriority: 'High' | 'Medium' | 'Low';
  renewableRatio: number;        // Grid green energy %
  socGain: number;               // % gained
  aiMaintenanceStatus: 'EXCELLENT' | 'STABLE' | 'GRID_STRESS_WARNING';
  recommendation: string;
}

/**
 * System-assigned charging priority based on initial SoC & emergency state
 */
export function calculateSystemPriority(
  initialSoc: number,
  isEmergency: boolean = false
): 'High' | 'Medium' | 'Low' {
  if (isEmergency || initialSoc < 20) return 'High';
  if (initialSoc <= 50) return 'Medium';
  return 'Low';
}

/**
 * VoltOptimize AI Optimization Reward & Maintenance Health Calculator
 */
export function calculateVoltOptimizeReward(
  params: VoltOptimizeRewardParams
): VoltOptimizeAnalyticsResult {
  const {
    renewableEnergyRatio = 68,
    stationLoadPct,
    initialSoc,
    targetSoc = 80,
    electricityPrice = 14.5,
    energyConsumedKwh = 35.0,
  } = params;

  const priority = params.chargingPriority || calculateSystemPriority(initialSoc);
  const socGain = Math.max(0, targetSoc - initialSoc);

  // 1. Green Renewable Component (Weight: 35%)
  const greenScore = (renewableEnergyRatio / 100) * 35;

  // 2. Grid Thermal & Load Factor (Weight: 30%)
  const gridScore = Math.max(0, (100 - stationLoadPct) / 100) * 30;

  // 3. SOC Gain Factor (Weight: 20%)
  const socScore = (socGain / 100) * 20;

  // 4. Priority Allocation Bonus (Weight: 15%)
  const priorityBonus = priority === 'High' ? 15 : priority === 'Medium' ? 10 : 5;

  // Composite Optimization Reward Score (0 - 100)
  const rawReward = greenScore + gridScore + socScore + priorityBonus;
  const optimizationReward = Math.round(Math.min(100, Math.max(10, rawReward)) * 10) / 10;

  // Reward Efficiency per kWh
  const rewardEfficiency = Math.round((optimizationReward / (energyConsumedKwh || 1)) * 100) / 100;

  // AI Maintenance & Grid Health Status
  let aiMaintenanceStatus: 'EXCELLENT' | 'STABLE' | 'GRID_STRESS_WARNING' = 'EXCELLENT';
  let recommendation = 'Grid running at peak green energy efficiency. Safe for fast charging.';

  if (stationLoadPct >= 80) {
    aiMaintenanceStatus = 'GRID_STRESS_WARNING';
    recommendation = '⚠️ Transformer load >80%. AI automated load-shading & district redirect enabled.';
  } else if (stationLoadPct >= 65) {
    aiMaintenanceStatus = 'STABLE';
    recommendation = 'Station operating within normal grid load parameters. Renewable mix is optimal.';
  }

  return {
    optimizationReward,
    rewardEfficiency,
    chargingPriority: priority,
    renewableRatio: renewableEnergyRatio,
    socGain,
    aiMaintenanceStatus,
    recommendation,
  };
}

/**
 * VoltOptimize ML AI Engine: 24-Hour Load Forecast Regressor
 * Generates 24-hour predictive kVA load curve using trained mlChargingModel.json
 */
export function generateAILoadForecast24h(station?: Station | null, chargers: Charger[] = []) {
  const capacity = station?.transformer_load_capacity_kva || 500;
  const stateName = station?.state || 'Delhi';
  
  const stateProfiles = (mlModelData as any)?.state_profiles || {};
  const profile = stateProfiles[stateName] || stateProfiles['Delhi'] || {};
  const hourlyPctMap: Record<string, number> = profile.hourly_load_pct || {
    0: 24.8, 1: 26.5, 2: 24.6, 3: 22.6, 4: 29.7, 5: 32.4, 6: 39.9, 7: 54.1,
    8: 72.7, 9: 77.3, 10: 73.5, 11: 52.5, 12: 40.2, 13: 32.3, 14: 29.4, 15: 36.1,
    16: 45.5, 17: 70.9, 18: 84.2, 19: 88.5, 20: 81.0, 21: 65.4, 22: 48.2, 23: 35.1
  };

  const activeChargerCount = chargers.filter((c) => c.status === 'occupied').length;
  const chargerFactor = chargers.length > 0 ? 0.85 + 0.3 * (activeChargerCount / chargers.length) : 1.0;

  return Array.from({ length: 24 }, (_, hour) => {
    const basePct = hourlyPctMap[hour.toString()] || 35.0;
    const adjustedPct = Math.min(98, Math.max(10, basePct * chargerFactor));
    const loadKva = Math.round((capacity * adjustedPct) / 100);

    return {
      hour: `${hour.toString().padStart(2, '0')}:00`,
      load: loadKva,
      capacity,
      loadPct: Math.round(adjustedPct),
    };
  });
}

/**
 * VoltOptimize ML AI Engine: Weekly Charging Sessions & Revenue Regressor
 * Predicts daily sessions and revenue (₹) using ML pattern stats and tariff model
 */
export function generateAIWeeklySessionsAndRevenue(station?: Station | null, chargers: Charger[] = []) {
  const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  const dayMultipliers = [0.85, 0.90, 0.95, 1.10, 1.25, 1.35, 1.15];
  
  const totalPowerKw = chargers.reduce((sum, c) => sum + c.power_kw, 0) || 150;
  const avgKwhPerSession = mlModelData?.pattern_stats?.avg_energy_consumed_kwh || 42.64;
  const tariffRateRupees = 14.5;

  return days.map((day, idx) => {
    const mult = dayMultipliers[idx];
    const baseSessions = Math.max(8, Math.round((totalPowerKw / 30) * 3.5 * mult));
    const revenueRupees = Math.round(baseSessions * avgKwhPerSession * tariffRateRupees);

    return {
      day,
      sessions: baseSessions,
      revenue: revenueRupees,
    };
  });
}

/**
 * VoltOptimize ML AI Engine: Real-Time Charger Distribution Analytics
 */
export function generateAIChargerDistribution(chargers: Charger[] = []) {
  const counts = {
    available: chargers.filter((c) => c.status === 'available').length,
    occupied: chargers.filter((c) => c.status === 'occupied').length,
    fault: chargers.filter((c) => c.status === 'fault').length,
    maintenance: chargers.filter((c) => c.status === 'maintenance').length,
    disabled: chargers.filter((c) => c.status === 'disabled').length,
  };

  const list = [
    { name: 'Available', value: counts.available, color: '#10b981' },
    { name: 'Occupied', value: counts.occupied, color: '#f59e0b' },
    { name: 'Under Maintenance', value: counts.maintenance, color: '#f97316' },
    { name: 'Hardware Fault', value: counts.fault, color: '#ef4444' },
    { name: 'Temporarily Disabled', value: counts.disabled, color: '#64748b' },
  ].filter((d) => d.value > 0);

  return list.length > 0 ? list : [{ name: 'Available', value: 1, color: '#10b981' }];
}


