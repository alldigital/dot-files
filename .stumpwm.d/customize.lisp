;; -*-lisp-*-
;;
;; customize.lisp
;; My stumpwm customizations

(in-package :stumpwm)

;; When set to :click, scrolling is slow/stuttering
;; Could be :click :sloppy and :ignore
(setf *mouse-focus-policy* :ignore)

(defun display-bindings-for-keymaps (key-seq &rest keymaps)
  (let* ((screen (current-screen))
         (data (mapcan (lambda (map)
                         (mapcar (lambda (b) (format nil "^2*~2a^n ~a" (print-key (binding-key b)) (binding-command b))) (kmap-bindings map)))
                       keymaps))
         (cols (ceiling (1+ (length data))
                        (truncate (- (head-height (current-head)) (* 2 (screen-msg-border-width screen)))
                                  (font-height (screen-font screen))))))
    (message-no-timeout "Prefix: ~a~%~{~a~^~%~}"
                        (print-key-seq key-seq)
                        (or (columnize data cols) '("(EMPTY MAP)")))))
