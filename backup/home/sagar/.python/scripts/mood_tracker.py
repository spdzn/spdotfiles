#!/usr/bin/env python3

import os
import csv
from datetime import datetime

MOOD_FILE = os.path.expanduser("~/.local/share/mood_log.csv")

# Ask user
mood = input("🧠 How are you feeling, bud? ").strip()

# Make sure dir exists
os.makedirs(os.path.dirname(MOOD_FILE), exist_ok=True)

# Write to CSV
file_exists = os.path.isfile(MOOD_FILE)
with open(MOOD_FILE, "a", newline="") as csvfile:
    writer = csv.DictWriter(csvfile, fieldnames=["timestamp", "mood"])
    if not file_exists:
        writer.writeheader()
    writer.writerow({
        "timestamp": datetime.now().isoformat(sep=" ", timespec="seconds"),
        "mood": mood
    })

print(f"✅ Logged: '{mood}' at {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}")
