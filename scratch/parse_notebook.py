import json
import re

with open('where-can-you-charge-mapping-ev-stations-india.ipynb', 'r', encoding='utf-8') as f:
    nb = json.load(f)

print("Cells count:", len(nb['cells']))

for i, cell in enumerate(nb['cells']):
    sources = "".join(cell.get('source', []))
    outputs = cell.get('outputs', [])
    if 'station_name' in sources or 'df' in sources or 'latitude' in sources or outputs:
        print(f"--- Cell {i} ({cell.get('cell_type')}) ---")
        print("Source snippet:", sources[:300])
        for out in outputs:
            if 'text' in out:
                print("Text output:", "".join(out['text'])[:300])
            elif 'data' in out and 'text/plain' in out['data']:
                print("Data output:", "".join(out['data']['text/plain'])[:300])
