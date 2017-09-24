;; -*-lisp-*-
;;
;; init.lisp

(in-package :stumpwm)


(ql:quickload :clx-truetype)

(setf xft:*font-dirs* '("/usr/share/fonts" "/home/ed/.local/share/fonts/InputMonoCompressed"))
(xft:cache-fonts)
(ql:quickload :ttf-fonts)

(ql:quickload :swank)

;; (set-font (make-instance 'xft:font :family "PragmataPro for Powerline"
;;                                    :subfamily "Regular"
;;                                    :size 10))

(set-font (make-instance 'xft:font :family "InputMonoCompressed"
                                   :subfamily "Regular"
                                   :size 10))
;; load external rc files

(defvar *load-directory*
  (directory-namestring
   (truename (merge-pathnames (user-homedir-pathname)
                              ".stumpwm.d")))
  "A directory with initially loaded files.")

(defun load-file (filename)
  "Load a file FILENAME (without extension) from `*load-directory*'."
  (let ((file (merge-pathnames (concat filename ".lisp")
                               *load-directory*)))
    (if (probe-file file)
        (load file)
        (format *error-output* "File '~a' doesn't exist." file))))

(defun load-files (filenames)
  "Load a list of files (without extensions) from `*load-directory*'."
  (mapcar #'load-file filenames))


;; load all files
(load-files
  '("util"
    "xresources"
    "apps"
    "gaps"
    "keys"
    "layout"
    "mode-line"
    "mouse"
    "system"
    "swank"
    "startup"
    "customize"))
