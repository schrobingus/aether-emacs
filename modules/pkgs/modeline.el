;; Configure the NANO Modeline here.
(use-package nano-modeline
  :custom
  (nano-modeline-position 'top)  ;;; move at the top
  ;; (nano-modeline-prefix 'status)  ;;; show the status as the prefix
  ;; (nano-modeline-prefix-padding t)  ;;; add padding to the prefix
  :config
  (nano-modeline-mode))
