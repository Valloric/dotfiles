#!/bin/bash
export VALGRIND_LIB="$HOME/valgrind/lib/valgrind"
exec ~/valgrind/bin/valgrind "$@"

