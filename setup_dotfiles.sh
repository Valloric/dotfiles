#!/bin/bash

# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

if [[ ! -a ~/.zshrc ]]
then
  ln -s $script_dir/zsh/zshrc.zsh ~/.zshrc
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -s $script_dir/vim/vimrc.vim ~/.vimrc
fi

if [[ ! -a ~/.config/terminator/config ]]
then
  mkdir -p ~/.config/terminator
  ln -s $script_dir/terminator/config ~/.config/terminator/config
fi

# -p says to create the dir if it doesn't exist already
mkdir -p $HOME/bin

platform=$(uname)

# Naturally, macvim needs to be installed for this to work
if [[ $platform == *Darwin* ]]
then
  # symlinks for mvim
  ln -s /usr/local/bin/mvim ~/bin/gvimdiff
  ln -s /usr/local/bin/mvim ~/bin/vimdiff
  ln -s /usr/local/bin/mvim ~/bin/vim
  ln -s /usr/local/bin/mvim ~/bin/gvim
  ln -s /usr/local/bin/mvim ~/bin/vi
fi

source $script_dir/gitconfig_setup.sh

