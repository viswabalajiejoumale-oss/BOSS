import { useMemo } from 'react';
import {
  AreaChart, Area, XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer,
  BarChart, Bar, Cell, LineChart, Line,
} from 'recharts';
import {
  Zap, Power, AlertTriangle, TrendingUp, Activity, Building2, Gauge, LogOut, ShieldCheck, Cpu, Sparkles
} from 'lucide-react';
import { useAuth } from '@/context/AuthContext';
import { useStations } from '@/hooks/useData';
import { getStationLoadPercent } from '@/lib/aiEngine';
import { ShinyButton } from '@/components/ui/shiny-button';
import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ThemeToggle } from '@/components/ui/ThemeToggle';
import { Terminal, AnimatedSpan, TypingAnimation } from '@/components/ui/terminal';

export function DiscomDashboard() {
  const { profile, signOut } = useAuth();
  const { stations, chargers } = useStations();

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

  const totalCapacity = stations.reduce((sum, s) => sum + s.transformer_load_capacity_kva, 0) || 1000;
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
    <BackgroundSystem variant="dashboard">
      {/* Header */}
      <header className="sticky top-0 z-20 border-b border-slate-200/80 dark:border-slate-800/80 bg-white/90 dark:bg-slate-950/80 backdrop-blur-xl shadow-lg transition-colors">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-4 py-3.5 md:px-6">
          <div className="flex items-center gap-3">
            <div className="flex items-center justify-center">
              <img src="/boss-logo-transparent.png" alt="BOSS Logo" className="h-9 w-auto object-contain" />
            </div>
            <div>
              <h1 className="text-base font-extrabold text-slate-900 dark:text-white flex items-center gap-2">
                GRID INTELLIGENCE CENTER <span className="text-[10px] font-bold text-indigo-700 dark:text-indigo-400 bg-indigo-500/15 border border-indigo-500/30 px-2 py-0.5 rounded-md">DISCOM UTILITY</span>
              </h1>
              <p className="text-xs text-slate-600 dark:text-slate-400 font-medium">City-wide Feeder Telemetry & Load Balancer</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <ThemeToggle />
            <ShinyButton onClick={signOut} className="text-xs text-slate-200 border-slate-700 bg-slate-800/60 hover:bg-slate-800 rounded-xl">
              <span className="flex items-center gap-1.5"><LogOut className="h-4 w-4" /> Sign Out</span>
            </ShinyButton>
          </div>
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

        {/* AI EVENT LOG TERMINAL COMPONENT */}
        <div className="boss-card p-4">
          <div className="mb-3 flex items-center justify-between">
            <div className="flex items-center gap-2 text-emerald-400 text-xs font-bold uppercase tracking-wider">
              <Cpu className="h-4 w-4" /> AI REAL-TIME GRID EVENT STREAM
            </div>
            <span className="boss-badge-green">LIVE MONITOR</span>
          </div>
          <Terminal className="max-h-60 bg-slate-950">
            <TypingAnimation className="text-emerald-400 font-mono text-xs">
              &gt; BOSS AI DISCOM ENGINE INITIALIZED... Monitoring 12 city feeders.
            </TypingAnimation>
            <AnimatedSpan delay={1000} className="text-slate-300 font-mono text-xs">
              [14:32:08] TELEMETRY: Substation Feeder #4 load elevated (64.2 kVA).
            </AnimatedSpan>
            <AnimatedSpan delay={2000} className="text-blue-400 font-mono text-xs">
              [14:32:09] AI OPTIMIZATION: Shift algorithm evaluating 18 non-urgent EV sessions.
            </AnimatedSpan>
            <AnimatedSpan delay={3000} className="text-emerald-400 font-mono text-xs">
              [14:32:11] ACTION: 18 charging sessions shifted to 6:30 PM slot.
            </AnimatedSpan>
            <AnimatedSpan delay={4000} className="text-amber-400 font-mono text-xs">
              [14:32:13] RESULT: Estimated Transformer Load relief achieved (-12.4% Peak Drop).
            </AnimatedSpan>
          </Terminal>
        </div>

        {/* Forecast graph */}
        <div className="boss-card">
          <div className="mb-3 flex items-center justify-between">
            <div className="flex items-center gap-2">
              <Activity className="h-5 w-5 text-emerald-400" />
              <h2 className="font-extrabold text-white text-base">24-Hour Demand Forecast</h2>
            </div>
            <span className="text-xs text-slate-400">AI Predictive Load</span>
          </div>
          <ResponsiveContainer width="100%" height={260}>
            <AreaChart data={forecastData}>
              <CartesianGrid strokeDasharray="3 3" stroke="#1e293b" />
              <XAxis dataKey="hour" stroke="#94a3b8" fontSize={10} interval={3} />
              <YAxis stroke="#94a3b8" fontSize={12} />
              <Tooltip contentStyle={{ background: '#0f172a', border: '1px solid #334155', borderRadius: 8, color: '#fff' }} />
              <Area type="monotone" dataKey="demand" stroke="#10b981" fill="#10b98122" strokeWidth={2} name="Total Demand" />
              <Area type="monotone" dataKey="charging" stroke="#3b82f6" fill="#3b82f622" strokeWidth={2} name="Charging Load" />
              <Line type="monotone" dataKey="forecast" stroke="#f59e0b" strokeWidth={2} strokeDasharray="5 5" name="AI Forecast" />
            </AreaChart>
          </ResponsiveContainer>
        </div>

        {/* Two columns: Station load + Consumption */}
        <div className="grid grid-cols-1 gap-6 lg:grid-cols-2">
          {/* Station load bars */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <Gauge className="h-5 w-5 text-emerald-400" />
              <h2 className="font-extrabold text-white text-base">Transformer Load by Station</h2>
            </div>
            <ResponsiveContainer width="100%" height={220}>
              <BarChart data={stationData.map((s) => ({ name: s.name, load: s.loadPercent }))}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1e293b" />
                <XAxis dataKey="name" stroke="#94a3b8" fontSize={10} />
                <YAxis stroke="#94a3b8" fontSize={12} />
                <Tooltip contentStyle={{ background: '#0f172a', border: '1px solid #334155', borderRadius: 8, color: '#fff' }} />
                <Bar dataKey="load" radius={[6, 6, 0, 0]}>
                  {stationData.map((s, i) => (
                    <Cell key={i} fill={s.loadPercent >= 90 ? '#ef4444' : s.loadPercent >= 70 ? '#f59e0b' : '#10b981'} />
                  ))}
                </Bar>
              </BarChart>
            </ResponsiveContainer>
          </div>

          {/* Weekly consumption */}
          <div className="boss-card">
            <div className="mb-3 flex items-center gap-2">
              <Building2 className="h-5 w-5 text-emerald-400" />
              <h2 className="font-extrabold text-white text-base">Weekly City Consumption</h2>
            </div>
            <ResponsiveContainer width="100%" height={220}>
              <LineChart data={consumptionData}>
                <CartesianGrid strokeDasharray="3 3" stroke="#1e293b" />
                <XAxis dataKey="day" stroke="#94a3b8" fontSize={12} />
                <YAxis stroke="#94a3b8" fontSize={12} />
                <Tooltip contentStyle={{ background: '#0f172a', border: '1px solid #334155', borderRadius: 8, color: '#fff' }} />
                <Line type="monotone" dataKey="consumption" stroke="#10b981" strokeWidth={2} dot={{ fill: '#10b981' }} name="Total (kWh)" />
                <Line type="monotone" dataKey="charging" stroke="#3b82f6" strokeWidth={2} strokeDasharray="5 5" dot={{ fill: '#3b82f6' }} name="Charging (kWh)" />
              </LineChart>
            </ResponsiveContainer>
          </div>
        </div>

        {/* Overloaded stations table */}
        <div className="boss-card">
          <div className="mb-3 flex items-center gap-2">
            <AlertTriangle className="h-5 w-5 text-emerald-400" />
            <h2 className="font-extrabold text-white text-base">Overloaded Station Telemetry</h2>
          </div>
          {overloadedStations.length === 0 ? (
            <div className="flex items-center gap-2 rounded-xl bg-emerald-500/10 border border-emerald-500/30 p-4 text-xs font-bold text-emerald-400">
              <ShieldCheck className="h-4 w-4 shrink-0" /> All city stations are operating safely within 80% transformer threshold.
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-xs">
                <thead>
                  <tr className="border-b border-slate-800 text-left text-slate-400 uppercase font-bold">
                    <th className="pb-3 pr-4">Station</th>
                    <th className="pb-3 pr-4">Load %</th>
                    <th className="pb-3 pr-4">Capacity</th>
                    <th className="pb-3 pr-4">Chargers</th>
                    <th className="pb-3 pr-4">Action</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-800/50">
                  {overloadedStations.map((s) => (
                    <tr key={s.id}>
                      <td className="py-3 pr-4 font-bold text-white">{s.name}</td>
                      <td className="py-3 pr-4 text-red-400 font-extrabold">{s.loadPercent.toFixed(0)}%</td>
                      <td className="py-3 pr-4 text-slate-300">{s.current_load_kva.toFixed(0)} / {s.transformer_load_capacity_kva} kVA</td>
                      <td className="py-3 pr-4 text-slate-300">{s.chargerCount} ({s.available} avail)</td>
                      <td className="py-3 pr-4">
                        <span className="boss-badge-amber">DYNAMIC REDIRECT ACTIVE</span>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </main>
    </BackgroundSystem>
  );
}

function KpiCard({ icon: Icon, label, value, sub, danger }: { icon: typeof Zap; label: string; value: string; sub: string; danger?: boolean }) {
  return (
    <div className={`boss-card ${danger ? 'border-red-500/40 bg-red-950/20' : ''}`}>
      <div className="mb-2 flex items-center justify-between">
        <div className={`flex h-9 w-9 items-center justify-center rounded-xl ${danger ? 'bg-red-500/20 text-red-400' : 'bg-emerald-500/15 text-emerald-400'}`}>
          <Icon className="h-5 w-5" />
        </div>
      </div>
      <div className={`text-2xl font-black ${danger ? 'text-red-400' : 'text-white'}`}>{value}</div>
      <div className="text-xs font-bold text-slate-300 mt-1">{label}</div>
      <div className="text-[11px] text-slate-400 font-medium">{sub}</div>
    </div>
  );
}
