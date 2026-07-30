import { motion } from 'framer-motion';
import { Zap, BatteryCharging, MapPin, BarChart3, Shield, ArrowRight } from 'lucide-react';

interface LandingPageProps {
  onEnter: () => void;
}

export function LandingPage({ onEnter }: LandingPageProps) {
  return (
    <div className="min-h-screen bg-[var(--boss-bg)] text-white overflow-hidden">
      {/* Background glow */}
      <div className="pointer-events-none fixed inset-0 overflow-hidden">
        <div className="absolute -top-40 -left-40 h-96 w-96 rounded-full bg-[var(--boss-green)] opacity-10 blur-3xl" />
        <div className="absolute top-1/2 -right-40 h-96 w-96 rounded-full bg-[var(--boss-green-dim)] opacity-10 blur-3xl" />
        <div className="absolute bottom-0 left-1/3 h-72 w-72 rounded-full bg-[var(--boss-green-bright)] opacity-5 blur-3xl" />
      </div>

      {/* Nav */}
      <motion.nav
        initial={{ opacity: 0, y: -20 }}
        animate={{ opacity: 1, y: 0 }}
        transition={{ duration: 0.6, delay: 0.2 }}
        className="relative z-10 flex items-center justify-between px-6 py-5 md:px-12"
      >
        <div className="flex items-center gap-2">
          <div className="flex h-9 w-9 items-center justify-center rounded-xl bg-[var(--boss-green)] text-black">
            <Zap className="h-5 w-5" />
          </div>
          <span className="text-lg font-bold tracking-tight">BOSS</span>
        </div>
        <button onClick={onEnter} className="boss-btn-ghost text-sm">
          Sign In
        </button>
      </motion.nav>

      {/* Hero */}
      <div className="relative z-10 flex flex-col items-center justify-center px-6 pt-16 pb-24 text-center md:pt-28 md:pb-32">
        <motion.div
          initial={{ opacity: 0, scale: 0.8 }}
          animate={{ opacity: 1, scale: 1 }}
          transition={{ duration: 0.8, ease: 'easeOut' }}
          className="mb-6 flex h-20 w-20 items-center justify-center rounded-2xl bg-[var(--boss-green)] text-black shadow-[0_0_40px_var(--boss-green-glow)]"
        >
          <Zap className="h-10 w-10" />
        </motion.div>

        <motion.h1
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.3 }}
          className="text-4xl font-extrabold tracking-tight md:text-6xl"
        >
          BOSS
        </motion.h1>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.5 }}
          className="mt-2 text-lg text-[var(--boss-green-bright)] md:text-xl"
        >
          Battery Optimization Software Service
        </motion.p>

        <motion.p
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.7 }}
          className="mt-6 max-w-2xl text-base text-gray-400 md:text-lg"
        >
          AI-powered smart EV charging optimization and grid load balancing.
          Connecting EV users, charging station operators, and distribution
          companies on one intelligent platform.
        </motion.p>

        <motion.button
          initial={{ opacity: 0, y: 20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ duration: 0.8, delay: 0.9 }}
          onClick={onEnter}
          className="mt-10 boss-btn-primary text-base"
        >
          Get Started <ArrowRight className="h-5 w-5" />
        </motion.button>
      </div>

      {/* Feature cards */}
      <div className="relative z-10 mx-auto grid max-w-5xl grid-cols-1 gap-4 px-6 pb-20 md:grid-cols-3">
        {[
          { icon: BatteryCharging, title: 'Smart Charging', desc: 'AI recommends the best station, time, and current for your EV.' },
          { icon: MapPin, title: 'Nearby Stations', desc: 'Live map of available chargers with real-time queue status.' },
          { icon: BarChart3, title: 'Grid Balancing', desc: 'Transformer overload prevention with dynamic load redirect.' },
        ].map((f, i) => (
          <motion.div
            key={f.title}
            initial={{ opacity: 0, y: 30 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6, delay: 1.1 + i * 0.15 }}
            className="boss-card"
          >
            <div className="mb-3 flex h-11 w-11 items-center justify-center rounded-xl bg-[var(--boss-green)]/10 text-[var(--boss-green-bright)]">
              <f.icon className="h-6 w-6" />
            </div>
            <h3 className="mb-1 font-semibold text-white">{f.title}</h3>
            <p className="text-sm text-gray-400">{f.desc}</p>
          </motion.div>
        ))}
      </div>

      {/* Bottom strip */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ duration: 1, delay: 1.6 }}
        className="relative z-10 flex items-center justify-center gap-2 border-t border-[var(--boss-border)] py-6 text-sm text-gray-500"
      >
        <Shield className="h-4 w-4 text-[var(--boss-green)]" />
        <span>Secured with hashed passwords and JWT authentication</span>
      </motion.div>
    </div>
  );
}
