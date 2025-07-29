#!/usr/bin/env python3

import subprocess
from datetime import datetime
import os

LOGFILE = "/home/sagar/.python/scripts/usb_log.txt"

def get_usb_devices():
    try:
        output = subprocess.check_output("lsusb", shell=True).decode("utf-8")
        return output.strip().split('\n')
    except subprocess.CalledProcessError:
        return []

def log_new_devices():
    current_devices = get_usb_devices()
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    log_line = f"\n[{timestamp}] USB Device(s) Detected:\n"
    for device in current_devices:
        log_line += f"    {device}\n"

    with open(LOGFILE, "a") as f:
        f.write(log_line)

if __name__ == "__main__":
    log_new_devices()

