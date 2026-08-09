import { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  Zap, Cpu, ShieldAlert, Sparkles, RefreshCw, CheckCircle2,
  AlertTriangle, BatteryCharging, Power, Activity, BarChart3, Gauge, Clock
} from 'lucide-react';
import type { Station, Charger } from '@/types';
import { getStationLoadPercent } from '@/lib/aiEngine';
import { getAILiveLoadInsights } from '@/lib/openRouterService';

interface LiveChargerDistributionProps {
  station: Station;
  chargers: Charger[];
  onSelectCharger?: (charger: Charger) => void;
}

export function LiveChargerDistribution({
  station,
  chargers,
  onSelectCharger,
}: LiveChargerDistributionProps) {
  const [aiInsight, setAiInsight] = useState<string | null>(null);
  const [loadingAi, setLoadingAi] = useState(false);
  const [lastUpdated, setLastUpdated] = useState<Date>(new Date());

  const loadPercent = Math.round(getStationLoadPercent(station));
  const availableCount = chargers.filter((c) => c.status === 'available').length;
  const occupiedCount = chargers.filter((c) => c.status === 'occupied').length;
  const faultCount = chargers.filter((c) => c.status === 'fault').length;
  const totalPowerKw = chargers.reduce((sum, c) => sum + (c.power_kw || 0), 0);
  const activePowerKw = chargers.reduce((sum, c) => sum + (c.current_load_kw || 0), 0);

  // Live ticker updates
  useEffect(() => {
    const timer = setInterval(() => {
      setLastUpdated(new Date());
    }, 2000);
    return () => clearInterval(timer);
  }, []);

  const handleFetchAiLoadInsights = async () => {
    setLoadingAi(true);
    try {
      const details = chargers.map((c) => ({
        label: c.label,
        status: c.status,
        powerKw: c.power_kw,
        currentLoadKw: c.current_load_kw || 0,
      }));
      const insight = await getAILiveLoadInsights(station.name, loadPercent, details);
      setAiInsight(insight);
    } catch (e) {
      console.error(e);
    } finally {
      setLoadingAi(false);
    }
  };

  return (
    <div className="boss-card p-6 space-y-6 relative overflow-hidden">
      {/* Dynamic Background Glow */}
      <div className="absolute top-0 right-0 -mt-10 -mr-10 w-48 h-48 bg-emerald-500/10 rounded-full blur-3xl opacity-50 pointer-events-none" />

      {/* Header Bar */}
      <div className="flex flex-wrap items-center justify-between gap-4 pb-4 border-b border-slate-200 dark:border-slate-800">
        <div>
          <div className="flex items-center gap-2.5">
            <div className="p-2 rounded-xl bg-emerald-600 text-white shadow-md">
              <Activity className="w-5 h-5 animate-pulse" />
            </div>
            <div>
              <div className="flex items-center gap-2">
                <h3 className="text-lg font-extrabold text-slate-900 dark:text-white tracking-tight">
                  LIVE Charger Power Distribution & Station Load
                </h3>
                <span className="px-2.5 py-0.5 rounded-full text-[11px] font-black bg-emerald-500/15 text-emerald-700 dark:text-emerald-400 border border-emerald-500/30 animate-pulse">
                  ● LIVE ONLY
                </span>
              </div>
              <p className="text-xs text-slate-600 dark:text-slate-400 font-semibold mt-0.5">
                Station: <span className="text-slate-900 dark:text-white font-extrabold">{station.name}</span> ({station.city || 'District'}) | Sync: {lastUpdated.toLocaleTimeString()}
              </p>
            </div>
          </div>
        </div>

        <button
          onClick={handleFetchAiLoadInsights}
          disabled={loadingAi}
          className="boss-btn-primary text-xs font-extrabold flex items-center gap-2 px-4 py-2.5 shadow-md hover:shadow-emerald-500/20 cursor-pointer active:scale-95 disabled:opacity-50"
        >
          {loadingAi ? (
            <RefreshCw className="w-4 h-4 animate-spin" />
          ) : (
            <Sparkles className="w-4 h-4 text-emerald-200" />
          )}
          OpenRouter AI Load Diagnosis
        </button>
      </div>

      {/* Live Power Gauge & Summary Cards */}
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
        {/* Transformer Load Capacity */}
        <div className="rounded-xl border border-slate-200 dark:border-slate-800 bg-slate-50 dark:bg-slate-900/60 p-4 space-y-2 shadow-sm">
          <div className="flex items-center justify-between text-xs text-slate-600 dark:text-slate-400 font-bold uppercase tracking-wider">
            <span className="flex items-center gap-1.5"><Gauge className="w-4 h-4 text-slate-600 dark:text-slate-400" /> Transformer Limit</span>
            <span className="text-slate-900 dark:text-white font-extrabold">{station.transformer_load_capacity_kva} kVA</span>
          </div>
          <div className="flex items-baseline justify-between pt-1">
            <span className="text-2xl font-black text-slate-900 dark:text-white">{loadPercent}%</span>
            <span className={`text-xs font-black px-2 py-0.5 rounded-md border ${
              loadPercent >= 80 ? 'bg-red-500/15 text-red-600 dark:text-red-400 border-red-500/30' : 'bg-emerald-500/15 text-emerald-700 dark:text-emerald-400 border-emerald-500/30'
            }`}>
              {loadPercent >= 80 ? '⚠️ OVERLOAD RISK' : '🟢 NORMAL GRID'}
            </span>
          </div>
          <div className="w-full bg-slate-200 dark:bg-slate-800 rounded-full h-2.5 overflow-hidden">
            <div
              className={`h-full rounded-full transition-all duration-500 ${
                loadPercent >= 80 ? 'bg-red-600 animate-pulse' : 'bg-emerald-600'
              }`}
              style={{ width: `${Math.min(loadPercent, 100)}%` }}
            />
          </div>
        </div>

        {/* Current Active Power Draw */}
        <div className="rounded-xl border border-emerald-500/30 bg-emerald-500/10 p-4 space-y-2 shadow-sm">
          <div className="flex items-center justify-between text-xs text-emerald-800 dark:text-emerald-300 font-bold uppercase tracking-wider">
            <span className="flex items-center gap-1.5"><Zap className="w-4 h-4 text-emerald-600 dark:text-emerald-400" /> Active Power Draw</span>
            <span className="text-emerald-700 dark:text-emerald-400 font-black">Live kW</span>
          </div>
          <div className="flex items-baseline justify-between pt-1">
            <span className="text-2xl font-black text-emerald-800 dark:text-emerald-400">{activePowerKw.toFixed(1)} <span className="text-sm font-bold text-slate-600 dark:text-slate-400">kW</span></span>
            <span className="text-xs font-bold text-slate-600 dark:text-slate-400">/ {totalPowerKw} kW Total</span>
          </div>
          <p className="text-[11px] text-slate-600 dark:text-slate-400 font-semibold">
            Real-time aggregate port consumption
          </p>
        </div>

        {/* Port Freeness Counter */}
        <div className="rounded-xl border border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-900/60 p-4 space-y-2 shadow-sm">
          <div className="flex items-center justify-between text-xs text-slate-600 dark:text-slate-400 font-bold uppercase tracking-wider">
            <span className="flex items-center gap-1.5"><Power className="w-4 h-4 text-emerald-600 dark:text-emerald-400" /> Port Freeness</span>
            <span className="text-emerald-700 dark:text-emerald-400 font-extrabold">{availableCount} Free</span>
          </div>
          <div className="flex items-baseline justify-between pt-1">
            <span className="text-2xl font-black text-slate-900 dark:text-white">{availableCount} <span className="text-sm text-slate-500 dark:text-slate-400 font-semibold">/ {chargers.length}</span></span>
            <span className="text-xs font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 rounded-md">
              {availableCount > 0 ? '✓ Booking Open' : '⏳ Waiting Queue'}
            </span>
          </div>
          <p className="text-[11px] text-slate-500 dark:text-slate-400 font-medium">
            {occupiedCount} busy • {faultCount} offline
          </p>
        </div>

        {/* Dynamic Pricing / Demand Factor */}
        <div className="rounded-xl border border-amber-500/30 bg-amber-500/10 p-4 space-y-2 shadow-sm">
          <div className="flex items-center justify-between text-xs text-amber-800 dark:text-amber-300 font-bold uppercase tracking-wider">
            <span className="flex items-center gap-1.5"><BarChart3 className="w-4 h-4 text-amber-600 dark:text-amber-400" /> Dynamic Tariff</span>
            <span className="text-amber-900 dark:text-amber-300 font-extrabold">Rate/kWh</span>
          </div>
          <div className="flex items-baseline justify-between pt-1">
            <span className="text-2xl font-black text-amber-900 dark:text-amber-400">₹{(12.5 + (loadPercent / 100) * 4).toFixed(2)}</span>
            <span className="text-xs font-bold text-amber-800 dark:text-amber-400">Standard Tariff</span>
          </div>
          <p className="text-[11px] text-amber-800 dark:text-amber-300 font-semibold">
            {loadPercent >= 85 ? 'High demand surge tariff' : 'Off-peak optimal tariff active'}
          </p>
        </div>
      </div>

      {/* VoltOptimize AI Maintenance & Grid Stabilization Status */}
      <div className="p-3.5 rounded-xl bg-slate-50 dark:bg-slate-900/60 border border-slate-200 dark:border-slate-800 flex flex-wrap items-center justify-between gap-3 text-xs">
        <div className="flex items-center gap-2">
          <span className={`px-2.5 py-1 rounded-lg text-[10px] font-black uppercase ${
            loadPercent >= 80 ? 'bg-red-500/15 text-red-700 dark:text-red-400 border border-red-500/30' : 'bg-emerald-500/15 text-emerald-700 dark:text-emerald-400 border border-emerald-500/30'
          }`}>
            AI Status: {loadPercent >= 80 ? 'GRID STRESS WARNING' : 'EXCELLENT MAINTENANCE'}
          </span>
          <span className="text-slate-700 dark:text-slate-300 font-semibold">
            Station AI Green Energy Index: <b className="text-emerald-700 dark:text-emerald-400">68% Renewable Mix</b> • Reward Potential: <b className="text-cyan-700 dark:text-cyan-400">High Efficiency</b>
          </span>
        </div>
        <span className="text-slate-500 dark:text-slate-400 font-bold text-[11px]">
          ⚡ AI Automated Maintenance & 80% Threshold Protection Active
        </span>
      </div>


      {/* OpenRouter AI Diagnostics Box */}
      <AnimatePresence>
        {aiInsight && (
          <motion.div
            initial={{ opacity: 0, y: -10 }}
            animate={{ opacity: 1, y: 0 }}
            exit={{ opacity: 0, y: -10 }}
            className="p-4 rounded-xl bg-emerald-500/10 border border-emerald-500/30 text-slate-900 dark:text-slate-100 text-xs leading-relaxed shadow-md"
          >
            <div className="flex items-center justify-between font-extrabold text-emerald-800 dark:text-emerald-400 mb-2">
              <span className="flex items-center gap-2">
                <Sparkles className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
                OpenRouter AI Live Grid Diagnosis
              </span>
              <button onClick={() => setAiInsight(null)} className="text-slate-400 hover:text-slate-700 dark:hover:text-slate-200">✕</button>
            </div>
            <p className="whitespace-pre-line text-slate-800 dark:text-slate-200 font-semibold">{aiInsight}</p>
          </motion.div>
        )}
      </AnimatePresence>

      {/* Per-Port Power Draw Grid */}
      <div>
        <div className="flex items-center justify-between mb-3">
          <h4 className="text-xs font-extrabold uppercase tracking-wider text-slate-700 dark:text-slate-300 flex items-center gap-2">
            <Power className="w-4 h-4 text-emerald-600 dark:text-emerald-400" />
            Individual Charger Port States & Power Distribution
          </h4>
          <span className="text-xs text-slate-500 dark:text-slate-400 font-semibold">
            Click any FREE port to reserve your slot
          </span>
        </div>

        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-3">
          {chargers.map((charger) => {
            const isAvailable = charger.status === 'available';
            const isOccupied = charger.status === 'occupied';
            const isFault = charger.status === 'fault';
            const isMaintenance = charger.status === 'maintenance';
            const isDisabled = charger.status === 'disabled';
            const loadRatio = charger.power_kw > 0 ? ((charger.current_load_kw || 0) / charger.power_kw) * 100 : 0;

            const statusText = isAvailable
              ? 'FREE'
              : isOccupied
              ? 'BUSY'
              : isFault
              ? 'HARDWARE FAULT'
              : isMaintenance
              ? 'UNDER REPAIR'
              : 'STOPPED';

            return (
              <motion.div
                key={charger.id}
                whileHover={{ scale: 1.02, y: -2 }}
                whileTap={{ scale: 0.98 }}
                onClick={() => {
                  if (isAvailable) {
                    onSelectCharger?.(charger);
                  } else if (isFault) {
                    alert(`⚠️ Port ${charger.label} reported a hardware or network communication error. Please shift to another available port.`);
                  } else if (isMaintenance) {
                    alert(`🛠️ Port ${charger.label} is currently under repair/maintenance. Please shift to another available port.`);
                  } else if (isDisabled) {
                    alert(`⛔ Port ${charger.label} has been temporarily stopped by the station admin. Please shift to another available port.`);
                  } else {
                    alert(`🟡 Port ${charger.label} is currently busy in an active charging session. Please shift to another available port.`);
                  }
                }}
                className={`p-4 rounded-xl border transition-all relative shadow-sm ${
                  isAvailable
                    ? 'bg-emerald-500/10 border-emerald-500/30 hover:border-emerald-500 hover:bg-emerald-500/20 hover:shadow-md cursor-pointer'
                    : isOccupied
                    ? 'bg-amber-500/10 border-amber-500/30 text-slate-900 dark:text-slate-100 cursor-not-allowed'
                    : isMaintenance
                    ? 'bg-orange-500/10 border-orange-500/30 text-slate-900 dark:text-slate-100 cursor-not-allowed'
                    : isDisabled
                    ? 'bg-slate-100 dark:bg-slate-800 border-slate-300 dark:border-slate-700 text-slate-900 dark:text-slate-100 cursor-not-allowed'
                    : 'bg-red-500/10 border-red-500/30 text-slate-900 dark:text-slate-100 cursor-not-allowed'
                }`}
              >
                {/* Top Port Label */}
                <div className="flex items-center justify-between mb-2">
                  <span className="font-extrabold text-slate-900 dark:text-white text-sm flex items-center gap-1.5">
                    <Power className={`w-4 h-4 ${isAvailable ? 'text-emerald-600 dark:text-emerald-400' : isOccupied ? 'text-amber-600 dark:text-amber-400' : isMaintenance ? 'text-orange-600 dark:text-orange-400' : isDisabled ? 'text-slate-600 dark:text-slate-400' : 'text-red-600 dark:text-red-400'}`} />
                    {charger.label}
                  </span>
                  <span
                    className={`px-2 py-0.5 rounded-full text-[9px] font-black uppercase tracking-wider border ${
                      isAvailable
                        ? 'bg-emerald-500/15 text-emerald-700 dark:text-emerald-400 border-emerald-500/30'
                        : isOccupied
                        ? 'bg-amber-500/15 text-amber-700 dark:text-amber-400 border-amber-500/30'
                        : isMaintenance
                        ? 'bg-orange-500/15 text-orange-700 dark:text-orange-400 border-orange-500/30'
                        : isDisabled
                        ? 'bg-slate-200 dark:bg-slate-800 text-slate-800 dark:text-slate-200 border-slate-400 dark:border-slate-700'
                        : 'bg-red-500/15 text-red-700 dark:text-red-400 border-red-500/30'
                    }`}
                  >
                    {statusText}
                  </span>
                </div>

                {/* Details */}
                <div className="text-xs text-slate-600 dark:text-slate-400 font-semibold space-y-1 my-2.5">
                  <div className="flex justify-between">
                    <span className="text-slate-500 dark:text-slate-400 font-medium">Connector:</span>
                    <span className="text-slate-900 dark:text-white font-bold">{charger.connector_type}</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-slate-500 dark:text-slate-400 font-medium">Rated Speed:</span>
                    <span className="text-amber-800 dark:text-amber-400 font-bold">{charger.power_kw} kW</span>
                  </div>
                  <div className="flex justify-between">
                    <span className="text-slate-500 dark:text-slate-400 font-medium">Live Output Draw:</span>
                    <span className="text-emerald-700 dark:text-emerald-400 font-extrabold">{charger.current_load_kw || 0} kW</span>
                  </div>
                </div>

                {/* Power Bar */}
                <div className="mt-3">
                  <div className="flex justify-between text-[10px] text-slate-500 dark:text-slate-400 font-extrabold mb-1">
                    <span>Power Utilization</span>
                    <span>{Math.round(loadRatio)}%</span>
                  </div>
                  <div className="w-full bg-slate-200 dark:bg-slate-700 rounded-full h-2 overflow-hidden">
                    <div
                      className={`h-full rounded-full transition-all duration-500 ${
                        isAvailable
                          ? 'bg-emerald-600 dark:bg-emerald-400'
                          : isOccupied
                          ? 'bg-amber-500 animate-pulse'
                          : 'bg-red-600'
                      }`}
                      style={{ width: `${isAvailable ? 0 : Math.max(loadRatio, 15)}%` }}
                    />
                  </div>
                </div>
              </motion.div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
