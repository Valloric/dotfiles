#!/bin/bash -e

if git log -1 | grep -q -i -m 1 -w wip; then
  echo "ABORTED: Found WIP in last commit!"
  exit 1
elif git log master..HEAD | grep -q -i -m 1 -w wip; then
  echo "ABORTED: Found WIP in branch commits!"
  exit 1
else
  exit 0
fi
