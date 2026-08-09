import { motion } from 'framer-motion';
import {
  BatteryCharging, MapPin, BarChart3, Shield, ArrowRight, Zap, Cpu,
  Activity, CheckCircle2, Sparkles, Layers, Globe2, ShieldCheck, ChevronRight
} from 'lucide-react';
import { BackgroundSystem } from '@/components/ui/BackgroundSystem';
import { ShinyButton } from '@/components/ui/shiny-button';
import { AnimatedGradientText } from '@/components/ui/animated-gradient-text';
import { BorderBeam } from '@/components/ui/border-beam';
import { ThemeToggle } from '@/components/ui/ThemeToggle';
import { BossMascotMessage } from '@/components/ui/BossMascotMessage';

interface LandingPageProps {
  onEnter: () => void;
}

export function LandingPage({ onEnter }: LandingPageProps) {
  const scrollToSection = (id: string) => {
    const el = document.getElementById(id);
    if (el) el.scrollIntoView({ behavior: 'smooth' });
  };

  return (
    <BackgroundSystem variant="hero">
      {/* STICKY GLASS NAVBAR */}
      <header className="sticky top-0 z-50 w-full backdrop-blur-xl bg-white/80 dark:bg-slate-950/70 border-b border-slate-200/80 dark:border-slate-800/80 px-6 py-4 md:px-12 transition-all">
        <div className="max-w-7xl mx-auto flex items-center justify-between">
          <div className="flex items-center gap-3 cursor-pointer" onClick={() => window.scrollTo({ top: 0, behavior: 'smooth' })}>
            <div className="relative flex items-center justify-center">
              <img
                src="/boss-logo-transparent.png"
                alt="BOSS Logo"
                className="h-9 w-9 object-contain"
              />
              <span className="absolute -top-0.5 -right-0.5 flex h-2.5 w-2.5">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75" />
                <span className="relative inline-flex rounded-full h-2.5 w-2.5 bg-emerald-500" />
              </span>
            </div>
            <div className="flex flex-col">
              <span className="text-xl font-black tracking-tight text-slate-900 dark:text-white flex items-center gap-1.5">
                BOSS <span className="text-[10px] font-extrabold uppercase px-1.5 py-0.5 rounded bg-emerald-500/20 text-emerald-700 dark:text-emerald-400 border border-emerald-500/30">AI GRID</span>
              </span>
            </div>
          </div>

          {/* Nav items desktop */}
          <nav className="hidden md:flex items-center gap-8 text-sm font-semibold text-slate-700 dark:text-slate-300">
            <button onClick={() => scrollToSection('features')} className="hover:text-emerald-600 dark:hover:text-emerald-400 transition-colors">Features</button>
            <button onClick={() => scrollToSection('architecture')} className="hover:text-emerald-600 dark:hover:text-emerald-400 transition-colors">Architecture</button>
            <button onClick={() => scrollToSection('intelligence')} className="hover:text-emerald-600 dark:hover:text-emerald-400 transition-colors">AI Intelligence</button>
            <button onClick={() => scrollToSection('copilot')} className="hover:text-emerald-600 dark:hover:text-emerald-400 transition-colors">Copilot</button>
          </nav>

          <div className="flex items-center gap-3 sm:gap-4">
            <ThemeToggle />
            <button
              onClick={onEnter}
              className="text-sm font-bold text-slate-700 dark:text-slate-300 hover:text-slate-900 dark:hover:text-white transition-colors px-2 py-1.5"
            >
              Sign In
            </button>
            <ShinyButton
              onClick={onEnter}
              className="bg-emerald-600 hover:bg-emerald-500 text-white font-extrabold text-xs uppercase px-5 py-2.5 rounded-xl shadow-lg shadow-emerald-600/30 border border-emerald-400/40 cursor-pointer"
            >
              Get Started →
            </ShinyButton>
          </div>
        </div>
      </header>

      {/* HERO SECTION */}
      <main className="flex-1 flex flex-col items-center justify-center px-4 pt-8 pb-16 text-center max-w-7xl mx-auto w-full relative z-10">
        
        {/* Eyebrow Pill */}
        <motion.div
          initial={{ opacity: 0, y: -10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.5 }}
          className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-emerald-500/10 border border-emerald-500/30 backdrop-blur-md mb-6"
        >
          <Sparkles className="h-4 w-4 text-emerald-400" />
          <span className="text-xs font-bold uppercase tracking-wider text-emerald-300">
            AI-POWERED EV ENERGY INTELLIGENCE
          </span>
        </motion.div>

        {/* Main Headline */}
        <motion.h1
          initial={{ opacity: 0, y: 15 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.1 }}
          className="text-4xl sm:text-6xl md:text-7xl font-black text-slate-900 dark:text-white tracking-tight max-w-4xl leading-[1.1]"
        >
          Charge Smarter.{' '}
          <AnimatedGradientText speed={3} colorFrom="#10b981" colorTo="#3b82f6" className="font-black text-4xl sm:text-6xl md:text-7xl inline">
            Balance Better.
          </AnimatedGradientText>{' '}
          Drive Further.
        </motion.h1>

        {/* Subtitle */}
        <motion.p
          initial={{ opacity: 0, y: 15 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.2 }}
          className="mt-6 max-w-2xl text-slate-600 dark:text-slate-300 font-medium text-base sm:text-lg leading-relaxed"
        >
          BOSS intelligently optimizes EV charging schedules, station availability,
          and grid demand in real time using high-performance AI telemetry.
        </motion.p>

        {/* Dual CTA Buttons */}
        <motion.div
          initial={{ opacity: 0, y: 15 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.6, delay: 0.3 }}
          className="mt-8 flex flex-col sm:flex-row items-center justify-center gap-4"
        >
          <ShinyButton
            onClick={onEnter}
            className="bg-emerald-600 hover:bg-emerald-500 text-white font-extrabold text-base px-8 py-3.5 rounded-xl shadow-xl shadow-emerald-600/30 border border-emerald-400/40 cursor-pointer transition-transform hover:scale-105"
          >
            <span className="flex items-center justify-center gap-2 text-white">
              Start Charging <ArrowRight className="h-5 w-5" />
            </span>
          </ShinyButton>

          <button
            onClick={() => scrollToSection('intelligence')}
            className="boss-btn-ghost px-7 py-3.5 text-base rounded-xl font-bold"
          >
            Explore Platform
          </button>
        </motion.div>

        {/* Trust Strip */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ duration: 0.6, delay: 0.4 }}
          className="mt-8 flex flex-wrap items-center justify-center gap-6 text-xs font-bold text-slate-600 dark:text-slate-400"
        >
          <span className="flex items-center gap-1.5 text-slate-700 dark:text-slate-300">
            <CheckCircle2 className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> AI Optimized Charging
          </span>
          <span className="flex items-center gap-1.5 text-slate-700 dark:text-slate-300">
            <CheckCircle2 className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> Real-Time Grid Intelligence
          </span>
          <span className="flex items-center gap-1.5 text-slate-700 dark:text-slate-300">
            <CheckCircle2 className="h-4 w-4 text-emerald-600 dark:text-emerald-400" /> Smart Station Discovery
          </span>
        </motion.div>

        {/* HERO MASCOT ENERGY COMPOSITION ENVIRONMENT */}
        <motion.div
          initial={{ opacity: 0, scale: 0.95 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.8, delay: 0.45 }}
          className="mt-14 relative w-full max-w-3xl mx-auto flex items-center justify-center"
        >
          {/* Active Glowing Ring behind mascot */}
          <div className="absolute w-72 h-72 sm:w-96 sm:h-96 rounded-full bg-radial from-emerald-500/20 via-emerald-600/5 to-transparent blur-xl animate-pulse" />
          
          {/* SVG Connection Lines */}
          <svg className="absolute inset-0 w-full h-full pointer-events-none opacity-40" viewBox="0 0 600 300">
            <line x1="100" y1="150" x2="250" y2="150" stroke="#10b981" strokeWidth="2" strokeDasharray="5 5" />
            <line x1="350" y1="150" x2="500" y2="150" stroke="#3b82f6" strokeWidth="2" strokeDasharray="5 5" />
            <circle cx="100" cy="150" r="5" fill="#10b981" />
            <circle cx="500" cy="150" r="5" fill="#3b82f6" />
          </svg>

          {/* Central Mascot Image */}
          <div className="relative z-10 p-6 rounded-full bg-white/90 dark:bg-slate-900/80 border border-emerald-500/30 backdrop-blur-xl shadow-2xl shadow-emerald-500/10">
            <img
              src="/boss-logo-transparent.png"
              alt="BOSS Mascot Energy Core"
              className="h-48 sm:h-60 md:h-64 w-auto object-contain drop-shadow-[0_10px_35px_rgba(16,185,129,0.3)]"
            />
          </div>

          {/* Floating Data Badge 1: Top Left */}
          <motion.div
            animate={{ y: [0, -8, 0] }}
            transition={{ duration: 4, repeat: Infinity, ease: 'easeInOut' }}
            className="absolute -top-4 left-4 sm:left-10 z-20 boss-badge-green shadow-lg backdrop-blur-md border border-emerald-500/40 bg-white/90 dark:bg-slate-900/90 text-emerald-700 dark:text-emerald-400 px-3.5 py-1.5 text-xs"
          >
            <Zap className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" />
            <span>AI OPTIMIZED CHARGING</span>
          </motion.div>

          {/* Floating Data Badge 2: Top Right */}
          <motion.div
            animate={{ y: [0, 8, 0] }}
            transition={{ duration: 4.5, repeat: Infinity, ease: 'easeInOut', delay: 0.5 }}
            className="absolute -top-2 right-4 sm:right-10 z-20 boss-badge-blue shadow-lg backdrop-blur-md border border-blue-500/40 bg-white/90 dark:bg-slate-900/90 text-blue-700 dark:text-blue-400 px-3.5 py-1.5 text-xs"
          >
            <Activity className="h-3.5 w-3.5 text-blue-600 dark:text-blue-400" />
            <span>GRID LOAD: 64% (OPTIMAL)</span>
          </motion.div>

          {/* Floating Data Badge 3: Bottom Left */}
          <motion.div
            animate={{ y: [0, 6, 0] }}
            transition={{ duration: 5, repeat: Infinity, ease: 'easeInOut', delay: 1 }}
            className="absolute -bottom-4 left-6 sm:left-16 z-20 boss-badge border border-slate-300 dark:border-slate-700 bg-white/90 dark:bg-slate-900/90 text-slate-800 dark:text-slate-200 px-3.5 py-1.5 text-xs"
          >
            <BatteryCharging className="h-3.5 w-3.5 text-emerald-600 dark:text-emerald-400" />
            <span>3 FAST CHARGERS FREE</span>
          </motion.div>

          {/* Floating Data Badge 4: Bottom Right */}
          <motion.div
            animate={{ y: [0, -6, 0] }}
            transition={{ duration: 3.8, repeat: Infinity, ease: 'easeInOut', delay: 1.5 }}
            className="absolute -bottom-2 right-6 sm:right-16 z-20 boss-badge-amber shadow-lg backdrop-blur-md border border-amber-500/40 bg-white/90 dark:bg-slate-900/90 text-amber-700 dark:text-amber-400 px-3.5 py-1.5 text-xs"
          >
            <Sparkles className="h-3.5 w-3.5 text-amber-600 dark:text-amber-400" />
            <span>CO₂ SAVED: 12.8 kg</span>
          </motion.div>
        </motion.div>

        {/* LIVE NETWORK FLOATING STAT PANEL */}
        <motion.div
          initial={{ opacity: 0, y: 30 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.7, delay: 0.6 }}
          className="mt-14 w-full max-w-4xl mx-auto rounded-2xl border border-slate-200 dark:border-slate-800 bg-white/90 dark:bg-slate-900/80 backdrop-blur-xl p-5 shadow-2xl relative overflow-hidden"
        >
          <BorderBeam size={180} duration={8} colorFrom="#10b981" colorTo="#3b82f6" />
          <div className="flex flex-col md:flex-row items-center justify-between gap-6 text-left">
            <div className="flex items-center gap-3">
              <span className="relative flex h-3 w-3">
                <span className="animate-ping absolute inline-flex h-full w-full rounded-full bg-emerald-400 opacity-75" />
                <span className="relative inline-flex rounded-full h-3 w-3 bg-emerald-500" />
              </span>
              <div>
                <h4 className="font-extrabold text-slate-900 dark:text-white text-sm tracking-wide">BOSS NETWORK TELEMETRY</h4>
                <p className="text-xs text-slate-600 dark:text-slate-400 font-medium">Real-time smart grid & station optimization</p>
              </div>
            </div>

            <div className="grid grid-cols-2 sm:grid-cols-4 gap-6 w-full md:w-auto text-center md:text-left">
              <div>
                <span className="text-xl font-black text-emerald-600 dark:text-emerald-400">248</span>
                <p className="text-[11px] font-bold text-slate-600 dark:text-slate-400 uppercase">EVs Charging</p>
              </div>
              <div>
                <span className="text-xl font-black text-blue-600 dark:text-blue-400">87</span>
                <p className="text-[11px] font-bold text-slate-600 dark:text-slate-400 uppercase">Active Stations</p>
              </div>
              <div>
                <span className="text-xl font-black text-emerald-600 dark:text-emerald-400">64%</span>
                <p className="text-[11px] font-bold text-slate-600 dark:text-slate-400 uppercase">Avg Grid Load</p>
              </div>
              <div>
                <span className="text-xl font-black text-indigo-600 dark:text-indigo-400">31 MW</span>
                <p className="text-[11px] font-bold text-slate-600 dark:text-slate-400 uppercase">Power Balanced</p>
              </div>
            </div>
          </div>
        </motion.div>

        {/* SECTION 1: THREE PREMIUM FEATURE CARDS */}
        <section id="features" className="w-full max-w-6xl mx-auto mt-28">
          <div className="text-center mb-12">
            <span className="text-xs font-bold text-emerald-600 dark:text-emerald-400 uppercase tracking-widest">SMART INFRASTRUCTURE</span>
            <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900 dark:text-white mt-2">Built for Modern Electric Mobility</h2>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
            {/* Card 1 */}
            <motion.div
              whileHover={{ y: -6 }}
              className="boss-card relative overflow-hidden flex flex-col justify-between"
            >
              <div>
                <div className="h-12 w-12 rounded-xl bg-emerald-500/10 border border-emerald-500/30 flex items-center justify-center text-emerald-600 dark:text-emerald-400 mb-5">
                  <BatteryCharging className="h-6 w-6" />
                </div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-emerald-600 dark:text-emerald-400">AI OPTIMIZATION</span>
                <h3 className="text-xl font-extrabold text-slate-900 dark:text-white mt-1 mb-2">Smart Charging</h3>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
                  Algorithms analyze battery state, energy prices, and queue times to recommend the fastest, most cost-effective charging slot.
                </p>
              </div>

              {/* Visual Widget 1 */}
              <div className="mt-6 p-4 rounded-xl bg-slate-100 dark:bg-slate-950/60 border border-slate-200 dark:border-slate-800 flex items-center justify-between">
                <div className="flex items-center gap-3">
                  <div className="relative h-12 w-12 flex items-center justify-center rounded-full border-2 border-emerald-500 text-emerald-700 dark:text-emerald-400 text-xs font-black">
                    78%
                  </div>
                  <div>
                    <span className="text-xs font-bold text-slate-900 dark:text-slate-200">Optimal Charge</span>
                    <p className="text-[10px] text-emerald-700 dark:text-emerald-400 font-medium">⚡ +45 kW DC Current</p>
                  </div>
                </div>
              </div>
            </motion.div>

            {/* Card 2 */}
            <motion.div
              whileHover={{ y: -6 }}
              className="boss-card relative overflow-hidden flex flex-col justify-between"
            >
              <div>
                <div className="h-12 w-12 rounded-xl bg-blue-500/10 border border-blue-500/30 flex items-center justify-center text-blue-600 dark:text-blue-400 mb-5">
                  <MapPin className="h-6 w-6" />
                </div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-blue-600 dark:text-blue-400">GEOSPATIAL NETWORK</span>
                <h3 className="text-xl font-extrabold text-slate-900 dark:text-white mt-1 mb-2">Nearby Stations</h3>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
                  Real-time interactive map with connector availability (CCS2, Type 2, CHAdeMO) and state-by-state district search across India.
                </p>
              </div>

              {/* Visual Widget 2 */}
              <div className="mt-6 p-4 rounded-xl bg-slate-100 dark:bg-slate-950/60 border border-slate-200 dark:border-slate-800 flex items-center justify-around text-center">
                <div className="flex flex-col items-center">
                  <span className="h-2 w-2 rounded-full bg-emerald-500 mb-1" />
                  <span className="text-[10px] text-slate-800 dark:text-slate-300 font-bold">CCS2 Dual</span>
                  <span className="text-[9px] text-emerald-700 dark:text-emerald-400 font-bold">Available</span>
                </div>
                <div className="h-6 w-px bg-slate-300 dark:bg-slate-800" />
                <div className="flex flex-col items-center">
                  <span className="h-2 w-2 rounded-full bg-amber-500 mb-1" />
                  <span className="text-[10px] text-slate-800 dark:text-slate-300 font-bold">Type 2 AC</span>
                  <span className="text-[9px] text-amber-700 dark:text-amber-400 font-bold">In Use</span>
                </div>
              </div>
            </motion.div>

            {/* Card 3 */}
            <motion.div
              whileHover={{ y: -6 }}
              className="boss-card relative overflow-hidden flex flex-col justify-between"
            >
              <div>
                <div className="h-12 w-12 rounded-xl bg-indigo-500/10 border border-indigo-500/30 flex items-center justify-center text-indigo-600 dark:text-indigo-400 mb-5">
                  <BarChart3 className="h-6 w-6" />
                </div>
                <span className="text-[10px] font-bold uppercase tracking-wider text-indigo-600 dark:text-indigo-400">GRID STABILITY</span>
                <h3 className="text-xl font-extrabold text-slate-900 dark:text-white mt-1 mb-2">Grid Load Balancing</h3>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
                  Prevents local transformer trip overloads by dynamically distributing high-kW charging demand during peak hours.
                </p>
              </div>

              {/* Visual Widget 3 */}
              <div className="mt-6 p-4 rounded-xl bg-slate-100 dark:bg-slate-950/60 border border-slate-200 dark:border-slate-800">
                <div className="flex justify-between text-[11px] font-bold mb-1.5">
                  <span className="text-slate-800 dark:text-slate-300">Transformer Load</span>
                  <span className="text-emerald-700 dark:text-emerald-400">62% (Safe)</span>
                </div>
                <div className="w-full bg-slate-200 dark:bg-slate-800 h-2 rounded-full overflow-hidden">
                  <div className="bg-gradient-to-r from-emerald-500 to-blue-500 h-full w-[62%]" />
                </div>
              </div>
            </motion.div>
          </div>
        </section>

        {/* SECTION 2: PRODUCT STORY (3 CONNECTED SYSTEMS) */}
        <section id="architecture" className="w-full max-w-6xl mx-auto mt-32">
          <div className="text-center mb-16">
            <span className="text-xs font-bold text-blue-600 dark:text-blue-400 uppercase tracking-widest">UNIFIED ARCHITECTURE</span>
            <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900 dark:text-white mt-2">One Platform. Three Connected Systems.</h2>
            <p className="text-sm text-slate-600 dark:text-slate-400 mt-3 max-w-2xl mx-auto">
              Connecting EV drivers, station operators, and distribution companies on a single synchronized energy grid.
            </p>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-3 gap-8 relative">
            {/* System 1 */}
            <div className="boss-card p-6 flex flex-col justify-between relative z-10 border border-emerald-500/30">
              <div>
                <span className="px-2.5 py-1 rounded-md bg-emerald-500/10 text-emerald-700 dark:text-emerald-400 text-[10px] font-black uppercase">01. DRIVERS</span>
                <h3 className="text-xl font-extrabold text-slate-900 dark:text-white mt-4 mb-2">EV Users</h3>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
                  Discover nearby fast chargers, reserve guaranteed slots, track charging speed, and minimize session costs.
                </p>
              </div>
              <ul className="mt-6 space-y-2 text-xs text-slate-700 dark:text-slate-300 font-semibold border-t border-slate-200 dark:border-slate-800 pt-4">
                <li className="flex items-center gap-2">✓ Smart slot pre-booking</li>
                <li className="flex items-center gap-2">✓ Real-time battery telemetry</li>
                <li className="flex items-center gap-2">✓ Dynamic price optimization</li>
              </ul>
            </div>

            {/* System 2 */}
            <div className="boss-card p-6 flex flex-col justify-between relative z-10 border border-blue-500/30">
              <div>
                <span className="px-2.5 py-1 rounded-md bg-blue-500/10 text-blue-700 dark:text-blue-400 text-[10px] font-black uppercase">02. OPERATORS</span>
                <h3 className="text-xl font-extrabold text-slate-900 dark:text-white mt-4 mb-2">Station Operators</h3>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
                  Monitor charger utilization, automate port maintenance alerts, control pricing, and maximize revenue.
                </p>
              </div>
              <ul className="mt-6 space-y-2 text-slate-700 dark:text-slate-300 text-xs font-semibold border-t border-slate-200 dark:border-slate-800 pt-4">
                <li className="flex items-center gap-2">✓ Charger uptime analytics</li>
                <li className="flex items-center gap-2">✓ Revenue & session tracking</li>
                <li className="flex items-center gap-2">✓ Automated queue management</li>
              </ul>
            </div>

            {/* System 3 */}
            <div className="boss-card p-6 flex flex-col justify-between relative z-10 border border-indigo-500/30">
              <div>
                <span className="px-2.5 py-1 rounded-md bg-indigo-500/10 text-indigo-700 dark:text-indigo-400 text-[10px] font-black uppercase">03. UTILITIES</span>
                <h3 className="text-xl font-extrabold text-slate-900 dark:text-white mt-4 mb-2">DISCOM Grid Operators</h3>
                <p className="text-xs text-slate-600 dark:text-slate-400 leading-relaxed">
                  Manage substation feeder loads, trigger peak-shaving load redirection, and protect distribution transformers.
                </p>
              </div>
              <ul className="mt-6 space-y-2 text-slate-700 dark:text-slate-300 text-xs font-semibold border-t border-slate-200 dark:border-slate-800 pt-4">
                <li className="flex items-center gap-2">✓ Feeder load telemetry</li>
                <li className="flex items-center gap-2">✓ Peak demand load shedding</li>
                <li className="flex items-center gap-2">✓ Automated grid protection</li>
              </ul>
            </div>
          </div>
        </section>

        {/* SECTION 3: LIVE INTELLIGENCE ENGINE DASHBOARD PREVIEW */}
        <section id="intelligence" className="w-full max-w-6xl mx-auto mt-32">
          <div className="rounded-3xl border border-slate-200 dark:border-slate-800 bg-white/90 dark:bg-slate-900/90 backdrop-blur-2xl p-8 md:p-12 shadow-2xl relative overflow-hidden">
            <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-6 mb-8">
              <div>
                <span className="text-xs font-bold text-emerald-600 dark:text-emerald-400 uppercase tracking-widest flex items-center gap-2">
                  <Cpu className="h-4 w-4" /> AI ENGINE IN ACTION
                </span>
                <h2 className="text-2xl sm:text-3xl font-extrabold text-slate-900 dark:text-white mt-2">
                  The Grid Is Always Moving. BOSS Is Always Learning.
                </h2>
              </div>
              <div className="boss-badge-green">
                <span className="h-2 w-2 rounded-full bg-emerald-400 animate-ping" />
                <span>LIVE TELEMETRY ACTIVE</span>
              </div>
            </div>

            {/* Mock Dashboard Control System */}
            <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
              <div className="p-5 rounded-2xl bg-slate-50 dark:bg-slate-950/80 border border-slate-200 dark:border-slate-800 text-left">
                <span className="text-xs font-bold text-slate-600 dark:text-slate-400 uppercase">SUBSTATION FEEDER #4</span>
                <div className="mt-3 flex items-baseline justify-between">
                  <span className="text-3xl font-black text-slate-900 dark:text-white">64.2 kW</span>
                  <span className="text-xs font-bold text-emerald-600 dark:text-emerald-400">+12% vs avg</span>
                </div>
                <div className="mt-4 space-y-2">
                  <div className="flex justify-between text-xs text-slate-700 dark:text-slate-300">
                    <span>Capacity Used</span>
                    <span className="font-bold">64%</span>
                  </div>
                  <div className="w-full bg-slate-200 dark:bg-slate-800 h-2 rounded-full">
                    <div className="bg-emerald-500 h-full w-[64%]" />
                  </div>
                </div>
              </div>

              <div className="p-5 rounded-2xl bg-slate-50 dark:bg-slate-950/80 border border-slate-200 dark:border-slate-800 text-left">
                <span className="text-xs font-bold text-slate-600 dark:text-slate-400 uppercase">OPTIMIZED CHARGING DEMAND</span>
                <div className="mt-3 flex items-baseline justify-between">
                  <span className="text-3xl font-black text-blue-600 dark:text-blue-400">18 Sessions</span>
                  <span className="text-xs font-bold text-blue-600 dark:text-blue-400">Balanced</span>
                </div>
                <div className="mt-4 flex items-center gap-1.5 h-6">
                  {[40, 65, 80, 55, 30, 45, 90, 70, 50, 60, 40, 75].map((val, idx) => (
                    <div key={idx} className="flex-1 bg-blue-500/40 rounded-sm" style={{ height: `${val}%` }} />
                  ))}
                </div>
              </div>

              <div className="p-5 rounded-2xl bg-emerald-500/10 border border-emerald-500/30 text-left flex flex-col justify-between">
                <div>
                  <span className="text-xs font-bold text-emerald-700 dark:text-emerald-400 uppercase flex items-center gap-1.5">
                    <Sparkles className="h-3.5 w-3.5" /> AI RECOMMENDATION
                  </span>
                  <p className="text-sm font-bold text-slate-900 dark:text-white mt-2">
                    Shift 18 non-urgent EV sessions to 6:30 PM slot.
                  </p>
                </div>
                <div className="mt-4 pt-3 border-t border-emerald-500/30 flex items-center justify-between text-xs">
                  <span className="text-slate-700 dark:text-slate-300">Est. Grid Relief:</span>
                  <span className="font-black text-emerald-700 dark:text-emerald-400">12.4% Peak Drop</span>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* SECTION 4: AI COPILOT SHOWCASE */}
        <section id="copilot" className="w-full max-w-6xl mx-auto mt-32 text-left">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div>
              <span className="text-xs font-bold text-emerald-600 dark:text-emerald-400 uppercase tracking-widest">ALWAYS-ON COPILOT</span>
              <h2 className="text-3xl sm:text-4xl font-extrabold text-slate-900 dark:text-white mt-2">
                Meet Your Intelligent EV Charging Assistant.
              </h2>
              <p className="text-sm text-slate-600 dark:text-slate-300 mt-4 leading-relaxed">
                Integrated directly into the BOSS ecosystem, our AI Copilot provides real-time answers on station congestion, optimal charging windows, and grid safety status.
              </p>
              <div className="mt-6 space-y-3 text-xs font-semibold text-slate-700 dark:text-slate-300">
                <div className="flex items-center gap-3">
                  <div className="h-6 w-6 rounded-full bg-emerald-500/20 text-emerald-600 dark:text-emerald-400 flex items-center justify-center font-bold">✓</div>
                  <span>Instant slot availability matching based on battery SoC</span>
                </div>
                <div className="flex items-center gap-3">
                  <div className="h-6 w-6 rounded-full bg-emerald-500/20 text-emerald-600 dark:text-emerald-400 flex items-center justify-center font-bold">✓</div>
                  <span>Automated price calculation and off-peak cost savings</span>
                </div>
              </div>
            </div>

            {/* Chatbot Interface Mock */}
            <div className="rounded-2xl border border-slate-200 dark:border-slate-800 bg-white/90 dark:bg-slate-900/90 backdrop-blur-xl p-6 shadow-2xl relative">
              <div className="flex items-center gap-3 border-b border-slate-200 dark:border-slate-800 pb-4 mb-4">
                <div className="h-8 w-8 rounded-full bg-emerald-500/20 border border-emerald-500/40 flex items-center justify-center text-emerald-600 dark:text-emerald-400">
                  <Sparkles className="h-4 w-4" />
                </div>
                <div>
                  <h4 className="font-extrabold text-slate-900 dark:text-white text-sm">BOSS AI COPILOT</h4>
                  <p className="text-[10px] text-emerald-600 dark:text-emerald-400 font-bold">Connected to Grid Telemetry</p>
                </div>
              </div>

              <div className="space-y-4 text-xs">
                <div className="bg-slate-100 dark:bg-slate-800/60 rounded-xl p-3 max-w-[85%] text-slate-800 dark:text-slate-200 font-medium">
                  Find me the fastest free charging station nearby.
                </div>
                <div className="bg-emerald-500/10 border border-emerald-500/30 rounded-xl p-3 max-w-[90%] text-slate-900 dark:text-emerald-200 ml-auto space-y-2 font-medium">
                  <p>⚡ <strong>Found 3 Stations Nearby:</strong></p>
                  <p>Station A (2.4 km away) has 2 CCS2 ports free with optimal grid load (48%). Charging now saves ₹42.</p>
                </div>
              </div>
            </div>
          </div>
        </section>

      </main>

      {/* FOOTER */}
      <footer className="relative z-10 border-t border-slate-200 dark:border-slate-800/80 bg-white/80 dark:bg-slate-950/90 py-12 px-6 md:px-14 text-slate-600 dark:text-slate-400 text-xs">
        <div className="max-w-7xl mx-auto grid grid-cols-1 md:grid-cols-4 gap-8 mb-8 text-left">
          <div>
            <div className="flex items-center gap-2 mb-3">
              <img src="/boss-logo-transparent.png" alt="BOSS Logo" className="h-6 w-6 object-contain" />
              <span className="text-base font-black text-slate-900 dark:text-white">BOSS</span>
            </div>
            <p className="text-slate-600 dark:text-slate-400 text-xs leading-relaxed">
              Battery Optimized Software Service. Next-gen AI EV charging optimization and smart grid load management.
            </p>
          </div>

          <div>
            <h5 className="font-bold text-slate-900 dark:text-white uppercase text-[11px] mb-3 tracking-wider">Platform</h5>
            <ul className="space-y-2 text-slate-600 dark:text-slate-400 font-medium">
              <li><button onClick={onEnter} className="hover:text-emerald-600 dark:hover:text-emerald-400">EV User Dashboard</button></li>
              <li><button onClick={onEnter} className="hover:text-emerald-600 dark:hover:text-emerald-400">Station Operator Portal</button></li>
              <li><button onClick={onEnter} className="hover:text-emerald-600 dark:hover:text-emerald-400">DISCOM Control Center</button></li>
            </ul>
          </div>

          <div>
            <h5 className="font-bold text-slate-900 dark:text-white uppercase text-[11px] mb-3 tracking-wider">Solutions</h5>
            <ul className="space-y-2 text-slate-600 dark:text-slate-400 font-medium">
              <li><button onClick={() => scrollToSection('features')} className="hover:text-emerald-600 dark:hover:text-emerald-400">Smart Slot Booking</button></li>
              <li><button onClick={() => scrollToSection('architecture')} className="hover:text-emerald-600 dark:hover:text-emerald-400">Grid Load Balancing</button></li>
              <li><button onClick={() => scrollToSection('intelligence')} className="hover:text-emerald-600 dark:hover:text-emerald-400">Transformer Overload Protection</button></li>
            </ul>
          </div>

          <div>
            <h5 className="font-bold text-slate-900 dark:text-white uppercase text-[11px] mb-3 tracking-wider">Security & Trust</h5>
            <div className="flex items-center gap-2 text-emerald-700 dark:text-emerald-400 font-semibold mb-2">
              <ShieldCheck className="h-4 w-4" />
              <span>JWT & Hashed Authentication</span>
            </div>
            <p className="text-[11px] text-slate-500 dark:text-slate-400">
              Protected by encrypted telemetry channels and standards-compliant authentication protocols.
            </p>
          </div>
        </div>

        <div className="max-w-7xl mx-auto pt-6 border-t border-slate-200 dark:border-slate-900 flex flex-col sm:flex-row items-center justify-between gap-4 text-[11px] text-slate-500 dark:text-slate-400">
          <p>© {new Date().getFullYear()} BOSS - Battery Optimized Software Service. All rights reserved.</p>
          <div className="flex gap-4">
            <span className="hover:text-slate-700 dark:hover:text-slate-300 cursor-pointer">Privacy Policy</span>
            <span className="hover:text-slate-700 dark:hover:text-slate-300 cursor-pointer">Terms of Service</span>
          </div>
        </div>
      </footer>
    </BackgroundSystem>
  );
}
