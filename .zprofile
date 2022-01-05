PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
#
#if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#  exec startx
#fi

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/mnt/woodstock/android/platform-tools:$PATH"
export ANDROID_HOME="/mnt/woodstock/android"
