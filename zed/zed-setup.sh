#!/usr/bin/env bash
set -euo pipefail

# get the dir of the current script
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# Check if the 'zed' command exists
if ! command -v zed &>/dev/null; then
  echo "The 'zed' command (Zed editor) was not found on the PATH."
  echo "Aborting zed setup."
  exit 0
fi

# The `~/.config/zed` dir is linked directly to `zed/zed-configs` so if zed
# decides to create any new config files, they will automatically end up in our
# dotfiles.
if [[ ! -e ~/.config/zed ]]; then
  ln -s "$script_dir/zed-configs" ~/.config/zed
fi
