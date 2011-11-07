#!/bin/zsh

PROMPT=$'%{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt_info)%{$fg[magenta]%}%n@%m %{$reset_color%}%{$fg[cyan]%}%D{[%H:%M:%S]} %{$reset_color%}\
%{$fg[red]%}➜ %{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[white]%}[%{$reset_color%}%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

