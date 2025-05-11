#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
platform=$(uname)

if [[ ! -a ~/.ideavimrc ]]
then
  ln -s "$script_dir/ideavimrc" ~/.ideavimrc
fi

declare -a names=(
                  "IntelliJIdeaLI11"
                  "IntelliJIdeaLI12"
                  "IdeaIC2018.2"
                  "IdeaIC2019.1"
                  "CLion2018.3"
                  "CLion2019.1"
                 )

# 1. Let intellij create these folders in config dir.
# 2. Delete ONLY THESE FOLDERS from the config dir.
# 3. Add the new IntelliJ name above, if necessary.
# 4. Run our setup.sh
# 5. Start intellij again.
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
    if [[ ! -a "~/Library/Preferences/$name/codestyles" ]]
    then
      for folder in "${folders[@]}"
      do
        mkdir -p "~/Library/Preferences/$name/"
        ln -s "$script_dir/config/$folder" "~/Library/Preferences/$name/$folder"
      done
    fi
  else
    mkdir -p ~/.$name/config

    if [[ ! -a "~/.$name/config/codestyles" ]]
    then
      for folder in "${folders[@]}"
      do
        mkdir -p "~/.$name/config/"
        ln -s "$script_dir/config/$folder" "~/.$name/config/$folder"
      done
    fi
  fi
done

