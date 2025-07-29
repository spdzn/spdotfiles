#!/usr/bin/env python3
import os
import subprocess
import json

# Define base directory for downloads
BASE_DOWNLOAD_PATH = "/home/sagar/Videos/"

# Ensure the base download directory exists
os.makedirs(BASE_DOWNLOAD_PATH, exist_ok=True)

# Get the YouTube URL
url = input("Enter the YouTube video/playlist URL: ").strip()

# Check if it's a playlist
is_playlist = input("Is this a playlist? (yes/no): ").strip().lower()

# If it's a playlist, fetch its title first
if is_playlist in ["yes", "y"]:
    print("\n🔍 Fetching playlist metadata...")

    try:
        # Run yt-dlp to get JSON metadata
        result = subprocess.run(
            ["yt-dlp", "--flat-playlist", "--print-json", url],
            capture_output=True, text=True, check=True
        )

        # Extract playlist title from first JSON entry
        first_json_line = result.stdout.split("\n")[0].strip()
        metadata = json.loads(first_json_line)
        playlist_title = metadata.get("playlist_title", "Unknown_Playlist").replace("/", "-")  # Sanitize name

        # Define final playlist folder
        playlist_folder = os.path.join(BASE_DOWNLOAD_PATH, playlist_title)
        os.makedirs(playlist_folder, exist_ok=True)

        print(f"📁 Playlist will be saved in: {playlist_folder}")

        # Set output template
        output_template = os.path.join(playlist_folder, "%(title)s.%(ext)s")

    except Exception as e:
        print("\n❌ Failed to fetch playlist name. Downloading to default location.")
        output_template = os.path.join(BASE_DOWNLOAD_PATH, "%(title)s.%(ext)s")

else:
    # Single video download
    output_template = os.path.join(BASE_DOWNLOAD_PATH, "%(title)s.%(ext)s")

# Define yt-dlp options
options = [
    "yt-dlp",
    "-f", "bestvideo[height<=480]+bestaudio/best[height<=480]",
    "--merge-output-format", "mp4",
    "-o", output_template,
]

# If it's a playlist, enable playlist download
if is_playlist in ["yes", "y"]:
    options.append("--yes-playlist")
else:
    options.append("--no-playlist")

# Add URL to command
options.append(url)

# Start download
try:
    print("\n📥 Downloading...")
    subprocess.run(options, check=True)
    print("\n✅ Download complete!")
except subprocess.CalledProcessError:
    print("\n❌ Download failed. Please check the URL.")
except Exception as e:
    print(f"\n❌ Error: {e}")
