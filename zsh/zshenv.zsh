# Configs that need to also be available to non-interactive shells (like PATH)
# should go here not in zshrc!

export EDITOR="nvim -f"
export SVN_EDITOR="$EDITOR"
export VISUAL="$EDITOR"
export GIT_EDITOR="$EDITOR"
export HGEDITOR="$EDITOR"

export P4DIFF="meld"

declare -a paths=(
  $HOME/bin
  $HOME/.local/bin
  /usr/local/bin
  $PATH
  $HOME/.cargo/bin
  $HOME/.yarn/bin
  $HOME/.rvm/bin
)
export PATH=${(j/:/)paths}

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
