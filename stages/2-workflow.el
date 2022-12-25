;; Enable Flycheck mode.
(use-package flycheck
  :config
  (global-flycheck-mode 1))

;; Enable company mode.
(use-package company
  :config
  (add-hook 'prog-mode-hook #'company-mode))

;; Use LSP.
(use-package lsp-mode
  :config
  (use-package lsp-ui
    :after lsp))

;; Enable Projectile for Emacs.
(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Enable Ivy and Counsel.
(use-package ivy
  :config
  (straight-use-package 'counsel)
  (straight-use-package 'swiper)
  (ivy-mode 1)
  (global-set-key "\C-s" 'swiper)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c r")   'counsel-recentf)
  (global-set-key (kbd "C-c b")   'counsel-bookmark)
  (global-set-key (kbd "C-x C-b") 'counsel-switch-buffer))

;; Enable undo-tree as well, hook it to Evil.
(use-package undo-tree
   :after evil
   :config
   (setq undo-tree-history-directory-alist
	 '(("." . "~/.emacs.d/undo"))) ;; Prevent cluttering.
   (evil-set-undo-system 'undo-tree)
   (global-undo-tree-mode 1))

;; Enable Keychord, as well as the JJ binding for Evil.
(use-package key-chord
  :after evil
  :config
  (setq key-chord-two-keys-delay 0.25)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-mode 1))

;; On Evil, also set D to the black hole register.
(defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
    (apply orig-fn beg end type ?_ args))
(advice-add 'evil-delete :around 'bb/evil-delete)

;; Configure visual lines and line truncation.
(global-visual-line-mode 1)
(add-hook 'prog-mode-hook
	  (lambda () (visual-line-mode -1) (setq truncate-lines 1)))

;; Enable Smartparens (bracket pairing).
(use-package smartparens
  :config
  (sp-local-pair 'emacs-lisp-mode "'" "'" :actions nil)
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (add-hook 'foo-mode-hook #'smartparens-mode))

;; Enable and configure the TODO highlighting package.
(use-package hl-todo
  :config
  (setq hl-todo-keyword-faces
	'(("TODO"   . "#EBCB8B")
	  ("FIXME"  . "#BF616A")
	  ("DEBUG"  . "#A3BE8C")
	  ("STUB"   . "#B48EAD")
	  ("GOTCHA" . "#8FBCBB")
	  ("NOTE"   . "#81A1C1")))
  (add-hook 'prog-mode-hook #'hl-todo-mode))

;; Also enable and configure rainbow delimiters.
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (custom-set-variables '(rainbow-delimiters-max-face-count 5))
  (custom-set-faces
   '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "#EBCB8B"))))
   '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "#A3BE8C"))))
   '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "#81A1C1"))))
   '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "#B48EAD"))))
   '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "#BF616A"))))))

(use-package highlight-indent-guides
  :config
  (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
  (custom-set-variables '(highlight-indent-guides-method 'character)))

;; Enable Rainbow Mode (highlight colors.)
(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

;; Enable number lines.
(add-hook 'prog-mode-hook #'linum-mode)

;; Set font to SF Mono.
(set-face-attribute 'default nil :font "Liga SFMono Nerd Font" :height 124)

;; Set macOS settings.
(use-package ns-auto-titlebar
  :config
  (when (eq system-type 'darwin) (ns-auto-titlebar-mode)))

;; Set to NANO theme (Material Light + Nord).
(straight-use-package 'nano-theme)
;;(straight-use-package 'nord-theme)
(require 'nano-theme)
(load-theme 'nano-dark t)
;;(load-theme 'nano-light t)
;;(load-theme 'nord t)

;; Utilize frame to edit some settings.
(setq default-frame-alist
      (append (list
	       '(width  . 138) ; Default width.
	       '(height . 48)  ; Default height.
	       '(vertical-scroll-bars  . nil) ; Disables vertical scroll bars.
               '(internal-border-width . 16)  ; Adds padding to Emacs (take that StackOverflow!)
               '(left-fringe    . 8) ; Add some fringe padding to the left.
               '(right-fringe   . 8) ; Likewise to the right.
	       '(line-spacing   . 0.2)))) ; Finally, add some line spacing.
(setq linum-format " %d") ; Also add a space at the end of the line number.

;; Disable Evil in term-specific buffers.
(add-hook 'term-mode-hook 'evil-local-mode)
(add-hook 'eshell-mode-hook 'evil-local-mode) ; Doesn't work for some reason.
