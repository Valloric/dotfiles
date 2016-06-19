;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

;;; Code:
(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     emacs-lisp
     git
     markdown
     yaml
     colors
     javascript
     html
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(highlight-operators
                                      ;; Great function for learning about what
                                      ;; the major mode supports. Also has
                                      ;; discover-my-mode for minor modes.
                                      discover-my-major
                                      fill-column-indicator
                                      toml-mode
                                      rust-mode
                                      flycheck-rust
                                      company-ycmd
                                      flycheck-ycmd
                                      ycmd)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; Prevents search highlight persisting
                                    ;; after search.
                                    evil-search-highlight-persist
                                    ;; Stops emacsclient starting with last
                                    ;; buffer; now starts with scratch buffer.
                                    persp-mode)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         monokai
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Consolas"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key nil
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ";"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  ;; Custom colors that make the spacemacs theme look like
  ;; vim-valloric-colorscheme.
  (custom-set-variables
   '(spacemacs-theme-custom-colors
     '((base . "#ffffff")
       (var . "#ffffff")
       (bg1 . "#000000")
       (comment-bg . "#000000")
       (comment . "#13c100")
       (const . "#ffff00")
       (keyword . "#3664FF")
       (type . "#AA00FF")
       (func . "#ffa600")
       (str . "#E6DB74")
       (highlight . "#403D3D")
       ))

   ;; Makes helm ag search auto switch the current buffer to the location in the
   ;; search list. As we move over items in the search list, the correct location
   ;; is opened.
   ;; This likely makes other, non-ag parts of helm persistent as well. There's
   ;; a way to make this ag-only, but this comment is too short to contain the
   ;; explanation. (That's a lie, I just don't know how to. :))
   '(helm-follow-mode-persistent t)
   )

  ;; Darker background for current line
  (custom-set-faces
   '(hl-line ((t (:background "#0f0f0f")))))
  )

(defun dotspacemacs/user-config ()

  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; CUSTOM MAPS
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  (define-key evil-normal-state-map (kbd "M-j") (kbd "15j"))
  (define-key evil-normal-state-map (kbd "M-k") (kbd "15k"))

  (setq-default evil-escape-key-sequence ",.")

  (defun val/empty-line-below ()
    (interactive)
    (call-interactively (key-binding (kbd "o")))
    (evil-normal-state)
    (call-interactively (key-binding (kbd "k")))
    )

  (define-key evil-normal-state-map (kbd "zj") 'val/empty-line-below)

  (defun val/empty-line-above ()
    (interactive)
    (call-interactively (key-binding (kbd "O")))
    (evil-normal-state)
    (call-interactively (key-binding (kbd "j")))
    )

  (define-key evil-normal-state-map (kbd "zk") 'val/empty-line-above)

  ;; Swaps ; and : in normal mode.
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

  ;; Q reformats paragraphs to fit within 80 lines
  (define-key evil-normal-state-map (kbd "Q") 'fill-paragraph)
  (define-key evil-visual-state-map (kbd "Q") 'fill-paragraph)

  ;; Makes j and k behave like gj and gk (visual line navigation)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  ;; Makes spc-spc use avy-goto-char instead of avy-goto-word
  (spacemacs/set-leader-keys "SPC" 'avy-goto-char)

  ;; ycmd goto-anything
  (spacemacs/set-leader-keys "og" 'ycmd-goto)

  (defun val/join-lines ()
    "Join the following line onto the current one.
If the current line is a comment and the next line is also a comment,
remove the comment characters from that line before joining."
    (interactive)
    (join-line -1)
    ;; If the current line is a comment
    (when (nth 4 (syntax-ppss))
      ;; Remove the comment prefix chars from the pulled-up line if present
      (save-excursion
        (forward-char)
        ;; Delete all comment-start or space characters
        (while (looking-at
                (concat
                 "\\s<" ; comment-start char as per syntax table
                 "\\|" (substring comment-start 0 1) ; first char of `comment-start'
                 "\\|" "\\s-")) ; extra spaces
          (delete-char 1)))))

  (define-key evil-normal-state-map (kbd "J") 'val/join-lines)


  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; GENERAL EMACS CONFIG
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Makes initial buffer be the scratch buffer.
  (setq-default initial-buffer-choice t)

  ;; Increase font vertical line spacing a bit; only needed for Consolas!
  ;; The number is amount of extra pixels between lines.
  (setq-default line-spacing 1)

  ;; Make scrolling non-shitty; this prevents screen re-centering for the cursor
  (setq-default scroll-conservatively 10000 )

  ;; < and > indent by this many chars
  (setq-default evil-shift-width 2)

  ;; always indent with spaces, never tabs
  (setq-default indent-tabs-mode nil)

  ;; indent with 2 spaces
  (setq-default tab-width 2)
  (defvaralias 'c-basic-offset 'tab-width)
  (defvaralias 'cperl-indent-level 'tab-width)
  (defvaralias 'sh-basic-offset 'tab-width)
  (defvaralias 'sh-indentation 'tab-width)
  (defvaralias 'rust-indent-offset 'tab-width)

  ;; 80 colums for wrapping
  (setq-default fill-column 80)
  ;; Hard-wrap at 80 columns on for _everything_
  (setq-default auto-fill-function 'do-auto-fill)

  ;; Make emacsclient start maximized
  (add-to-list 'default-frame-alist '(fullscreen . fullboth))

  ;; Enables editing compressed files like zip etc.
  (auto-compression-mode 1)

  ;; Why the fuck would I EVER want my mouse scrolling to _accelerate_? Who in
  ;; their right fucking mind came up with this bullshit...
  (setq-default mouse-wheel-progressive-speed nil)

  ;; Removes silly .#<name> lock files. Unfortunately there's no way to move
  ;; these to a tmp folder; we can only have them in the same folder as the file
  ;; being edited (zero chance of that) or not have them.
  (setq-default create-lockfiles nil)

  ;; Emacs autosave files (".#<name>") and backup files ("<name>~") go into the
  ;; temp dir, not the dir where the file being edited is located.
  (setq-default backup-directory-alist
                `((".*" . ,temporary-file-directory)))
  (setq-default auto-save-file-name-transforms
                `((".*" ,temporary-file-directory t)))

  ;; Prevents Emacs from asking "do you want to follow the symlink?" when
  ;; editing a symlink. Yes Emacs, I do want to open the file.
  (setq vc-follow-symlinks t)

  ;; Min number of lines to keep below/above the cursor in view.
  (setq-default scroll-margin 3)

  ;; Chrome as default browser
  (setq-default browse-url-browser-function 'browse-url-generic
                browse-url-generic-program "google-chrome")

  ;; Highlight all function calls in all programming modes.
  (add-hook 'prog-mode-hook
   (lambda ()
     (font-lock-add-keywords
      nil
      '(("\\([_a-zA-Z][_a-zA-Z0-9]*\\)(" 1 'font-lock-function-name-face)))
     ))

  ;; *.zsh files now use sh-mode as major mode
  (add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode))

  ;; The below defadvice calls modify searching with '/' so that it recenters
  ;; the screen after each jump.
  (defadvice
      evil-search-forward
      (after evil-search-forward-recenter activate)
    (recenter))
  (ad-activate 'evil-search-forward)

  (defadvice
      evil-search-next
      (after evil-search-next-recenter activate)
    (recenter))
  (ad-activate 'evil-search-next)

  (defadvice
      evil-search-previous
      (after evil-search-previous-recenter activate)
    (recenter))
  (ad-activate 'evil-search-previous)

  ;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; PLUGIN CONFIG
  ;;;;;;;;;;;;;;;;;;;;;;;;;

  ;; Helm config
  (setq-default helm-mode-fuzzy-match t)
  (setq-default helm-completion-in-region-fuzzy-match t)

  ;; Workaround to force fci-mode on globally.
  (define-globalized-minor-mode global-fci-mode fci-mode
    (lambda () (fci-mode 1)))
  (global-fci-mode 1)
  ;; fill-column-indicator (visual indicator line at 80 colums) config
  (setq-default fci-rule-color "#3B3A32")

  ;; Set up operator highlight.
  (add-hook 'prog-mode-hook
            (lambda ()
              (highlight-operators-mode 1)
              ;; HAS to be set here and not in custom-set-faces because that
              ;; doesn't work. Don't know why, don't care much either.
              (set-face-foreground 'highlight-operators-face "cyan")
              ))
  (add-hook 'emacs-lisp-mode-hook (lambda () (highlight-operators-mode -1)))
  (add-hook 'json-mode-hook (lambda () (highlight-operators-mode -1)))

  (custom-set-faces
   ;; All parens/braces/brackets start with cyan color; further nesting changes
   ;; color.
   '(rainbow-delimiters-depth-1-face ((t (:foreground "cyan"))))
   )

  ;; Rainbow mode! (CSS color declarations use the color background.)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode)
  (add-hook 'scss-mode-hook 'rainbow-mode)
  (add-hook 'less-mode-hook 'rainbow-mode)
  (add-hook 'emacs-lisp-mode-hook 'rainbow-mode)

  ;; Turn off minor modes token list in modeline.
  (spaceline-toggle-minor-modes-off)

  ;; Set up ycmd and company-mode.
  (add-hook 'ycmd-mode-hook 'company-ycmd-setup)
  (add-hook 'ycmd-mode-hook 'flycheck-ycmd-setup)
  (global-company-mode)
  (global-ycmd-mode)
  (company-ycmd-setup)

  (set-variable 'ycmd-global-config "")
  (set-variable
   'ycmd-server-command
   '("python" "/home/valloric/repos/YouCompleteMe/third_party/ycmd/ycmd"))
  (set-variable 'ycmd-extra-conf-whitelist '("~/repos/*"))
  (set-variable 'ycmd-global-modes 'all)
  (set-variable 'ycmd-parse-conditions
                '(save new-line mode-enabled idle-change buffer-focus))
  (set-variable 'ycmd-rust-src-path "/home/valloric/repos/rust/src")

  ;; Enable flycheck (syntastic equiv).
  (global-flycheck-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (set-variable 'flycheck-display-errors-delay 0.4)

  ;; I don't know why emacs-ycmd sets up ycmd for python syntax checking; ycmd
  ;; doesn't support it! (I'd know.)
  (add-hook 'python-mode-hook
            (lambda () (add-to-list 'flycheck-disabled-checkers 'ycmd)))

  ;; Turn on git commit syntax highlighting.
  (global-git-commit-mode)
  ;; Always spell-check for commit messages.
  (add-hook 'git-commit-mode-hook 'turn-on-flyspell)
  ;; Don't save cursor position in git commit messages, it's never useful.
  (add-hook 'git-commit-mode-hook (lambda () (toggle-save-place 0)))

  ;; Turn on tildes as markers for end of file.
  (global-vi-tilde-fringe-mode)
  )

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
