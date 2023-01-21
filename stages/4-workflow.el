;; Enable company mode.
(use-package company
  :config
  (add-hook 'prog-mode-hook #'company-mode))

;; Enable Projectile for Emacs.
(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Enable undo-tree as well, hook it to Evil.
(use-package undo-tree
  :config
  (setq undo-tree-history-directory-alist
	'(("." . "~/.emacs.d/temporary/undo"))) ;; Prevent cluttering.
  (global-undo-tree-mode 1))

;; Enable Ivy and Counsel.
(use-package ivy
  :config
  (straight-use-package 'counsel)
  (ivy-mode 1)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c r")   'counsel-recentf)
  (global-set-key (kbd "C-c b")   'counsel-bookmark)
  (global-set-key (kbd "C-x C-b") 'counsel-switch-buffer))

;; Enable Smartparens (bracket pairing).
(use-package smartparens
  :config
  (sp-local-pair 'emacs-lisp-mode "'" "'" :actions nil)
  (sp-local-pair 'emacs-lisp-mode "`" "`" :actions nil)
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (add-hook 'foo-mode-hook #'smartparens-mode))

;; Configure the TODO highlighting package.
(use-package hl-todo
  :config
  (setq hl-todo-keyword-faces
	'(("TODO"   . "#EBCB8B")
	  ("FIXME"  . "#BF616A")
	  ("DEBUG"  . "#A3BE8C")
	  ("STUB"   . "#B48EAD")
	  ("DONE"   . "#8FBCBB")
	  ("NOTE"   . "#81A1C1")))
  (add-hook 'prog-mode-hook #'hl-todo-mode))

;; Configure rainbow delimiters.
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (custom-set-variables '(rainbow-delimiters-max-face-count 5))
  (custom-set-faces
   '(rainbow-delimiters-depth-1-face
     ((t (:inherit rainbow-delimiters-base-face :foreground "#EBCB8B"))))
   '(rainbow-delimiters-depth-2-face
     ((t (:inherit rainbow-delimiters-base-face :foreground "#A3BE8C"))))
   '(rainbow-delimiters-depth-3-face
     ((t (:inherit rainbow-delimiters-base-face :foreground "#81A1C1"))))
   '(rainbow-delimiters-depth-4-face
     ((t (:inherit rainbow-delimiters-base-face :foreground "#B48EAD"))))
   '(rainbow-delimiters-depth-5-face
     ((t (:inherit rainbow-delimiters-base-face :foreground "#BF616A"))))))

;; Enable highlight guides.
(use-package highlight-indent-guides
  :config
  (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
  (custom-set-variables '(highlight-indent-guides-method 'character)))

;; Enable Rainbow Mode (highlight colors.)
(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

