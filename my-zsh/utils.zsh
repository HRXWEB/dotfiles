# Personal zsh utilities loaded after Oh My Zsh.

run_docker() {
  if [ -z "$1" ]; then
    echo "please provide docker image name"
    echo "ie: nvcr.io/nvidia/pytorch:23.07-py3"
    return
  fi

  local container_name
  container_name="$(whoami)_$(jot -r 1 10000 99999)"
  echo -e "container_name is $container_name"

  docker run -itd -u "$(id -u)" --name "$container_name" \
    --ipc=host \
    --privileged --net=host \
    --ulimit memlock=-1 --ulimit stack=67108864 \
    --mount "src=$HOME/Archive/nova,target=/Workshop,type=bind" \
    "$1" bash

  echo -e "\033[1;32mCreate Container: $container_name\033[0m"
  docker exec -it -u root "$container_name" /bin/bash
}

set_proxy() {
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export no_proxy="localhost,127.0.0.1,192.168.0.0/16"
}

unset_proxy() {
  unset https_proxy
  unset http_proxy
  unset all_proxy
  unset no_proxy
}

alias ts=tailscale

mnt_sfb() {
  sudo mount -t nfs 192.168.5.23:/cpfs/SFBperception "$HOME/Archive/nova/perception"
}

umnt_sfb() {
  sudo diskutil unmount "$HOME/Archive/nova/perception" || sudo umount -f "$HOME/Archive/nova/perception"
}

set_nvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
set_nvm

alias goquartz="cd '$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/quartz'"

if [ -x "$HOME/miniforge3/bin/conda" ]; then
  __conda_setup="$("$HOME/miniforge3/bin/conda" "shell.zsh" "hook" 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  elif [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniforge3/etc/profile.d/conda.sh"
  else
    export PATH="$HOME/miniforge3/bin:$PATH"
  fi
  unset __conda_setup
fi

if [ -x "$HOME/miniforge3/bin/mamba" ]; then
  export MAMBA_EXE="$HOME/miniforge3/bin/mamba"
  export MAMBA_ROOT_PREFIX="$HOME/miniforge3"
  __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
  else
    alias mamba="$MAMBA_EXE"
  fi
  unset __mamba_setup
fi

export PATH="$HOME/.local/bin:$PATH"

y() {
  local tmp cwd
  tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  rm -f -- "$tmp"
}

ydoc() {
  echo "https://wangchujiang.com/reference/docs/yazi.html"
  echo "https://yazi-rs.github.io/docs/configuration/yazi"
}

alias lg=lazygit
alias cc=claude
alias ccc="claude -c"
alias ccr="claude -r"

export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC="1"
export CLAUDE_CODE_LOG_LEVEL="debug"

[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export VIMINIT="source ~/.config/vim/.vimrc"

notify() {
  local title="${1:-通知}"
  local body="${2:-任务已完成}"
  if [[ -n "$TMUX" ]]; then
    printf "\ePtmux;\e\e]777;notify;%s;%s\a\e\\\\" "$title" "$body"
    return
  fi

  command cmux notify --title "$title" --body "$body"
}
