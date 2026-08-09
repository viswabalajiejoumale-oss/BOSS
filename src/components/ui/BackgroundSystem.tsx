import { motion } from 'framer-motion';

interface BackgroundSystemProps {
  children?: React.ReactNode;
  className?: string;
  variant?: 'hero' | 'dashboard' | 'auth' | 'minimal';
}

export function BackgroundSystem({
  children,
  className = '',
  variant = 'hero',
}: BackgroundSystemProps) {
  return (
    <div className={`relative min-h-screen w-full overflow-hidden bg-[#F5FAF8] dark:bg-[#07110F] text-[#0F172A] dark:text-[#F8FAFC] font-sans transition-colors duration-250 ${className}`}>
      {/* LAYER 1 & 2: Ambient Deep Radial Energy Glows */}
      <div className="pointer-events-none absolute inset-0 z-0 overflow-hidden">
        {/* Primary Emerald Glow Top-Center */}
        <div className="absolute -top-[10%] left-1/2 -translate-x-1/2 w-[900px] h-[600px] bg-radial from-emerald-500/10 dark:from-emerald-500/18 via-emerald-600/5 to-transparent blur-3xl rounded-full" />
        
        {/* Electric Blue Glow Right */}
        <div className="absolute top-[25%] -right-[15%] w-[700px] h-[600px] bg-radial from-blue-500/12 dark:from-blue-500/15 via-indigo-600/4 to-transparent blur-3xl rounded-full" />

        {/* Emerald Glow Bottom Left */}
        <div className="absolute bottom-[10%] -left-[10%] w-[650px] h-[550px] bg-radial from-emerald-400/10 dark:from-emerald-400/12 via-teal-600/4 to-transparent blur-3xl rounded-full" />
      </div>

      {/* LAYER 3: Technical Micro Grid Overlay */}
      <div 
        className="pointer-events-none absolute inset-0 z-0 opacity-[0.05] dark:opacity-[0.07]"
        style={{
          backgroundImage: `
            linear-gradient(to right, rgba(0,0,0,0.15) 1px, transparent 1px),
            linear-gradient(to bottom, rgba(0,0,0,0.15) 1px, transparent 1px)
          `,
          backgroundSize: '40px 40px',
        }}
      />

      {/* LAYER 4: Dotted Network Dot Grid */}
      <div 
        className="pointer-events-none absolute inset-0 z-0 opacity-[0.10] dark:opacity-[0.12]"
        style={{
          backgroundImage: `radial-gradient(rgba(16, 185, 129, 0.4) 1px, transparent 1px)`,
          backgroundSize: '24px 24px',
        }}
      />

      {/* LAYER 5: Faint Animated SVG Energy Lines */}
      {variant === 'hero' && (
        <svg className="pointer-events-none absolute inset-0 z-0 h-full w-full opacity-25 dark:opacity-20" xmlns="http://www.w3.org/2000/svg">
          <defs>
            <linearGradient id="energyGrad1" x1="0%" y1="0%" x2="100%" y2="100%">
              <stop offset="0%" stopColor="#10b981" stopOpacity="0.8" />
              <stop offset="50%" stopColor="#3b82f6" stopOpacity="0.4" />
              <stop offset="100%" stopColor="#0b1220" stopOpacity="0" />
            </linearGradient>
          </defs>
          <path
            d="M -100 200 C 300 100, 500 400, 900 200 C 1300 0, 1600 300, 2000 150"
            fill="none"
            stroke="url(#energyGrad1)"
            strokeWidth="1.5"
            strokeDasharray="6 6"
          />
          <path
            d="M -100 500 C 400 600, 700 300, 1100 550 C 1500 800, 1800 400, 2200 500"
            fill="none"
            stroke="url(#energyGrad1)"
            strokeWidth="1"
            strokeDasharray="4 8"
          />
        </svg>
      )}

      {/* LAYER 6: Subtle Floating Particles */}
      <div className="pointer-events-none absolute inset-0 z-0 overflow-hidden">
        {[...Array(6)].map((_, i) => (
          <motion.div
            key={i}
            className="absolute rounded-full bg-emerald-500/20 dark:bg-emerald-400/25 blur-[1px]"
            style={{
              width: `${(i % 3) * 3 + 3}px`,
              height: `${(i % 3) * 3 + 3}px`,
              top: `${15 + i * 14}%`,
              left: `${10 + (i * 17) % 80}%`,
            }}
            animate={{
              y: [0, -25, 0],
              opacity: [0.2, 0.6, 0.2],
            }}
            transition={{
              duration: 4 + i * 1.5,
              repeat: Infinity,
              ease: 'easeInOut',
            }}
          />
        ))}
      </div>

      {/* Main Content Render */}
      <div className="relative z-10 w-full min-h-screen flex flex-col">
        {children}
      </div>
    </div>
  );
}

