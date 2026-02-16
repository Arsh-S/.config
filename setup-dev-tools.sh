#!/bin/bash
# Install development version managers and tools

set -e

echo "=== Installing Development Tools ==="

# Install pyenv
echo "Installing pyenv..."
if [ ! -d "$HOME/.pyenv" ]; then
    curl https://pyenv.run | bash

    # Add to zshrc if not already there
    grep -q 'PYENV_ROOT' ~/.zshrc || cat >> ~/.zshrc << 'EOF'

# Pyenv configuration
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
EOF
else
    echo "pyenv already installed, skipping..."
fi

# Install nvm
echo "Installing nvm (Node Version Manager)..."
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

    # Add to zshrc if not already there
    grep -q 'NVM_DIR' ~/.zshrc || cat >> ~/.zshrc << 'EOF'

# NVM configuration
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
EOF
else
    echo "nvm already installed, skipping..."
fi

# Install Docker
echo "Installing Docker..."
if ! command -v docker &> /dev/null; then
    # Add Docker's official GPG key
    sudo apt-get update
    sudo apt-get install -y ca-certificates curl
    sudo install -m 0755 -d /etc/apt/keyrings
    sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
    sudo chmod a+r /etc/apt/keyrings/docker.asc

    # Add the repository to Apt sources
    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update

    # Install Docker
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

    # Add user to docker group
    sudo usermod -aG docker $USER
    echo "NOTE: You'll need to log out and back in for docker group to take effect"
else
    echo "Docker already installed, skipping..."
fi

echo ""
echo "=== Development Tools Installed! ==="
echo "  - pyenv (Python version manager)"
echo "  - nvm (Node version manager)"
echo "  - Docker (with docker-compose)"
echo ""
echo "After reloading shell, you can:"
echo "  - Install Python: pyenv install 3.12.0 && pyenv global 3.12.0"
echo "  - Install Node: nvm install --lts && nvm use --lts"
echo "  - Test Docker: docker run hello-world"
