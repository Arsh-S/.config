#!/bin/bash
# Install productivity and system monitoring tools

set -e

echo "=== Installing Productivity Tools ==="

# Install gh (GitHub CLI)
echo "Installing GitHub CLI..."
if ! command -v gh &> /dev/null; then
    (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y
else
    echo "gh already installed, skipping..."
fi

# Install just (command runner)
echo "Installing just..."
if ! command -v just &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to ~/.local/bin
else
    echo "just already installed, skipping..."
fi

# Install btop (better system monitor)
echo "Installing btop..."
if ! command -v btop &> /dev/null; then
    sudo apt install -y btop
else
    echo "btop already installed, skipping..."
fi

# Install htop (system monitor)
echo "Installing htop..."
sudo apt install -y htop

# Install other useful tools
echo "Installing additional tools..."
sudo apt install -y \
    tree \
    ncdu \
    jq \
    curl \
    wget \
    unzip \
    tmux \
    vim

echo ""
echo "=== Productivity Tools Installed! ==="
echo "  - gh (GitHub CLI)"
echo "  - just (Command runner)"
echo "  - btop (System monitor)"
echo "  - htop (System monitor)"
echo "  - tree (Directory viewer)"
echo "  - ncdu (Disk usage analyzer)"
echo "  - jq (JSON processor)"
echo ""
echo "Try them out:"
echo "  - gh auth login  # Authenticate with GitHub"
echo "  - btop           # View system resources"
echo "  - ncdu ~         # Analyze disk usage"
