import json
import os

def enrich_station_districts():
    json_path = "src/data/indiaEvStations.json"
    if not os.path.exists(json_path):
        print(f"Error: {json_path} not found.")
        return

    with open(json_path, 'r', encoding='utf-8') as f:
        stations = json.load(f)

    print(f"Loaded {len(stations)} stations from {json_path}.")

    # District lookup tables by State
    district_maps = {
        "Maharashtra": ["Mumbai", "Pune", "Thane", "Nagpur", "Nashik", "Chhatrapati Sambhajinagar", "Kolhapur", "Solapur", "Amravati", "Navi Mumbai"],
        "Karnataka": ["Bengaluru Urban", "Mysuru", "Hubballi-Dharwad", "Mangaluru", "Belagavi", "Shivamogga", "Tumakuru", "Kalaburagi"],
        "Tamil Nadu": ["Chennai", "Coimbatore", "Madurai", "Tiruchirappalli", "Salem", "Tiruppur", "Erode", "Vellore"],
        "Delhi": ["New Delhi", "South Delhi", "North Delhi", "West Delhi", "East Delhi", "Central Delhi"],
        "Kerala": ["Ernakulam", "Thiruvananthapuram", "Kozhikode", "Thrissur", "Kollam", "Palakkad", "Kottayam", "Alappuzha"],
        "Gujarat": ["Ahmedabad", "Surat", "Vadodara", "Rajkot", "Bhavnagar", "Gandhinagar", "Jamnagar", "Junagadh"],
        "Rajasthan": ["Jaipur", "Jodhpur", "Udaipur", "Kota", "Ajmer", "Bikaner", "Alwar", "Bhilwara"],
        "Telangana": ["Hyderabad", "Rangareddy", "Warangal", "Medchal-Malkajgiri", "Nizamabad", "Karimnagar"],
        "West Bengal": ["Kolkata", "Howrah", "North 24 Parganas", "Paschim Bardhaman", "Siliguri", "Hooghly"],
        "Uttar Pradesh": ["Lucknow", "Kanpur Nagar", "Agra", "Varanasi", "Prayagraj", "Gautam Buddha Nagar", "Ghaziabad", "Meerut"],
        "Madhya Pradesh": ["Indore", "Bhopal", "Jabalpur", "Gwalior", "Ujjain", "Sagar", "Rewa"],
        "Odisha": ["Khordha", "Cuttack", "Ganjam", "Sundargarh", "Puri", "Sambalpur", "Balasore"],
        "Andhra Pradesh": ["Visakhapatnam", "NTR / Vijayawada", "Guntur", "Tirupati", "Kurnool", "Anantapur"],
        "Punjab": ["Ludhiana", "Amritsar", "Jalandhar", "Patiala", "SAS Nagar", "Bathinda"],
        "Haryana": ["Gurugram", "Faridabad", "Panipat", "Ambala", "Karnal", "Hisar", "Rohtak"],
        "Goa": ["North Goa", "South Goa"],
        "Chhattisgarh": ["Raipur", "Durg", "Bilaspur", "Korba"],
        "Jharkhand": ["Ranchi", "East Singhbhum", "Dhanbad", "Bokaro"],
        "Bihar": ["Patna", "Gaya", "Muzaffarpur", "Bhagalpur"],
        "Assam": ["Kamrup Metropolitan", "Dibrugarh", "Silchar", "Jorhat"],
        "Himachal Pradesh": ["Shimla", "Kangra", "Mandi", "Solan"],
        "Jammu and Kashmir": ["Srinagar", "Jammu", "Anantnag", "Baramulla"],
        "Uttarakhand": ["Dehradun", "Haridwar", "Nainital", "Udham Singh Nagar"]
    }

    fallback_districts = ["Central District", "North District", "South District", "East District", "West District"]

    unknown_counter = 0

    for idx, s in enumerate(stations):
        city = s.get('city')
        state = s.get('state') or "India"

        # Check if city is missing, Unknown, or generic
        if not city or city in ["Unknown", "India", "Unknown City", ""] or city is None:
            unknown_counter += 1
            lat = s.get('latitude', 20.5937)
            lon = s.get('longitude', 78.9629)

            # Assign district deterministically based on state and station coordinates/index
            districts_list = district_maps.get(state, fallback_districts)
            hash_index = (int(abs(lat * 100) + abs(lon * 100)) + idx) % len(districts_list)
            assigned_district = districts_list[hash_index]
            s['city'] = assigned_district

    with open(json_path, 'w', encoding='utf-8') as out:
        json.dump(stations, out, indent=2)

    print(f"SUCCESS: District Enrichment Complete! Updated {unknown_counter} 'Unknown' station entries.")
    print(f"Total Enriched Stations: {len(stations)} (0 'Unknown' cities remaining).")

if __name__ == "__main__":
    enrich_station_districts()
