;; -*-lisp-*-
;;
;; Here is a sample .stumpwmrc file

(in-package :stumpwm)

(sb-posix:putenv "SBCL_HOME=/usr/lib/sbcl")

;; (run-shell-command "xmodmap ~/.xmodmap.stumpwm")
(run-shell-command "setxkbmap -option caps:backspace -option shift:both_capslock -option 'grp:alt_space_toggle' \"us,ru(winkeys)\"")
;; change the prefix key to something else
(set-prefix-key (kbd "s-z"))
;; (set-prefix-key (kbd "F20"))

;; prompt the user for an interactive command. The first arg is an
;; optional initial contents.
(defcommand colon1 (&optional (initial "")) (:rest)
  (let ((cmd (read-one-line (current-screen) ": " :initial-input initial)))
    (when cmd
      (eval-command cmd t))))

;; Read some doc
(define-key *root-map* (kbd "d") "exec gv")
;; Browse somewhere
;; (define-key *root-map* (kbd "b") "colon1 exec firefox http://www.")
;; Ssh somewhere
(define-key *root-map* (kbd "C-s") "colon1 exec termite -e ssh ")
;; Start Chrome
(define-key *root-map* (kbd "g") "exec google-chrome-stable")
;; Lock screen
(define-key *root-map* (kbd "C-l") "exec i3lock-fancy")
;; Terminal
(define-key *root-map* (kbd "t") "exec i3-sensible-terminal")
;; Libreoffice
(define-key *root-map* (kbd "o") "exec LANG=ru_RU.UTF-8 libreoffice")

;; Web jump (works for Google and Imdb)
(defmacro make-web-jump (name prefix)
  `(defcommand ,(intern name) (search) ((:rest ,(concatenate 'string name " search: ")))
    (substitute #\+ #\Space search)
    (run-shell-command (concatenate 'string ,prefix search))))

(make-web-jump "google" "google-chrome-stable http://www.google.fr/search?q=")
(make-web-jump "imdb" "google-chrome-stable http://www.imdb.com/find?q=")

;; C-t M-s is a terrble binding, but you get the idea.
(define-key *root-map* (kbd "M-s") "google")
(define-key *root-map* (kbd "i") "imdb")

;; Message window font
;; (set-font "-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-15")
;; (set-font "-misc-roboto condensed-medium-r-normal--14-140-72-72-p-80-iso8859-1")
;; (set-font "-misc-roboto condensed light-light-r-*-*-*-*-*-*-*-*-*-uni")

;; (load-module "ttf-fonts")
;; "(set-font (make-instance 'xft:font :family \"PragmataPro for Powerline\" :subfamily \"Regular\" :size 12))"+y
;;; Define window placement policy...

;; Clear rules
(clear-window-placement-rules)

;; Last rule to match takes precedence!
;; TIP: if the argument to :title or :role begins with an ellipsis, a substring
;; match is performed.
;; TIP: if the :create flag is set then a missing group will be created and
;; restored from *data-dir*/create file.
;; TIP: if the :restore flag is set then group dump is restored even for an
;; existing group using *data-dir*/restore file.
(define-frame-preference "Default"
  ;; frame raise lock (lock AND raise == jumpto)
  (0 t nil :class "Konqueror" :role "...konqueror-mainwindow")
  (1 t nil :class "XTerm"))

(define-frame-preference "Ardour"
  (0 t   t   :instance "ardour_editor" :type :normal)
  (0 t   t   :title "Ardour - Session Control")
  (0 nil nil :class "XTerm")
  (1 t   nil :type :normal)
  (1 t   t   :instance "ardour_mixer")
  (2 t   t   :instance "jvmetro")
  (1 t   t   :instance "qjackctl")
  (3 t   t   :instance "qjackctl" :role "qjackctlMainForm"))

(define-frame-preference "Shareland"
  (0 t   nil :class "XTerm")
  (1 nil t   :class "aMule"))

(define-frame-preference "Emacs"
  (1 t t :restore "emacs-editing-dump" :title "...xdvi")
  (0 t t :create "emacs-dump" :class "Emacs"))

(load "~/.emacs.d/elpa/slime-20170319.1601/swank-loader.lisp")
(swank-loader:init)


(ql:quickload :clx-truetype)
(xft:cache-fonts)
(ql:quickload :ttf-fonts)
;; (ql:quickload :swank)

(set-font (make-instance 'xft:font :family "PragmataPro for Powerline" :subfamily "Regular" :size 12))

(defcommand swank () ()
            "Launch swank server if one isn't running."
            (if (find "Swank 4004" (mapcar #'sb-thread:thread-name
                                           (sb-thread:list-all-threads))
                      :test #'cl:string-equal)
                (echo-string (current-screen) "Swank already running on port 4004.")
                (progn  (swank:create-server :port 4004
                                             :style swank:*communication-style*
                                             :dont-close t)
                        (echo-string (current-screen)
                                     "Starting swank."))))

(swank)

;; (defmacro select-group-or-create ((name &key (float nil)) &body body)
;;   (let ((name-sym (gensym "NAME-"))
;;         (group-sym (gensym "GROUP-")))
;;     `(let* ((,name-sym ,name)
;;             (,group-sym (find ,name-sym (screen-groups (current-screen)) :key #'group-name :test #'equal)))
;;        (if ,group-sym
;;            (gselect ,group-sym)
;;            (progn
;;              ,(if float
;;                   `(gnew-float ,name-sym)
;;                   `(gnew ,name-sym))
;;              (progn
;;                ,@body))))))

;; (defcommand android-studio () ()
;;   "Start Android Studio in its own group"
;;   (select-group-or-create ("Android Studio" :float t)
;;                           (run-shell-command "android-studio" nil)))
