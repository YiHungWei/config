# config

Personal dotfiles: `.tmux.conf`, `.vimrc`, `.gitconfig`.

## tmux

### Setup

```bash
git clone git@github.com:YiHungWei/config.git ~/git/config
ln -sf ~/git/config/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start `tmux`, then press `Ctrl-a I` to install plugins.

If tmux was already running, reload with `tmux source-file ~/.tmux.conf`.

### Terminal settings

- **iTerm2**
  - Settings → General → Selection → enable **"Applications in terminal may
    access clipboard"** (so copying in tmux reaches the Mac clipboard).
  - Settings → Profiles → Keys → **Left Option key: Esc+** (for `Alt+Arrow`).
- **Windows**: run PowerShell / WSL inside **Windows Terminal** (not the
  legacy console) so copying in tmux reaches the Windows clipboard.

### Updating

```bash
cd ~/git/config && git pull
```

Then `Ctrl-a r` inside tmux.

### Key bindings

Prefix is **`Ctrl-a`** (press it, release, then press the key).

| Keys | Action |
|---|---|
| `prefix c` | New window (in current directory) |
| `prefix s` / `prefix v` | Split top/bottom / side-by-side (vim-style) |
| `prefix h j k l` | Move to pane left/down/up/right |
| `Alt + Arrow` | Move to pane (no prefix) |
| `prefix < > - +` | Resize pane (repeatable) |
| `Shift + Left/Right` | Previous / next window |
| `Shift + Up/Down` | Move current window left / right |
| `prefix [` | Copy mode, then `v` select, `V` line, `Ctrl-v` block, `y` copy |
| `prefix p` | Paste |
| `prefix r` | Reload config |
| `prefix d` | Detach |
| `prefix Ctrl-s` / `prefix Ctrl-r` | Save / restore sessions (resurrect) |
| `prefix I` | Install plugins (tpm) |
| `prefix Ctrl-a` | Send a literal `Ctrl-a` |

The session name on the left of the status bar turns orange while the prefix
is active.
