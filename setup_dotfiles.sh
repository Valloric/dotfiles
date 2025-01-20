#!/bin/bash

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ ! -a ~/.zshrc ]]
then
  ln -s $script_dir/zsh/zshrc.zsh ~/.zshrc
fi

if [[ ! -a ~/.zshenv ]]
then
  ln -s $script_dir/zsh/zshenv.zsh ~/.zshenv
fi

if [[ ! -a ~/.vimrc ]]
then
  ln -s $script_dir/vim/vimrc.vim ~/.vimrc
fi

mkdir -p $HOME/.config/nvim
if [[ ! -a ~/.config/nvim/init.vim ]]
then
  ln -s $script_dir/nvim/init.vim ~/.config/nvim/init.vim
fi

if [[ ! -a ~/.gdbinit ]]
then
  ln -s $script_dir/misc/gdbinit ~/.gdbinit
fi

if [[ ! -a ~/.gradle/gradle.properties ]]
then
  mkdir -p ~/.gradle
  ln -s $script_dir/gradle/gradle.properties ~/.gradle/gradle.properties
fi

if [[ ! -a ~/.cgdb/cgdbrc ]]
then
  mkdir -p ~/.cgdb
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

if [[ ! -a ~/.config/alacritty.yml ]]
then
  mkdir -p ~/.config
  ln -s $script_dir/alacritty/alacritty.yml ~/.config/alacritty.yml
fi

if [[ ! -a ~/.flake8rc ]]
then
  ln -s $script_dir/misc/flake8rc ~/.flake8rc
fi

# -p says to create the dir if it doesn't exist already
mkdir -p $HOME/bin

if [[ ! -a ~/bin/git-wip-check ]]
then
  ln -s $script_dir/bin/git-wip-check.sh ~/bin/git-wip-check
fi

if [[ ! -a ~/bin/valgrind ]]
then
  ln -s $script_dir/bin/valgrind.sh ~/bin/valgrind
fi

if [[ ! -a ~/bin/gnvim ]]
then
  ln -s $script_dir/bin/gnvim.sh ~/bin/gnvim
fi

if [[ ! -a ~/.hgrc ]]
then
  ln -s $script_dir/mercurial/hgrc.local ~/.hgrc
  ln -s $script_dir/mercurial/hgrc.local ~/.hgrc.override
fi

if [[ ! -a ~/.inputrc ]]
then
  ln -s $script_dir/misc/inputrc ~/.inputrc
fi

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
$script_dir/compton/compton_setup.sh
$script_dir/emacs/emacs_setup.sh
$script_dir/gpg/gpg_setup.sh
$script_dir/sublime-text/sublime_setup.sh
$script_dir/vscode/vscode_setup.sh
