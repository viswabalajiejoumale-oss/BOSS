import json

with open('src/data/indiaEvStations.json', 'r', encoding='utf-8') as f:
    stations = json.load(f)

for i, s in enumerate(stations):
    st = s.get('state')
    if not st or st in ['Unknown', 'India', '']:
        print(f"Index {i+1}: Name: {s.get('name')}, City: {s.get('city')}, Address: {s.get('address')}, Lat: {s.get('latitude')}, Lon: {s.get('longitude')}")
