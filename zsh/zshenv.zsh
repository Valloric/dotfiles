# Configs that need to also be available to non-interactive shells (like PATH)
# should go here not in zshrc!

export EDITOR="vim"
export SVN_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export HGEDITOR="$EDITOR"

# Python, my man, please stop littering my repos with pyc files!
export PYTHONPYCACHEPREFIX=${TMPDIR}

export P4DIFF="icdiff"
# GC time for unused Mosh sessions. Value is 3 days in seconds.
export MOSH_SERVER_NETWORK_TMOUT=259200

# Set the config file
export BAT_CONFIG_PATH="$HOME/dotfiles/misc/batrc"

# Load our `less` config (all env vars)
source "$HOME/dotfiles/less/lessrc"

# `groff` is used by `man` and we want it to produce ANSI escape sequences
# that `less` knows how to render.
export GROFF_NO_SGR=1
# `man` now uses our fancy `less` config so we get colors, italic, and bold.
export MANPAGER="less"

# NOTE: See comments in zprofile.zsh to understand how OSX munges our PATH.
declare -a paths=(
  $HOME/bin
  $HOME/.local/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /snap/bin
  $PATH
  $HOME/.juliaup/bin
  $HOME/.cargo/bin
  $HOME/.yarn/bin
  $HOME/.rvm/bin
  $HOME/.npm-global/bin
  $HOME/.lmstudio/bin
)
export PATH=${(j/:/)paths}

platform=$(uname)

if [[ $platform == *Darwin* ]]
then
  # This makes our PATH visible to GUI apps
  launchctl setenv PATH $PATH
else
  export XDG_DATA_DIRS="$HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:$XDG_DATA_DIRS"
fi

# Source Cargo's env vars
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"
