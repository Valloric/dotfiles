#!/bin/zsh

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_ADDED="%{$fg_bold[green]%}+%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg_bold[blue]%}!%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg_bold[red]%}-%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg_bold[magenta]%}>%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg_bold[yellow]%}#%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg_bold[cyan]%}?%{$reset_color%}"

GIT_PROMPT_PREFIX="%{$fg[white]%}[%{$reset_color%}%{$fg[green]%}"
GIT_PROMPT_SUFFIX="%{$fg[white]%}]%{$reset_color%} "

function git_prompt() {
    info=$(git_prompt_info)
    if [[ "x$info" != "x" ]]; then
        echo "$GIT_PROMPT_PREFIX$(git_prompt_info) $(git_prompt_status)$GIT_PROMPT_SUFFIX"
    fi
}


PROMPT=$'%{$fg[yellow]%}${PWD/#$HOME/~}%{$reset_color%} $(git_prompt)%{$fg[magenta]%}%n@%m %{$reset_color%}%{$fg[cyan]%}%D{[%H:%M:%S]} %{$reset_color%}\
%{$fg[red]%}➜ %{$reset_color%} '

