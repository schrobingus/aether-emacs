;; Install Projectile for project management.
(use-package projectile
    :config
    (projectile-mode +1))

;; Highlight the indents.
;(use-package highlight-indent-guides
;  :config
;  (setq highlight-indent-guides-mode 'fill)
;  (setq highlight-indent-guides-auto-enabled nil)
;  (set-face-background 'highlight-indent-guides-odd-face "grey19")
;  (set-face-background 'highlight-indent-guides-even-face "grey26")
;  (add-hook 'prog-mode-hook #'highlight-indent-guides-mode))

;; Install utilities for managing brackets.
(use-package smartparens
  :config
  (require 'smartparens-config)
  (setq sp-highlight-pair-overlay nil)
  (smartparens-global-mode 1))
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Install Counsel and Ivy for better Minibuffer navigation.
(use-package counsel
  :config
  (straight-use-package 'counsel-projectile))
(use-package ivy :demand
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d ")
  (ivy-mode 1)
  (use-package ivy-prescient
    :config
    (ivy-prescient-mode 1)
    (prescient-persist-mode 1)))
(use-package ivy-explorer
  :config
  (ivy-explorer-mode 1)
  (counsel-mode 1))

;; Enable flycheck for code checking.
;;(use-package flycheck
;;  :config
;;  (setq flycheck-indication-mode 'right-fringe)
;;  (add-hook 'after-init-hook (global-flycheck-mode))
;;  (add-hook 'after-init-hook (flycheck-disable-checker 'emacs-lisp)))

;; Highlight color codes with Rainbow Mode.
(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

;; Add TODO highlighting.
(use-package hl-todo
  :config
  (setq hl-todo-keyword-faces
	'(("TODO"   . "#ffcb6b")
	  ("NOTE"   . "#eeffff")
	  ("FIXME"  . "#f57273")
	  ("DEBUG"  . "#82aaff")
	  ("GOTCHA" . "#c3e88d")
	  ("STUB"   . "#88ddff")))
  (global-hl-todo-mode))

;; Configure for precision scrolling.
(setq scroll-step            1
      scroll-conservatively  10000)

;; Install Neotree, and integrate it with Projectile.
(use-package neotree
  :config
  (setq-default neo-show-hidden-files t)
  (setq neo-theme nil)
  (setq-default neo-window-fixed-size nil)
  (setq projectile-switch-project-action 'neotree-projectile-action))

;; Install Git Gutter Mode.
(use-package git-gutter
  :config
  (global-git-gutter-mode +1))
