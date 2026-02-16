#!/bin/bash
# Install useful CLI tools and configurations

set -e

echo "=== Installing Useful CLI Tools ==="

# Install essential tools via apt
echo "Installing CLI tools via apt..."
sudo apt install -y \
    fzf \
    bat \
    zoxide \
    tldr

# Install eza (better ls)
echo "Installing eza..."
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza

# Install lazygit
echo "Installing lazygit..."
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz

# Install git-delta
echo "Installing git-delta..."
DELTA_VERSION=$(curl -s "https://api.github.com/repos/dandavison/delta/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
curl -Lo delta.deb "https://github.com/dandavison/delta/releases/latest/download/git-delta_${DELTA_VERSION}_amd64.deb"
sudo dpkg -i delta.deb
rm delta.deb

# Install Tmux Plugin Manager
echo "Installing Tmux Plugin Manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo ""
echo "=== Setting up shell aliases ==="
cat >> ~/.zshrc << 'EOF'

# CLI tool aliases
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias cat='batcat'  # Ubuntu ships bat as batcat
alias cd='z'  # Use zoxide for smarter cd

# Initialize zoxide
eval "$(zoxide init zsh)"
EOF

echo ""
echo "=== Setup Complete! ==="
echo "Installed:"
echo "  - fzf (fuzzy finder)"
echo "  - bat (better cat)"
echo "  - eza (better ls)"
echo "  - zoxide (smarter cd)"
echo "  - lazygit (terminal UI for git)"
echo "  - delta (better git diffs)"
echo "  - tldr (simplified man pages)"
echo "  - TPM (Tmux Plugin Manager)"
echo ""
echo "Next steps:"
echo "1. Restart your shell: source ~/.zshrc"
echo "2. Install tmux plugins: Open tmux and press Prefix + I (Ctrl+b then I)"
echo "3. Configure delta for git: git config --global core.pager delta"
