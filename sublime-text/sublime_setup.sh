#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ ! -a ~/.config/sublime-text-3/Packages/User ]]
then
  mkdir -p ~/.config/sublime-text-3/Packages
  ln -s $script_dir/User ~/.config/sublime-text-3/Packages/User
fi
