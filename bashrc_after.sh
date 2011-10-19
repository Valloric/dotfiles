#!/bin/bash

if [[ -f ~/.completion_bash.sh ]]; then
    source ~/.completion_bash.sh
fi

if [[ -f ~/.aliases_bash.sh ]]; then
    source ~/.aliases_bash.sh
fi

# This is all for the bash prompt; it shows the current git branch
c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`

parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
  then
          gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
          return 0
  fi
  echo -e $gitver
}

branch_color ()
{
        if git rev-parse --git-dir >/dev/null 2>&1
        then
                # we color the branch name green if there are no unstanged
                # changes, and red if there are some
                color=""
                if git diff --quiet 2>/dev/null >&2
                then
                        color="${c_green}"
                else
                        color=${c_red}
                fi
        else
                return 0
        fi
        echo -ne $color
}

branch_display ()
{
  if [[ $(parse_git_branch) ]]
  then
    echo -ne "[$(branch_color)$(parse_git_branch)${c_sgr0}] "
  else
    echo ""
  fi
}

PS1='$(branch_display)\u@\[${c_red}\]\w\[${c_sgr0}\]: '

# We want bash to be case-insensitive for tab completion
bind 'set completion-ignore-case on'

# for macs, we should do export EDITOR="mvim -f"
# and gvim otherwise

export PATH=$PATH:$HOME/bin

