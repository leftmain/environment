#!/bin/bash
set -e

# Install neovim and fzf
sudo apt update
sudo apt install -y neovim fzf

# Download nvim config
NVIM_DIR="$HOME/.config/nvim"
mkdir -p "$NVIM_DIR/colors" "$NVIM_DIR/after/ftplugin"
BASE_URL="https://raw.githubusercontent.com/leftmain/environment/master/nvim"
wget -qO "$NVIM_DIR/init.lua" "$BASE_URL/init.lua"
wget -qO "$NVIM_DIR/colors/mine.vim" "$BASE_URL/colors/mine.vim"
wget -qO "$NVIM_DIR/after/ftplugin/c.vim" "$BASE_URL/after/ftplugin/c.vim"

# Install plugins
nvim --headless "+Lazy! sync" +qa
