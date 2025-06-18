#!/bin/bash

set -e

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Set XDG_DATA_HOME to default if unset
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

mkdir -p "$XDG_DATA_HOME/typst/packages"
if [[ ! -e "$XDG_DATA_HOME/typst/packages/local" ]]; then
  ln -s "$script_dir/local" "$XDG_DATA_HOME/typst/packages/local"
fi
