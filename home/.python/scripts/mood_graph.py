#!/usr/bin/env python3

import os
import csv
from datetime import datetime
import matplotlib.pyplot as plt

MOOD_FILE = os.path.expanduser("~/.local/share/mood_log.csv")

# Load moods and timestamps
timestamps = []
moods = []

with open(MOOD_FILE, "r") as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        timestamps.append(datetime.fromisoformat(row["timestamp"]))
        moods.append(row["mood"])

# Convert moods to numerical scores for plotting
mood_map = {
    "happy": 5,
    "good": 4,
    "okay": 3,
    "meh": 2,
    "sad": 1,
    "angry": 0,
}

scores = [mood_map.get(m.lower(), 3) for m in moods]

# Plot
plt.figure(figsize=(10, 5))
plt.plot(timestamps, scores, marker="o", linestyle="-", color="skyblue")
plt.title("Mood Over Time")
plt.xlabel("Timestamp")
plt.ylabel("Mood Level (0=Angry, 5=Happy)")
plt.grid(True)
plt.tight_layout()
plt.xticks(rotation=45)
plt.show()
