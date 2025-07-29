#!/bin/bash

# 📁 Directory to store notes
NOTES_DIR="$HOME/notes"
mkdir -p "$NOTES_DIR"

# 🎨 Color codes
BLUE="\e[34m"
GREEN="\e[32m"
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

# 📜 Show usage guide
show_usage() {
    echo -e "${BLUE}Usage:${RESET} note [new|list|search|open|delete] <title/keyword>"
}

# ✍️ Create a new note
create_note() {
    echo -ne "${BLUE}Enter note title: ${RESET}"
    read title
    [ -z "$title" ] && { echo -e "${RED}❌ Title cannot be empty!${RESET}"; exit 1; }

    filename="${title// /_}-$(date +"%Y-%m-%d_%H-%M-%S").md"
    filepath="$NOTES_DIR/$filename"

    echo -e "✍️  Writing note: ${GREEN}$filepath${RESET}"
    nvim "$filepath"
}

# 📜 List all notes
list_notes() {
    echo -e "${YELLOW}📜 Your Notes:${RESET}"
    ls -1 "$NOTES_DIR" | nl -w2 -s'. '
}

# 🔍 Search for a note
search_notes() {
    echo -ne "${BLUE}Enter search keyword: ${RESET}"
    read keyword
    grep -irl "$keyword" "$NOTES_DIR" 2>/dev/null | nl -w2 -s'. ' || echo -e "${RED}❌ No matching notes found.${RESET}"
}

# 📝 Open a note
open_note() {
    list_notes
    echo -ne "${BLUE}Enter note number to open: ${RESET}"
    read num
    file=$(ls -1 "$NOTES_DIR" | sed -n "${num}p")
    [ -z "$file" ] && { echo -e "${RED}❌ Invalid selection!${RESET}"; exit 1; }

    echo -e "📂 Opening: ${GREEN}$file${RESET}"
    nvim "$NOTES_DIR/$file"
}

# 🗑️ Delete a note
delete_note() {
    list_notes
    echo -ne "${RED}Enter note number to delete: ${RESET}"
    read num
    file=$(ls -1 "$NOTES_DIR" | sed -n "${num}p")
    [ -z "$file" ] && { echo -e "${RED}❌ Invalid selection!${RESET}"; exit 1; }

    rm "$NOTES_DIR/$file"
    echo -e "🗑️  Deleted: ${RED}$file${RESET}"
}

# 🚀 Main logic
case "$1" in
    new) create_note ;;
    list) list_notes ;;
    search) search_notes ;;
    open) open_note ;;
    delete) delete_note ;;
    *) show_usage ;;
esac
