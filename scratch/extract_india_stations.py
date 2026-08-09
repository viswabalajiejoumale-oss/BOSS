import kagglehub
import pandas as pd
import json
import os

try:
    path = kagglehub.dataset_download("deepeshkansotia/ev-charging-stations-in-india-openchargemap")
    print("Dataset path:", path)
    files = os.listdir(path)
    print("Files:", files)
    
    csv_file = None
    for f in files:
        if f.endswith('.csv'):
            csv_file = os.path.join(path, f)
            break
            
    if not csv_file:
        for root, dirs, f_list in os.walk(path):
            for f in f_list:
                if f.endswith('.csv'):
                    csv_file = os.path.join(root, f)
                    break
                    
    print("CSV file selected:", csv_file)
    df = pd.read_csv(csv_file)
    print("DataFrame shape:", df.shape)
    print(df.head())
    
    # Process stations into clean format for frontend
    stations = []
    for idx, row in df.iterrows():
        st_id = f"in_st_{row.get('station_id', idx+1)}"
        name = str(row.get('station_name', f"EV Station {idx+1}")).strip()
        city = str(row.get('city', 'India')).strip()
        state = str(row.get('state', 'India')).strip()
        operator = str(row.get('operator', 'Independent')).strip()
        lat = float(row.get('latitude', 20.5937))
        lon = float(row.get('longitude', 78.9629))
        charging_points = int(row.get('charging_points', 4))
        if charging_points <= 0 or pd.isna(charging_points):
            charging_points = 2
            
        status = str(row.get('status', 'Operational')).strip()
        
        address_parts = [p for p in [name, city, state, 'India'] if p and p != 'Unknown']
        address = ", ".join(address_parts)
        
        stations.append({
            "id": st_id,
            "name": name,
            "address": address,
            "city": city,
            "state": state,
            "operator": operator,
            "latitude": lat,
            "longitude": lon,
            "charging_points": charging_points,
            "status": status,
            "transformer_load_capacity_kva": 500,
            "current_load_kva": round(charging_points * 35 * 0.7),
            "is_active": True
        })
        
    print(f"Processed {len(stations)} India EV stations.")
    
    with open('src/data/indiaEvStations.json', 'w', encoding='utf-8') as f:
        json.dump(stations, f, indent=2)
        
    print("Saved src/data/indiaEvStations.json successfully.")

except Exception as e:
    print("Error extracting dataset:", e)
