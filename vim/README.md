# Vim Config

## Files

- `.vimrc` — main vim configuration

## Setup

This config lives in `~/.config/vim/` instead of `~/` to stay consistent with other dotfiles under `~/.config/`.

Add to your shell profile (`.zshrc` / `.bashrc`):

```bash
export VIMINIT='source ~/.config/vim/.vimrc'
```

## Sync with stow

```bash
stow --target=$HOME/.config/vim vim
```
