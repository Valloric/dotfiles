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
git config --global alias.unstage "reset HEAD"
git config --global alias.dst "diff --staged"
git config --global alias.cp "cherry-pick"

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

git config --global color.ui true

git config --global diff.tool meld
git config --global difftool.prompt false
git config --global merge.tool p4merge

# With this, "git pull --rebase" is the default form of pull
git config --global branch.autosetuprebase always

# This converts CRLF endings to LF endings on Mac & Lin and also keeps them in
# the repo, but for Windows checkouts it converts LF to CRLF (and back to LF on
# commits)
git config --global core.autocrlf input

script_dir="$( cd "$( dirname "$0" )" && pwd )"

git config --global alias.meld "!$script_dir/bin/git-meld/git-meld.pl"
