#!/bin/bash

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ ! -a ~/.zshrc ]]
then
  ln -s $script_dir/zsh/zshrc.zsh ~/.zshrc
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -s $script_dir/vim/vimrc.vim ~/.vimrc
fi

if [[ ! -a ~/.gdbrc ]]
then
  ln -s $script_dir/misc/gdbrc ~/.gdbrc
fi

if [[ ! -a ~/.gradle/gradle.properties ]]
then
  mkdir ~/.gradle
  ln -s $script_dir/gradle/gradle.properties ~/.gradle/gradle.properties
fi

if [[ ! -a ~/.cgdb/cgdbrc ]]
then
  mkdir ~/.cgdb
  ln -s $script_dir/misc/cgdbrc ~/.cgdb/cgdbrc
fi

if [[ ! -a ~/.gitignore_global ]]
then
  ln -s $script_dir/misc/gitignore_global ~/.gitignore_global
fi

if [[ ! -a ~/.config/terminator/config ]]
then
  mkdir -p ~/.config/terminator
  ln -s $script_dir/terminator/config ~/.config/terminator/config
fi

if [[ ! -a ~/.config/redshift.conf ]]
then
  mkdir -p ~/.config
  ln -s $script_dir/redshift/redshift.conf ~/.config/redshift.conf
fi

# -p says to create the dir if it doesn't exist already
mkdir -p $HOME/bin

# Naturally, macvim needs to be installed for this to work
if [[ $(uname) == *Darwin* ]]
then
  # symlinks for mvim
  if [[ -a ~/bin/mvim ]]
  then
    ln -s ~/bin/mvim ~/bin/gvimdiff
    ln -s ~/bin/mvim ~/bin/vimdiff
    ln -s ~/bin/mvim ~/bin/vim
    ln -s ~/bin/mvim ~/bin/gvim
    ln -s ~/bin/mvim ~/bin/vi
  else
    ln -s /usr/local/bin/mvim ~/bin/gvimdiff
    ln -s /usr/local/bin/mvim ~/bin/vimdiff
    ln -s /usr/local/bin/mvim ~/bin/vim
    ln -s /usr/local/bin/mvim ~/bin/gvim
    ln -s /usr/local/bin/mvim ~/bin/vi
  fi
elif [[ -a ~/bin/vim ]]
then
  ln -s ~/bin/vim ~/bin/gvim
  ln -s ~/bin/vim ~/bin/vi
  ln -s ~/bin/vim ~/bin/gvimdiff
  ln -s ~/bin/vim ~/bin/vimdiff
  ln -s ~/bin/vim ~/bin/view
fi

$script_dir/gitconfig_setup.sh
$script_dir/tmux/tmux_setup.sh
$script_dir/urxvt/urxvt_setup.sh
$script_dir/intellij/intellij_setup.sh
$script_dir/less/less_setup.sh

