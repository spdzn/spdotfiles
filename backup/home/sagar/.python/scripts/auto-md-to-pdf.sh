#!/bin/bash

WATCH_DIR="$HOME/notes"
OUTPUT_DIR="$WATCH_DIR/pdfs"

mkdir -p "$OUTPUT_DIR"

echo "👀 Watching $WATCH_DIR for changes..."

inotifywait -m -e close_write --format "%w%f" "$WATCH_DIR" | while read file; do
    if [[ "$file" == *.md ]]; then
        filename=$(basename "$file" .md)
        output="$OUTPUT_DIR/$filename.pdf"

        echo "🌀 Detected change in $file"
        echo "📄 Converting to PDF..."

        pandoc "$file" -o "$output" && echo "✅ Saved as $output" || echo "❌ Failed to convert"
    fi
done
