#!/bin/bash

set -e

# Where your repo is
REPO_DIR="$HOME/spdotfiles"

# Go to repo
cd "$REPO_DIR"

# Copy stuff you care about
cp -r ~/.config "$REPO_DIR/config"
cp ~/.zshrc "$REPO_DIR/.zshrc"
cp -r ~/.python/scripts "$REPO_DIR/python-scripts"
cp -r ~/scripts "$REPO_DIR/scripts"

# Git stuff
git add .
git commit -m "🔄 Auto backup on $(date '+%Y-%m-%d %H:%M:%S')"
git push

