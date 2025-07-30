# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# This theme exists ONLY in our custom fork of oh-my-zsh
ZSH_THEME="valloric"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Would love to use ZVM_VI_ESCAPE_BINDKEY=",." for zsh-vi-mode config, but due
# to https://github.com/jeffreytse/zsh-vi-mode/issues/325 this prevents
# insertion of `,`.

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# Use `als` to print out aliases by group.
# NOTE: `zsh-vi-mode` is stored as a git submodule in plugins/custom/zsh-vi-mode
plugins=(aliases git fasd mercurial rust uv systemd command-not-found podman httpie zsh-vi-mode)

# Load custom shell completions; must happen before sourcing oh-my-zsh.sh
# Custom completions are placed in the ~/.oh-my-zsh/custom/completions folder
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/completions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# just in case
export LANG=en_US.UTF-8

# This turns off zsh's "helpful" autocorrect feature
unsetopt correct_all

setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
unset zle_bracketed_paste        # Turn off gargage characters on paste

# turn off hosts file reading for autocomplete suggestions (sloooow!)
zstyle ':completion:*' hosts off

# Configure less with modern defaults:
# - Case-insensitive search, preserve colors, highlight movement
# - Detailed prompts, don't clear screen, auto-exit short content
# - 2-space tabs, wrap lines, mouse support
export LESS="--ignore-case --raw-control-chars --hilite-unread --long-prompt --no-init --quit-if-one-screen --tabs=2 --mouse --wheel-lines=3 --use-color --incsearch"

# This needs to be set for xclip, GUI emacs etc to work correctly; it informs
# them which X server to talk to. This should be set by default if everything is
# working correctly, but life is mean so sometimes it isn't.
export DISPLAY=":0"

# Set up RVM so "rvm use 2.0.0" works
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# FZF setup; https://github.com/junegunn/fzf
# Also run `cargo install fd-find` for faster file listing.
export FZF_DEFAULT_OPTS="
--color fg:252,bg:233,hl:67,fg+:252,bg+:235,hl+:81
--color info:144,prompt:161,spinner:135,pointer:135,marker:118
"

# Use 'fd' for file finding, it's faster
export FZF_DEFAULT_COMMAND='fd --type f'

# Also run `cargo install bat` for syntax highlighted file preview.
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND
--preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers --color=always {} || highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'
"

# Use fd (https://github.com/sharkdp/fd) instead of the default find
# command for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.LESS_TERMCAP ] && source ~/.LESS_TERMCAP

# needed for gpg-agent to work right
export GPG_TTY=$(tty)




