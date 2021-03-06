# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/torvarun/.oh-my-zsh"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Prompt to show Spotify status on powerline
# Taken From: https://github.com/bhilburn/powerlevel9k/wiki/Show-Off-Your-Config#semartins-configuration
prompt_zsh_showStatus () {
	local color='%F{white}'
  state=`osascript -e 'tell application "Spotify" to player state as string'`;
  if [ $state = "playing" ]; then
    artist=`osascript -e 'tell application "Spotify" to artist of current track as string'`;
    track=`osascript -e 'tell application "Spotify" to name of current track as string'`;

      echo -n "%{$color%}♬  $artist - $track " ;

  fi
}


POWERLEVEL9K_MODE="nerdfont-complete"      
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="▶ "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
if [ $(hostname) = "snoopy" ]; then
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
else
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
fi
# Don't use the spotify prompt because it is very slow
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(zsh_showStatus) 

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  Z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# rbenv
eval "$(rbenv init -)"

source ~/.shrc_general # General functions

alias zshrc="vim ~/.zshrc && source ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias icons.show="defaults write com.apple.finder CreateDesktop true"
alias icons.hide="defaults write com.apple.finder CreateDesktop false"
alias trash.empty="sudo rm -rfv ~/.Trash;"
alias trash.empty_all="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash;"
alias stream.nhl="open /Applications/LazyMan.jar"
alias update.all="sh ~/Documents/scripts/update.sh"
alias config='/usr/bin/git --git-dir=/Users/torvarun/.cfg/ --work-tree=/Users/torvarun'
alias cls='colorls'
alias ct='colorls --tree'

alias jobs='jobs -p'

# Android goodies
alias logcat="adb logcat -c && adb logcat"
alias screenshot="adb shell screencap /sdcard/screen.png && adb pull /sdcard/screen.png && adb shell rm /sdcard/screen.png"


# Function to serve the current dir using ruby with CORS enabled
# Serves at localhost:3000 by default
function serve {
  port="${1:-3000}"
  open http://localhost:$port
  ruby -run -e httpd . -p $port 
}


# Global Variables
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export GOOGLE_APPLICATION_CREDENTIALS="/Users/torvarun/googlepi-b51dc8a04e77.json"
export PATH="/usr/local/sbin:$PATH"
export VISUAL=vim # editor for crontab
source /Users/torvarun/.rbenv/versions/2.6.1/lib/ruby/gems/2.6.0/gems/colorls-1.1.1/lib/tab_complete.sh # colorls

# --- CS 246
alias uwl="ssh v5venkat@linux.student.cs.uwaterloo.ca"
