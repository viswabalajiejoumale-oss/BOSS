import csv
import json
import os

brands_2_words = ["Alfa Romeo", "DS Automobiles"]

vehicles = []

with open('electric_vehicles_dataset.csv', mode='r', encoding='utf-8') as f:
    reader = csv.reader(f)
    # The first line starts with "#,Brand & Model..."
    next(reader)
    for row in reader:
        if not row or len(row) < 3:
            continue
        fullname = row[1].strip()
        try:
            battery = float(row[2].strip())
        except ValueError:
            continue
        
        brand = ""
        model = ""
        for b in brands_2_words:
            if fullname.startswith(b):
                brand = b
                model = fullname[len(b):].strip()
                break
        
        if not brand:
            parts = fullname.split(' ', 1)
            brand = parts[0]
            model = parts[1] if len(parts) > 1 else ""
            
        vehicles.append({
            "fullName": fullname,
            "brand": brand,
            "model": model,
            "battery": battery
        })

os.makedirs('src/data', exist_ok=True)
output = f"export interface EVModel {{\n  fullName: string;\n  brand: string;\n  model: string;\n  battery: number;\n}}\n\nexport const evDataset: EVModel[] = {json.dumps(vehicles, indent=2)};\n"

with open('src/data/evDataset.ts', 'w', encoding='utf-8') as out:
    out.write(output)
print("Parsed", len(vehicles), "vehicles successfully.")
