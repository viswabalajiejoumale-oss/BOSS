# BOSS — Battery Optimization Software Service

AI-based smart EV charging optimization and grid load balancing platform.

BOSS connects three actors on a single intelligent platform:

- **EV Users** — find nearby stations, book slots, get AI recommendations, and trigger emergency priority charging.
- **Charging Station Operators (Admins)** — manage charger ports, monitor transformer capacity, view analytics, and receive overload notifications.
- **DISCOM Grid Operators** — monitor city-wide transformer load, peak demand, charging demand, overloaded stations, and 24-hour demand forecasts.

## Tech Stack

| Layer | Technology |
|-------|-----------|
| Frontend | React + TypeScript + Vite |
| Styling | Tailwind CSS (green-black theme) |
| Animations | Framer Motion (fade-in landing page, transitions) |
| Charts | Recharts (usage graphs, load forecasts, analytics) |
| Maps | Leaflet + OpenStreetMap (dark-themed) |
| QR Codes | qrcode (booking confirmation) |
| Backend / Auth / DB | Supabase (PostgreSQL, secure password hashing, JWT sessions, Row Level Security) |

## AI Modules

- **Waiting Time Prediction** — estimates wait time from queue size, charging speed, battery level, number of chargers, and average session time.
- **Transformer Overload Prevention** — if a station reaches 90% utilization, new users are automatically redirected to nearby stations.
- **Dynamic Pricing** — low demand = cheap price; high demand = higher price. Computed from station load and charger availability.
- **Emergency Priority** — emergency vehicles (Ambulance, Police, Fire) or battery < 10% are allocated to a priority queue.
- **Smart AI Recommendation Engine** — scores stations on distance, wait time, price, transformer load, and charging speed. Provides an explainable "Why was this station recommended?" breakdown.
- **Load Balancing & Incentives** — if Station A is at 95%+ load and Station B is significantly lower, users are redirected with a discount coupon reward.

## Demo Accounts

| Role | Email | Password |
|------|-------|----------|
| Admin | `admin@boss.demo` | `BossAdmin123!` |
| User | `user@boss.demo` | `BossUser123!` |

## Database Schema

| Table | Purpose |
|-------|---------|
| `profiles` | Extends auth.users — stores user/admin/discom profile data, vehicle details, onboarding answers, station operator fields |
| `stations` | Charging stations owned by an admin, with GPS coordinates and transformer capacity |
| `chargers` | Individual charger ports per station (power, status, load, connector type) |
| `reservations` | Booking slots with 5-minute-valid codes, queue position, charge current, emergency flag, price |
| `ai_predictions` | Explainable AI recommendation and prediction records |
| `notifications` | Admin-facing alerts (overload warnings, new bookings, charger faults) |
| `coupons` | Discount/reward coupons for load-balancing incentives |

All tables have Row Level Security enabled with owner-scoped policies.

## Getting Started

The dev server runs automatically. Open the app in your browser and you'll see the landing page with a fade-in animation. Click **Get Started** to reach the login screen, or use the demo accounts above.

### Project Structure

```
src/
├── components/
│   └── MapView.tsx          # Leaflet map with dark theme
├── context/
│   └── AuthContext.tsx      # Auth provider (sign in, sign up, session)
├── hooks/
│   └── useData.ts           # Data-fetching hooks (stations, reservations, notifications)
├── lib/
│   ├── supabase.ts          # Supabase client
│   └── aiEngine.ts          # All AI logic (recommendations, pricing, wait time, overload)
├── pages/
│   ├── LandingPage.tsx      # Fade-in hero with logo and title
│   ├── AuthPage.tsx         # Login/register with User/Admin toggle + onboarding
│   ├── UserDashboard.tsx    # EV owner dashboard with book slot flow
│   ├── AdminDashboard.tsx   # Station operator dashboard with notifications
│   └── DiscomDashboard.tsx  # Grid operator master view
├── types/
│   └── index.ts             # TypeScript types matching the database schema
├── App.tsx                  # Root router (auth-gated)
├── main.tsx                 # Entry point with AuthProvider
└── index.css                # Green-black theme + component classes
```

## Key Features

### Book Slot Flow (User)
1. Select a location from the nearby list (left panel)
2. View live queue status and transformer load (middle panel)
3. Choose station, time, and charge current (right panel)
4. Click **Book** — if the station is crowded (90%+ load, no available chargers), you'll see "Sorry, booking full" with a redirect suggestion. If successful, you get a unique 5-minute-valid code and QR code.

### Emergency Button
The red Emergency button in the header activates priority mode — battery < 10% or emergency vehicle status routes you to the nearest available station immediately.

### Admin Notifications
The bell icon in the admin header opens a notifications panel showing overload warnings, new bookings, and charger faults. Unread count is badge-displayed.
