#!/bin/bash

git config --global user.name "Val Markovic"

current_email=$(git config --global --get user.email)

# if current_email is empty, then add an email
if [[ -z "$current_email" ]]; then
  git config --global user.email "val@markovic.io"
fi

git config --global github.user valloric

git config --global alias.st status
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br "branch -vv"
git config --global alias.d difftool
git config --global alias.h help
git config --global alias.sub submodule
git config --global alias.unstage "restore --staged"
git config --global alias.unstash "stash pop"
git config --global alias.dst "diff --staged"
# These two aliases use delta, configured below
git config --global alias.dc "!git --paginate diff"
git config --global alias.dcs "!git --paginate diff --staged"
git config --global alias.cp "cherry-pick"
git config --global alias.rb "rebase"

# Main log command
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
# Log command without pager, with commit ID and first commit line.
# This is useful when we want to use "git commit --fixup <commit id>", but don't
# want to have to remember the commit ID!
# You can pass "-n <N>" again to see more commits, it will override "-n 5".
git config --global alias.clg "!git --no-pager log --pretty='%h %s' -n 5"

# Config for git-absorb: https://github.com/tummychow/git-absorb
# By default it creates the "fixup!"" commits, but doesn't integrate them.
# To integrate them, use: git absorb --and-rebase
#
# 1 fixup commit for all hunks that absorb into the same commit
git config --global absorb.oneFixupPerCommit true
# By default, git-absorb will only consider files that you've staged to the
# index via git add. With, running absorb will stage everything first ONLY if
# nothing is staged.
git config --global absorb.autoStageIfNothingStaged true

# Sets up delta: https://github.com/dandavison/delta
# Install delta with: cargo install git-delta
# Navigate big diffs with n and N (next and prev file)!
git config --global core.pager delta
git config --global interactive.diffFilter 'delta --color-only'
git config --global delta.navigate true
git config --global delta.side-by-side true

# Tell git diff algo to do a better job when functions are moved around
git config --global diff.algorithm histogram

# Pipes "git status" through LESS
# Can set "pager.<tool>" to enable the pager for other commands.
# Also, can use "git --paginate <tool>" to make pagination per-invocation.
git config --global pager.status true

git config --global color.ui true

git config --global diff.tool kdiff3
git config --global difftool.prompt false
git config --global merge.tool kdiff3

git config --global alias.ks "difftool -y -t Kaleidoscope"
git config --global alias.meld "difftool --tool=meld --dir-diff -y"

# This gives us 'ours', 'base', and 'theirs', instead of just 'ours' and
# 'theirs'. More details: https://stackoverflow.com/a/71254097
git config --global merge.conflictStyle zdiff3

# Prevents us from having to do merge resolution for things we've already
# resolved before; see http://git-scm.com/blog/2010/03/08/rerere.html
git config --global rerere.enabled true

# With this, "git pull --rebase" is the default form of pull FOR NEWLY CREATED
# BRANCHES; for branches created before this config option is set, pull.rebase
# true handles that
git config --global branch.autosetuprebase always

# "git pull --rebase" is now the default for pull no matter what
git config --global pull.rebase true

# This makes sure that push pushes only the current branch, and pushes it to the
# same branch pull would pull from
git config --global push.default upstream
# push, my man, I love you, I really do, but you gotta STFU
git config --global push.quiet true
# When you push a local branch to a remote, it will auto set up the remote
# tracking branch.
git config --global push.autoSetupRemote true

# The default branch for new repos is 'main' instead of 'master'
git config --global init.defaultBranch main

# This converts CRLF endings to LF endings on Mac & Lin and also keeps them in
# the repo, but for Windows checkouts it converts LF to CRLF (and back to LF on
# commits)
git config --global core.autocrlf input

git config --global core.excludesfile ~/.gitignore_global

# Forces the use of SSH instead of HTTPS for any URLs that point to github.
# This means that if a repo uses "https://github/..." for "origin", we will
# automatically use SSH. No more password prompts!
# Off because it messes up Cargo
#git config --global url.ssh://git@github.com/.insteadOf https://github.com/

# Makes "git stash show" display a diff by default
git config --global stash.showPatch true

# Makes rebasing stash any dirty changes before running rebase, and then
# unstashes them afterwards.
git config --global rebase.autostash true

# Make --autosquash always-on for rebase commands
# Autosquash automatically squashes commits that start with "squash!" or
# "fixup!". See "git rebase" docs for details.
git config --global rebase.autosquash true

# When editing the commit message, git will now always include a diff of the
# changes below the message area (the diff does NOT become part of the commit
# message, it's only there for information).
git config --global commit.verbose true

# Number of concurrent submodule fetches
git config --global submodule.fetchJobs 8

# Prettier diffs
git config --global diff.compactionHeuristic true
git config --global diff.indentHeuristic on

# Make git use the system-default web browser.
if [[ $(uname) == *Darwin* ]]; then
  git config --global web.browser open
else
  git config --global web.browser xdg-open
fi
