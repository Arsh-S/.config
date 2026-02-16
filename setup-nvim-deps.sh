#!/bin/bash
# Neovim dependencies installation script for Ubuntu

set -e

echo "=== Installing Neovim Dependencies ==="

# Update package list
echo "Updating package list..."
sudo apt update

# Install Node.js, npm, and other apt packages
echo "Installing Node.js, npm, Python pip, Go, Ruby, cmake, and build tools..."
sudo apt install -y \
    nodejs \
    npm \
    python3-pip \
    golang-go \
    ruby-full \
    cmake \
    build-essential \
    ripgrep \
    fd-find

# Install Rust (non-interactive)
echo "Installing Rust..."
if ! command -v cargo &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust already installed, skipping..."
fi

# Verify installations
echo ""
echo "=== Verifying Installations ==="
echo "Node: $(node --version 2>&1 || echo 'NOT INSTALLED')"
echo "npm: $(npm --version 2>&1 || echo 'NOT INSTALLED')"
echo "Python: $(python3 --version 2>&1 || echo 'NOT INSTALLED')"
echo "pip3: $(pip3 --version 2>&1 || echo 'NOT INSTALLED')"
echo "Go: $(go version 2>&1 || echo 'NOT INSTALLED')"
echo "Ruby: $(ruby --version 2>&1 || echo 'NOT INSTALLED')"
echo "cargo: $(cargo --version 2>&1 || echo 'NOT INSTALLED')"
echo "cmake: $(cmake --version 2>&1 | head -1 || echo 'NOT INSTALLED')"
echo "ripgrep: $(rg --version 2>&1 | head -1 || echo 'NOT INSTALLED')"

echo ""
echo "=== Installation Complete! ==="
echo "Please run 'source ~/.zshrc' or restart your terminal"
echo "Then open nvim and run :MasonInstallAll"
