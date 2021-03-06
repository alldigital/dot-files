;; -*-lisp-*-
;;
;; mode-line.lisp

(in-package :stumpwm)

(add-to-load-path "/home/ed/.stumpwm.d/contrib/modeline/cpu")
(load-module "cpu")

(add-to-load-path "/home/ed/.stumpwm.d/contrib/modeline/mem")
(load-module "mem")

(add-to-load-path "/home/ed/.stumpwm.d/contrib/modeline/net")
(load-module "net")

(add-to-load-path "/home/ed/.stumpwm.d/contrib/modeline/disk")
(load-module "disk")
(setf disk:*disk-usage-paths* '("/" "/data"))

(add-to-load-path "/home/ed/.stumpwm.d/contrib/modeline/wifi")
(load-module "wifi")
(defvar *iwconfig-path* "/usr/bin/iwconfig"
  "Location if iwconfig, defaults to /sbin/iwconfig.")

(add-to-load-path "/home/ed/.stumpwm.d/contrib/modeline/battery-portable")
(load-module "battery-portable")

(add-to-load-path "/home/ed/.stumpwm.d/contrib/util/stumptray")
(load-module "stumptray")

;; obtain battery status
;;   formatted as +XX% when    charging
;;                -XX% when discharging
;;                100% when full
(setf battery-status-command
  "acpi -b |
   awk -F '[ ,]' '{printf \"%s%s\", $3, $5}' |
   sed s/Discharging/\-/ |
   sed s/Unknown// |
   sed s/Full// |
   sed s/Charging/+/ |
   awk '{printf \"%4s\", $1}' ")

(setf vol-status-command
  "amixer sget Master |
   awk sp-F'[][]' '/dB/ { printf \"%s\", $6 }' |
   sed 's/on/Vol\\./' |
   sed 's/off/Mut\\./'")

(setf vol-percent-command
  "amixer sget Master |
   awk -F'[][]' '/dB/ { printf \"%4s\", $2 }'")

(setf *time-modeline-string*
      "%a %b %e %k:%M")

(setf *screen-mode-line-format*
      (list "[%h][^B%n^b] %W^>| %D | %M | %t %f %c| %l| %I |"
            '(:eval (run-shell-command battery-status-command t))
            " | "
            ;; '(:eval (run-shell-command vol-status-command t))
            ;; " "
            ;; '(:eval (run-shell-command vol-percent-command t))
            "%d%T "))

(setf *mode-line-timeout* 1)

(setf *mode-line-position* :bottom)


;; Turn on the modeline
(if (not (head-mode-line (current-head)))
    (toggle-mode-line (current-screen) (current-head)))


(stumptray:stumptray)
