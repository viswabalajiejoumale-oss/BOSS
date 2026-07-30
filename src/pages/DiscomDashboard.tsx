import { useMemo, useState } from 'react';
import {
  AreaChart, Area, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer,
  BarChart, Bar, Cell, LineChart, Line,
} from 'recharts';
import {
  Zap, Power, AlertTriangle, TrendingUp, Activity, Building2, Gauge, LogOut,
} from 'lucide-react';
import { useAuth } from '@/context/AuthContext';
import { useStations } from '@/hooks/useData';
import { getStationLoadPercent } from '@/lib/aiEngine';

export function DiscomDashboard() {
  const { profile, signOut } = useAuth();
  const { stations, chargers, loading } = useStations();

  const stationData = useMemo(() => {
    return stations.map((s) => {
      const stationChargers = chargers.filter((c) => c.station_id === s.id);
      const load = getStationLoadPercent(s);
      const totalKw = stationChargers.reduce((sum, c) => sum + c.current_load_kw, 0);
      return {
        ...s,
        loadPercent: load,
        totalKw,
        chargerCount: stationChargers.length,
        available: stationChargers.filter((c) => c.status === 'available').length,
        isOverloaded: load >= 90,
      };
    });
  }, [stations, chargers]);

  const totalCapacity = stations.reduce((sum, s) => sum + s.transformer_load_capacity_kva, 0);
  const totalLoad = stations.reduce((sum, s) => sum + s.current_load_kva, 0);
  const totalConsumption = (totalLoad / totalCapacity) * 100;
  const overloadedStations = stationData.filter((s) => s.isOverloaded);
  const peakDemand = Math.max(...stationData.map((s) => s.loadPercent), 0);
  const chargingDemand = chargers.filter((c) => c.status === 'occupied').length;

  const forecastData = useMemo(() => {
    return Array.from({ length: 24 }, (_, h) => ({
      hour: `${h}:00`,
      demand: Math.round((Math.sin(h / 3) * 0.3 + 0.6) * totalCapacity),
      charging: Math.round((Math.sin(h / 3) * 0.2 + 0.3) * totalCapacity * 0.4),
      forecast: Math.round((Math.sin(h / 3) * 0.3 + 0.65) * totalCapacity),
    }));
  }, [totalCapacity]);

  const consumptionData = useMemo(() => {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days.map((d) => ({
      day: d,
      consumption: Math.round(Math.random() * 500 + 800),
      charging: Math.round(Math.random() * 200 + 100),
    }));
  }, []);

  return (
    <div className="min-h-screen bg-[var(--boss-bg)] text-white">
      {/* Header */}
      <header className="sticky top-0 z-20 border-b border-[var(--boss-border)] bg-[var(--boss-bg)]/90 backdrop-blur">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-4 md:px-6">
          <div className="flex items-center gap-3">
            <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-[var(--boss-green)] text-black">
              <Power className="h-5 w-5" />
            </div>
            <div>
              <h1 className="text-lg font-bold">DISCOM Grid Control</h1>
              <p className="text-xs text-gray-500">City-wide Grid Monitoring</p>
            </div>
          </div>
          <button onClick={signOut} className="boss-btn-ghost text-sm">
            <LogOut className="h-4 w-4" /> Sign Out
          </button>
        </div>
      </header>

      <main className="mx-auto max-w-7xl space-y-6 px-4 py-6 md:px-6">
        {/* KPI cards */}
        <div className="grid grid-cols-2 gap-4 md:grid-cols-4">
          <KpiCard icon={Zap} label="Total Power Consumption" value={`${totalConsumption.toFixed(0)}%`} sub={`${totalLoad.toFixed(0)} / ${totalCapacity} kVA`} />
          <KpiCard icon={TrendingUp} label="Peak Demand" value={`${peakDemand.toFixed(0)}%`} sub="Current peak load" />
          <KpiCard icon={Activity} label="Charging Demand" value={`${chargingDemand}`} sub="Active sessions" />
          <KpiCard icon={AlertTriangle} label="Overloaded Stations" value={`${overloadedStations.length}`} sub="Need attention" danger={overloadedStations.length > 0} />
        </div>

        {/* Forecast graph */}
        <div className="boss-card">
          <div className="mb-3 flex items-center gap-2">
            <Activity className="h-5 w-5 text-[var(--boss-green-bright)]" />
            <h2 className="font-semibold">24-Hour Demand Forecast</h2>
          </div>
          <ResponsiveContainer width="100%" height={250}>
            <AreaChart data={forecastData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#1a2a1a" />
              <XAxis dataKey="hour" stroke="#666" fontSize={10} interval={3} />
              <YAxis stroke="#666" fontSize={12} />
              <Tooltip contentStyle={{ background: '#111a11', border: '1px solid #1a2a1a', borderRadius: 8 }} />
              <Area type="monotone" dataKey="demand" stroke="#22c55e" fill="#22c55e22" strokeWidth={2} name="Total Demand" />
              <Area type="monotone" dataKey="charging" stroke="#4ade80" fill="#4ade8022" strokeWidth={2} name="Charging Load" />
              <Line type="monotone" dataKey="forecast" stroke="#eab308" strokeWidth={2} strokeDasharray="5 5" name="AI Forecast" />
            </AreaChart>
          </ResponsiveContainer>
        </div>

        {/* Two columns: Station load + Consumption */}
        <div className="grid grid-cols-1 gap-4 lg:grid-cols-2">
          {/* Station load bars */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <Gauge className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Transformer Load by Station</h2>
            </div>
            <ResponsiveContainer width="100%" height={220}>
              <BarChart data={stationData.map((s) => ({ name: s.name, load: s.loadPercent }))}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1a2a1a" />
                <XAxis dataKey="name" stroke="#666" fontSize={10} />
                <YAxis stroke="#666" fontSize={12} />
                <Tooltip contentStyle={{ background: '#111a11', border: '1px solid #1a2a1a', borderRadius: 8 }} />
                <Bar dataKey="load" radius={[4, 4, 0, 0]}>
                  {stationData.map((s, i) => (
                    <Cell key={i} fill={s.loadPercent >= 90 ? '#ef4444' : s.loadPercent >= 70 ? '#eab308' : '#22c55e'} />
                  ))}
                </Bar>
              </BarChart>
            </ResponsiveContainer>
          </div>

          {/* Weekly consumption */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <Building2 className="h-5 w-5 text-[var(--boss-green-bright)]" />
              <h2 className="font-semibold">Weekly City Consumption</h2>
            </div>
            <ResponsiveContainer width="100%" height={220}>
              <LineChart data={consumptionData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1a2a1a" />
                <XAxis dataKey="day" stroke="#666" fontSize={12} />
                <YAxis stroke="#666" fontSize={12} />
                <Tooltip contentStyle={{ background: '#111a11', border: '1px solid #1a2a1a', borderRadius: 8 }} />
                <Line type="monotone" dataKey="consumption" stroke="#22c55e" strokeWidth={2} dot={{ fill: '#22c55e' }} name="Total (kWh)" />
                <Line type="monotone" dataKey="charging" stroke="#4ade80" strokeWidth={2} strokeDasharray="5 5" dot={{ fill: '#4ade80' }} name="Charging (kWh)" />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Overloaded stations table */}
        <div className="boss-card">
          <div className="mb-3 flex items-center gap-2">
            <AlertTriangle className="h-5 w-5 text-[var(--boss-green-bright)]" />
            <h2 className="font-semibold">Overloaded Stations</h2>
          </div>
          {overloadedStations.length === 0 ? (
            <div className="flex items-center gap-2 rounded-lg bg-[var(--boss-green)]/10 p-3 text-sm text-[var(--boss-green-bright)]">
              <Zap className="h-4 w-4" /> All stations are operating within safe limits.
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-sm">
                <thead>
                  <tr className="border-b border-[var(--boss-border)] text-left text-xs text-gray-500">
                    <th className="pb-2 pr-4">Station</th>
                    <th className="pb-2 pr-4">Load</th>
                    <th className="pb-2 pr-4">Capacity</th>
                    <th className="pb-2 pr-4">Chargers</th>
                    <th className="pb-2 pr-4">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {overloadedStations.map((s) => (
                    <tr key={s.id} className="border-b border-[var(--boss-border)]/50">
                      <td className="py-2 pr-4 font-medium">{s.name}</td>
                      <td className="py-2 pr-4 text-red-400 font-bold">{s.loadPercent.toFixed(0)}%</td>
                      <td className="py-2 pr-4">{s.current_load_kva.toFixed(0)} / {s.transformer_load_capacity_kva} kVA</td>
                      <td className="py-2 pr-4">{s.chargerCount} ({s.available} avail)</td>
                      <td className="py-2 pr-4">
                        <span className="rounded-full bg-red-500/20 px-2 py-0.5 text-xs text-red-400">REDIRECT ACTIVE</span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>

        {/* All stations grid */}
        <div className="boss-card">
          <div className="mb-3 flex items-center gap-2">
            <Building2 className="h-5 w-5 text-[var(--boss-green-bright)]" />
            <h2 className="font-semibold">All Stations Overview</h2>
          </div>
          <div className="grid grid-cols-1 gap-3 sm:grid-cols-2 lg:grid-cols-3">
            {stationData.map((s) => (
              <div key={s.id} className="rounded-xl border border-[var(--boss-border)] p-4">
                <div className="mb-2 flex items-center justify-between">
                  <span className="font-medium">{s.name}</span>
                  <span className={`rounded-full px-2 py-0.5 text-xs ${s.isOverloaded ? 'bg-red-500/20 text-red-400' : 'bg-[var(--boss-green)]/20 text-[var(--boss-green-bright)]'}`}>
                    {s.loadPercent.toFixed(0)}%
                  </span>
                </div>
                <div className="h-2 overflow-hidden rounded-full bg-gray-800">
                  <div
                    className={`h-full rounded-full ${s.loadPercent >= 90 ? 'bg-red-500' : s.loadPercent >= 70 ? 'bg-yellow-500' : 'bg-[var(--boss-green)]'}`}
                    style={{ width: `${Math.min(s.loadPercent, 100)}%` }}
                  />
                </div>
                <div className="mt-2 flex justify-between text-xs text-gray-500">
                  <span>{s.current_load_kva.toFixed(0)} kVA</span>
                  <span>{s.chargerCount} chargers</span>
                </div>
              </div>
            ))}
          </div>
        </div>
      </main>
    </div>
  );
}

function KpiCard({ icon: Icon, label, value, sub, danger }: { icon: typeof Zap; label: string; value: string; sub: string; danger?: boolean }) {
  return (
    <div className={`boss-card ${danger ? 'border-red-500/30' : ''}`}>
      <div className="mb-2 flex items-center gap-2">
        <div className={`flex h-8 w-8 items-center justify-center rounded-lg ${danger ? 'bg-red-500/10 text-red-400' : 'bg-[var(--boss-green)]/10 text-[var(--boss-green-bright)]'}`}>
          <Icon className="h-5 w-5" />
        </div>
      </div>
      <div className={`text-2xl font-bold ${danger ? 'text-red-400' : ''}`}>{value}</div>
      <div className="text-xs text-gray-400">{label}</div>
      <div className="text-xs text-gray-600">{sub}</div>
    </div>
  );
}
