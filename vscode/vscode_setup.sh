#!/usr/bin/env bash
set -euo pipefail

# Check if the 'code' command exists
if ! command -v code &>/dev/null; then
  echo "The 'code' command (VS Code) was not found on the PATH."
  echo "Aborting VS Code setup."
  exit 0
fi

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ "$(uname)" == *Darwin* ]]; then
  readonly VSC_ROOT_DIR="$HOME/Library/Application Support/Code"
else
  readonly VSC_ROOT_DIR="$HOME/.config/Code"
fi
readonly VSC_CONFIG_DIR="$VSC_ROOT_DIR/User"

mkdir -p "$VSC_CONFIG_DIR"

declare -a config_files=(
  "settings.json"
  "keybindings.json"
)

for file in "${config_files[@]}"; do
  if [[ ! -e "$VSC_CONFIG_DIR/$file" ]]; then
    ln -s "$SCRIPT_DIR/$file" "$VSC_CONFIG_DIR/$file"
  fi
done

if [[ ! -e "$VSC_CONFIG_DIR/snippets" ]]; then
  ln -s "$SCRIPT_DIR/snippets" "$VSC_CONFIG_DIR/snippets"
fi

# Get list of installed extensions with `code --list-extensions`
declare -a extensions=(
  bazelbuild.vscode-bazel
  bbenoist.togglehs
  charliermarsh.ruff
  coolbear.systemd-unit-file
  davidanson.vscode-markdownlint
  esbenp.prettier-vscode
  formulahendry.auto-close-tag
  foxundermoon.shell-format
  julialang.language-julia
  llvm-vs-code-extensions.vscode-clangd
  mechatroner.rainbow-csv
  ms-azuretools.vscode-containers
  ms-azuretools.vscode-docker
  ms-python.black-formatter
  ms-python.debugpy
  ms-python.python
  ms-python.vscode-pylance
  myriad-dreamin.tinymist
  nefrob.vscode-just-syntax
  ragnoroct.linkme
  redhat.ansible
  redhat.vscode-yaml
  richie5um2.vscode-sort-json
  rust-lang.rust-analyzer
  shinichi-takii.sql-bigquery
  tamasfe.even-better-toml
  tomoki1207.pdf
  visualstudioexptteam.intellicode-api-usage-examples
  visualstudioexptteam.vscodeintellicode
  vscode-icons-team.vscode-icons
  vscodevim.vim
  yzhang.markdown-all-in-one
  zxh404.vscode-proto3
)

readonly INSTALLED_EXTENSIONS=$(code --list-extensions)

# Install only missing extensions
for extension in "${extensions[@]}"; do
  if ! echo "$INSTALLED_EXTENSIONS" | grep -q "^$extension$"; then
    code --install-extension "$extension" --force &>/dev/null &
  fi
done

# Wait for all background processes to complete
wait

readonly VSC_DICTS_DIR="$VSC_ROOT_DIR/Dictionaries"
mkdir -p "$VSC_DICTS_DIR"

if [[ "$(uname)" != *Darwin* ]]; then
  if [[ -d "/usr/share/hunspell" ]]; then
    for dict_file in /usr/share/hunspell/*; do
      if [[ ! -e "$VSC_DICTS_DIR/$(basename "$dict_file")" ]]; then
        ln -s "$dict_file" "$VSC_DICTS_DIR"
      fi
    done
  elif [[ -n "$(ls -A /usr/share/hunspell 2>/dev/null)" ]]; then
    echo "Warning: hunspell dictionaries not found at /usr/share/hunspell"
  fi
fi

if [[ ! -e "$VSC_DICTS_DIR/spellright.dict" ]]; then
  ln -s "$SCRIPT_DIR/spellright.dict" "$VSC_DICTS_DIR"
fi
