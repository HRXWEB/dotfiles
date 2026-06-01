# ~/.config/tmux/tmux.conf

## Install

### 1. Install TPM (Tmux Plugin Manager)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

### 2. Sync with stow

```bash
stow --target=$HOME/.config/tmux tmux
```

### 3. Install plugins

Start tmux, then press `prefix + I` (default prefix is `Ctrl+B`, then uppercase `I`).

Plugins will be installed to `~/.config/tmux/plugins/`.

## Run

`Ctrl+I` — Install new plugins declared in `tmux.conf`
