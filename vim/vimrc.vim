" File Type Settings
filetype plugin indent on        " Enable file type detection

" Basic Settings
set nocompatible                " Disable vi compatibility mode
set backspace=indent,eol,start  " Modern backspace behavior
set history=50                  " Reduce command history (default is 200)
set ruler                       " Show cursor position
set incsearch                   " Incremental searching
set nowrap                      " Don't wrap lines
set nonumber                    " Do NOT show line numbers
set cursorline                  " Highlight current line
set laststatus=2                " Always show status line
set wildmenu                    " Enhanced command-line completion
set wildmode=longest:full,full  " Complete longest common string, then each full match
set mouse=a                     " Enable mouse support
set mousemodel=popup_setpos	" Right-click on selection should bring up a menu
set scrolloff=2        	        " 2 lines above/below cursor when scrolling
set showmatch                   " show matching bracket (briefly jump)
set noshowmode                  " do NOT show mode in status bar (insert/replace/...)
set showcmd                     " Display incomplete commands
set bs=indent,eol,start         " Allow backspacing over everything in insert mode
" This changes the default display of tab and CR chars in list mode
set listchars=tab:▸\ ,eol:¬
" The "longest" option makes completion insert the longest prefix of all
" the possible matches; see :h completeopt
set completeopt=menu,menuone,longest
set switchbuf=useopen,usetab
" toggles vim's paste mode; when we want to paste something into vim from a
" different application, turning on paste mode prevents the insertion of extra
" whitespace
set pastetoggle=<F7>

" We want our cross-machine spell file to be used
set spellfile=$HOME/dotfiles/vim/spell/en.latin1.add

" File Handling
set nobackup                   " Don't create backup files
set noswapfile                 " Don't create swap files
set autoread                   " Reload files changed outside vim
set fileformat=unix            " file mode is unix
set fileformats=unix,dos,mac   " detects unix, dos, mac file formats in that order
set encoding=utf8              " Set utf8 as standard encoding 

" Indentation
set autoindent                " Copy indent from current line when starting a new line
set smartindent               " Smart autoindenting when starting a new line
set smarttab                  " smart tab handling for indenting
set expandtab                 " Use spaces instead of tabs
set shiftwidth=2              " Number of spaces for autoindent
set softtabstop=2             " Number of spaces in tab when editing
set tabstop=2                 " Number of visual spaces per TAB
set copyindent                " copy the previous indentation on autoindenting

" Color and Syntax
syntax enable                " Enable syntax highlighting
set background=dark          " Use dark background
colorscheme slate            

" Performance Settings
set lazyredraw              " Don't redraw while executing macros
set synmaxcol=100           " Only highlight first N columns
set updatetime=300          " Faster update time for better experience
set regexpengine=0          " Set regular expression engine automatically

" Status Line Configuration
set statusline=%f\ %h%w%m%r\ %=%(%l,%c%V\ %=\ %P%)

" Search Settings
set nohlsearch              " Do NOT highlight search results
set ignorecase              " Case-insensitive search
set smartcase               " Case-sensitive if search contains uppercase
set magic                   " change the way backslashes are used in search patterns
set gdefault                " this makes search/replace global by default

" this makes sure that shell scripts are highlighted
" as bash scripts and not sh scripts
let g:is_posix = 1

" tries to avoid those annoying "hit enter to continue" messages
" if it still doesn't help with certain commands, add a second <cr>
" at the end of the map command
set shortmess=a

" turns off all error bells, visual or otherwise
set noerrorbells visualbell t_vb=

" none of these should be word dividers, so make them not be
set iskeyword+=_,$,@,%,#

" Number of screen lines to use for the command-line
set cmdheight=2

" allow backspace and cursor keys to cross line boundaries
set whichwrap+=<,>,h,l

" enforces a specified line-length and auto inserts hard line breaks when we
" reach the limit; in Normal mode, you can reformat the current paragraph with
" gqap.
set textwidth=80

" this makes the color after the textwidth column highlighted
set colorcolumn=+1

" options for formatting text; see :h formatoptions
set formatoptions=tcroqnj


if has('unnamedplus')
  " By default, Vim will not use the system clipboard when yanking/pasting to
  " the default register. This option makes Vim use the system default
  " clipboard.
  " Note that on X11, there are _two_ system clipboards: the "standard" one, and
  " the selection/mouse-middle-click one. Vim sees the standard one as register
  " '+' (and this option makes Vim use it by default) and the selection one as
  " '*'.
  " See :h 'clipboard' for details.
  set clipboard=unnamedplus,unnamed
else
  " Vim now also uses the selection system clipboard for default yank/paste.
  set clipboard+=unnamed
endif

" Auto saving
set autowriteall
au FocusLost * silent! wa

" Change cursor shape between insert and normal mode
let &t_SI = "\e[6 q"  " Insert mode - thin vertical bar
let &t_SR = "\e[4 q"  " Replace mode - underscore
let &t_EI = "\e[2 q"  " Normal mode - full block

" Key Mappings
let mapleader = "\<Space>"  " Set space as leader key
nnoremap <leader>w :w!<CR>  " Quick save
nnoremap <leader>q :qa<CR>  " Quick quit

" with this, we can now type ",." to exit out of insert mode
" if we really wanted to type ",.", then just type one char, wait half a sec,
" type another
inoremap ,. <Esc>
vnoremap ,. <Esc>

" These create newlines like o and O but stay in normal mode
nnoremap <silent> zj o<Esc>k
nnoremap <silent> zk O<Esc>j


" In normal mode, we use : much more often than ; so lets swap them.
" WARNING: this will cause any "ordinary" map command without the "nore" prefix
" that uses ":" to fail. For instance, "map <f2> :w" would fail, since vim will
" read ":w" as ";w" because of the below remappings. Use "noremap"s in such
" situations and you'll be fine.
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" This makes j and k work on "screen lines" instead of on "file lines"; now, when
" we have a long line that wraps to multiple screen lines, j and k behave as we
" expect them to.
nnoremap j gj
nnoremap k gk

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" for faster scrolling
noremap <m-j> 15gj
noremap <m-k> 15gk

" on macs the alt key is inconvenient to press, so let's also map to ctrl
noremap <c-j> 15gj
noremap <c-k> 15gk

" Using '<' and '>' in visual mode to shift code by a tab-width left/right by
" default exits visual mode. With this mapping we remain in visual mode after
" such an operation.
vnoremap < <gv
vnoremap > >gv

" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell! spelllang=en_us<cr>

" Y should yank until end of line
nnoremap Y y$

" spelling shortcuts using <leader>
" ]s next misspelled word
" [s previous misspelled word
" zg add to dict
" z= get suggestions
noremap <leader>sn ]s
noremap <leader>sp [s
noremap <leader>sa zg
noremap <leader>su z=

" Git Commit Message Settings
augroup gitcommit
    autocmd!
    " enable spell checking
    autocmd FileType gitcommit setlocal spell! spelllang=en_us
    autocmd FileType gitcommit setlocal textwidth=72  " Wrap at 72 chars for git commits
    autocmd FileType gitcommit setlocal colorcolumn=+1 " Show column at 73 for git commits
augroup END


" Filetype detection for systemd and Podman Quadlet unit files
augroup filetypedetect_systemd
  autocmd!
  " Standard systemd unit files
  autocmd BufRead,BufNewFile
        \ *.service,*.socket,*.timer,*.mount,*.path,*.slice,
        \ *.target,*.automount,*.swap,*.netdev,*.network,*.link,
        \ *.nspawn,*.cgd,*.vlan,*.bridge,*.bond,*.vrf,*.tun,*.tap
        \ setfiletype systemd

  " Podman Quadlet files
  autocmd BufRead,BufNewFile
        \ *.container,*.volume,*.image,*.kube
        \ setfiletype systemd

  " Path-based detection for unit files without extensions
  autocmd BufRead,BufNewFile /etc/systemd/system/* setfiletype systemd
  autocmd BufRead,BufNewFile ~/.config/systemd/user/* setfiletype systemd
  autocmd BufRead,BufNewFile ~/.config/containers/systemd/* setfiletype systemd
augroup END
