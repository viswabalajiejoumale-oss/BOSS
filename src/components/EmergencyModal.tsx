import React, { useState } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import {
  X,
  Truck,
  Zap,
  ShieldAlert,
  Navigation,
  Radio,
  BatteryCharging,
  Siren
} from 'lucide-react';
import { ShinyButton } from './ui/shiny-button';
import type { Station } from '@/types';

interface EmergencyModalProps {
  isOpen: boolean;
  onClose: () => void;
  onDispatchMobileBattery: (batterySize: string, locationName: string) => void;
  onActivateEmergencyPriority: (isEmergencyVehicle: boolean, batteryPct: number) => void;
  stations: Station[];
  selectedStationId?: string | null;
  userLat?: number;
  userLon?: number;
  currentBatteryPct: number;
  isEmergencyActive: boolean;
}

export const EmergencyModal: React.FC<EmergencyModalProps> = ({
  isOpen,
  onClose,
  onDispatchMobileBattery,
  onActivateEmergencyPriority,
  stations,
  selectedStationId,
  userLat,
  userLon,
  currentBatteryPct,
}) => {
  const [requestType, setRequestType] = useState<'mobile_delivery' | 'station_priority'>('mobile_delivery');
  const [batteryBoostSize, setBatteryBoostSize] = useState<'20' | '30' | '50'>('30');
  const [selectedVehicleType, setSelectedVehicleType] = useState<'ambulance' | 'police' | 'fire' | 'critical_ev'>('critical_ev');
  const [batteryPctInput, setBatteryPctInput] = useState<number>(currentBatteryPct || 8);

  // Live Location Detection state
  const [userCoords, setUserCoords] = useState<{ lat: number; lon: number; locationName: string }>({
    lat: userLat || 20.5937,
    lon: userLon || 78.9629,
    locationName: 'Detecting live device GPS location...',
  });
  const [isLocating, setIsLocating] = useState(false);

  React.useEffect(() => {
    if (isOpen) {
      if ('geolocation' in navigator) {
        setIsLocating(true);
        navigator.geolocation.getCurrentPosition(
          (pos) => {
            const lat = pos.coords.latitude;
            const lon = pos.coords.longitude;
            setUserCoords({
              lat,
              lon,
              locationName: `Live User GPS Location (${lat.toFixed(4)}° N, ${lon.toFixed(4)}° E)`,
            });
            setIsLocating(false);
          },
          () => {
            // Fallback to selected station or default coordinates if geolocation fails
            const st = stations.find((s) => s.id === selectedStationId) || stations[0];
            const fallbackLoc = st ? `${st.name}, ${st.city}` : `Live GPS (${userLat || 20.5937}° N, ${userLon || 78.9629}° E)`;
            setUserCoords({
              lat: userLat || 20.5937,
              lon: userLon || 78.9629,
              locationName: fallbackLoc,
            });
            setIsLocating(false);
          },
          { enableHighAccuracy: true, timeout: 8000 }
        );
      }
    }
  }, [isOpen, userLat, userLon, selectedStationId, stations]);

  if (!isOpen) return null;

  const handleDispatch = () => {
    onDispatchMobileBattery(batteryBoostSize, userCoords.locationName);
  };

  const handleActivatePriority = () => {
    const isEmergencyVehicle = selectedVehicleType !== 'critical_ev';
    onActivateEmergencyPriority(isEmergencyVehicle, batteryPctInput);
  };

  return (
    <AnimatePresence>
      <div className="fixed inset-0 z-[99999] flex items-center justify-center bg-black/85 backdrop-blur-xl p-4 overflow-y-auto">
        {/* Background Ambient Glowing Radar Strobe */}
        <div className="absolute inset-0 pointer-events-none overflow-hidden flex items-center justify-center">
          <div className="h-[600px] w-[600px] rounded-full bg-red-600/10 blur-[120px] animate-pulse" />
        </div>

        <motion.div
          initial={{ scale: 0.92, opacity: 0, y: 20 }}
          animate={{ scale: 1, opacity: 1, y: 0 }}
          exit={{ scale: 0.92, opacity: 0, y: 20 }}
          transition={{ type: 'spring', damping: 25, stiffness: 300 }}
          className="relative w-full max-w-lg overflow-hidden rounded-3xl border border-red-500/50 bg-[#0c0505] p-6 shadow-[0_0_60px_rgba(220,38,38,0.35)] text-white"
          onClick={(e) => e.stopPropagation()}
        >
          {/* Top Warning Stripe Accent */}
          <div className="absolute top-0 left-0 right-0 h-1.5 bg-gradient-to-r from-red-600 via-rose-500 to-amber-500" />

          {/* Modal Header */}
          <div className="mb-5 flex items-center justify-between border-b border-red-500/20 pb-4">
            <div className="flex items-center gap-3">
              <div className="relative flex h-11 w-11 items-center justify-center rounded-2xl bg-gradient-to-br from-red-600 to-rose-700 text-white shadow-lg shadow-red-600/40">
                <Siren className="h-6 w-6 animate-bounce" />
                <span className="absolute -top-1 -right-1 flex h-3 w-3">
                  <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-red-400 opacity-75"></span>
                  <span className="relative inline-flex rounded-full h-3 w-3 bg-red-500"></span>
                </span>
              </div>
              <div>
                <div className="flex items-center gap-2">
                  <h2 className="text-lg font-black tracking-wide text-white uppercase">EMERGENCY COMMAND CENTER</h2>
                  <span className="rounded-full bg-red-500/20 px-2 py-0.5 text-[9px] font-black text-red-400 border border-red-500/30 uppercase tracking-widest">
                    LIVE DISPATCH
                  </span>
                </div>
                <p className="text-xs text-red-300/80 font-medium">Priority EV Battery Rescue & Rapid Grid Allocation</p>
              </div>
            </div>

            <button
              onClick={onClose}
              className="flex h-8 w-8 items-center justify-center rounded-full bg-white/10 text-gray-400 hover:bg-red-500/20 hover:text-white transition cursor-pointer"
            >
              <X className="h-4 w-4" />
            </button>
          </div>

          {/* Mode Selector Tabs */}
          <div className="grid grid-cols-2 gap-2 p-1.5 rounded-2xl bg-red-950/40 border border-red-500/30 mb-5">
            <button
              onClick={() => setRequestType('mobile_delivery')}
              className={`flex items-center justify-center gap-2 py-2.5 px-3 rounded-xl text-xs font-black transition-all cursor-pointer ${
                requestType === 'mobile_delivery'
                  ? 'bg-gradient-to-r from-red-600 to-rose-600 text-white shadow-md shadow-red-600/30 border border-red-400/40'
                  : 'text-gray-400 hover:text-white hover:bg-white/5'
              }`}
            >
              <Truck className="h-4 w-4 text-amber-300" />
              <span>MOBILE BATTERY TRUCK</span>
            </button>

            <button
              onClick={() => setRequestType('station_priority')}
              className={`flex items-center justify-center gap-2 py-2.5 px-3 rounded-xl text-xs font-black transition-all cursor-pointer ${
                requestType === 'station_priority'
                  ? 'bg-gradient-to-r from-red-600 to-rose-600 text-white shadow-md shadow-red-600/30 border border-red-400/40'
                  : 'text-gray-400 hover:text-white hover:bg-white/5'
              }`}
            >
              <Zap className="h-4 w-4 text-amber-300" />
              <span>STATION PRIORITY SLOT</span>
            </button>
          </div>

          {/* Tab Content 1: Mobile Battery Truck Dispatch */}
          {requestType === 'mobile_delivery' && (
            <div className="space-y-4">
              <div className="rounded-2xl border border-red-500/30 bg-red-950/30 p-4 space-y-3">
                <div className="flex items-center justify-between">
                  <span className="text-xs font-extrabold uppercase tracking-wider text-red-300 flex items-center gap-1.5">
                    <BatteryCharging className="h-4 w-4 text-emerald-400" /> Select Emergency Power Boost
                  </span>
                  <span className="text-[10px] text-amber-400 font-mono font-bold">DC FAST DISPENSER</span>
                </div>

                <div className="grid grid-cols-3 gap-2">
                  <button
                    type="button"
                    onClick={() => setBatteryBoostSize('20')}
                    className={`rounded-xl p-3 border text-left transition-all cursor-pointer ${
                      batteryBoostSize === '20'
                        ? 'border-red-400 bg-red-600/30 ring-2 ring-red-500/50 shadow-lg'
                        : 'border-red-900/40 bg-black/40 hover:border-red-500/40'
                    }`}
                  >
                    <div className="font-extrabold text-sm text-white">20 kWh</div>
                    <div className="text-[10px] text-red-300 font-medium">~100 km Range</div>
                    <div className="mt-1 text-[9px] font-mono text-emerald-400 font-bold">⏱ ~10 MIN ETA</div>
                  </button>

                  <button
                    type="button"
                    onClick={() => setBatteryBoostSize('30')}
                    className={`rounded-xl p-3 border text-left transition-all cursor-pointer relative overflow-hidden ${
                      batteryBoostSize === '30'
                        ? 'border-red-400 bg-red-600/30 ring-2 ring-red-500/50 shadow-lg'
                        : 'border-red-900/40 bg-black/40 hover:border-red-500/40'
                    }`}
                  >
                    <span className="absolute top-0 right-0 bg-amber-500 text-black font-black text-[8px] px-1.5 py-0.5 rounded-bl">
                      POPULAR
                    </span>
                    <div className="font-extrabold text-sm text-white">30 kWh</div>
                    <div className="text-[10px] text-red-300 font-medium">~150 km Range</div>
                    <div className="mt-1 text-[9px] font-mono text-emerald-400 font-bold">⏱ ~15 MIN ETA</div>
                  </button>

                  <button
                    type="button"
                    onClick={() => setBatteryBoostSize('50')}
                    className={`rounded-xl p-3 border text-left transition-all cursor-pointer ${
                      batteryBoostSize === '50'
                        ? 'border-red-400 bg-red-600/30 ring-2 ring-red-500/50 shadow-lg'
                        : 'border-red-900/40 bg-black/40 hover:border-red-500/40'
                    }`}
                  >
                    <div className="font-extrabold text-sm text-white">50 kWh</div>
                    <div className="text-[10px] text-red-300 font-medium">~250 km Range</div>
                    <div className="mt-1 text-[9px] font-mono text-emerald-400 font-bold">⏱ ~20 MIN ETA</div>
                  </button>
                </div>
              </div>

              {/* Target Location Card */}
              <div className="rounded-2xl border border-red-500/30 bg-black/50 p-4 space-y-2">
                <div className="flex items-center justify-between text-xs text-red-300 font-bold">
                  <span className="flex items-center gap-1.5">
                    <Navigation className="h-4 w-4 text-red-400 animate-pulse" /> Live Device GPS Target:
                  </span>
                  <span className="font-mono text-[10px] text-emerald-400 font-black">
                    {userCoords.lat.toFixed(4)}° N, {userCoords.lon.toFixed(4)}° E
                  </span>
                </div>
                <div className="text-xs font-extrabold text-white bg-red-950/50 p-2.5 rounded-xl border border-red-500/20 flex items-center justify-between">
                  <span className="flex items-center gap-1.5 truncate">
                    <span>📍</span>
                    <span className="truncate">{isLocating ? 'Detecting user live coordinates...' : userCoords.locationName}</span>
                  </span>
                  <span className="text-[10px] font-bold text-emerald-400 bg-emerald-500/10 px-2 py-0.5 rounded border border-emerald-500/30 shrink-0">
                    {isLocating ? 'GPS LOCATING...' : 'GPS ACTIVE'}
                  </span>
                </div>
              </div>

              {/* Live Pilot Info Preview */}
              <div className="rounded-xl bg-gradient-to-r from-red-950/60 to-black p-3 border border-red-500/20 flex items-center justify-between text-xs">
                <div className="flex items-center gap-2.5">
                  <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-red-600/30 text-white font-black text-sm">
                    🚚
                  </div>
                  <div>
                    <div className="font-extrabold text-white">BOSS Mobile EV Unit #09</div>
                    <div className="text-[10px] text-gray-400 font-medium">Pilot: Rajesh Kumar (+91 98765 43210)</div>
                  </div>
                </div>
                <div className="text-right">
                  <span className="text-[10px] text-emerald-400 font-mono font-extrabold block">READY TO DISPATCH</span>
                  <span className="text-[9px] text-gray-400">150kW Mobile DC Pack</span>
                </div>
              </div>
            </div>
          )}

          {/* Tab Content 2: Station Priority Allocation */}
          {requestType === 'station_priority' && (
            <div className="space-y-4">
              <div className="rounded-2xl border border-red-500/30 bg-red-950/30 p-4 space-y-3">
                <label className="text-xs font-extrabold uppercase tracking-wider text-red-300 flex items-center gap-1.5">
                  <ShieldAlert className="h-4 w-4 text-amber-400" /> Priority Vehicle Category
                </label>

                <div className="grid grid-cols-2 gap-2">
                  <button
                    type="button"
                    onClick={() => setSelectedVehicleType('ambulance')}
                    className={`flex items-center gap-2.5 p-2.5 rounded-xl border text-left text-xs font-bold transition-all cursor-pointer ${
                      selectedVehicleType === 'ambulance'
                        ? 'border-red-400 bg-red-600/30 text-white ring-2 ring-red-500/50'
                        : 'border-red-900/40 bg-black/40 text-gray-300 hover:border-red-500/40'
                    }`}
                  >
                    <span className="text-base">🚑</span>
                    <div>
                      <div>Ambulance</div>
                      <div className="text-[9px] font-normal text-red-300">Medical Emergency</div>
                    </div>
                  </button>

                  <button
                    type="button"
                    onClick={() => setSelectedVehicleType('police')}
                    className={`flex items-center gap-2.5 p-2.5 rounded-xl border text-left text-xs font-bold transition-all cursor-pointer ${
                      selectedVehicleType === 'police'
                        ? 'border-red-400 bg-red-600/30 text-white ring-2 ring-red-500/50'
                        : 'border-red-900/40 bg-black/40 text-gray-300 hover:border-red-500/40'
                    }`}
                  >
                    <span className="text-base">🚓</span>
                    <div>
                      <div>Police & Patrol</div>
                      <div className="text-[9px] font-normal text-red-300">Law Enforcement</div>
                    </div>
                  </button>

                  <button
                    type="button"
                    onClick={() => setSelectedVehicleType('fire')}
                    className={`flex items-center gap-2.5 p-2.5 rounded-xl border text-left text-xs font-bold transition-all cursor-pointer ${
                      selectedVehicleType === 'fire'
                        ? 'border-red-400 bg-red-600/30 text-white ring-2 ring-red-500/50'
                        : 'border-red-900/40 bg-black/40 text-gray-300 hover:border-red-500/40'
                    }`}
                  >
                    <span className="text-base">🚒</span>
                    <div>
                      <div>Fire & Rescue</div>
                      <div className="text-[9px] font-normal text-red-300">Disaster Response</div>
                    </div>
                  </button>

                  <button
                    type="button"
                    onClick={() => setSelectedVehicleType('critical_ev')}
                    className={`flex items-center gap-2.5 p-2.5 rounded-xl border text-left text-xs font-bold transition-all cursor-pointer ${
                      selectedVehicleType === 'critical_ev'
                        ? 'border-red-400 bg-red-600/30 text-white ring-2 ring-red-500/50'
                        : 'border-red-900/40 bg-black/40 text-gray-300 hover:border-red-500/40'
                    }`}
                  >
                    <span className="text-base">⚡</span>
                    <div>
                      <div>Critical SOC (&lt;10%)</div>
                      <div className="text-[9px] font-normal text-red-300">Battery Exhaustion</div>
                    </div>
                  </button>
                </div>
              </div>

              {/* Battery SOC Slider */}
              <div className="rounded-2xl border border-red-500/30 bg-black/50 p-4 space-y-3">
                <div className="flex items-center justify-between text-xs">
                  <span className="font-extrabold text-red-300 flex items-center gap-1.5">
                    <BatteryCharging className="h-4 w-4 text-emerald-400" /> Current EV Battery State of Charge (SOC)
                  </span>
                  <span
                    className={`font-mono font-black text-sm px-2 py-0.5 rounded ${
                      batteryPctInput <= 10
                        ? 'bg-red-600 text-white animate-pulse'
                        : batteryPctInput <= 25
                        ? 'bg-amber-500 text-black'
                        : 'bg-emerald-500 text-black'
                    }`}
                  >
                    {batteryPctInput}%
                  </span>
                </div>

                <input
                  type="range"
                  min="1"
                  max="100"
                  value={batteryPctInput}
                  onChange={(e) => setBatteryPctInput(parseInt(e.target.value))}
                  className="w-full h-2 rounded-lg accent-red-500 bg-red-950 cursor-pointer"
                />

                <div className="flex items-center justify-between text-[10px] text-gray-400">
                  <span className="text-red-400 font-bold">1% Critical Stop</span>
                  <span>10% Priority Override</span>
                  <span>100% Fully Charged</span>
                </div>
              </div>

              {/* Priority Notice Banner */}
              <div className="rounded-xl border border-amber-500/30 bg-amber-500/10 p-3 text-[11px] text-amber-200 flex items-start gap-2.5">
                <Radio className="h-5 w-5 text-amber-400 shrink-0 mt-0.5 animate-pulse" />
                <p className="leading-relaxed">
                  <b>DISCOM Emergency Grid Protocol:</b> Activating priority mode reserves the next available CCS2/Type 2 fast charger port immediately, bypassing general reservation wait lists.
                </p>
              </div>
            </div>
          )}

          {/* Action Buttons */}
          <div className="mt-6 flex gap-3">
            {requestType === 'mobile_delivery' ? (
              <ShinyButton
                onClick={handleDispatch}
                className="flex-1 font-black text-xs py-3 shadow-xl shadow-red-600/40 bg-gradient-to-r from-red-600 via-rose-600 to-red-700 text-white rounded-2xl text-center hover:scale-[1.02] active:scale-[0.98] transition block border border-red-400/50"
              >
                <div className="flex items-center justify-center gap-2">
                  <Truck className="h-4 w-4" />
                  <span>DISPATCH RESCUE TRUCK NOW</span>
                </div>
              </ShinyButton>
            ) : (
              <ShinyButton
                onClick={handleActivatePriority}
                className="flex-1 font-black text-xs py-3 shadow-xl shadow-red-600/40 bg-gradient-to-r from-red-600 via-rose-600 to-red-700 text-white rounded-2xl text-center hover:scale-[1.02] active:scale-[0.98] transition block border border-red-400/50"
              >
                <div className="flex items-center justify-center gap-2">
                  <Zap className="h-4 w-4 text-amber-300" />
                  <span>ACTIVATE EMERGENCY PRIORITY</span>
                </div>
              </ShinyButton>
            )}

            <button
              onClick={onClose}
              className="px-5 py-3 text-xs font-extrabold text-gray-300 border border-red-900/50 hover:bg-white/10 rounded-2xl transition cursor-pointer"
            >
              Cancel
            </button>
          </div>
        </motion.div>
      </div>
    </AnimatePresence>
  );
};

export default EmergencyModal;
