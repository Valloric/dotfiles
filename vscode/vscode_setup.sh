#!/bin/bash

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
  bbenoist.togglehs
  DavidAnson.vscode-markdownlint
  DevonDCarew.bazel-code
  foxundermoon.shell-format
  llvm-vs-code-extensions.vscode-clangd
  mrcrowl.hg
  ms-python.python
  ragnoroct.linkme
  richie5um2.vscode-sort-json
  rust-lang.rust
  shinichi-takii.sql-bigquery
  vscode-icons-team.vscode-icons
  vscodevim.vim
  zxh404.vscode-proto3
)

for i in ${extensions[@]}; do
  code --install-extension $i &
done

declare vsc_dicts_dir="$HOME/.config/Code/Dictionaries"
mkdir -p $vsc_dicts_dir
ln -s /usr/share/hunspell/* $vsc_config_dir
ln -s $script_dir/spellright.dict $vsc_config_dir
