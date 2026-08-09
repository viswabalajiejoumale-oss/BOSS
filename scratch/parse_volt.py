import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

nb_path = 'voltoptimize-smart-grid-ev-analytics.ipynb'
with open(nb_path, 'r', encoding='utf-8') as f:
    nb = json.load(f)

print(f"Total cells in {nb_path}: {len(nb['cells'])}\n")

for idx, cell in enumerate(nb['cells']):
    cell_type = cell.get('cell_type')
    source = "".join(cell.get('source', []))
    print(f"=== Cell {idx} ({cell_type}) ===")
    print(source)
    print("-" * 50)
