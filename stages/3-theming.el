;; Configure frame.el for padding and other settings.
(setq default-frame-alist
      (append
       (list
	'(width  . 138) ; Default width.
	'(height . 48)  ; Default height.
	'(vertical-scroll-bars  . nil) ; Disables vertical scroll bars.
        '(internal-border-width . 8)  ; Adds padding to Emacs.
        '(left-fringe    . 8) ; Add some fringe padding to the left.
        '(right-fringe   . 2) ; Likewise to the right.
	'(line-spacing   . 0.2)))) ; Finally, add some line spacing.

;; Set theme to Nord by default.
(straight-use-package 'nord-theme)
(load-theme 'nord t)

;; Set font to SF Mono.
(set-face-attribute 'default nil :font "Liga SFMono Nerd Font" :height 124)

;; Configure window divider foreground.
(set-face-foreground 'window-divider "#434C5E")
