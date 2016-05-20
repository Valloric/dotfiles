#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
platform=$(uname)

if [[ ! -a ~/.ideavimrc ]]
then
  ln -s $script_dir/ideavimrc ~/.ideavimrc
fi

if [[ $platform == *Darwin* ]]
then
  if [[ ! -a ~/Library/Preferences/IntelliJIdea14 ]]
  then
    ln -s $script_dir/config ~/Library/Preferences/IntelliJIdea14
  fi
else
  mkdir -p ~/.IdeaIC15

  if [[ ! -a ~/.IdeaIC15/config ]]
  then
    ln -s $script_dir/config ~/.IdeaIC15/config
  fi

  mkdir -p ~/.IntelliJIdea15

  if [[ ! -a ~/.IntelliJIdea15/config ]]
  then
    ln -s $script_dir/config ~/.IntelliJIdea15/config
  fi
fi
