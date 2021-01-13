# configs

These are the bare minimal configs needed for work.

## Setup

### Clone repo with aliases

```sh
git clone --bare https://github.com/torvarun/configs.git $HOME/.cfg

# Keep this in a bashrc or an equivalent file
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

config checkout --track origin work/base
config checkout -b work/<descriptive-branch-name>
config config --local status.showUntrackedFiles no
config add <file-to-backup>
config commit -m "initial commit"
config push --set-upstream origin <descriptive-branch-name>
```

### scripts

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
