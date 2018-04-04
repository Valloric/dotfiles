#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
platform=$(uname)

if [[ ! -a ~/.ideavimrc ]]
then
  ln -s $script_dir/ideavimrc ~/.ideavimrc
fi

declare -a names=(
                  "IntelliJIdeaLI8"
                  "IntelliJIdeaLI9"
                  "IdeaIC2017.2"
                  "IdeaIC2017.3"
                 )

# need to let intellij create these folders in config dir, then delete them,
# then run our setup.sh
declare -a folders=(
                  "codestyles"
                  "colors"
                  "extensions"
                  "fileTemplates"
                  "inspection"
                  "keymaps"
                  "migration"
                  "options"
                  "templates"
                 )

for name in "${names[@]}"
do
  if [[ $platform == *Darwin* ]]
  then
    if [[ ! -a ~/Library/Preferences/$name/codestyles ]]
    then
      for folder in "${folders[@]}"
      do
        ln -s $script_dir/config/$folder ~/Library/Preferences/$name/$folder
      done
    fi
  else
    mkdir -p ~/.$name/config

    if [[ ! -a ~/.$name/config/codestyles ]]
    then
      for folder in "${folders[@]}"
      do
        ln -s $script_dir/config/$folder ~/.$name/config/$folder
      done
    fi
  fi
done

