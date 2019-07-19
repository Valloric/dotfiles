set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

" Might be needed to avoid the following error message on startup:
"  clipboard: error: Error: target STRING not available
let g:yankring_clipboard_monitor = 0

" Set up python support. Note that first we need to run:
"   python2 -m pip install --user --upgrade pynvim
"   python3 -m pip install --user --upgrade pynvim
" See :help provider-python for details.
let g:python_host_prog  = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" Ruby support (needed for command-t).
" Install the host with:
"   gem install --user-install neovim
let g:ruby_host_prog = '~/.gem/ruby/2.5.0/bin/neovim-ruby-host'

" Enables better clipboard support in neovim-gtk
let g:GuiInternalClipboard = 1

