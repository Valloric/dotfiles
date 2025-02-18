#!/bin/bash

set -e

script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

if [[ ! -e ~/.aider.conf.yml ]]; then
  ln -s $script_dir/aider.conf.yml ~/.aider.conf.yml
fi

if [[ ! -e ~/.aider.model.metadata.json ]]; then
  ln -s $script_dir/aider.model.metadata.json ~/.aider.model.metadata.json
fi

if [[ ! -e ~/.aider.model.settings.yml ]]; then
  ln -s $script_dir/aider.model.settings.yml ~/.aider.model.settings.yml
fi
