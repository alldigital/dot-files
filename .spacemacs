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
     better-defaults
     spell-checking
     syntax-checking
     themes-megapack
     ;; Programming languages
     c-c++
     elm
     emacs-lisp
     haskell
     java
     javascript
     lua
     php
     python
     ruby-on-rails
     rust
     (ruby :variables ruby-version-manager 'rvm)
     (clojure :variables clojure-enable-fancify-symbols t)
     (scala :variables scala-enable-eldoc t scala-auto-insert-asterisk-in-comments t)
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
     yaml
     (org :variables org-enable-github-support t)
     (spacemacs-layouts :variables layouts-enable-autosave t layouts-autosave-delay 300)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     fontawesome
     ;; color-theme-solarized
     solarized-theme
     clojure-snippets
     dockerfile-mode
     magithub
     ;; (org-protocol-capture-html :local (recipe :fetcher github :repo "alphapapa/org-protocol-capture-html"))
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-themes '(
                         solarized-dark
                         sanityinc-solarized-dark
                         material
                         material-light
                         spacemacs-light
                         spacemacs-dark
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '(
                               ;; "Iosevka"
                               "PragmataPro for Powerline"
                               :size 14
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
   dotspacemacs-major-mode-leader-key ","
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
   dotspacemacs-command-key "SPC"
   ;; dotspacemacs-command-key ":"
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers '(t
                               :relative t
                               :size-limit-kb 1024)
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  (when (display-graphic-p)
    (set-face-attribute 'default nil :font "PragmataPro for Powerline" :weight
                        'normal))
  ;; (set-terminal-parameter nil 'background-mode 'dark)
  ;; (set-frame-parameter nil 'background-mode 'dark)
  ;; (spacemacs/load-theme 'solarized)

  ;; org-protocol
  (require 'org-protocol)
  ;; (require 'org-protocol-capture-html)


  (add-hook 'before-save-hook 'delete-trailing-whitespace)
  ;; Add line numbers
  (global-linum-mode)
  (with-eval-after-load 'linum
    (linum-relative-toggle))
  ;; (load-theme 'solarized)
  ;; Org mode alternative bullets
  (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
  ;; All files in this directory should activate org-mode
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
  (add-to-list 'auto-mode-alist `(,(expand-file-name "~/.notes/") . org-mode))
  ;; Default browser
  (setq browse-url-browser-function 'browse-url-generic
        browse-url-generic-program "google-chrome-stable")
  ;; From Sacha Chua's config http://pages.sachachua.com/.emacs.d/Sacha.html
  ;; Backup settings
  (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
  (setq delete-old-versions -1)
  (setq version-control t)
  (setq vc-make-backup-files t)
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

    ;; Org file paths
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

  (ed/configure-org-mode)

  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-term-color-vector
   [unspecified "#081724" "#ff694d" "#68f6cb" "#fffe4e" "#bad6e2" "#afc0fd" "#d2f1ff" "#d3f9ee"])
 '(cider-repl-display-help-banner nil)
 '(cider-repl-history-file "~/.lein/cider-repl-history")
 '(cider-show-error-buffer nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("39dd7106e6387e0c45dfce8ed44351078f6acd29a345d8b22e7b8e54ac25bac4" "868f73b5cf78e72ca2402e1d48675e49cc9a9619c5544af7bf216515d22b58e7" "ecb9fe1d5b165a35499191a909b2b5710a52935614058b327a39bfbbb07c7dc8" "b8b66b57d6bb59b85416578cb1a338e3ad00a56da28e83362949cc2ca584c850" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "d9129a8d924c4254607b5ded46350d68cc00b6e38c39fc137c3cfb7506702c12" "f5512c02e0a6887e987a816918b7a684d558716262ac7ee2dd0437ab913eaec6" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "3ff96689086ebc06f5f813a804f7114195b7c703ed2f19b51e10026723711e33" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "77c65d672b375c1e07383a9a22c9f9fc1dec34c8774fe8e5b21e76dca06d3b09" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" "cedd3b4295ac0a41ef48376e16b4745c25fa8e7b4f706173083f16d5792bb379" "5dc0ae2d193460de979a463b907b4b2c6d2c9c4657b2e9e66b8898d2592e3de5" "28ec8ccf6190f6a73812df9bc91df54ce1d6132f18b4c8fcc85d45298569eb53" "c9321e2db48a21fc656a907e97ee85d8cd86967855bf0bed3998bcf9195c758b" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "51e228ffd6c4fff9b5168b31d5927c27734e82ec61f414970fc6bcce23bc140d" "d8f76414f8f2dcb045a37eb155bfaa2e1d17b6573ed43fb1d18b936febc7bbc2" "a164837cd2821475e1099911f356ed0d7bd730f13fa36907895f96a719e5ac3e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "66132890ee1f884b4f8e901f0c61c5ed078809626a547dbefbb201f900d03fd8" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "e56ee322c8907feab796a1fb808ceadaab5caba5494a50ee83a13091d5b1a10c" "cdbd0a803de328a4986659d799659939d13ec01da1f482d838b68038c1bb35e8" "19ba41b6dc0b5dd34e1b8628ad7ae47deb19f968fe8c31853d64ea8c4df252b8" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "b0ab5c9172ea02fba36b974bbd93bc26e9d26f379c9a29b84903c666a5fde837" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#eee8d5" t)
 '(frame-background-mode (quote dark))
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#fdf6e3" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#586e75")
 '(highlight-tail-colors
   (quote
    (("#eee8d5" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#69B7F0" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#eee8d5" . 100))))
 '(hl-bg-colors
   (quote
    ("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342")))
 '(hl-fg-colors
   (quote
    ("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3")))
 '(hl-sexp-background-color "#efebe9")
 '(linum-format " %7i ")
 '(magit-diff-use-overlays nil)
 '(mouse-yank-at-point t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (color-theme zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme majapahit-theme madhat2r-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme log4e winum unfill fuzzy company-ansible intero flycheck-haskell company-ghci company-ghc ghc toml-mode racer jinja2-mode hlint-refactor hindent helm-hoogle haskell-snippets flycheck-rust docker tablist docker-tramp csv-mode haskell-mode company-cabal cmm-mode cargo rust-mode ansible-doc ansible flycheck-elm elm-mode packed avy haml-mode magithub bind-key tern bind-map org scala-mode inflections seq highlight request magit-popup pcre2el minitest hide-comnt powerline spinner peg multiple-cursors clojure-mode anzu undo-tree async yasnippet inf-ruby dash dockerfile-mode phpunit phpcbf php-extras php-auto-yasnippets nginx-mode magit-gh-pulls github-search github-clone github-browse-file git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht drupal-mode php-mode diff-hl pug-mode yapfify uuidgen py-isort ox-gfm org-projectile org-download mwim livid-mode skewer-mode simple-httpd live-py-mode link-hint git-link flyspell-correct-helm flyspell-correct evil-visual-mark-mode evil-unimpaired evil-ediff dumb-jump company-emacs-eclim column-enforce-mode rake js2-mode iedit sbt-mode hydra cider auto-complete anaconda-mode smartparens flycheck company projectile helm helm-core markdown-mode alert magit git-commit with-editor f s package-build evil clojure-snippets yaml-mode ws-butler window-numbering which-key web-mode web-beautify volatile-highlights vi-tilde-fringe use-package toc-org tagedit spacemacs-theme spaceline solarized-theme smooth-scrolling smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe restart-emacs rbenv rainbow-delimiters quelpa pyvenv pytest pyenv-mode py-yapf projectile-rails popwin pip-requirements persp-mode paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file noflet neotree move-text mmm-mode markdown-toc magit-gitflow macrostep lua-mode lorem-ipsum linum-relative leuven-theme less-css-mode json-mode js2-refactor js-doc jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gitignore helm-flyspell helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md fontawesome flycheck-pos-tip flx-ido fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu ensime emmet-mode elisp-slime-nav eclim disaster define-word cython-mode company-web company-tern company-statistics company-quickhelp company-c-headers company-anaconda command-log-mode color-theme-solarized coffee-mode cmake-mode clj-refactor clean-aindent-mode clang-format cider-eval-sexp-fu chruby bundler buffer-move bracketed-paste auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#eee8d5")
 '(pos-tip-foreground-color "#586e75")
 '(select-enable-clipboard nil)
 '(select-enable-primary t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(solarized-distinct-fringe-background t)
 '(solarized-high-contrast-mode-line t)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c37300")
     (60 . "#b97d00")
     (80 . "#b58900")
     (100 . "#a18700")
     (120 . "#9b8700")
     (140 . "#948700")
     (160 . "#8d8700")
     (180 . "#859900")
     (200 . "#5a942c")
     (220 . "#439b43")
     (240 . "#2da159")
     (260 . "#16a870")
     (280 . "#2aa198")
     (300 . "#009fa7")
     (320 . "#0097b7")
     (340 . "#008fc7")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#fdf6e3" "#eee8d5" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#657b83" "#839496")))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
