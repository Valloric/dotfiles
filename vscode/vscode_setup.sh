#!/bin/bash

set -e

declare script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
declare vsc_config_dir="$HOME/.config/Code/User"
mkdir -p $vsc_config_dir

if [[ ! -e $vsc_config_dir/settings.json ]]; then
  ln -s $script_dir/settings.json $vsc_config_dir/settings.json
fi

if [[ ! -e $vsc_config_dir/keybindings.json ]]; then
  ln -s $script_dir/keybindings.json $vsc_config_dir/keybindings.json
fi

# Get list of installed extensions with code --list-extensions
declare -a extensions=(
  aaron-bond.better-comments
  bbenoist.togglehs
  DavidAnson.vscode-markdownlint
  foxundermoon.shell-format
  llvm-vs-code-extensions.vscode-clangd
  mrcrowl.hg
  ms-python.python
  rust-lang.rust
  streetsidesoftware.code-spell-checker
  vscode-icons-team.vscode-icons
  vscodevim.vim
)

for i in ${extensions[@]}; do
  code --install-extension $i &
done
