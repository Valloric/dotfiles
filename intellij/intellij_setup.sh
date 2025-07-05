#!/bin/bash

set -e

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
platform=$(uname)

if [[ ! -e "$HOME/.ideavimrc" ]]; then
  ln -s "$script_dir/ideavimrc" "$HOME/.ideavimrc"
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

for name in "${names[@]}"; do
  if [[ $platform == *Darwin* ]]; then
    if [[ ! -e "$HOME/Library/Preferences/$name/codestyles" ]]; then
      for folder in "${folders[@]}"; do
        mkdir -p "$HOME/Library/Preferences/$name/"
        ln -s "$script_dir/config/$folder" "$HOME/Library/Preferences/$name/$folder"
      done
    fi
  else
    mkdir -p "$HOME/.$name/config"

    if [[ ! -e "$HOME/.$name/config/codestyles" ]]; then
      for folder in "${folders[@]}"; do
        mkdir -p "$HOME/.$name/config/"
        ln -s "$script_dir/config/$folder" "$HOME/.$name/config/$folder"
      done
    fi
  fi
done
