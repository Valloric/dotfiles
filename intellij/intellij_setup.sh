#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
platform=$(uname)

if [[ ! -a ~/.ideavimrc ]]
then
  ln -s $script_dir/ideavimrc ~/.ideavimrc
fi

declare -a names=("IntelliJIdea15"
                  "IdeaIC15"
                  "IntelliJIdea2016.2"
                  "IntelliJIdea2016.3"
                  "IntelliJIdea2016.4"
                  "IntelliJIdeaLI2"
                  "IntelliJIdeaLI3"
                  "IntelliJIdeaLI4"
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

