#!/usr/bin/env bash

# ┌────────────────────────────────────┐
# │    Dynamic Android Debloater v1   │
# └────────────────────────────────────┘

set -euo pipefail

# Colors for sexiness
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
YELLOW=$(tput setaf 3)
RESET=$(tput sgr0)

BACKUP_FILE="reinstall_apps.sh"
LOG_FILE="debloater.log"
mkdir -p logs
touch "$BACKUP_FILE" "$LOG_FILE"

function detect_device() {
  echo -e "${CYAN}[+] Detecting device...${RESET}"
  adb wait-for-device
  BRAND=$(adb shell getprop ro.product.brand | tr -d '\r')
  MODEL=$(adb shell getprop ro.product.model | tr -d '\r')
  ANDROID=$(adb shell getprop ro.build.version.release | tr -d '\r')
  echo -e "${GREEN}[✓] $BRAND $MODEL (Android $ANDROID) connected.${RESET}"
}

function get_user_apps() {
  echo -e "${CYAN}[+] Fetching user-installed apps...${RESET}"
  adb shell pm list packages -3 | cut -d ':' -f 2 | sort
}

function interactive_uninstall() {
  echo -e "${CYAN}Choose apps to uninstall. Type 'done' when finished.${RESET}"
  mapfile -t APPS < <(get_user_apps)

  for pkg in "${APPS[@]}"; do
    echo -en "${YELLOW}Remove $pkg? [y/N]: ${RESET}"
    read -r answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
      echo -e "${RED}Uninstalling $pkg...${RESET}"
      adb shell pm uninstall --user 0 "$pkg" >> "$LOG_FILE" && \
      echo "adb shell cmd package install-existing $pkg" >> "$BACKUP_FILE"
    else
      echo -e "${GREEN}Skipped $pkg.${RESET}"
    fi
  done
}

function fuzzy_mode() {
  if ! command -v fzf &>/dev/null; then
    echo -e "${RED}fzf not found. Install it to use this feature.${RESET}"
    exit 1
  fi

  SELECTED=$(get_user_apps | fzf --multi --header="Select packages to uninstall")
  echo "$SELECTED" | while read -r pkg; do
    [[ -z "$pkg" ]] && continue
    echo -e "${RED}Uninstalling $pkg...${RESET}"
    adb shell pm uninstall --user 0 "$pkg" >> "$LOG_FILE" && \
    echo "adb shell cmd package install-existing $pkg" >> "$BACKUP_FILE"
  done
}

function show_help() {
  echo -e "${YELLOW}
Dynamic Android Debloater

Usage:
  ./android-debloater.sh [option]

Options:
  --interactive     One-by-one uninstall with confirmation
  --fuzzy           Use fzf to select multiple packages
  --list            Just list user-installed apps
  --help            Show this help
${RESET}"
}

# Main
[[ $# -eq 0 ]] && show_help && exit 1
detect_device

case "$1" in
  --interactive) interactive_uninstall ;;
  --fuzzy) fuzzy_mode ;;
  --list) get_user_apps ;;
  --help) show_help ;;
  *) echo "Unknown option: $1"; show_help ;;
esac

