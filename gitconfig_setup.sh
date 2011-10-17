#!/bin/bash

git config --global user.name "Strahinja Markovic"

current_email=$(git config --global --get user.email)

# if current_email is empty, then add an email
if [[ -z "$current_email" ]]
then
    git config --global user.email "strahinja.markovic@gmail.com"
fi

git config --global github.user valloric

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.d difftool
git config --global alias.sub submodule

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

platform=$(uname)

# If we are on mac, we use opendiff instead of gvimdiff
if [[ $platform == *Darwin* ]]
then
    git config --global diff.tool opendiff
else
    git config --global diff.tool gvimdiff
fi

git config --global difftool.prompt false

script_dir="$( cd "$( dirname "$0" )" && pwd )"

git config --global alias.meld "!$script_dir/bin/git-meld/git-meld.pl"

