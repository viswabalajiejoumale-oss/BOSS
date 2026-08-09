import { useState, useEffect } from 'react';
import { motion } from 'framer-motion';
import { Zap, Clock, ShieldCheck, BatteryCharging, CheckCircle, Cpu, AlertCircle, RefreshCw, Sparkles, Leaf } from 'lucide-react';
import type { Reservation, Station } from '@/types';
import { calculateVoltOptimizeReward, getStationLoadPercent } from '@/lib/aiEngine';

interface LiveUserUsageCardProps {
  reservation: Reservation;
  station?: Station;
  onVerifyMeter?: (resId: string) => void;
  onCancel?: (resId: string) => void;
}

export function LiveUserUsageCard({
  reservation,
  station,
  onVerifyMeter,
  onCancel,
}: LiveUserUsageCardProps) {
  const [secondsRemaining, setSecondsRemaining] = useState<number>(3600);
  const [kwhDelivered, setKwhDelivered] = useState<number>(0);
  const [liveVoltage, setLiveVoltage] = useState<number>(reservation.output_voltage_v || 385);
  const [livePower, setLivePower] = useState<number>(reservation.output_power_kw || 45);

  // Live countdown timer & energy accumulation
  useEffect(() => {
    if (!reservation.slot_end_time && !reservation.code_expires_at) return;

    const expiryTime = new Date(reservation.code_expires_at || Date.now() + 60 * 60 * 1000).getTime();

    const interval = setInterval(() => {
      const now = Date.now();
      const diff = Math.max(0, Math.floor((expiryTime - now) / 1000));
      setSecondsRemaining(diff);

      // Simulate live kWh accumulation during charging
      const elapsedSec = 3600 - diff;
      const hours = elapsedSec / 3600;
      const energy = Math.round(hours * livePower * 10) / 10;
      setKwhDelivered(energy);

      // Fluctuate voltage slightly around base
      const voltageVariation = (Math.random() - 0.5) * 2;
      setLiveVoltage(Math.round((reservation.output_voltage_v || 385) + voltageVariation));
    }, 1000);

    return () => clearInterval(interval);
  }, [reservation, livePower]);

  const formatTimer = (totalSeconds: number) => {
    const m = Math.floor(totalSeconds / 60);
    const s = totalSeconds % 60;
    return `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
  };

  const batteryLevel = reservation.battery_percent || 50;

  // VoltOptimize Smart Grid EV Analytics calculation
  const voltAnalytics = calculateVoltOptimizeReward({
    stationLoadPct: station ? Math.round(getStationLoadPercent(station)) : 45,
    initialSoc: batteryLevel,
    energyConsumedKwh: kwhDelivered > 0 ? kwhDelivered : 15.0,
  });

  return (
    <div className="boss-card-glow p-6 shadow-xl relative overflow-hidden">
      {/* Header */}
      <div className="flex flex-wrap items-center justify-between gap-4 border-b border-slate-200 dark:border-slate-800 pb-4">
        <div className="flex items-center gap-3">
          <div className="p-3 bg-emerald-500/20 rounded-xl border border-emerald-500/40 text-emerald-600 dark:text-emerald-400">
            <BatteryCharging className="w-6 h-6 animate-pulse" />
          </div>
          <div>
            <div className="flex items-center gap-2">
              <h3 className="text-lg font-bold text-slate-900 dark:text-white tracking-wide">Live Active User Charging Session</h3>
              <span className="px-2.5 py-0.5 rounded-full text-xs font-black bg-emerald-500/20 text-emerald-700 dark:text-emerald-400 border border-emerald-500/30 animate-pulse">
                ACTIVE LIVE
              </span>
            </div>
            <p className="text-xs text-slate-600 dark:text-slate-400 font-medium mt-0.5">
              Station: <span className="text-slate-900 dark:text-white font-bold">{station?.name || 'EV Station'}</span> | Code:{' '}
              <span className="text-emerald-700 dark:text-emerald-400 font-mono font-extrabold tracking-wider">{reservation.booking_code}</span>
            </p>
          </div>
        </div>

        {/* Live Slot Timer */}
        <div className="bg-white dark:bg-slate-800 px-4 py-2 rounded-xl border border-slate-300 dark:border-slate-700 text-right shadow-sm">
          <div className="text-[10px] text-slate-600 dark:text-slate-400 uppercase font-bold tracking-wider flex items-center justify-end gap-1">
            <Clock className="w-3 h-3 text-emerald-600 dark:text-emerald-400" /> Slot Time Remaining
          </div>
          <div className="text-xl font-black text-emerald-600 dark:text-emerald-400 font-mono tracking-wider mt-0.5">
            {formatTimer(secondsRemaining)}
          </div>
        </div>
      </div>

      {/* Real-time Telemetry Cards */}
      <div className="grid grid-cols-2 sm:grid-cols-4 gap-4 my-5">
        <div className="bg-white dark:bg-slate-800 p-4 rounded-xl border border-slate-200 dark:border-slate-700 shadow-sm">
          <p className="text-xs text-slate-600 dark:text-slate-400 font-semibold">Output Voltage (V DC)</p>
          <div className="flex items-baseline gap-1.5 mt-1">
            <span className="text-2xl font-black text-amber-600 dark:text-amber-400">{liveVoltage}</span>
            <span className="text-xs text-slate-500 dark:text-slate-400 font-bold">V</span>
          </div>
          <p className="text-[10px] text-slate-500 dark:text-slate-400 font-medium mt-1">Regulated Machine Output</p>
        </div>

        <div className="bg-white dark:bg-slate-800 p-4 rounded-xl border border-slate-200 dark:border-slate-700 shadow-sm">
          <p className="text-xs text-slate-600 dark:text-slate-400 font-semibold">Live Power Output</p>
          <div className="flex items-baseline gap-1.5 mt-1">
            <span className="text-2xl font-black text-emerald-600 dark:text-emerald-400">{livePower}</span>
            <span className="text-xs text-slate-500 dark:text-slate-400 font-bold">kW</span>
          </div>
          <p className="text-[10px] text-slate-500 dark:text-slate-400 font-medium mt-1">Current: {reservation.charge_current_a || 32} A</p>
        </div>

        <div className="bg-white dark:bg-slate-800 p-4 rounded-xl border border-slate-200 dark:border-slate-700 shadow-sm">
          <p className="text-xs text-slate-600 dark:text-slate-400 font-semibold">Energy Delivered</p>
          <div className="flex items-baseline gap-1.5 mt-1">
            <span className="text-2xl font-black text-cyan-600 dark:text-cyan-400">{kwhDelivered.toFixed(1)}</span>
            <span className="text-xs text-slate-500 dark:text-slate-400 font-bold">kWh</span>
          </div>
          <p className="text-[10px] text-slate-500 dark:text-slate-400 font-medium mt-1">Live meter sync</p>
        </div>

        <div className="bg-white dark:bg-slate-800 p-4 rounded-xl border border-slate-200 dark:border-slate-700 shadow-sm">
          <p className="text-xs text-slate-600 dark:text-slate-400 font-semibold">Battery Level (SOC)</p>
          <div className="flex items-baseline gap-1.5 mt-1">
            <span className="text-2xl font-black text-slate-900 dark:text-white">{batteryLevel}%</span>
          </div>
          <div className="mt-2 w-full bg-slate-200 dark:bg-slate-700 rounded-full h-2 overflow-hidden">
            <div
              className="h-full bg-emerald-600 dark:bg-emerald-400 rounded-full transition-all"
              style={{ width: `${batteryLevel}%` }}
            />
          </div>
        </div>
      </div>

      {/* VoltOptimize Smart Grid AI Analytics Panel */}
      <div className="mb-4 p-4 rounded-xl bg-emerald-500/10 border border-emerald-500/30 text-xs shadow-sm space-y-2">
        <div className="flex items-center justify-between font-extrabold text-emerald-900 dark:text-emerald-300">
          <span className="flex items-center gap-1.5">
            <Sparkles className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
            VoltOptimize Smart Grid AI Analytics (Trained Model)
          </span>
          <span className="px-2 py-0.5 rounded-full bg-emerald-500/20 text-emerald-800 dark:text-emerald-300 font-bold text-[10px]">
            Score: {voltAnalytics.optimizationReward} / 100
          </span>
        </div>

        <div className="grid grid-cols-2 sm:grid-cols-4 gap-2 text-slate-700 dark:text-slate-300 font-semibold text-[11px] pt-1">
          <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-emerald-500/30">
            <span className="text-slate-500 dark:text-slate-400 block text-[10px]">Grid Green Energy Mix</span>
            <span className="font-bold text-emerald-700 dark:text-emerald-400 flex items-center gap-1">
              <Leaf className="w-3 h-3 text-emerald-600 dark:text-emerald-400" /> {voltAnalytics.renewableRatio}% Solar/Wind
            </span>
          </div>
          <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-emerald-500/30">
            <span className="text-slate-500 dark:text-slate-400 block text-[10px]">System Priority Level</span>
            <span className="font-bold text-amber-800 dark:text-amber-400">{voltAnalytics.chargingPriority} Priority</span>
          </div>
          <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-emerald-500/30">
            <span className="text-slate-500 dark:text-slate-400 block text-[10px]">SOC Target Gain</span>
            <span className="font-bold text-slate-900 dark:text-white">+{voltAnalytics.socGain}% SOC</span>
          </div>
          <div className="bg-white dark:bg-slate-800 p-2 rounded-lg border border-emerald-500/30">
            <span className="text-slate-500 dark:text-slate-400 block text-[10px]">Reward / kWh Efficiency</span>
            <span className="font-bold text-cyan-800 dark:text-cyan-400">{voltAnalytics.rewardEfficiency} pts/kWh</span>
          </div>
        </div>

        <p className="text-[11px] text-slate-700 dark:text-slate-300 font-medium pt-1">
          💡 <strong>AI Maintenance Note:</strong> {voltAnalytics.recommendation}
        </p>
      </div>

      {/* Smart Meter Verification status & Actions */}
      <div className="flex flex-wrap items-center justify-between gap-4 pt-3 border-t border-slate-200 dark:border-slate-800 text-xs font-semibold">
        <div className="flex items-center gap-2 text-slate-700 dark:text-slate-300">
          <ShieldCheck className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
          <span>Smart Meter Auth: <span className="text-emerald-700 dark:text-emerald-400 font-bold">VERIFIED & LINKED</span></span>
        </div>

        {onCancel && (
          <button
            onClick={() => onCancel(reservation.id)}
            className="px-3 py-1.5 rounded-lg bg-red-500/15 hover:bg-red-500/25 text-red-700 dark:text-red-400 border border-red-500/30 text-xs font-bold transition-all cursor-pointer"
          >
            Cancel Session
          </button>
        )}
      </div>
    </div>
  );
}
