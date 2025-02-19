# Configs that need to also be available to non-interactive shells (like PATH)
# should go here not in zshrc!

export EDITOR="vim"
export SVN_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export HGEDITOR="$EDITOR"

export P4DIFF="icdiff"
# GC time for unused Mosh sessions. Value is 3 days in seconds.
export MOSH_SERVER_NETWORK_TMOUT=259200

# NOTE: See comments in zprofile.zsh to understand how OSX munges our PATH.
declare -a paths=(
  $HOME/bin
  $HOME/.local/bin
  /opt/homebrew/bin
  /opt/homebrew/sbin
  /usr/local/bin
  /snap/bin
  $PATH
  $HOME/.cargo/bin
  $HOME/.yarn/bin
  $HOME/.rvm/bin
  $HOME/.npm-global/bin
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
. "$HOME/.cargo/env"
