#!/bin/bash
set -e

# Install neovim and fzf
sudo apt update
sudo apt install -y neovim fzf

# Clone repo if not already inside it
REPO_DIR="$HOME/environment"
if [ ! -d "$REPO_DIR/.git" ]; then
  git clone https://github.com/leftmain/environment.git "$REPO_DIR"
fi

# Symlink nvim config
mkdir -p ~/.config
ln -sfn "$REPO_DIR/nvim" ~/.config/nvim

# Install plugins
nvim --headless "+Lazy! sync" +qa
