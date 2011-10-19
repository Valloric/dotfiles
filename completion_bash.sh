#!/bin/bash

if [ -f /etc/bash-completion.d/git ]; then
    source /etc/bash_completion.d/git
elif [ -f $HOME/.git-completion.bash ]; then
    source $HOME/.git-completion.bash
fi


