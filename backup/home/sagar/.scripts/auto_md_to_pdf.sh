#!/bin/bash

WATCH_DIR="$HOME/notes"
OUTPUT_DIR="$HOME/notes/pdfs"
PDF_ENGINE="tectonic"

mkdir -p "$OUTPUT_DIR"

echo "Watching $WATCH_DIR for .md changes..."

inotifywait -m -e close_write,create --format '%w%f' "$WATCH_DIR" | while read file; do
    if [[ "$file" == *.md ]]; then
        filename=$(basename -- "$file")
        name="${filename%.*}"
        output="$OUTPUT_DIR/$name.pdf"
        echo "[+] Detected change: $file → Generating $output"
        pandoc "$file" -o "$output" --pdf-engine="$PDF_ENGINE"
        echo "[✓] PDF generated: $output"
    fi
done
