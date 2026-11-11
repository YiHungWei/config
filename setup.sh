#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "==> Setting up dotfiles from $DOTFILES_DIR"

# 1. Symlink configuration files to $HOME
for file in .tmux.conf .vimrc .gitconfig; do
    target="$HOME/$file"
    source="$DOTFILES_DIR/$file"

    if [ ! -f "$source" ]; then
        continue
    fi

    if [ -L "$target" ] && [ "$(readlink "$target")" = "$source" ]; then
        echo "    ~/$file already linked"
    else
        ln -sf "$source" "$target"
        echo "    Linked ~/$file -> $source"
    fi
done

# 2. Install TPM (tmux plugin manager) if missing
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [ ! -d "$TPM_DIR" ]; then
    echo "==> Cloning TPM (tmux plugin manager)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
else
    echo "    TPM already installed"
fi

# 3. Install tmux plugins if tmux is available
if command -v tmux >/dev/null 2>&1; then
    if [ -x "$TPM_DIR/bin/install_plugins" ]; then
        echo "==> Ensuring tmux plugins are installed..."
        "$TPM_DIR/bin/install_plugins" >/dev/null 2>&1 || true
    fi

    # If a tmux server is already running, reload the config
    if tmux ls >/dev/null 2>&1; then
        tmux source-file "$HOME/.tmux.conf" 2>/dev/null || true
        echo "    Reloaded running tmux session"
    fi
else
    echo "    Note: tmux is not installed yet; install it and re-run setup.sh"
fi

echo "==> Setup complete!"
