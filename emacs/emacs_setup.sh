#!/bin/bash

set -e

script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [[ ! -a ~/.spacemacs ]]
then
  ln -s $script_dir/spacemacs.el ~/.spacemacs
fi

if [[ ! -a ~/bin/e-wait ]]
then
  ln -s $script_dir/e-wait.sh ~/bin/e-wait
fi

if [[ ! -a ~/bin/e ]]
then
  ln -s $script_dir/e.sh ~/bin/e
fi

