;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(rust
     ;; Programming languages
     octave
     groovy
     haskell
     emacs-lisp
     shell-scripts
     (python :variables
             python-backend 'lsp
             python-lsp-server 'pyls
             python-sort-imports-on-save t
             python-enable-yapf-format-on-save t)

     (c-c++ :variables
            c-c++-backend 'lsp-ccls
            c-c++-adopt-subprojects t
            c-c++-lsp-enable-semantic-highlight t
            c-c++-enable-clang-format-on-save nil
            ;; clang-format-style "file"
            c-c++-default-mode-for-headers 'c++-mode)
     (cmake :variables cmake-enable-cmake-ide-support nil)

     ;; Autocompletion and language server
     syntax-checking
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-complete-with-key-sequence nil
                      auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets")
     (lsp :variables
          lsp-enable-symbol-highlighting nil
          lsp-enable-on-type-formatting nil
          lsp-enable-indentation nil
          lsp-enable-file-watchers t
          lsp-prefer-flymake nil
          lsp-file-watch-threshold nil
          lsp-auto-guess-root t
          lsp-before-save-edits nil
          lsp-ui-doc-enable nil
          lsp-ui-doc-header t
          lsp-ui-doc-include-signature t
          lsp-ui-doc-border (face-foreground 'default)
          lsp-ui-doc-delay 0
          lsp-ui-sideline-enable nil
          lsp-ui-sideline-ignore-duplicate t
          lsp-ui-sideline-show-code-actions t
          lsp-ui-peek-enable t
          lsp-ui-peek-fontify 'always
          )

     ;; File types
     markdown
     yaml
     pdf
     html
     (org :variables
          org-want-todo-bindings t
          org-hide-leading-stars nil
          org-hide-emphasis-markers t
          org-hide-macro-markers t
          org-level-color-stars-only t
          org-enable-github-support t
          org-enable-reveal-js-support t)

     ;; Utils
     helm
     git
     neotree
     systemd
     version-control
     search-engine
     ;; (ranger :variables
     ;;         ranger-show-preview t)
     (shell :variables
            shell-default-shell 'ansi-term
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables
                     spell-checking-enable-by-default nil
                     spell-checking-enable-auto-dictionary t)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(cmake-mode
                                      doom-themes
                                      format-all
                                      xclip
                                      arduino-mode
                                      exec-path-from-shell
                                      org-make-toc)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    evil-escape)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

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
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
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
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-dark
                         solarized-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 17
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   dotspacemacs-mode-line-theme '(doom :separator wave :separator-scale 1.5)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'original
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 95
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
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
   dotspacemacs-whitespace-cleanup 'trailing

   ;; make backup files
   make-backup-files nil
   ))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
)

(setq helm-buffer-max-length 50)

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."

  (setq shell-file-name "/bin/zsh")
  (setq term-char-mode-point-at-process-mark nil)
  (setq-default dotspacemacs-themes '(doom-solarized-dark
                                      doom-solarized-light
                                      doom-one)
                ;; Ignore any ROS environment variables since they might change depending
                ;; on which catkin workspace is used. When a new catkin workspace is chosen
                ;; call `spacemacs/update-ros-envs' to update theses envs accordingly
                spacemacs-ignored-environment-variables '("ROS_IP"
                                                          "PYTHONPATH"
                                                          "CMAKE_PREFIX_PATH"
                                                          "ROS_MASTER_URI"
                                                          "ROS_PACKAGE_PATH"
                                                          "ROSLISP_PACKAGE_DIRECTORIES"
                                                          "PKG_CONFIG_PATH"
                                                          "LD_LIBRARY_PATH"))

  (setq configuration-layer-elpa-archives
        '(("melpa-cn" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
          ("org-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")
          ("gnu-cn"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))


  (my-setup-indent 4);
  ;; (setq-default tab-width 4)
  ;; (setq-default indent-tabs-mode nil)

  (setenv "WORKON_HOME" "~/anaconda3/envs")
)

(defun spacemacs/update-ros-envs ()
  "Update all environment variables in `spacemacs-ignored-environment-variables'
from their values currently sourced in the shell environment (e.g. .bashrc)"
  (interactive)
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-copy-envs spacemacs-ignored-environment-variables)
  (message "ROS environment copied successfully from shell"))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Transparency settings
  (spacemacs/set-leader-keys "tt" 'spacemacs/toggle-transparency)
  (add-hook 'after-make-frame-functions 'spacemacs/enable-transparency)

  ;; Default toggle setting
  (spacemacs/toggle-indent-guide-globally-on)

  ;; Set google as default search engine
  (spacemacs/set-leader-keys "ag" 'engine/search-google)
  (setq browse-url-browser-function 'browse-url-generic
        engine/browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome")

  ;; Org-mode
  (setq org-agenda-files (list "~/org/work.org"
                               "~/org/home.org"))

  ;; reveal.js
  (setq org-reveal-root (file-truename "~/.spacemacs.d/reveal.js"))

  ;; C++ build dir setting
  (put 'cmake-ide-dir 'safe-local-variable 'stringp)
  (put 'cmake-ide-make-command 'safe-local-variable 'stringp)
  (put 'cmake-ide-cmake-args 'safe-local-variable 'stringp)

  ;; Python interpreter
  ;; (setq python-shell-interpreter "/usr/bin/python3")

  ;; Autocompletion configuration
  (use-package company
    :ensure t
    :config
    (setq company-idle-delay 0)
    (setq company-minimum-prefix-length 2))
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-j") 'company-select-next)
    (define-key company-active-map (kbd "C-k") 'company-select-previous))
  (with-eval-after-load 'company
    (add-hook 'c++-mode-hook 'company-mode)
    (add-hook 'c-mode-hook 'company-mode))

  ;; Kill all buffers
  (defun nuke-all-buffers ()
    (interactive)
    (mapcar 'kill-buffer (buffer-list))
    (delete-other-windows))
  (global-set-key (kbd "C-x K") 'nuke-all-buffers)

  ;; Make w key in vim mode move to end of the word (not stopped by _)
  (with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))

  ;; Only kill frame when using SPC+q+q
  (spacemacs/set-leader-keys "qq" 'spacemacs/frame-killer)

  ;; Turn on xclip mode
  (xclip-mode t)

  (with-eval-after-load 'flycheck
    (setq flycheck-check-syntax-automatically '(save
                                                idle-buffer-switch
                                                mode-enabled)))

  (require 'magit)
  ;; (defun magit-display-buffer-pop-up-frame (buffer)
  ;;   (if (with-current-buffer buffer (eq major-mode 'magit-status-mode))
  ;;       (display-buffer buffer
  ;;                       '((display-buffer-reuse-window
  ;;                          display-buffer-pop-up-frame)
  ;;                         (reusable-frames . t)))
  ;;     (magit-display-buffer-traditional buffer)))
  ;; (setq magit-display-buffer-function #'magit-display-buffer-traditional)
  (defun magit-diff-visit-file-other-window (&optional noselect)
    "Visit current file in another window."
    (interactive)
    (let ((current-window (selected-window))
          ;; magit-diff-visit-file visits in other-window with prefix arg
          (current-prefix-arg t))
      (call-interactively 'magit-diff-visit-file)
      (when noselect
        (select-window current-window))))

  (defun magit-diff-visit-file-other-window-noselect ()
    "Visit current file in another window, but don't select it."
    (interactive)
    (magit-diff-visit-file-other-window t))

  (use-package magit
    :ensure t
    :init
    ;; disable gravatars
    (setq magit-revision-show-gravatars nil)

    ;; hide recent commits in magit-status
    (setq magit-log-section-commit-count 0)

    :bind (("C-x m" . magit-status)
           ("C-c b" . magit-blame)
           :map magit-status-mode-map
           ;; make C-o and o behave as in dired
           ("o" . magit-diff-visit-file-other-window)
           ("C-o" . magit-diff-visit-file-other-window-noselect)))

  (load-file "~/.spacemacs.d/private/auto-save/auto-save.el")
  (require 'auto-save)
  (auto-save-enable)
  (setq auto-save-silent t)   ; quietly save
  (setq auto-save-idle 0.3)   ; quietly save
  (setq auto-save-delete-trailing-whitespace t)  ; automatically delete spaces at the end of the line when saving


  (load-file "~/.spacemacs.d/private/awesome-tab/awesome-tab.el")
  (require 'awesome-tab)
  (awesome-tab-mode t)
  (setq awesome-tab-height 130)

  (spacemacs/set-leader-keys "atl" 'awesome-tab-forward-tab)
  (spacemacs/set-leader-keys "ath" 'awesome-tab-backward-tab)
  (spacemacs/set-leader-keys "atj" 'awesome-tab-ace-jump)
  (spacemacs/set-leader-keys "ats" 'awesome-tab-switch-group)
  (spacemacs/set-leader-keys "atf" 'awesome-tab-forward-group)
  (spacemacs/set-leader-keys "atb" 'awesome-tab-backward-group)

  ;; (load-file "~/.spacemacs.d/private/aweshell/eshell-up.el")
  ;; (load-file "~/.spacemacs.d/private/aweshell/aweshell.el")
  ;; (load-file "~/.spacemacs.d/private/aweshell/eshell-prompt-extras.el")
  ;; (load-file "~/.spacemacs.d/private/aweshell/exec-path-from-shell.el")
  ;; (load-file "~/.spacemacs.d/private/aweshell/eshell-did-you-mean.el")
  ;; (require 'aweshell)
  ;; (spacemacs/set-leader-keys "osn" 'aweshell-new)
  ;; (spacemacs/set-leader-keys "osdcb" 'aweshell-dedicated-create-buffer)

  (require 'all-the-icons)
  (setq inhibit-compacting-font-caches t)
  (setq neo-theme 'icons)

  ;;; custom predicates if you don't want auto save.
  ;;; disable auto save mode when current filetype is an gpg file.
  (setq auto-save-disable-predicates
        '((lambda ()
            (string-suffix-p
             "gpg"
             (file-name-extension (buffer-name)) t))))

  ;; Other settings
  (setq find-file-visit-truename t)
  (setq helm-swoop-use-fuzzy-match t)
  (setq helm-swoop-use-line-number-face t)

  ;; C-a for increasing number, C-x for descreasing number
  (evil-define-key 'normal global-map (kbd "C-a") 'evil-numbers/inc-at-pt)
  (evil-define-key 'normal global-map (kbd "C-x") 'evil-numbers/dec-at-pt)
  (evil-define-key 'normal global-map (kbd "-") 'evil-previous-line-first-non-blank)

  ;; Zoom in / out
  ;; (define-key (current-global-map) (kbd "C-+") 'spacemacs/zoom-frm-in)
  ;; (define-key (current-global-map) (kbd "C--") 'spacemacs/zoom-frm-out)

  ;; Use windows key as meta key to avoid conflicts with i3wm
  (setq x-super-keysym 'meta)

  ;; dired
  (require 'dired)
  (define-key dired-mode-map "c" 'find-file)

  ;; Ranger keybindings
  ;; (require 'ranger)
  ;; (define-key ranger-mode-map (kbd "M-h") 'ranger-prev-tab)
  ;; (define-key ranger-mode-map (kbd "M-l") 'ranger-next-tab)
  ;; (define-key ranger-mode-map (kbd "M-n") 'ranger-new-tab)
  ;; (spacemacs/set-leader-keys "ar" 'ranger)

  (require 'lsp-ui)
  (define-key lsp-ui-peek-mode-map (kbd "C-j") 'lsp-ui-peek--select-next)
  (define-key lsp-ui-peek-mode-map (kbd "C-k") 'lsp-ui-peek--select-prev)

  ;; Semantic mode
  (semantic-mode t)

  ;; Org mode
  (require 'org)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "=" 'editorconfig-format-buffer)
  (define-key org-mode-map (kbd "C-<tab>") 'org-table-previous-field)
  (setq org-export-with-sub-superscripts 'nil)

  ;; Enable doom-modeline-icons in gui and disable them in terminal
  (defun enable-doom-modeline-icons()
    (setq doom-modeline-icon (display-graphic-p)))
  (defun enable-doom-modeline-icons-weird (_frame)
    ;; TODO: Don't know why this "not" is needed...
    (setq doom-modeline-icon (not (display-graphic-p))))
  (add-hook 'focus-in-hook
            #'enable-doom-modeline-icons)
  (add-hook 'after-make-frame-functions
            #'enable-doom-modeline-icons-weird)

  ;; Enable format-all minor mode
  ;; (add-hook 'python-mode-hook #'yapf-mode)
  (add-hook 'sh-mode-hook #'format-all-mode)
  (add-hook 'fish-mode-hook #'format-all-mode)

  ;; ccls
  (require 'ccls)
  (setq ccls-root-files (add-to-list 'ccls-root-files "build/compile_commands.json" t))
  (setq ccls-sem-highlight-method 'font-lock)
  (setq ccls-initialization-options
        (list :cache (list :directory (concat (file-name-as-directory spacemacs-cache-directory) ".ccls-cache") )
              :compilationDatabaseDirectory "build"))
  (setq ccls-executable (file-truename "~/.spacemacs.d/ccls/Release/ccls"))

  ;; Configure glow viewer
  (defun start-glow-viewer ()
    (interactive)
    (start-process "glow-markdown-viewer" nil
                   "/usr/bin/x-terminal-emulator"
                   (file-truename "~/.spacemacs.d/scripts/glow_mk_viewer.sh")
                   (buffer-file-name nil)))

  ;; Mouse & Smooth Scroll
  ;; Scroll one line at a time (less "jumpy" than defaults)
  (when (display-graphic-p)
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
          mouse-wheel-progressive-speed nil))
  (setq scroll-step 1
        scroll-margin 0
        scroll-conservatively 100000)

  (with-eval-after-load 'org
    (require 'ob-python)
    (require 'ob-C)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((C . t)
       (python . t)
       (shell . t))))

  ;; Workaround for https://github.com/syl20bnr/spacemacs/issues/13100
  (setq completion-styles `(basic partial-completion emacs22 initials
                                  ,(if (version<= emacs-version "27.0") 'helm-flex 'flex)))

  ;; Workaround for https://github.com/company-mode/company-mode/issues/383
  (evil-declare-change-repeat 'company-complete)

  ;; Workaround for https://github.com/syl20bnr/spacemacs/issues/10410
  (defun kill-minibuffer ()
    (interactive)
    (when (windowp (active-minibuffer-window))
      (evil-ex-search-exit)))
  (add-hook 'mouse-leave-buffer-hook #'kill-minibuffer))
