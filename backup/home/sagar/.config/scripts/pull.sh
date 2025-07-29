#!/bin/bash

# Colors
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
BLUE="\e[34m"
CYAN="\e[36m"
RESET="\e[0m"

# Save settings file
CONFIG_FILE="$HOME/.pull_config"

# Banner
echo -e "${BLUE}==================================="
echo -e "📂 MOBILE FILE PULL SCRIPT 🚀"
echo -e "===================================${RESET}"

# Load saved settings if available
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
    echo -e "${CYAN}🔄 Loaded previous settings!${RESET}"
else
    echo -e "${YELLOW}🔧 No saved settings found.${RESET}"
fi

# Prompt user for folder name on phone
read -p "📁 Enter the folder name on your phone (inside /sdcard/): " folder_name
mobile_folder="/sdcard/$folder_name"
laptop_folder="$HOME/pull/"

# Auto-detect phone connection
adb devices | grep -w "device" &> /dev/null
ADB_CONNECTED=$?

if [[ $ADB_CONNECTED -eq 0 ]]; then
    echo -e "${GREEN}🔗 Phone detected via ADB.${RESET}"
    method="1"
else
    echo -e "${YELLOW}⚠️ No USB connection found. Switching to Wi-Fi mode.${RESET}"
    method="2"
fi

# Rsync settings
if [[ "$method" == "2" ]]; then
    if [[ -z "$mobile_ip" ]]; then
        read -p "🌐 Enter your mobile's IP address: " mobile_ip
    fi
    if [[ -z "$ssh_user" ]]; then
        read -p "👤 Enter SSH username (Termux default is u0_a...): " ssh_user
    fi
    echo "mobile_ip=$mobile_ip" > "$CONFIG_FILE"
    echo "ssh_user=$ssh_user" >> "$CONFIG_FILE"
fi

# Confirm transfer
echo -e "${CYAN}➡️ Copying from: ${mobile_folder}${RESET}"
echo -e "${CYAN}➡️ Saving to: ${laptop_folder}${RESET}"
read -p "✅ Confirm transfer? (y/n): " confirm
[[ "$confirm" != "y" ]] && echo -e "${RED}❌ Transfer canceled.${RESET}" && exit 1

# Transfer using ADB
if [[ "$method" == "1" ]]; then
    if ! command -v adb &> /dev/null; then
        echo -e "${RED}❌ ADB not installed. Install it with: sudo pacman -S android-tools${RESET}"
        exit 1
    fi
    echo -e "${GREEN}🔗 Using ADB to pull files...${RESET}"
    adb pull "$mobile_folder" "$laptop_folder" | pv -lep -s 100 > /dev/null
    echo -e "${GREEN}✅ Transfer complete! Files saved to: $laptop_folder${RESET}"

# Transfer using Rsync
elif [[ "$method" == "2" ]]; then
    if ! command -v rsync &> /dev/null; then
        echo -e "${RED}❌ Rsync not installed. Install it with: sudo pacman -S rsync${RESET}"
        exit 1
    fi
    echo -e "${GREEN}🔗 Using Rsync over SSH...${RESET}"
    rsync -avz --progress "$ssh_user@$mobile_ip:$mobile_folder/" "$laptop_folder"
    echo -e "${GREEN}✅ Transfer complete! Files saved to: $laptop_folder${RESET}"
fi

# Optional Cleanup: Delete files from phone after copy
read -p "🗑️ Delete original files from phone? (y/n): " delete_after
if [[ "$delete_after" == "y" ]]; then
    if [[ "$method" == "1" ]]; then
        adb shell rm -rf "$mobile_folder"
    else
        ssh "$ssh_user@$mobile_ip" "rm -rf '$mobile_folder'"
    fi
    echo -e "${YELLOW}🚮 Files deleted from phone!${RESET}"
fi

echo -e "${GREEN}🚀 All done! Enjoy your files!${RESET}"
