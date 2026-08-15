#!/bin/bash
set -e

# Install apt deps
sudo apt update
sudo apt install -y wget curl neovim fzf git tmux build-essential ranger

# Setup git
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.ci commit
git config --global pull.rebase true

echo "=== Git User Configuration ==="
echo

# Get current global settings
CURRENT_NAME=$(git config --global user.name || echo "")
CURRENT_EMAIL=$(git config --global user.email || echo "")

# Display current configuration if it exists
if [ -n "$CURRENT_NAME" ]; then
    echo "Current global user.name:  $CURRENT_NAME"
else
    echo "Current global user.name:  (not set)"
fi

if [ -n "$CURRENT_EMAIL" ]; then
    echo "Current global user.email: $CURRENT_EMAIL"
else
    echo "Current global user.email: (not set)"
fi

echo
echo "Press Enter to keep the current value, or type a new one."
echo

# Prompt for user.name
read -r -p "Enter Git username [$CURRENT_NAME]: " NEW_NAME
if [ -n "$NEW_NAME" ]; then
    git config --global user.name "$NEW_NAME"
    echo "-> Updated user.name to: $NEW_NAME"
else
    echo "-> Kept existing user.name."
fi

echo

# Prompt for user.email
read -r -p "Enter Git email [$CURRENT_EMAIL]: " NEW_EMAIL
if [ -n "$NEW_EMAIL" ]; then
    git config --global user.email "$NEW_EMAIL"
    echo "-> Updated user.email to: $NEW_EMAIL"
else
    echo "-> Kept existing user.email."
fi

echo
echo "=== Success! Final Configuration ==="
echo "user.name  = $(git config --global user.name)"
echo "user.email = $(git config --global user.email)"


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
if ! command -v atuin &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh -s -- --non-interactive
fi
mkdir -p "$HOME/.config/atuin"
wget -qO "$HOME/.config/atuin/config.toml" "$REPO_URL/atuin/config.toml"

# Install Rust/cargo
if ! command -v cargo &>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi
. "$HOME/.cargo/env"

# Install zellij
if ! command -v zellij &>/dev/null; then
  cargo install --locked zellij
fi
mkdir -p "$HOME/.config/zellij"
wget -qO "$HOME/.config/zellij/config.kdl" "$REPO_URL/zellij/config.kdl"

