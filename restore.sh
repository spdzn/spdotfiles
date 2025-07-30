#!/bin/bash

# -----------------------
# RESTORE DOTFILES SCRIPT
# -----------------------

echo "Restoring dotfiles from GitHub..."

# Clone dotfiles (skip if already cloned)
if [ ! -d "$HOME/spdotfiles" ]; then
    git clone https://github.com/spdzn/spdotfiles.git "$HOME/spdotfiles"
fi

cd "$HOME/spdotfiles" || exit

echo "Copying dotfiles to correct locations..."

# Define dotfile targets
cp -rv .zshrc ~/
cp -rv .xinitrc ~/
cp -rv .config/nvim ~/.config/
cp -rv .config/zathura ~/.config/
cp -rv .config/scripts ~/.config/
cp -rv .python/scripts ~/.python/
cp -rv .config/geany ~/.config/

echo "✅ Dotfiles copied!"

