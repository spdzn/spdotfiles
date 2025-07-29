#!/bin/bash

# Screenshot filename
SCREENSHOT="$HOME/Pictures/screenshot_$(date +'%Y-%m-%d_%H-%M-%S').png"

echo "⏳ Waiting 5 seconds before taking screenshot..."
sleep 5  # Timer added

echo "📸 Taking screenshot..."
scrot "$SCREENSHOT"  # You can replace this with flameshot or another tool

# Ensure the screenshot was taken
if [[ ! -f "$SCREENSHOT" ]]; then
  echo "❌ Screenshot failed!"
  exit 1
fi

# User selects upload service
echo "🌍 Choose an upload service:"
echo "1) Imgur (Account needed)"
echo "2) Catbox.moe (Fast, No Account)"
echo "3) Transfer.sh (Auto-Deletes in 14 days)"
echo "4) File.io (One-time Download)"
echo "5) Anonfiles (Permanent, Slow)"
echo "6) No upload, just save locally"
read -p "Enter choice (1-6): " choice

UPLOAD_URL=""

case $choice in
  1)
    echo "🔼 Uploading to Imgur..."
    UPLOAD_URL=$(curl -s -H "Authorization: Client-ID 6eddb734c428ff1" -F "image=@$SCREENSHOT" https://api.imgur.com/3/image | jq -r '.data.link') ;;
  2)
    echo "🔼 Uploading to Catbox.moe..."
    UPLOAD_URL=$(curl -s -F "reqtype=fileupload" -F "fileToUpload=@$SCREENSHOT" "https://catbox.moe/user/api.php") ;;
  3)
    echo "🔼 Uploading to Transfer.sh..."
    UPLOAD_URL=$(curl -s --upload-file "$SCREENSHOT" "https://transfer.sh/screenshot.png") ;;
  4)
    echo "🔼 Uploading to File.io..."
    UPLOAD_URL=$(curl -s -F "file=@$SCREENSHOT" "https://file.io" | jq -r '.link') ;;
  5)
    echo "🔼 Uploading to Anonfiles..."
    UPLOAD_URL=$(curl -s -F "file=@$SCREENSHOT" "https://api.anonfiles.com/upload" | jq -r '.data.file.url.full') ;;
  6)
    echo "📂 Screenshot saved at: $SCREENSHOT"
    exit 0 ;;
  *)
    echo "❌ Invalid choice!"
    exit 1 ;;
esac

# Check if upload was successful
if [[ -z "$UPLOAD_URL" || "$UPLOAD_URL" == "null" || "$UPLOAD_URL" == "No request type given?" ]]; then
  echo "❌ Upload failed!"
  exit 1
fi

# Display and copy URL
echo "✅ Upload successful! URL: $UPLOAD_URL"
echo -n "$UPLOAD_URL" | xclip -selection clipboard
echo "📋 Link copied to clipboard!"

# Send notification only if D-Bus is running
if command -v notify-send &>/dev/null && pgrep -x "dbus-daemon" &>/dev/null; then
  notify-send "Screenshot Uploaded" "$UPLOAD_URL"
fi
