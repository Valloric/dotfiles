#!/bin/bash

set -e

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ ! -e ~/.zshrc ]]; then
  ln -s $script_dir/zshrc.zsh ~/.zshrc
fi

if [[ ! -e ~/.zshenv ]]; then
  ln -s $script_dir/zshenv.zsh ~/.zshenv
fi

if [[ ! -e ~/.zprofile ]]; then
  ln -s $script_dir/zprofile.zsh ~/.zprofile
fi
