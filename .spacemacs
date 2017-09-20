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
   ;; List of aTry calling it in the REPLdditional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   ;; '(
   ;;   ;; ----------------------------------------------------------------
   ;;   ;; Example of useful layers you may want to use right away.
   ;;   ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
   ;;   ;; <M-m f e R> (Emacs style) to install them.
   ;;   ;; ----------------------------------------------------------------
   ;;   helm
   ;;   ;; auto-completion
   ;;   ;; better-defaults
   ;;   emacs-lisp
   ;;   ;; git
   ;;   ;; markdown
   ;;   ;; org
   ;;   ;; (shell :variables
   ;;   ;;        shell-default-height 30
   ;;   ;;        shell-default-position 'bottom)
   ;;   ;; spell-checking
   ;;   ;; syntax-checking
   ;;   ;; version-control
   ;;   racket
   ;;   )
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     helm
     spell-checking
     syntax-checking
     ;; themes-megapack
     ;; Programming languages
     c-c++
     (clojure :variables clojure-enable-fancify-symbols t)
     colors
     common-lisp
     elm
     emacs-lisp
     haskell
     java
     javascript
     lua
     php
     python
     racket
     (ruby :variables ruby-version-manager 'rvm)
     ruby-on-rails
     rust
     (scala :variables scala-enable-eldoc t scala-auto-insert-asterisk-in-comments t)
     vimscript
     ;; Version control
     git
     github
     version-control
     ;; Markup
     ansible
     command-log
     csv
     docker
     html
     markdown
     nginx
     pdf-tools
     yaml
     (org :variables org-enable-github-support t)
     (spacemacs-layouts :variables layouts-enable-autosave t layouts-autosave-delay 300)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     (ranger :variables ranger-show-preview t
             ranger-show-hidden t
             ranger-cleanup-eagerly t
             ranger-ignored-extensions '("mkv" "avi" "iso" "mp3" "mp4"))
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     ;; (org-protocol-capture-html :local (recipe :fetcher github :repo "alphapapa/org-protocol-capture-html"))
     ;; solarized-theme
     clojure-snippets
     color-theme-solarized
     darkroom
     dockerfile-mode
     fontawesome
     langtool
     magithub
     material-theme
     plan9-theme
     highlight-indent-guides
     (sunrise-commander :location (recipe :fetcher github :repo "escherdragon/sunrise-commander"))
     symon
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be ins talled and loaded.
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-check-for-update t
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
   dotspacemacs-themes '(
                         material
                         solarized
                         solarized-light
                         spacemacs-dark
                         spacemacs-light
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Input Mono Compressed"
                               :size 14
                               :weight normal
                               :width normal
                               :style Medium
                               :powerline-scale 1.1)
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
   dotspacemacs-auto-save-file-location 'cache
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
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
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
   dotspacemacs-line-numbers '(:relative t
                               :size-limit-kb 1024)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
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
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq-default evil-escape-key-sequence "jk")

  (when (eq system-type 'gnu/linux)
    ;; tweak for using brew emacs (not emacs-mac which doesn't support running
    ;; in a terminal)
    (setq browse-url-browser-function 'browse-url-generic
          browse-url-generic-program "google-chrome")
    )
  ;; Avoid the dreaded $PATH env var warning durint initialization
  (setq exec-path-from-shell-check-startup-files nil)

)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; (when (display-graphic-p)
  ;;   (set-face-attribute 'default nil :font "PragmataPro for Powerline" :weight
  ;;                       'normal))
  ;; (set-terminal-parameter nil 'background-mode 'dark)
  ;; (set-frame-parameter nil 'background-mode 'dark)
  ;; (spacemacs/load-theme 'solarized)

  ;; SPC h d k workaround, causes error otherwise
  (require 'ansible-doc)

  (require 'org-protocol)
  ;; (require 'org-protocol-capture-html)

  (require 'darkroom)

  ;; Add create dir to ranger
  ;; (define-key ranger-normal-mode-map (kbd "+") #'dired-create-directory)

  ;; backups-mode
  (add-to-list 'load-path "/home/ed/.emacs.d/private/local/backups-mode")
  (require 'backups-mode)
  ;; (defvar backup-directory "~/.emacs-backups/backups/")
  ;; (defvar tramp-backup-directory "~/.emacs-backups/tramp-backups/")
  ;; keep all versions forever
  (setq delete-old-versions 1)
  (backups-minor-mode)


  (add-hook 'before-save-hook 'delete-trailing-whitespace)

  ;; Add line numbers
  (global-linum-mode)
  (with-eval-after-load 'linum
  (linum-relative-toggle))

  ;; Copy text selected with the mouse to kill ring and clipboard
  (setq mouse-drag-copy-region t)

  ;; Org mode alternative bullets
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  ;; All files in this directory should activate org-mode
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
  (add-to-list 'auto-mode-alist `(,(expand-file-name "~/.notes/") . org-mode))

  ;; Default browser
  ;; (setq browse-url-browser-function 'browse-url-generic
  ;;       browse-url-generic-program "google-chrome-stable")

  ;; From Sacha Chua's config http://pages.sachachua.com/.emacs.d/Sacha.html
  ;; Backup settings
  ;; (setq backup-directory-alist '(("." . "~/.emacs.d/private/backups")))
  ;; (setq delete-old-versions -1)
  ;; (setq version-control t)
  ;; (setq vc-make-backup-files t)

  (setq auto-save-file-name-transforms '((".*" "~/.emacs.local.d/auto-save-list/" t)))

  ;; History settings
  (setq savehist-file "~/.emacs.local.d/savehist")
  (savehist-mode 1)
  (setq history-length t)
  (setq history-delete-duplicates t)
  (setq savehist-save-minibuffer-history 1)
  (setq savehist-additional-variables
        '(kill-ring
          search-ring
          regexp-search-ring))

  ;; GNU Smalltalk mode
  ;; (load-file "/usr/share/emacs/site-lisp/site-start.d/smalltalk-mode-init.el")

  ;; Global keybindings

  (evil-leader/set-key
    "fx" '(lambda() (interactive)(switch-to-buffer "*scratch*"))
    )

  (evil-leader/set-key
    "oa" 'org-agenda
    "od" 'ed/org-agenda-day
    "oc" 'org-capture
    )

  (defun ed/org-agenda-day ()
    (interactive)
    (org-agenda-list nil nil 'day nil)
    )

  ;; replaces URL with Org-mode link including description

  (defun my-www-get-page-title (url)
    "retrieve title of web page. from: http://www.opensubscriber.com/message/help-gnu-emacs@gnu.org/14332449.html"
    (let ((title))
      (with-current-buffer (url-retrieve-synchronously url)
        (goto-char (point-min))
        (re-search-forward "<title>\\([^<]*\\)</title>" nil t 1)
        (setq title (match-string 1))
        (goto-char (point-min))
        (re-search-forward "charset=\\([-0-9a-zA-Z]*\\)" nil t 1)
        (decode-coding-string title (intern (match-string 1)))))
    )


  (defun my-url-linkify ()
    "Make URL at cursor point into an Org-mode link.
If there's a text selection, use the text selection as input.

Example: http://example.com/xyz.htm
becomes
\[\[http://example.com/xyz.htm\]\[Source example.com\]\]

Adapted code from: http://ergoemacs.org/emacs/elisp_html-linkify.html"
    (interactive)
    (let (resultLinkStr bds p1 p2 domainName)
      ;; get the boundary of URL or text selection
      (if (region-active-p)
	  (setq bds (cons (region-beginning) (region-end)) )
	(setq bds (bounds-of-thing-at-point 'url))
	)
      ;; set URL
      (setq p1 (car bds))
      (setq p2 (cdr bds))
      (let (
	    (url (buffer-substring-no-properties p1 p2))
	    )
	;; retrieve title
	(let ((title (my-www-get-page-title url)))
	  (message (concat "title is: " title))
	  ;;(setq url (replace-regexp-in-string "&" "&amp;" url))
	  (let ((resultLinkStr (concat "[[" url "][" title "]]")))
	    ;; delete url and insert the link
	    (delete-region p1 p2)
	    (insert resultLinkStr)
	    )
	  ))))

  ;; Org Capture
  (defun ed/configure-org-capture ()

    ;; Capture support functions

    ;; Capture templates

    (setq org-capture-templates
          (quote (
                  ("a" "Appointment" entry (file+headline "gcal.org" "Appointments")
                   "* TODO  %?\nAppointment created: %U\nDeadline: %^T\n%a\n" :prepend t)
                  ("l" "Link" entry (file+headline "links.org" "Unsorted Links")
                  "* %? %^L %^g \n%T" :prepend t)
                  ("n" "Note" entry (file+headline org-default-notes-file "Unsorted Notes")
                   "*  %? :NOTE:\n%U\n%a\n" :prepend t)
                  ("N" "Note with clipboard contents" entry (file+headline org-default-notes-file "Unsorted Notes")
                   "*  %? :NOTE:\n%U\n#+BEGIN_QUOTE\n%x\n#+END_QUOTE\n" :prepend t)
                  ("t" "Todo" entry (file+headline org-default-notes-file "Unsorted Todo")
                   "* TODO %?\n%U\n%a\n" :prepend t)
                  ("m" "Movies to see" entry (file+headline "movies.org" "To Download")
                   "* ToDownload %? \n  :PROPERTIES:\n  :DATE: %t\n  :URL: %c\n  :END:")
                  ("i" "idea" entry (file org-default-notes-file)
                   "* %? :IDEA:\n%U\n%a\n")
                  )))
  )

  ;; Clojure additional settings

  (with-eval-after-load 'clojure-mode
    (put-clojure-indent 'cond #'indent-cond)
    (set-face-italic 'clojure-keyword-face t))

  (add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
  (add-to-list 'magic-mode-alist '(".* boot" . clojure-mode))

  ;; lisp wrap-around fix
  (spacemacs/set-leader-keys "kw" nil)
  (spacemacs/set-leader-keys "kw(" 'paredit-wrap-round)
  (spacemacs/set-leader-keys "kw[" 'paredit-wrap-square)
  (spacemacs/set-leader-keys "kw{" 'paredit-wrap-curly)
  (spacemacs/set-leader-keys "kw<" 'paredit-wrap-angled)
  (spacemacs/set-leader-keys "kwr" 'sp-rewrap-sexp)

  ;; Paredit keybindings

  (with-eval-after-load 'paredit
    (message "Bindings for paredit")
    (dolist (binding '(("C-<left>" . paredit-backward-slurp-sexp)
                       ("C-<right>" . paredit-backward-barf-sexp)
                       ("C-M-<left>" . paredit-forward-barf-sexp)
                       ("C-M-<right>" . paredit-forward-slurp-sexp)
                       ("M-<up>" . paredit-splice-sexp-killing-backward)
                       ("M-<down>" . paredit-splice-sexp-killing-forward)))
      (define-key paredit-mode-map (kbd (car binding)) (cdr binding))))

  (with-eval-after-load 'smartparens
    (message "Bindings for smartparens")
    (dolist (binding '(("C-<left>" . sp-backward-slurp-sexp)
                     ("C-<right>" . sp-backward-barf-sexp)
                     ("C-M-<left>" . sp-forward-barf-sexp)
                     ("C-," . sp-forward-barf-sexp)
                     ("C-M-<right>" . sp-forward-slurp-sexp)
                     ("C-." . sp-forward-slurp-sexp)
                     ("M-<up>" . sp-splice-sexp-killing-backward)
                     ("M-<down>" . sp-splice-sexp-killing-forward)
                     (";" . (lambda ()
                              (interactive)
                              (if (member major-mode '(clojure-mode
                                                       clojurescript-mode
                                                       emacs-lisp-mode))
                                  (sp-comment)
                                (self-insert-command 1))))))
    (define-key smartparens-mode-map (kbd (car binding)) (cdr binding))))

  ;; Bunch of useful settings from internets
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)


  (defun ed/configure-org-mode ()
    (require 'org-checklist)
    (ed/configure-org-capture)

    ;;  Org file paths
    (setq ed/home-dir (expand-file-name "~"))
    (setq org-directory (concat ed/home-dir "/org"))
    (setq org-default-notes-file (concat org-directory "/notes.org"))

    ;; agenda

    (setq org-agenda-files (list org-directory))
    (setq org-agenda-skip-scheduled-if-done t)
    (setq org-agenda-skip-deadline-if-done t)

    ;; keybindings
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "z" 'org-add-note)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "F" 'org-attach)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode "g" 'org-mac-grab-link)

    ;; todos
    (setq org-todo-keywords
      (quote
       ((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "CANCELLED" "DONE"))))

    (setq org-todo-keyword-faces
          (quote
           (("TODO" . "black")
            ("IN-PROGRESS" . "green")
            ("WAITING" . "blue")
            ("DONE" :foreground "white" :weight bold)
            ("CANCELLED" :foreground "purple" :weight bold :strike-through t))))
    )

  ;; (custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  ;; '(default ((t (:background nil))))
  ;;  '(helm-ff-directory ((t (:background "#263238" :foreground "#81d4fa"))))
  ;;  '(helm-ff-file ((t (:background "#263238" :foreground "#ffffff"))))

  ;;  '(slime-repl-inputed-output-face ((t (:foreground "Green")))))

  (ed/configure-org-mode)

  (load-theme 'material)


  ;; Highlight indents
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "/usr/bin/sbcl")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-eldoc-display-context-dependent-info t)
 '(cider-eval-result-prefix ";;=> ")
 '(cider-repl-display-help-banner nil)
 '(cider-repl-history-file "~/.lein/cider-repl-history")
 '(cider-show-error-buffer nil)
 '(custom-safe-themes
   (quote
    ("5a7830712d709a4fc128a7998b7fa963f37e960fd2e8aa75c76f692b36e6cf3c" "aea30125ef2e48831f46695418677b9d676c3babf43959c8e978c0ad672a7329" "93268bf5365f22c685550a3cbb8c687a1211e827edc76ce7be3c4bd764054bad" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "85d609b07346d3220e7da1e0b87f66d11b2eeddad945cac775e80d2c1adb0066" "5a39d2a29906ab273f7900a2ae843e9aa29ed5d205873e1199af4c9ec921aaab" "840db7f67ce92c39deb38f38fbc5a990b8f89b0f47b77b96d98e4bf400ee590a" "45a8b89e995faa5c69aa79920acff5d7cb14978fbf140cdd53621b09d782edcf" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(package-selected-packages
   (quote
    (symon sunrise-commander rainbow-mode rainbow-identifiers color-identifiers-mode base16-theme ghub+ apiwrap ghub plan9-theme material-theme magithub langtool highlight-indent-guides fontawesome darkroom color-theme-solarized color-theme yapfify yaml-mode web-mode web-beautify vimrc-mode unfill toml-mode tagedit smeargle slime-company slime slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv ranger racer pyvenv pytest pyenv-mode py-isort pug-mode projectile-rails rake pip-requirements phpunit phpcbf php-extras php-auto-yasnippets pdf-tools ox-gfm orgit org-projectile org-present org-pomodoro alert log4e gntp org-download noflet nginx-mode mwim mmm-mode minitest markdown-toc markdown-mode magit-gitflow magit-gh-pulls lua-mode livid-mode skewer-mode simple-httpd live-py-mode less-css-mode js2-refactor js2-mode js-doc jinja2-mode intero hy-mode htmlize hlint-refactor hindent helm-pydoc helm-hoogle helm-gitignore helm-css-scss helm-company helm-c-yasnippet haskell-snippets haml-mode gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-rust flycheck-pos-tip pos-tip flycheck-haskell flycheck-elm flycheck feature-mode evil-magit magit git-commit with-editor ensime sbt-mode scala-mode emmet-mode elm-mode drupal-mode php-mode dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat disaster diff-hl dactyl-mode cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-ghci company-ghc ghc haskell-mode company-emacs-eclim eclim company-cabal company-c-headers company-ansible company-anaconda company common-lisp-snippets command-log-mode coffee-mode cmm-mode cmake-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg clang-format cider-eval-sexp-fu cider seq queue clojure-mode chruby cargo rust-mode bundler inf-ruby auto-yasnippet yasnippet auto-dictionary ansible-doc ansible anaconda-mode pythonic ac-ispell auto-complete racket-mode faceup ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(read-quoted-char-radix 16))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "PragmataPro for Powerline" :foundry "fsdf" :slant normal :weight normal :height 98 :width normal))))
 '(slime-repl-inputed-output-face ((t (:foreground "green")))))
