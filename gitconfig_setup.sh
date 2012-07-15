#!/bin/bash

git config --global user.name "Strahinja Val Markovic"

current_email=$(git config --global --get user.email)

# if current_email is empty, then add an email
if [[ -z "$current_email" ]]
then
    git config --global user.email "val@markovic.io"
fi

git config --global github.user valloric

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.d difftool
git config --global alias.h help
git config --global alias.sub submodule
git config --global alias.unstage "reset HEAD"
git config --global alias.unstash "stash pop"
git config --global alias.dst "diff --staged"
git config --global alias.cp "cherry-pick"

git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"

git config --global color.ui true

git config --global diff.tool gvimdiff
git config --global difftool.prompt false
git config --global merge.tool p4merge

# With this, "git pull --rebase" is the default form of pull FOR NEWLY CREATED
# BRANCHES; for branches created before this config option is set, pull.rebase
# true handles that
git config --global branch.autosetuprebase always

# "git pull --rebase" is now the default for pull no matter what
git config --global pull.rebase true

# This makes sure that push pushes only the current branch, and pushes it to the
# same branch pull would pull from
git config --global push.default upstream

# This converts CRLF endings to LF endings on Mac & Lin and also keeps them in
# the repo, but for Windows checkouts it converts LF to CRLF (and back to LF on
# commits)
git config --global core.autocrlf input

script_dir="$( cd "$( dirname "$0" )" && pwd )"

git config --global alias.meld "!$script_dir/bin/git-meld/git-meld.pl"

git config --global core.excludesfile ~/.gitignore_global

