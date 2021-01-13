# configs

These are the bare minimal configs needed for work.

## Setup

```sh
chmod +x scripts/autoscript
```

### Aliases

### vim

Install vundle following the instructions [here](https://github.com/VundleVim/Vundle.vim#quick-start).

```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

### zsh

**Install oh-my-zsh**

Follow instructions [here]().

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
rm .zshrc
mv .zshrc.pre-oh-my-zsh .zshrc
```

**Install plugins**

- [zsh-z](https://github.com/agkozak/zsh-z#installation)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)
- [common theme](https://github.com/jackharrisonsherlock/common#installation)

```sh
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
wget -O $ZSH_CUSTOM/themes/common.zsh-theme https://raw.githubusercontent.com/jackharrisonsherlock/common/master/common.zsh-theme
```

**Note:** Remember to source `.zshrc` at the end.
