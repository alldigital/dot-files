;; -*- mode:lisp -*-

(defvar ed/swank-port
           (+ swank::default-server-port ed/display-number))

(defvar ed/swank-process-name
  (concat "Swank " (write-to-string (+ swank::default-server-port ed/display-number))))

(defcommand swank () ()
  "Launch swank server if one isn't running."
  (if (find ed/swank-process-name (mapcar #'sb-thread:thread-name
                                 (sb-thread:list-all-threads))
            :test #'cl:string-equal)
      (echo-string (current-screen) (concat "Swank already running on port "
                                            (write-to-string ed/swank-port)))
      (progn  (swank:create-server :port ed/swank-port
                                   :style swank:*communication-style*
                                   :dont-close t)
              (echo-string (current-screen)
                           "Starting swank."))))

(swank)
