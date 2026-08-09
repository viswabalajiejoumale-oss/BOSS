import React, { useState, useMemo } from 'react';
import {
  ArrowLeft,
  MapPin,
  Search,
  Sparkles,
  Zap,
  Navigation,
  Clock,
  CheckCircle2,
  SlidersHorizontal,
  Compass,
  Building2,
  PhoneCall,
  ShieldCheck,
} from 'lucide-react';
import { MapView } from '@/components/MapView';
import type { Station, Charger, Recommendation } from '@/types';
import { recommendStations } from '@/lib/aiEngine';
import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';

interface FullMapPageProps {
  onBack: () => void;
  stations: Station[];
  chargers: Charger[];
  userLat: number;
  userLon: number;
  selectedStationId: string | null;
  onSelectStation: (id: string) => void;
}

const INDIAN_STATES = [
  'All India',
  'Maharashtra',
  'Karnataka',
  'Tamil Nadu',
  'Delhi',
  'Kerala',
  'Gujarat',
  'Rajasthan',
  'Telangana',
  'West Bengal',
  'Uttar Pradesh',
  'Madhya Pradesh',
];

export const FullMapPage: React.FC<FullMapPageProps> = ({
  onBack,
  stations,
  chargers,
  userLat,
  userLon,
  selectedStationId,
  onSelectStation,
}) => {
  const [searchQuery, setSearchQuery] = useState('');
  const [selectedState, setSelectedState] = useState('All India');
  const [selectedDistrict, setSelectedDistrict] = useState('All Districts');

  // Available districts for selected state
  const availableDistricts = useMemo(() => {
    const set = new Set<string>();
    stations.forEach((s) => {
      if (
        (selectedState === 'All India' || s.state === selectedState) &&
        s.city &&
        s.city !== 'Unknown' &&
        s.city !== 'India'
      ) {
        set.add(s.city);
      }
    });
    return Array.from(set).sort();
  }, [stations, selectedState]);

  // Group chargers by station
  const chargersByStation = useMemo(() => {
    const map = new Map<string, Charger[]>();
    chargers.forEach((c) => {
      const arr = map.get(c.station_id) ?? [];
      arr.push(c);
      map.set(c.station_id, arr);
    });
    return map;
  }, [chargers]);

  // Filtered stations
  const filteredStations = useMemo(() => {
    return stations.filter((s) => {
      const matchesSearch =
        searchQuery === '' ||
        s.name.toLowerCase().includes(searchQuery.toLowerCase()) ||
        s.address.toLowerCase().includes(searchQuery.toLowerCase()) ||
        (s.city && s.city.toLowerCase().includes(searchQuery.toLowerCase()));
      const matchesState = selectedState === 'All India' || s.state === selectedState;
      const matchesDistrict = selectedDistrict === 'All Districts' || s.city === selectedDistrict;
      return matchesSearch && matchesState && matchesDistrict;
    });
  }, [stations, searchQuery, selectedState, selectedDistrict]);

  // AI Station Recommendations
  const aiRecommendations = useMemo<Recommendation[]>(() => {
    return recommendStations(
      filteredStations,
      chargersByStation,
      userLat,
      userLon,
      50,
      false
    );
  }, [filteredStations, chargersByStation, userLat, userLon]);

  return (
    <BackgroundSystem variant="dashboard">
      {/* TOP HEADER BAR */}
      <header className="sticky top-0 z-40 border-b border-slate-200/80 dark:border-slate-800/80 bg-white/90 dark:bg-slate-950/80 backdrop-blur-xl px-4 lg:px-8 py-3.5 shadow-lg text-slate-900 dark:text-slate-100">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          {/* Back Button */}
          <button
            onClick={onBack}
            className="boss-btn-ghost text-xs font-bold px-4 py-2 cursor-pointer"
          >
            <ArrowLeft className="h-4 w-4 text-emerald-500" />
            <span>Back to Dashboard</span>
          </button>

          {/* Page Branding */}
          <div className="flex items-center gap-2.5">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-emerald-500/20 border border-emerald-500/40 text-emerald-500 shadow-md">
              <MapPin className="h-5 w-5" />
            </div>
            <div>
              <h1 className="text-base font-black tracking-tight text-slate-900 dark:text-white flex items-center gap-2">
                STATION MAP INTELLIGENCE <span className="text-[10px] font-bold text-emerald-700 dark:text-emerald-400 bg-emerald-500/15 border border-emerald-500/30 px-2 py-0.5 rounded-md">LIVE GPS</span>
              </h1>
              <p className="text-[11px] font-semibold text-slate-600 dark:text-slate-400 hidden sm:block">
                Geospatial Charger Availability & Load Telemetry
              </p>
            </div>
          </div>

          {/* Status Badge & Theme Toggle */}
          <div className="flex items-center gap-3">
            <ThemeToggle />
            <div className="hidden md:flex boss-badge-green">
              <span className="h-2.5 w-2.5 rounded-full bg-emerald-400 animate-pulse" />
              <span>GPS LIVE TRACKING</span>
            </div>
          </div>
        </div>
      </header>

      {/* MAIN CONTENT */}
      <main className="flex-1 max-w-7xl w-full mx-auto p-4 sm:p-6 lg:p-8 space-y-6">

        {/* TOP QUICK STATS GRID */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Total Active Stations</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">{filteredStations.length} Stations</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                {selectedState} Coverage
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-emerald-500/15 text-emerald-600 dark:text-emerald-400 flex items-center justify-center shadow-sm">
              <Building2 className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Available Fast Chargers</span>
              <span className="font-mono text-2xl font-black text-slate-900 dark:text-white">3,120 Guns</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                CCS2 / Type 2 Fast Charge
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-amber-500/15 text-amber-600 dark:text-amber-400 flex items-center justify-center shadow-sm">
              <Zap className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">Avg Station Wait Time</span>
              <span className="font-mono text-2xl font-black text-emerald-700 dark:text-emerald-400">&lt; 4.2 Mins</span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                AI Queue Optimization
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-blue-500/15 text-blue-600 dark:text-blue-400 flex items-center justify-center shadow-sm">
              <Clock className="h-6 w-6" />
            </div>
          </div>

          <div className="boss-card p-5 bg-white dark:bg-[#111F1C] border border-emerald-500/30 shadow-md rounded-2xl flex items-center justify-between">
            <div>
              <span className="text-xs text-slate-600 dark:text-slate-400 font-semibold block">AI Top Recommendation</span>
              <span className="font-mono text-sm font-black text-slate-900 dark:text-white truncate max-w-[140px] block">
                {aiRecommendations[0]?.station.name || 'EBM Station'}
              </span>
              <span className="text-[11px] text-emerald-600 dark:text-emerald-400 font-bold block mt-0.5">
                {aiRecommendations[0]?.distanceKm.toFixed(1) || '2.4'} km away
              </span>
            </div>
            <div className="h-12 w-12 rounded-2xl bg-teal-500/15 text-teal-600 dark:text-teal-400 flex items-center justify-center shadow-sm">
              <Compass className="h-6 w-6" />
            </div>
          </div>

        </div>

        {/* MAIN SPLIT VIEW */}
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 items-start">

          {/* LEFT HALF: INTERACTIVE MAP & SEARCH FILTERS */}
          <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-4 text-slate-900 dark:text-white">

            {/* Search & State Filters */}
            <div className="space-y-3">
              <div className="flex flex-col sm:flex-row gap-2">
                {/* Search Input */}
                <div className="relative flex-1">
                  <Search className="absolute left-3.5 top-3 h-4 w-4 text-slate-400" />
                  <input
                    type="text"
                    value={searchQuery}
                    onChange={(e) => setSearchQuery(e.target.value)}
                    placeholder="Search by station name, city, or address..."
                    className="boss-input pl-10 text-xs py-2.5 rounded-xl border-slate-300 dark:border-slate-700"
                  />
                </div>

                {/* State Dropdown */}
                <select
                  value={selectedState}
                  onChange={(e) => {
                    setSelectedState(e.target.value);
                    setSelectedDistrict('All Districts');
                  }}
                  className="boss-input text-xs py-2.5 rounded-xl font-bold"
                >
                  {INDIAN_STATES.map((st) => (
                    <option key={st} value={st}>
                      {st}
                    </option>
                  ))}
                </select>
              </div>

              {/* District Pills Bar */}
              {availableDistricts.length > 0 && (
                <div className="flex items-center gap-1.5 overflow-x-auto pb-1 text-xs">
                  <span className="text-slate-600 dark:text-slate-400 font-bold shrink-0 flex items-center gap-1">
                    <SlidersHorizontal className="h-3.5 w-3.5" /> District:
                  </span>
                  <button
                    onClick={() => setSelectedDistrict('All Districts')}
                    className={`rounded-lg px-2.5 py-1 font-extrabold text-[11px] transition-all shrink-0 cursor-pointer ${selectedDistrict === 'All Districts'
                        ? 'bg-emerald-600 text-white shadow-sm'
                        : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-700'
                      }`}
                  >
                    All Districts
                  </button>
                  {availableDistricts.slice(0, 8).map((dist) => (
                    <button
                      key={dist}
                      onClick={() => setSelectedDistrict(dist)}
                      className={`rounded-lg px-2.5 py-1 font-extrabold text-[11px] transition-all shrink-0 cursor-pointer ${selectedDistrict === dist
                          ? 'bg-emerald-600 text-white shadow-sm'
                          : 'bg-slate-100 dark:bg-slate-800 text-slate-700 dark:text-slate-300 hover:bg-slate-200 dark:hover:bg-slate-700'
                        }`}
                    >
                      {dist}
                    </button>
                  ))}
                </div>
              )}
            </div>

            {/* INTERACTIVE LEAFLET MAP VIEW */}
            <div className="h-[460px] w-full overflow-hidden rounded-2xl border border-slate-200 dark:border-slate-800 shadow-inner">
              <MapView
                stations={filteredStations}
                userLat={userLat}
                userLon={userLon}
                selectedId={selectedStationId}
                onSelect={onSelectStation}
                height="460px"
              />
            </div>

            <div className="flex items-center justify-between text-xs font-bold text-slate-600 dark:text-slate-400 pt-1">
              <span>Showing {filteredStations.length} stations on map</span>
              <span className="text-emerald-700 dark:text-emerald-400 flex items-center gap-1">
                <CheckCircle2 className="h-4 w-4" /> Real-time GPS Location Active
              </span>
            </div>
          </div>

          {/* RIGHT HALF: BOSS MAP VISUAL & AI RECOMMENDATIONS LIST */}
          <div className="space-y-6">

            {/* BOSS MAP VISUAL CARD */}
            <div className="boss-card relative flex flex-col items-center justify-center p-6 lg:p-8 overflow-hidden rounded-3xl border-emerald-500/30 bg-white dark:bg-[#111F1C] text-slate-900 dark:text-white shadow-xl min-h-[380px]">
              {/* Subtle Ambient Emerald Glow */}
              <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-emerald-500/15 via-teal-500/5 to-transparent blur-2xl pointer-events-none" />

              {/* Top Overlay Tag */}
              <div className="absolute top-6 left-6 flex items-center gap-2 rounded-full border border-emerald-500/30 bg-emerald-500/15 backdrop-blur-md px-3.5 py-1.5 text-xs font-bold text-emerald-700 dark:text-emerald-400 shadow-sm">
                <Sparkles className="h-3.5 w-3.5 text-amber-500" />
                <span>BOSS AI NAVIGATION MATRIX</span>
              </div>

              {/* STATIC MAP IMAGE */}
              <div className="relative z-10 my-auto flex items-center justify-center w-full pt-6">
                <img
                  src="/boss-map-transparent.png"
                  alt="BOSS Map Visual"
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = '/boss-map.jpeg';
                  }}
                  className="max-h-[320px] lg:max-h-[360px] w-auto max-w-full object-contain filter drop-shadow-[0_15px_30px_rgba(16,185,129,0.3)]"
                />
              </div>

              {/* Bottom Tech Strip */}
              <div className="relative z-10 w-full mt-4 grid grid-cols-3 gap-3 pt-4 border-t border-slate-200 dark:border-slate-800 text-center text-xs">
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Network Radius</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">All India (100%)</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Smart Metering</span>
                  <span className="font-extrabold text-slate-900 dark:text-white">OTP Verified</span>
                </div>
                <div className="rounded-xl bg-slate-100 dark:bg-slate-900 p-2 border border-slate-200 dark:border-slate-800">
                  <span className="text-[10px] text-slate-500 dark:text-slate-400 block uppercase font-bold">Emergency Dispatch</span>
                  <span className="font-extrabold text-emerald-700 dark:text-emerald-400">Mobile Unit Active</span>
                </div>
              </div>
            </div>

            {/* AI RECOMMENDED STATIONS LIST */}
            <div className="boss-card p-6 bg-white dark:bg-[#111F1C] border border-slate-200 dark:border-slate-800 shadow-xl rounded-3xl space-y-4 text-slate-900 dark:text-white">
              <div className="flex items-center justify-between">
                <div className="flex items-center gap-2">
                  <Sparkles className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
                  <h2 className="font-extrabold text-base text-slate-900 dark:text-white">AI Top Recommended Stations</h2>
                </div>
                <span className="text-xs font-bold text-slate-600 dark:text-slate-400">Sorted by AI Score</span>
              </div>

              <div className="space-y-3">
                {aiRecommendations.slice(0, 3).map((rec) => (
                  <div
                    key={rec.station.id}
                    onClick={() => onSelectStation(rec.station.id)}
                    className={`p-4 rounded-2xl border transition-all cursor-pointer ${selectedStationId === rec.station.id
                        ? 'border-emerald-500 bg-emerald-500/15 dark:bg-emerald-950/40 shadow-md ring-2 ring-emerald-500/30'
                        : 'border-slate-200 dark:border-slate-800 bg-slate-50 dark:bg-slate-900/60 hover:bg-slate-100 dark:hover:bg-slate-800/80'
                      }`}
                  >
                    <div className="flex items-start justify-between">
                      <div>
                        <div className="flex items-center gap-2">
                          <h4 className="font-extrabold text-sm text-slate-900 dark:text-white">{rec.station.name}</h4>
                          <span className="rounded-full bg-emerald-600 text-white px-2 py-0.5 text-[10px] font-black">
                            {rec.score}% Match
                          </span>
                        </div>
                        <p className="text-xs text-slate-600 dark:text-slate-400 font-medium mt-0.5">{rec.station.address}</p>
                      </div>

                      <span className="font-mono text-sm font-extrabold text-emerald-700 dark:text-emerald-400">
                        ₹{rec.pricePerKwh}/kWh
                      </span>
                    </div>

                    <div className="flex items-center justify-between pt-3 mt-2 border-t border-slate-200 dark:border-slate-800 text-xs font-semibold text-slate-600 dark:text-slate-300">
                      <div className="flex items-center gap-3">
                        <span className="flex items-center gap-1">
                          <Navigation className="h-3.5 w-3.5 text-blue-600 dark:text-blue-400" /> {rec.distanceKm.toFixed(1)} km
                        </span>
                        <span className="flex items-center gap-1">
                          <Clock className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" /> ~{rec.waitTimeMin}m wait
                        </span>
                      </div>

                      <span className="text-emerald-700 dark:text-emerald-400 font-bold">
                        {rec.availableChargers} Chargers Free
                      </span>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* AI GPS ADVISORY BOX */}
            <div className="rounded-2xl border border-emerald-500/30 bg-emerald-500/10 p-4 text-xs">
              <div className="flex items-start gap-2.5">
                <ShieldCheck className="h-5 w-5 text-emerald-700 dark:text-emerald-400 shrink-0 mt-0.5" />
                <div>
                  <h4 className="font-extrabold text-sm text-slate-900 dark:text-white mb-0.5">
                    BOSS AI GPS Route Optimization
                  </h4>
                  <p className="text-slate-700 dark:text-slate-300 leading-relaxed font-medium">
                    AI engine dynamically routes you to stations with active transformer load capacity below 65%, guaranteeing maximum DC fast charge delivery speed.
                  </p>
                </div>
              </div>
            </div>

          </div>

        </div>
      </main>
    </BackgroundSystem>
  );
};
