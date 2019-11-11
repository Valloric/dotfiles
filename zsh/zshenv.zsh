# Configs that need to also be available to non-interactive shells (like PATH)
# should go here not in zshrc!

export EDITOR="gvim -f"
export SVN_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"

export P4DIFF="meld"
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH:$HOME/.cargo/bin

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


# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# load company-specific stuff
local comp_zsh=$HOME/linkedin/zshenv_linkedin.zsh
if [[ -a $comp_zsh ]] then
   source $comp_zsh
fi
