;; Configure the NANO Modeline here.
(use-package nano-modeline
  :custom
  (nano-modeline-position 'top)  ;;; move at the top
  ;; (nano-modeline-prefix 'status)  ;;; show the status as the prefix
  ;; (nano-modeline-prefix-padding t)  ;;; add padding to the prefix
  (add-hook 'evil-normal-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#A3BE8C"))) ;; For normal mode.
  (add-hook 'evil-insert-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#88C0D0"))) ;; For insert mode.
  (add-hook 'evil-visual-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#81A1C1"))) ;; For visual mode.
  (add-hook 'evil-replace-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#EBCB8B"))) ;; For replace mode.
  :config
  (nano-modeline-mode))
