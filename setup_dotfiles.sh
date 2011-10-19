#!/bin/bash

# get the dir of the current script
script_dir="$( cd "$( dirname "$0" )" && pwd )"

# add bashrc_after to bashrc if it's not there already
# the grep expression means "if the string IS NOT found in the file"
if [[ ! -f ~/.bashrc || $( grep -q bashrc_after.sh ~/.bashrc ; echo $? ) ]]
then
  echo "source $script_dir/bashrc_after.sh" >> ~/.bashrc
fi

platform=$(uname)

# Mac OS X will not read .bashrc for terminal shells, but it will read
# .bash_profile
if [[ $platform == *Darwin* ]]
then
  # the grep expression means "if the string IS NOT found in the file"
  if [[ ! -f ~/.bash_profile || $( grep -q bashrc_after.sh ~/.bash_profile ;
    echo $? ) ]]
  then
    echo "source $script_dir/bashrc_after.sh" >> ~/.bash_profile
  fi
fi

# add links to our other files if there are not there already
for file in aliases_bash.sh completion_bash.sh
do
  if [[ ! -a ~/.$file ]]
  then
    ln -s $script_dir/$file ~/.$file
  fi
done


# -p says to create the dir if it doesn't exist already
mkdir -p $HOME/bin

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

source gitconfig_setup.sh

