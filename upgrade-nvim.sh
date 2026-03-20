#!/bin/bash
# Upgrade Neovim to latest version on Ubuntu

set -e

echo "=== Upgrading Neovim to latest version ==="

# Remove old nvim
echo "Removing old nvim..."
sudo apt remove -y neovim

# Add neovim unstable PPA
echo "Adding Neovim unstable PPA..."
sudo add-apt-repository -y ppa:neovim-ppa/unstable

# Update and install
echo "Installing latest Neovim..."
sudo apt update
sudo apt install -y neovim

# Verify installation
echo ""
echo "=== Neovim upgraded! ==="
nvim --version | head -3
