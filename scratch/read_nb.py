import json
import sys

sys.stdout.reconfigure(encoding='utf-8')

with open('voltoptimize-smart-grid-ev-analytics.ipynb', 'r', encoding='utf-8') as f:
    nb = json.load(f)

with open('scratch/nb_summary.txt', 'w', encoding='utf-8') as out:
    out.write(f"Total cells: {len(nb['cells'])}\n\n")
    for i, c in enumerate(nb['cells']):
        out.write(f"=== Cell {i} ({c.get('cell_type')}) ===\n")
        out.write("".join(c.get('source', [])))
        out.write("\n" + "="*50 + "\n\n")

print("Wrote scratch/nb_summary.txt successfully")
