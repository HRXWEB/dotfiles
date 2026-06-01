# ~/.config/tmux/tmux.conf

## Install

### 1. Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 2. Sync only tmux config (not other dotfiles)

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) for dotfile management. To sync **only tmux** without touching other configs:

```bash
# Create target directory first
mkdir -p ~/.config/tmux

# Stow only the tmux package into ~/.config/tmux/
stow --target=$HOME/.config/tmux -d /path/to/dotfiles/tmux .
```

Or simply symlink the whole directory:

```bash
ln -s /path/to/dotfiles/tmux ~/.config/tmux
```

### 3. Install plugins

Start tmux, then press `prefix + I` (default prefix is `Ctrl+B`, then uppercase `I`).

Plugins will be installed to `~/.config/tmux/plugins/`.

## Run

`Ctrl+I` — Install new plugins declared in `tmux.conf`
