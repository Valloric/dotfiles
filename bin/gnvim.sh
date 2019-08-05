#!/bin/bash
exec env NVIM_GTK_NO_HEADERBAR=1 ~/repos/neovim-gtk/target/release/nvim-gtk "$@"

