;; Pull the NANO Emacs theme.
(use-package nano-theme
  :commands nano-dark nano-light)

;; Select fonts for use.
(setq nano-fonts-use t)
(custom-set-faces
 '(nano-mono     ((t (:family "Liga SFMono Nerd Font"
			      :height 130
			      :weight normal))))
 '(nano-sans     ((t (:family "SF Pro"
			      :height 130
			      :weight normal))))
 '(nano-mono-alt ((t (:inherit nano-mono))))
 '(nano-serif    ((t (:inherit nano-sans))))
 '(nano-italic   ((t (:inherit nano-sans)))))

;; Configure and set up the frame.
(setq default-frame-alist
      (append (list
	       '(width  . 125)
	       '(height . 45)
	       '(vertical-scroll-bars  . nil)
	       '(internal-border-width . 12)
	       '(left-fringe    . 8)
	       '(right-fringe   . 2)
	       '(line-spacing   . 0.2))))

;; Make the window divider a bit thicker.
(setq window-divider-default-right-width 6)
(window-divider-mode 1)

;; Enable the theme afterwards.
(nano-dark)
