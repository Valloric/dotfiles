#!/bin/bash

# Check if the 'code' command exists
if ! command -v code &> /dev/null
then
    echo "The 'code' command (VS Code) was not found on the PATH."
    echo "Aborting VS Code setup."
    exit 0
fi

declare script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
if [[ $(uname) == *Darwin* ]]; then
  declare vsc_root_dir="$HOME/Library/Application Support/Code"
else
  declare vsc_root_dir="$HOME/.config/Code"
fi
declare vsc_config_dir="$vsc_root_dir/User"

mkdir -p $vsc_config_dir

if [[ ! -e $vsc_config_dir/settings.json ]]; then
  ln -s $script_dir/settings.json "$vsc_config_dir/settings.json"
fi

if [[ ! -e $vsc_config_dir/keybindings.json ]]; then
  ln -s $script_dir/keybindings.json "$vsc_config_dir/keybindings.json"
fi

if [[ ! -e $vsc_config_dir/snippets ]]; then
  ln -s $script_dir/snippets "$vsc_config_dir/snippets"
fi

# Get list of installed extensions with code --list-extensions
declare -a extensions=(
  bazelbuild.vscode-bazel
  bbenoist.togglehs
  charliermarsh.ruff
  coolbear.systemd-unit-file
  davidanson.vscode-markdownlint
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  foxundermoon.shell-format
  llvm-vs-code-extensions.vscode-clangd
  ms-azuretools.vscode-docker
  ms-python.black-formatter
  ms-python.debugpy
  ms-python.python
  ms-python.vscode-pylance
  ragnoroct.linkme
  richie5um2.vscode-sort-json
  rust-lang.rust-analyzer
  shinichi-takii.sql-bigquery
  tamasfe.even-better-toml
  visualstudioexptteam.intellicode-api-usage-examples
  visualstudioexptteam.vscodeintellicode
  vscode-icons-team.vscode-icons
  vscodevim.vim
  yzhang.markdown-all-in-one
  zxh404.vscode-proto3
)

for i in ${extensions[@]}; do
  code --install-extension $i --force &
done

declare vsc_dicts_dir="$vsc_root_dir/Dictionaries"
mkdir -p "$vsc_dicts_dir"

if [[ $(uname) != *Darwin* ]]; then
  ln -s /usr/share/hunspell/* "$vsc_dicts_dir"
fi

if [[ ! -e $vsc_dicts_dir/spellright.dict ]]; then
  ln -s $script_dir/spellright.dict "$vsc_dicts_dir"
fi
