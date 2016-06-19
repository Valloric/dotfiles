#!/bin/bash

# get the dir of the current script
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

mkdir -p ~/.gnupg
if [[ ! -a ~/.gnupg/gpg.conf ]]
then
  ln -s $script_dir/gpg.conf ~/.gnupg/gpg.conf
fi

if [[ ! -a ~/.gnupg/gpg-agent.conf ]]
then
  ln -s $script_dir/gpg-agent.conf ~/.gnupg/gpg-agent.conf
fi
