#!/bin/bash

set -e

declare script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
declare vsc_config_dir="$HOME/.config/Code/User"
mkdir -p $vsc_config_dir

if [[ ! -a $vsc_config_dir/settings.json ]]
then
  ln -s $script_dir/settings.json $vsc_config_dir/settings.json
fi

if [[ ! -a $vsc_config_dir/keybindings.json ]]
then
  ln -s $script_dir/keybindings.json $vsc_config_dir/keybindings.json
fi

declare -a extensions=(
  aaron-bond.better-comments
  foxundermoon.shell-format
  ms-python.python
  vscodevim.vim
)

for i in ${extensions[@]}; do
  code --install-extension $i &
done
