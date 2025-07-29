#!/bin/bash

set -e

echo "📦 Backing up your selected dotfiles..."

# Define your repo base
REPO_DIR="$HOME/spdotfiles"

# Create required dirs in repo if missing
mkdir -p "$REPO_DIR/home/.python/scripts"
mkdir -p "$REPO_DIR/home/.config/scripts"
mkdir -p "$REPO_DIR/home/.config/zathura"
mkdir -p "$REPO_DIR/home/.config/nvim"
mkdir -p "$REPO_DIR/home/.config/geany"

# Copy the files/folders
cp -r "$HOME/.python/scripts/"       "$REPO_DIR/home/.python/"
cp -r "$HOME/.config/scripts/"       "$REPO_DIR/home/.config/"
cp -r "$HOME/.config/zathura/"       "$REPO_DIR/home/.config/"
cp -r "$HOME/.config/nvim/"          "$REPO_DIR/home/.config/"
cp -r "$HOME/.config/geany/"         "$REPO_DIR/home/.config/"
cp "$HOME/.zshrc"                    "$REPO_DIR/home/"
cp "$HOME/.xinitrc"                  "$REPO_DIR/home/"

echo "✅ Done. Dotfiles backed up to $REPO_DIR"

