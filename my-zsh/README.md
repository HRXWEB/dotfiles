# my-zsh

这里放我自己的 Zsh 配置，由这个 dotfiles 仓库通过 GNU Stow 管理。

## 目录结构

- `utils.zsh`：个人 alias、函数、环境变量和工具初始化。
- `themes/mydpoggi.zsh-theme`：自定义 Oh My Zsh 主题。

这个仓库的 `.stowrc` 配置了：

```text
--target=~/.config
```

所以在仓库根目录执行：

```sh
stow .
```

会把本目录链接到：

```text
~/.config/my-zsh
```

## 新机器配置步骤

先在 dotfiles 仓库根目录部署所有配置：

```sh
stow .
```

然后安装 Oh My Zsh，并编辑 `~/.zshrc`。

在 `source $ZSH/oh-my-zsh.sh` 之前设置自定义目录和主题：

```zsh
ZSH_CUSTOM="$HOME/.config/my-zsh"
ZSH_THEME="mydpoggi"
```

在 `source $ZSH/oh-my-zsh.sh` 之后加载个人工具：

```zsh
[[ -r "$HOME/.config/my-zsh/utils.zsh" ]] && source "$HOME/.config/my-zsh/utils.zsh"
```

## 维护原则

`~/.zshrc` 继续使用 Oh My Zsh 生成的模板，只保留 Oh My Zsh 自己的初始化、
插件列表、主题选择等内容。

个人 shell 逻辑放到 `utils.zsh` 里，这样更新 Oh My Zsh 或重新生成 `.zshrc`
时，不容易和自己的配置互相覆盖。
