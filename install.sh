#!/bin/bash
set -e

# Install apt deps
sudo apt update
sudo apt install -y wget curl neovim fzf git tmux build-essential

REPO_URL="https://raw.githubusercontent.com/leftmain/environment/master"

# Download nvim config
NVIM_DIR="$HOME/.config/nvim"
mkdir -p "$NVIM_DIR/colors" "$NVIM_DIR/after/ftplugin"
NVIM_CONFIG_URL="$REPO_URL/nvim"
wget -qO "$NVIM_DIR/init.lua" "$NVIM_CONFIG_URL/init.lua"
wget -qO "$NVIM_DIR/colors/mine.vim" "$NVIM_CONFIG_URL/colors/mine.vim"
wget -qO "$NVIM_DIR/after/ftplugin/c.vim" "$NVIM_CONFIG_URL/after/ftplugin/c.vim"

# Install nvim plugins
nvim --headless "+Lazy! sync" +qa

# Copy dotfiles
wget -qO "$HOME/.vimrc" "$REPO_URL/.vimrc"
wget -qO "$HOME/.tmux.conf" "$REPO_URL/.tmux.conf"

# Install atuin
curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
mkdir -p "$HOME/.config/atuin"
wget -qO "$HOME/.config/atuin/config.toml" "$REPO_URL/atuin/config.toml"

# Install Rust/cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

# Install zellij
cargo install --locked zellij
mkdir -p "$HOME/.config/zellij"
wget -qO "$HOME/.config/zellij/config.kdl" "$REPO_URL/zellij/config.kdl"

