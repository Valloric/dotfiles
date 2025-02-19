#!/bin/bash

# get the dir of the current script
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Before anything else, set up ZSH
$script_dir/zsh/zsh_setup.sh

mkdir -p $HOME/.config
if [[ ! -e ~/.vimrc ]]; then
  ln -s $script_dir/vim/vimrc.vim ~/.vimrc
fi

mkdir -p $HOME/.config/nvim
if [[ ! -e ~/.config/nvim/init.vim ]]; then
  ln -s $script_dir/nvim/init.vim ~/.config/nvim/init.vim
fi

if [[ ! -e ~/.gdbinit ]]; then
  ln -s $script_dir/misc/gdbinit ~/.gdbinit
fi

if [[ ! -e ~/.gradle/gradle.properties ]]; then
  mkdir -p ~/.gradle
  ln -s $script_dir/gradle/gradle.properties ~/.gradle/gradle.properties
fi

if [[ ! -e ~/.cgdb/cgdbrc ]]; then
  mkdir -p ~/.cgdb
  ln -s $script_dir/misc/cgdbrc ~/.cgdb/cgdbrc
fi

if [[ ! -e ~/.gitignore_global ]]; then
  ln -s $script_dir/misc/gitignore_global ~/.gitignore_global
fi

if [[ ! -e ~/.config/terminator/config ]]; then
  mkdir -p ~/.config/terminator
  ln -s $script_dir/terminator/config ~/.config/terminator/config
fi

if [[ ! -e ~/.config/redshift.conf ]]; then
  mkdir -p ~/.config
  ln -s $script_dir/redshift/redshift.conf ~/.config/redshift.conf
fi

if [[ ! -e ~/.config/alacritty.yml ]]; then
  mkdir -p ~/.config
  ln -s $script_dir/alacritty/alacritty.yml ~/.config/alacritty.yml
fi

if [[ ! -e ~/.flake8rc ]]; then
  ln -s $script_dir/misc/flake8rc ~/.flake8rc
fi

# -p says to create the dir if it doesn't exist already
mkdir -p $HOME/bin

if [[ ! -e ~/bin/git-wip-check ]]; then
  ln -s $script_dir/bin/git-wip-check.sh ~/bin/git-wip-check
fi

if [[ ! -e ~/bin/valgrind ]]; then
  ln -s $script_dir/bin/valgrind.sh ~/bin/valgrind
fi

if [[ ! -e ~/bin/gnvim ]]; then
  ln -s $script_dir/bin/gnvim.sh ~/bin/gnvim
fi

if [[ ! -e ~/bin/clipper ]]; then
  ln -s $script_dir/bin/clipper.sh ~/bin/clipper
fi

if [[ ! -e ~/.hgrc ]]; then
  ln -s $script_dir/mercurial/hgrc.local ~/.hgrc
  ln -s $script_dir/mercurial/hgrc.local ~/.hgrc.override
fi

if [[ ! -e ~/.inputrc ]]; then
  ln -s $script_dir/misc/inputrc ~/.inputrc
fi

if [[ ! -e ~/.config/ghostty/config ]]; then
  mkdir -p ~/.config/ghostty
  ln -s $script_dir/misc/ghostty-config ~/.config/ghostty/config
fi

# Naturally, macvim needs to be installed for this to work
if [[ $(uname) == *Darwin* ]]; then
  # symlinks for mvim
  if [[ -e ~/bin/mvim ]]; then
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
elif [[ -e ~/bin/vim ]]; then
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
$script_dir/compton/compton_setup.sh
$script_dir/emacs/emacs_setup.sh
$script_dir/gpg/gpg_setup.sh
$script_dir/sublime-text/sublime_setup.sh
$script_dir/vscode/vscode_setup.sh
$script_dir/aider/aider_setup.sh
