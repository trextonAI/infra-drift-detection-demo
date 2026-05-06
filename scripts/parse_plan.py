import json
import sys

with open("plan.json") as f:
    data = json.load(f)

changes = data.get("resource_changes", [])

if changes:
    print("🚨 Drift Detected!")
    sys.exit(1)
else:
    print("✅ No Drift Detected")
