#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
platform=$(uname)

if [[ ! -a ~/.ideavimrc ]]
then
  ln -s $script_dir/ideavimrc ~/.ideavimrc
fi

declare -a names=(
                  "IntelliJIdeaLI6"
                  "IntelliJIdeaLI7"
                  "IntelliJIdeaLI8"
                  "IdeaIC2017.2"
                 )

for name in "${names[@]}"
do
  if [[ $platform == *Darwin* ]]
  then
    if [[ ! -a ~/Library/Preferences/$name ]]
    then
      ln -s $script_dir/config ~/Library/Preferences/$name
    fi
  else
    mkdir -p ~/.$name

    if [[ ! -a ~/.$name/config ]]
    then
      ln -s $script_dir/config ~/.$name/config
    fi
  fi
done

