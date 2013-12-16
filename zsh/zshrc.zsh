# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#
# This theme exists ONLY in our custom fork of oh-my-zsh
ZSH_THEME="valloric"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx vundle pip brew)

# Every terminal we use supports 256 colors; iTerm2 on Mac and gnome-terminal on
# linux
TERM=xterm-256color

export EDITOR="gvim -u $HOME/.vimrc -N -U NONE -f"
export P4DIFF="meld"
export PATH=$PATH:$HOME/bin:$HOME/bin/p4v/bin

platform=$(uname)

if [[ $platform == *Darwin* ]]
then
  # This makes our PATH visible to GUI apps
  launchctl setenv PATH $PATH

  # Brew paths over system paths
  export PATH=/usr/local/bin:/usr/local/sbin:$PATH

  # NPM binaries on PATH as well
  export PATH=/usr/local/share/npm/bin:$PATH
fi

# load google-specific stuff
local gzshrc=$HOME/google/zshrc_google.zsh
if [[ -a $gzshrc ]] then
  source $gzshrc
fi

source $ZSH/oh-my-zsh.sh

# This turns of zsh's "helpful" autocorrect feature
unsetopt correct_all

# Commands prefixed with a space don't go into history
setopt HIST_IGNORE_SPACE
