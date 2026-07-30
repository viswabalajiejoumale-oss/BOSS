import { useEffect, useRef } from 'react';
import L from 'leaflet';
import 'leaflet/dist/leaflet.css';
import type { Station } from '@/types';

interface MapViewProps {
  stations: Station[];
  userLat: number;
  userLon: number;
  selectedId?: string;
  onSelect?: (id: string) => void;
  height?: string;
}

export function MapView({ stations, userLat, userLon, selectedId, onSelect, height = '300px' }: MapViewProps) {
  const containerRef = useRef<HTMLDivElement>(null);
  const mapRef = useRef<L.Map | null>(null);
  const markersRef = useRef<Map<string, L.Marker>>(new Map());

  useEffect(() => {
    if (!containerRef.current || mapRef.current) return;

    const map = L.map(containerRef.current, {
      center: [userLat, userLon],
      zoom: 13,
      zoomControl: true,
    });
    mapRef.current = map;

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: '&copy; OpenStreetMap',
    }).addTo(map);

    // User location marker
    const userIcon = L.divIcon({
      html: '<div style="width:16px;height:16px;background:#22c55e;border:3px solid #fff;border-radius:50%;box-shadow:0 0 10px #22c55e"></div>',
      className: '',
      iconSize: [22, 22],
      iconAnchor: [11, 11],
    });
    L.marker([userLat, userLon], { icon: userIcon }).addTo(map);

    return () => {
      map.remove();
      mapRef.current = null;
      markersRef.current.clear();
    };
  }, []);

  useEffect(() => {
    const map = mapRef.current;
    if (!map) return;

    // Clear old markers
    markersRef.current.forEach((m) => m.remove());
    markersRef.current.clear();

    stations.forEach((s) => {
      const isSelected = s.id === selectedId;
      const icon = L.divIcon({
        html: `<div style="width:${isSelected ? 28 : 20}px;height:${isSelected ? 28 : 20}px;background:${isSelected ? '#22c55e' : '#16a34a'};border:2px solid #fff;border-radius:50%;box-shadow:0 0 ${isSelected ? 15 : 8}px #22c55e;display:flex;align-items:center;justify-content:center;color:#000;font-size:10px;font-weight:bold">⚡</div>`,
        className: '',
        iconSize: [isSelected ? 28 : 20, isSelected ? 28 : 20],
        iconAnchor: [isSelected ? 14 : 10, isSelected ? 14 : 10],
      });
      const marker = L.marker([s.latitude, s.longitude], { icon }).addTo(map);
      marker.bindPopup(`<b>${s.name}</b><br/>${s.address}`);
      if (onSelect) {
        marker.on('click', () => onSelect(s.id));
      }
      markersRef.current.set(s.id, marker);
    });
  }, [stations, selectedId, onSelect]);

  return <div ref={containerRef} style={{ height, width: '100%' }} />;
}
