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
  if [[ ! -a ~/Library/Preferences/IdeaIC14 ]]
  then
    ln -s $script_dir/config ~/Library/Preferences/IdeaIC14
  fi

  if [[ ! -a ~/Library/Preferences/IntelliJIdea14 ]]
  then
    ln -s $script_dir/config ~/Library/Preferences/IntelliJIdea14
  fi
else
  mkdir -p ~/.IdeaIC14

  if [[ ! -a ~/.IdeaIC14/config ]]
  then
    ln -s $script_dir/config ~/.IdeaIC14/config
  fi

  mkdir -p ~/.IntelliJIdea14

  if [[ ! -a ~/.IntelliJIdea14/config ]]
  then
    ln -s $script_dir/config ~/.IntelliJIdea14/config
  fi
fi
