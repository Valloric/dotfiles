#!/bin/bash

if [[ -f /etc/bash-completion.d/git ]]; then
    source /etc/bash_completion.d/git
elif [[ -f ~/.git-completion.bash ]]; then
    source ~/.git-completion.bash
fi


