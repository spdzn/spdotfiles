#!/usr/bin/env python3

import os
import time
import subprocess
from datetime import datetime

# Idle threshold in milliseconds (5 minutes)
IDLE_THRESHOLD = 300000

# Screenshot save directory
snap_dir = os.path.expanduser("~/Pictures/idle_snaps")
os.makedirs(snap_dir, exist_ok=True)

def get_idle_time():
    """Returns idle time in milliseconds."""
    try:
        idle_time = int(subprocess.check_output(["xprintidle"]).decode().strip())
        return idle_time
    except Exception as e:
        print(f"Error getting idle time: {e}")
        return 0

def take_screenshot():
    """Take a screenshot and return the path."""
    timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M-%S")
    snap_path = os.path.join(snap_dir, f"idle_snap_{timestamp}.png")

    for cmd in [["grim", snap_path], ["maim", snap_path], ["scrot", snap_path]]:
        try:
            subprocess.run(cmd, check=True)
            print(f"📸 Screenshot saved to {snap_path}")
            return snap_path
        except FileNotFoundError:
            continue
        except subprocess.CalledProcessError as e:
            print(f"Screenshot command failed: {e}")
            return None

    print("❌ No screenshot tool found (grim, maim, or scrot)")
    return None

def lock_screen_with_image(image_path):
    """Updates lockscreen background with image, then locks."""
    if image_path and os.path.exists(image_path):
        try:
            subprocess.run(["/sbin/betterlockscreen", "-u", image_path], check=True)
            print("🔒 Updated lockscreen background.")
            subprocess.run(["/sbin/betterlockscreen", "-l"], check=True)
            print("🔒 Screen locked.")
        except subprocess.CalledProcessError as e:
            print(f"❌ Locking failed: {e}")
    else:
        print("❌ No image found to update lockscreen.")

# --- Main loop ---
if __name__ == "__main__":
    print("⌛ Monitoring idle time...")
    while True:
        if get_idle_time() > IDLE_THRESHOLD:
            print("🚨 Idle time threshold exceeded.")
            snap_path = take_screenshot()
            lock_screen_with_image(snap_path)
            if snap_path:
                print(f"📝 Screenshot saved to: {snap_path}")
                print("📂 You can manually clean them later from the folder.")
            break
        time.sleep(1)
