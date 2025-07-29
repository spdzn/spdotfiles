#!/bin/bash

cd ~/spdotfiles || exit

# Stage all changes
git add .

# Check if there are any changes
if ! git diff --cached --quiet; then
  git commit -m "🔄 Daily backup: $(date '+%Y-%m-%d %H:%M:%S')"
  git push origin main
else
  echo "✅ No changes to commit."
fi
``
