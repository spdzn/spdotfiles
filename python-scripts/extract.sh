#!/bin/bash

# 🖌️ Colors
GREEN="\e[32m"
YELLOW="\e[33m"
RED="\e[31m"
RESET="\e[0m"

# 📂 Ask for archive file
echo -e "${YELLOW}📂 Enter the path of the archive file:${RESET}"
read archive

# ❌ Check if file exists
if [[ ! -f "$archive" ]]; then
    echo -e "${RED}❌ File not found!${RESET}"
    exit 1
fi

# 📁 Create a new folder with the same name as archive (without extension)
extract_folder="${archive%.*}_extracted"
mkdir -p "$extract_folder"

# 🔄 Detect and extract
echo -e "${GREEN}🔍 Extracting '$archive' into '$extract_folder'...${RESET}"
case "$archive" in
    *.tar.bz2) tar xvjf "$archive" -C "$extract_folder" ;;
    *.tar.gz) tar xvzf "$archive" -C "$extract_folder" ;;
    *.tar.xz) tar xvJf "$archive" -C "$extract_folder" ;;
    *.zip) unzip -q "$archive" -d "$extract_folder" ;;
    *.rar) unrar x -o+ "$archive" "$extract_folder" ;;
    *.7z) 7z x "$archive" -o"$extract_folder" ;;
    *) echo -e "${RED}❌ Unsupported file format!${RESET}" && exit 1 ;;
esac

# ✅ Success message
echo -e "${GREEN}✅ Extraction completed! Files are in '$extract_folder'${RESET}"
