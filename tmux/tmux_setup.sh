#!/usr/bin/env bash
set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ ! -e "$HOME/.tmux.conf" ]]; then
  ln -s "$SCRIPT_DIR/tmux.conf" "$HOME/.tmux.conf"
fi
