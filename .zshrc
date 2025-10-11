# Varun zshrc with antidote

source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ${ZDOTDIR:-$HOME}/.zsh_plugins.txt

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'

# zsh history
# https://unix.stackexchange.com/a/575102
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
unsetopt SHARE_HISTORY           # Do not share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
# setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
# setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
# setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
# setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

source ~/.shrc_general # General functions
alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias vimrc="vim ~/.vimrc"

PATH=$HOME/.local/bin:$PATH

# ssh
eval "$(ssh-agent -s)"
#ssh-add ~/.ssh/id_ed25519

# autoscript
PATH=$HOME/scripts:$PATH
alias ascript="autoscript"
alias as="autoscript"

# Global Variables
alias vim='nvim' # use neovim
export VISUAL=nvim # editor for crontab
export EDITOR=nvim # for C-xe
export GO111MODULE=on

# rust
. "$HOME/.cargo/env"

# ccache
export USE_CCACHE=1
export CCACHE_EXEC=$(command -v ccache)
export CCACHE_DIR=/mnt/ccache
PATH=/usr/lib/ccache:$PATH

# explicit recursive search for tmux
bindkey '^R' history-incremental-search-backward

# ctrl-XE for edit current cmd in vim
autoload edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# aliases
alias btm="btm --theme=nord-light --battery"
alias pidcat="python2 ~/scripts/pidcat.py"
alias ls="ls --color"

function help() {
    "$@" --help | less -
}

function notify() {
    "$@"
    local ret=?

    if [[ $ret -eq 0 ]] then
        notify-send "Command Successful" "$@"
    else
        notify-send "Command Failure" "$@"
    fi
}

fzf_git_branch() {
	git branch --color=always --all --sort=-committerdate |
        grep -v HEAD |
        fzf --height 50% --ansi --no-multi --preview-window right:65% \
            --preview 'git log -n 50 --color=always --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed "s/.* //" <<< {})' |
        sed "s/.* //"
}

function git_switch() {
    if [ "$#" -eq 1 ]; then
        git switch $1
        return
    fi

    local branch
    branch=$(fzf_git_branch)

    if [[ "$branch" = "" ]]; then
        echo "No branch selected";
        return
    fi

    git switch $branch
}
alias gswitch="git_switch"
alias gits="git_switch"

export FZF_DEFAULT_COMMAND="rg --files"

alias notes="$EDITOR ~/Documents/notes"

alias adbwfd="adb wait-for-device"
alias adbks="adb kill-server"
alias adbd="adb devices"
alias adbr="adb root"
alias adbs="adb shell"
alias adbre="adb remount"
alias adbrer="adb remount -R"
alias adbc="adb logcat -c"

alias emulator="emulator -no-audio -writable-system"

alias ass="adb sync && adb shell sync"

alias rgbp="rg -tamake"

alias plantuml="java -jar $HOME/plantuml.jar"

# . /usr/share/autojump/autojump.sh

# open fzf result in vim
alias f='$EDITOR "$(fzf)"'

function printrange() {
    #sed -n $1,${2}p $3
    sed -n $2,${3}p $1
}

source $HOME/.shrc_android

alias rgi="rg -i"
alias rgn="rg -v"
alias rgf="rg --files | rg"
alias rgfi="rg --files | rgi"
alias rgfn="rg --files | rgn"
alias logrg="adb logcat | rg"
alias logrgi="adb logcat | rgi"
alias logrgn="adb logcat | rgn"

alias create_ctags="ctags --recurse=yes --exclude=.git --exclude=.idea --exclude=.github --exclude=.gitignore"

# search ctags in fzf and open in vim
alias t='$EDITOR -t "$(cut -f1 tags | tail +7 | uniq | fzf"'

# fzf through rg query
function frg {
      result=$(rg --ignore-case --color=always --line-number --no-heading "$@" |
        fzf --ansi \
            --delimiter ':' \
            --preview "bat --color=always {1} --theme='Solarized (light)' --highlight-line {2}")
      file=${result%%:*}
      linenumber=$(echo "${result}" | cut -d: -f2)
      if [[ -n "$file" ]]; then
              $EDITOR +"${linenumber}" "$file"
      fi
    }

export RIPGREP_CONFIG_PATH="$HOME/.rg.conf"

alias vedit="open -e"
