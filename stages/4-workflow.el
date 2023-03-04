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

;; Enable exec-path-from-shell, then enable Quickrun for code execution.
(use-package exec-path-from-shell
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))
(use-package quickrun
  :after exec-path-from-shell)

;; Enable undo-tree as well, hook it to Evil.
(use-package undo-tree
  :config
  (setq undo-tree-history-directory-alist
	'(("." . "~/.emacs.d/temporary/undo"))) ;; Prevent cluttering.
  (global-undo-tree-mode 1))

;; Enable Ivy and Counsel.
(use-package ivy
  :init
  (straight-use-package 'counsel)
  :config
  (ivy-mode 1)
  (global-set-key (kbd "M-x")     'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c r")   'counsel-recentf)
  (global-set-key (kbd "C-c b")   'counsel-bookmark)
  (global-set-key (kbd "C-x C-b") 'counsel-switch-buffer))

;; Enable Prescient.el for Ivy and Company.
(use-package prescient
  :after ivy company
  :config
  (use-package ivy-prescient
    :config
    (ivy-prescient-mode 1))
  (use-package company-prescient
    :config
    (company-prescient-mode 1)))

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
  :init
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive t))
  ;; :config
  ;; (add-hook 'prog-mode-hook #'highlight-indent-guides-mode))
;; (use-package highlight-indentation
  ;; :init
  ;; (setq highlight-indentation-blank-lines t)
  ;; :config
  ;; (set-face-background 'highlight-indentation-face "#3B4252")
  ;; (set-face-background 'highlight-indentation-current-column-face "#4C566A")
  ;; (add-hook 'prog-mode-hook #'highlight-indentation-mode))
  ;; (add-hook 'prog-mode-hook #'highlight-indentation-current-column-mode))

;; Enable Rainbow Mode (highlight colors.)
(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

