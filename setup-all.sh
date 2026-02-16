#!/bin/bash
# Master setup script - runs all setup scripts

set -e

echo "========================================"
echo "   Complete Thinkpad Setup Script"
echo "========================================"
echo ""
echo "This will install:"
echo "  1. CLI Tools (fzf, bat, eza, zoxide, lazygit, delta, tldr, tmux plugins)"
echo "  2. Development Tools (pyenv, nvm, Docker)"
echo "  3. Productivity Tools (gh, just, btop, htop, tree, ncdu, jq)"
echo "  4. Dotfiles Auto-Sync"
echo ""
echo "This may take 10-15 minutes and will require sudo password."
echo ""
read -p "Continue? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "Setup cancelled"
    exit 1
fi

echo ""
echo "========================================"
echo "Step 1/4: CLI Tools"
echo "========================================"
./setup-cli-tools.sh

echo ""
echo "========================================"
echo "Step 2/4: Development Tools"
echo "========================================"
./setup-dev-tools.sh

echo ""
echo "========================================"
echo "Step 3/4: Productivity Tools"
echo "========================================"
./setup-productivity.sh

echo ""
echo "========================================"
echo "Step 4/4: Dotfiles Auto-Sync"
echo "========================================"
./setup-dotfiles-sync.sh

echo ""
echo "========================================"
echo "   ✅ SETUP COMPLETE!"
echo "========================================"
echo ""
echo "🎉 All tools installed successfully!"
echo ""
echo "Next steps:"
echo "  1. Reload your shell: exec zsh"
echo "  2. Open tmux and install plugins: tmux, then press Ctrl+b then I"
echo "  3. Install Python: pyenv install 3.12.0 && pyenv global 3.12.0"
echo "  4. Install Node: nvm install --lts && nvm use --lts"
echo "  5. Auth GitHub CLI: gh auth login"
echo "  6. Test Docker: docker run hello-world (after logout/login)"
echo ""
echo "📚 New commands available:"
echo "  - ls/ll         → eza (better ls)"
echo "  - cat           → bat (better cat)"
echo "  - cd            → zoxide (smarter cd)"
echo "  - lazygit       → git UI"
echo "  - btop          → system monitor"
echo "  - sync-dotfiles → sync dotfiles from git"
echo "  - push-dotfiles → push dotfiles to git"
echo ""
echo "Enjoy your fully configured Thinkpad! 🚀"
