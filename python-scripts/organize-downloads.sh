#!/bin/bash

# 🎨 Colors
GREEN="\e[32m"
BLUE="\e[34m"
CYAN="\e[36m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

# 📂 Define the Downloads directory
DOWNLOADS="$HOME/Downloads"

# 📌 Define folders for different file types
declare -A FOLDERS=(
    ["Images"]="jpg jpeg png gif bmp webp svg"
    ["Videos"]="mp4 mkv avi mov webm"
    ["Music"]="mp3 wav flac ogg m4a"
    ["Documents"]="pdf doc docx txt odt"
    ["Archives"]="zip rar tar gz 7z"
    ["Executables"]="sh deb rpm pkg appimage exe"
    ["Others"]="*"
)

# 🔄 Function to create directories if they don't exist
create_folders() {
    for folder in "${!FOLDERS[@]}"; do
        DEST="$DOWNLOADS/$folder"
        if [ ! -d "$DEST" ]; then
            mkdir -p "$DEST"
            echo -e "${CYAN}📂 Created folder: $folder${RESET}"
        fi
    done
}

# 📂 Move files to appropriate folders
move_files() {
    for folder in "${!FOLDERS[@]}"; do
        for ext in ${FOLDERS[$folder]}; do
            # Find and move files
            find "$DOWNLOADS" -maxdepth 1 -type f -iname "*.$ext" -exec mv {} "$DOWNLOADS/$folder/" \;
        done
        echo -e "${GREEN}✅ Moved ${folder} files${RESET}"
    done
}

# 🚀 Run the script
echo -e "${BLUE}🔄 Organizing your Downloads folder...${RESET}"
create_folders
move_files
echo -e "${YELLOW}🎉 Done! Your Downloads folder is now clean.${RESET}"
