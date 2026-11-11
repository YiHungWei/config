# config

Personal dotfiles: `.tmux.conf`, `.vimrc`, `.gitconfig`.

## Quick Start (New Machine)

```bash
git clone git@github.com:YiHungWei/config.git ~/git/config
cd ~/git/config && ./setup.sh
```

`setup.sh` symlinks all dotfiles to `$HOME`, installs TPM, and installs tmux plugins automatically.

## tmux

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

## vim

Built on top of Vim's own `defaults.vim` (syntax highlighting, filetype
indent, incremental search, return to last edit position, ...).

| Area | Setting / key | What it does |
|---|---|---|
| Search | `hlsearch` | Highlight all matches of the last search |
| Search | `ignorecase smartcase` | Case-insensitive search unless an uppercase letter is typed |
| Search | `Ctrl-l` | Clear search highlight (and redraw) |
| UI | `laststatus=2` | Always show the status line (file name, modified flag) |
| Mouse | `mouse=a` | Click, scroll, select, resize splits. Hold `Option` (iTerm2) / `Shift` (Windows Terminal) to use the terminal's own selection |
| Mouse | `ttymouse=sgr` | Makes split dragging and wide screens work inside tmux |
| Indent | `expandtab shiftwidth=4 softtabstop=4` | Tab inserts 4 spaces; Backspace deletes 4. Existing tabs display at the standard width 8. Per-language settings may override (Go, Makefile) |
| Indent | `<F7>` | Toggle current buffer between spaces (4) and real tabs (8) |
| Spell | `<F8>` | Toggle English (`en_us`) spell check on/off |
| UI | `<F9>` | Toggle line numbers on/off (off by default) |
