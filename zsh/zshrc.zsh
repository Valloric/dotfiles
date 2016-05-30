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
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx vundle pip brew)

export EDITOR="e-wait"
export SVN_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"

export P4DIFF="meld"
export PATH=$HOME/bin:$PATH:$HOME/bin/p4v/bin:$HOME/.cargo/bin

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

source $ZSH/oh-my-zsh.sh

# load company-specific stuff
local comp_zshrc=$HOME/linkedin/zshrc_linkedin.zsh
if [[ -a $comp_zshrc ]] then
  source $comp_zshrc
fi

# This turns of zsh's "helpful" autocorrect feature
unsetopt correct_all

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Set up RVM so "rvm use 2.0.0" works
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# FZF setup; https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS="
--extended-exact
--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
--color info:144,prompt:161,spinner:135,pointer:135,marker:118
"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f ~/.LESS_TERMCAP ] && source ~/.LESS_TERMCAP


# added by travis gem
[ -f /home/valloric/.travis/travis.sh ] && source /home/valloric/.travis/travis.sh
