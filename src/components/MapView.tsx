import { useEffect, useRef } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import type { Station } from '@/types';

interface MapViewProps {
  stations: Station[];
  userLat?: number;
  userLon?: number;
  zoom?: number;
  selectedId?: string | null;
  onSelect?: (id: string) => void;
  height?: string;
  className?: string;
}

// Default center of India
const DEFAULT_INDIA_LAT = 20.5937;
const DEFAULT_INDIA_LON = 78.9629;
const DEFAULT_INDIA_ZOOM = 5;

export function MapView({
  stations,
  userLat = DEFAULT_INDIA_LAT,
  userLon = DEFAULT_INDIA_LON,
  zoom,
  selectedId,
  onSelect,
  height = '540px',
  className = '',
}: MapViewProps) {
  const containerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<L.Map | null>(null);
  const markersRef = useRef<Map<string, L.Marker>>(new Map());
  const userMarkerRef = useRef<L.Marker | null>(null);

  // Initialize Map centered on India
  useEffect(() => {
    if (!containerRef.current || mapRef.current) return;

    const initialZoom = zoom || (userLat && userLat !== DEFAULT_INDIA_LAT ? 7 : DEFAULT_INDIA_ZOOM);
    const map = L.map(containerRef.current, {
      center: [userLat || DEFAULT_INDIA_LAT, userLon || DEFAULT_INDIA_LON],
      zoom: initialZoom,
      zoomControl: true,
    });
    mapRef.current = map;

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
      maxZoom: 18,
    }).addTo(map);

    // User location marker
    if (userLat && userLon) {
      const userIcon = L.divIcon({
        html: `
          <div style="position:relative;width:24px;height:24px;">
            <div style="position:absolute;inset:0;background:#22c55e;border:3px solid #ffffff;border-radius:50%;box-shadow:0 0 12px #22c55e;z-index:2;"></div>
            <div style="position:absolute;inset:-6px;background:rgba(34,197,94,0.3);border-radius:50%;animation:ping 2s cubic-bezier(0, 0, 0.2, 1) infinite;z-index:1;"></div>
          </div>
        `,
        className: '',
        iconSize: [24, 24],
        iconAnchor: [12, 12],
      });

      userMarkerRef.current = L.marker([userLat, userLon], { icon: userIcon })
        .addTo(map)
        .bindTooltip('Location Pin', { permanent: false, direction: 'top' });
    }

    // Attach ResizeObserver to automatically adjust map canvas size on layout or window changes
    const observer = new ResizeObserver(() => {
      if (mapRef.current) {
        mapRef.current.invalidateSize();
      }
    });
    observer.observe(containerRef.current);

    return () => {
      observer.disconnect();
      if (mapRef.current) {
        mapRef.current.remove();
        mapRef.current = null;
      }
      markersRef.current.clear();
    };
  }, []);

  // Smooth animated flight to state/location coordinates
  useEffect(() => {
    const map = mapRef.current;
    if (!map || !userLat || !userLon) return;

    if (userMarkerRef.current) {
      userMarkerRef.current.setLatLng([userLat, userLon]);
    }

    const targetZoom = zoom || (userLat === DEFAULT_INDIA_LAT && userLon === DEFAULT_INDIA_LON ? 5 : 7);
    map.flyTo([userLat, userLon], targetZoom, {
      animate: true,
      duration: 1.3,
      easeLinearity: 0.25,
    });
  }, [userLat, userLon, zoom]);

  // Render station pins with Thunder Green Symbol & detailed popups
  useEffect(() => {
    const map = mapRef.current;
    if (!map) return;

    // Clear old markers
    markersRef.current.forEach((m) => m.remove());
    markersRef.current.clear();

    stations.forEach((s) => {
      const isSelected = s.id === selectedId;
      const loadPct = s.transformer_load_capacity_kva
        ? Math.round((s.current_load_kva / s.transformer_load_capacity_kva) * 100)
        : 45;

      // Thunder Green Icon
      const icon = L.divIcon({
        html: `
          <div style="
            width: ${isSelected ? '32px' : '24px'};
            height: ${isSelected ? '32px' : '24px'};
            background: ${isSelected ? 'linear-gradient(135deg, #22c55e, #15803d)' : 'linear-gradient(135deg, #16a34a, #059669)'};
            border: 2px solid ${isSelected ? '#ffffff' : '#bbf7d0'};
            border-radius: 50%;
            box-shadow: 0 0 ${isSelected ? '20px' : '8px'} #22c55e;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            font-size: ${isSelected ? '14px' : '11px'};
            font-weight: bold;
            transition: all 0.2s ease;
            cursor: pointer;
          ">
            ⚡
          </div>
        `,
        className: '',
        iconSize: [isSelected ? 32 : 24, isSelected ? 32 : 24],
        iconAnchor: [isSelected ? 16 : 12, isSelected ? 16 : 12],
      });

      const marker = L.marker([s.latitude, s.longitude], { icon }).addTo(map);

      // Detailed Popup Content
      const popupContent = document.createElement('div');
      popupContent.style.cssText = 'color: var(--foreground); font-family: sans-serif; padding: 4px; min-width: 210px;';
      popupContent.innerHTML = `
        <div style="display:flex; justify-content:space-between; align-items:flex-start; margin-bottom: 6px;">
          <h4 style="margin:0; font-size:14px; font-weight:700; color:#10b981;">${s.name}</h4>
          <span style="font-size:10px; background:rgba(16, 185, 129, 0.15); color:#10b981; padding:2px 6px; border-radius:10px; font-weight:600;">
            ${s.operator || 'India EV Network'}
          </span>
        </div>
        <p style="margin: 2px 0 6px 0; font-size:11px; color: var(--muted-foreground);">📍 ${s.address || s.name}</p>
        <div style="display:grid; grid-template-columns: 1fr 1fr; gap:4px; font-size:11px; background: var(--surface-muted); color: var(--foreground); padding:6px; border-radius:6px; margin-bottom:8px;">
          <div><b>Charging Points:</b> ${s.charging_points || 4}</div>
          <div><b>Status:</b> <span style="color:#10b981; font-weight:bold;">${s.status || 'Active'}</span></div>
          <div><b>Load:</b> ${loadPct}%</div>
          <div><b>Power:</b> 50 - 150 kW</div>
        </div>
        <button id="btn-book-${s.id}" style="
          width: 100%;
          background: #10b981;
          color: white;
          border: none;
          padding: 8px 12px;
          border-radius: 8px;
          font-weight: 700;
          font-size: 12px;
          cursor: pointer;
          transition: all 0.2s;
          box-shadow: 0 2px 6px rgba(16, 185, 129, 0.3);
        ">
          ⚡ Book Slot at This Station
        </button>
      `;

      // Attach click handler inside popup to navigate
      popupContent.querySelector(`#btn-book-${s.id}`)?.addEventListener('click', () => {
        if (onSelect) onSelect(s.id);
        setTimeout(() => {
          const bookSec = document.getElementById('book-slot-section');
          if (bookSec) {
            bookSec.scrollIntoView({ behavior: 'smooth', block: 'start' });
          }
        }, 50);
      });

      marker.bindPopup(popupContent);

      if (onSelect) {
        marker.on('click', () => {
          onSelect(s.id);
        });
      }

      markersRef.current.set(s.id, marker);
    });

    // If a station is selected, center map on it smoothly and open popup
    if (selectedId && markersRef.current.has(selectedId)) {
      const selectedMarker = markersRef.current.get(selectedId)!;
      const targetStation = stations.find((st) => st.id === selectedId);
      if (targetStation) {
        map.flyTo([targetStation.latitude, targetStation.longitude], 12, { animate: true, duration: 1 });
        selectedMarker.openPopup();
      }
    }
  }, [stations, selectedId, onSelect]);

  // Ensure map recalculates container dimensions
  useEffect(() => {
    if (mapRef.current) {
      setTimeout(() => {
        mapRef.current?.invalidateSize();
      }, 200);
    }
  }, [height]);

  return (
    <div className={`relative isolate z-0 overflow-hidden rounded-xl border border-[var(--boss-border)] shadow-lg ${className}`}>
      <div ref={containerRef} style={{ height, width: '100%' }} />
    </div>
  );
}
