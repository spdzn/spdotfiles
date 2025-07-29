
#!/bin/bash

# Define paths to sync
TRACKED_REPO="$HOME/spdotfiles"
DATE=$(date +%F_%T)

echo "🔁 Backing up at $DATE..."

# List of files/directories to sync
declare -a FILES_TO_BACKUP=(
  "$HOME/.zshrc"
  "$HOME/.config"
  "$HOME/.scripts"
  "$HOME/.python/scripts"
  "$HOME/scripts"
)

# Rsync each one to the repo with preserving structure
for path in "${FILES_TO_BACKUP[@]}"; do
  if [ -e "$path" ]; then
    dest="$TRACKED_REPO/backup${path}"
    mkdir -p "$(dirname "$dest")"
    rsync -a --delete "$path/" "$dest/"
    echo "✅ Synced: $path → $dest"
  else
    echo "⚠️ Skipped (not found): $path"
  fi
done

# Stage, commit, and push
cd "$TRACKED_REPO" || exit 1
git add .
git commit -m "📦 Auto backup on $DATE"
git push origin main

echo "✅ Backup complete and pushed!"

