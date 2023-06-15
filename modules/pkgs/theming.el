;; Set up base16 colors. 
(setq
 base16-colors
 '(
   base00   "#2E3440"
   base01   "#3B4252"
   base02   "#4C566A"
   base03   "#677691"
   base04   "#D8DEE9"
   base05   "#E5E9F0"
   base06   "#ECEFF4"
   base07   "#8FBCBB"
   base08   "#88C0D0"
   base09   "#81A1C1"
   base0A   "#5E81AC"
   base0B   "#BF616A"
   base0C   "#D08770"
   base0D   "#EBCB8B"
   base0E   "#A3BE8C"
   base0F   "#B48EAD"))
(defun base16-color (name)
  (plist-get base16-colors name))

;; Define a hook for loading a theme.
(defvar after-load-theme-hook nil
  "Hook run after a color theme is loaded using `load-theme'.")
(defadvice load-theme (after run-after-load-theme-hook activate)
  "Run `after-load-theme-hook'."
  (run-hooks 'after-load-theme-hook))

;; Pull the NANO Emacs theme.
(use-package nano-theme
  :init
  ;; Configure it with base16.
  (setq nano-dark-foreground (base16-color 'base05)
	nano-dark-background (base16-color 'base00)
	nano-dark-highlight  (base16-color 'base02)
	nano-dark-critical   (base16-color 'base0B)
	nano-dark-salient    (base16-color 'base09)
	nano-dark-strong     (base16-color 'base08)
	nano-dark-popout     (base16-color 'base0E)
	nano-dark-subtle     (base16-color 'base01)
	nano-dark-faded      (base16-color 'base03))
  :commands nano-dark nano-light)

;; Set term theme after change based on base16.
(defun base16-term-update ()
  (interactive)
  (custom-set-faces
   `(term ((t (:foreground ,(base16-color 'base05) :background ,(base16-color 'base00)))))
   `(term-color-black ((t (:foreground ,(base16-color 'base01) :background ,(base16-color 'base02)))))
   `(term-color-white ((t (:foreground ,(base16-color 'base05) :background ,(base16-color 'base06)))))
   `(term-color-cyan ((t (:foreground ,(base16-color 'base08) :background ,(base16-color 'base07)))))
   `(term-color-blue ((t (:foreground ,(base16-color 'base09) :background ,(base16-color 'base09)))))
   `(term-color-red ((t (:foreground ,(base16-color 'base0B) :background ,(base16-color 'base0B)))))
   `(term-color-yellow ((t (:foreground ,(base16-color 'base0D) :background ,(base16-color 'base0D)))))
   `(term-color-green ((t (:foreground ,(base16-color 'base0E) :background ,(base16-color 'base0E)))))
   `(term-color-magenta ((t (:foreground ,(base16-color 'base0F) :background ,(base16-color 'base0F)))))))
(add-hook 'after-load-theme-hook 'base16-term-update)

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

;; Add dedicated unicode fonts to resolve font issues.
(use-package unicode-fonts
  :config
  (unicode-fonts-setup))

;; Configure and set up the frame.
(setq default-frame-alist
      (append (list
	       '(width  . 125)
	       '(height . 45)
	       '(vertical-scroll-bars  . nil)
	       '(internal-border-width . 12)
	       '(left-fringe    . 8)
	       '(right-fringe   . 8)
	       '(line-spacing   . 0.2))))

;; Make the window divider a bit thicker.
(setq window-divider-default-right-width 6)
(window-divider-mode 1)

;; Theme external packages and add the hooks for base16.
(add-hook 'after-load-theme-hook 'base16-rainbow-delimiters-update)

;; Enable the theme afterwards.
(load-theme 'nano-dark t)
