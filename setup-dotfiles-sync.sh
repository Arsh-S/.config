#!/bin/bash
# Set up automatic dotfiles sync

set -e

echo "=== Setting up Dotfiles Auto-Sync ==="

# Create a sync script
cat > ~/.local/bin/sync-dotfiles << 'EOF'
#!/bin/bash
# Auto-sync dotfiles from git repo

cd ~/.config || exit 1

# Check if we have changes to pull
git fetch origin master &>/dev/null

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL != $REMOTE ]; then
    echo "Syncing dotfiles..."

    # Stash any local changes
    if ! git diff-index --quiet HEAD --; then
        git stash save "Auto-stash before sync $(date +%Y-%m-%d_%H:%M:%S)"
        echo "Local changes stashed"
    fi

    # Pull latest
    git pull --rebase origin master
    echo "Dotfiles synced successfully!"

    # Reload zsh config if we're in a zsh session
    if [ -n "$ZSH_VERSION" ]; then
        source ~/.zshrc 2>/dev/null || true
    fi
else
    echo "Dotfiles already up to date"
fi
EOF

chmod +x ~/.local/bin/sync-dotfiles

# Add to zshrc to sync on shell start (but only once per day)
grep -q 'sync-dotfiles' ~/.zshrc || cat >> ~/.zshrc << 'EOF'

# Auto-sync dotfiles once per day
DOTFILES_SYNC_FLAG="$HOME/.cache/dotfiles_synced_today"
if [ ! -f "$DOTFILES_SYNC_FLAG" ] || [ "$(date +%Y-%m-%d)" != "$(cat $DOTFILES_SYNC_FLAG 2>/dev/null)" ]; then
    if command -v sync-dotfiles &> /dev/null; then
        sync-dotfiles &
        date +%Y-%m-%d > "$DOTFILES_SYNC_FLAG"
    fi
fi
EOF

# Create a push helper script
cat > ~/.local/bin/push-dotfiles << 'EOF'
#!/bin/bash
# Push dotfiles changes to git repo

cd ~/.config || exit 1

if git diff-index --quiet HEAD --; then
    echo "No changes to push"
    exit 0
fi

echo "Changes detected in dotfiles:"
git status --short

read -p "Commit message (or press Enter for auto-generated): " msg

if [ -z "$msg" ]; then
    msg="Update dotfiles on $(hostname) - $(date +%Y-%m-%d)"
fi

git add -A
git commit -m "$msg"
git push origin master

echo "Dotfiles pushed successfully!"
EOF

chmod +x ~/.local/bin/push-dotfiles

# Create cache directory
mkdir -p ~/.cache

echo ""
echo "=== Dotfiles Auto-Sync Setup Complete! ==="
echo ""
echo "Created commands:"
echo "  - sync-dotfiles   # Manually pull latest dotfiles"
echo "  - push-dotfiles   # Push your dotfile changes"
echo ""
echo "Auto-sync enabled:"
echo "  - Dotfiles will sync once per day when you open a new shell"
echo "  - Local changes are automatically stashed before sync"
echo ""
echo "Test it now: sync-dotfiles"
