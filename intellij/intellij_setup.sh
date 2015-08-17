#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ ! -a ~/.ideavimrc ]]
then
  ln -s $script_dir/ideavimrc ~/.ideavimrc
fi

mkdir -p ~/.IdeaIC14

if [[ ! -a ~/.IdeaIC14/config ]]
then
  ln -s $script_dir/config ~/.IdeaIC14/config
fi

mkdir -p ~/.IntelliJIdea14

if [[ ! -a ~/.IntelliJIdea14/config ]]
then
  ln -s $script_dir/config ~/.IntelliJIdea14/config
fi
