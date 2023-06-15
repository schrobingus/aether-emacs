;; Enable Smartparens (bracket pairing).
(use-package smartparens
  :config
  (sp-local-pair 'emacs-lisp-mode "'" "'" :actions nil)
  (sp-local-pair 'emacs-lisp-mode "`" "`" :actions nil)
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (add-hook 'foo-mode-hook #'smartparens-mode))

;; Enable company mode for autocompletion.
(use-package company
  :config
  (add-hook 'prog-mode-hook #'company-mode))

;; Enable rainbow delimiters.
(use-package rainbow-delimiters
  :init
  (setq rainbow-delimiters-max-face-count 3)
  (defun base16-rainbow-delimiters-update ()
    (interactive)
    (custom-set-faces
     `(rainbow-delimiters-depth-1-face
       ((t (:inherit rainbow-delimiters-base-face :foreground ,(base16-color 'base08)))))
     `(rainbow-delimiters-depth-2-face
       ((t (:inherit rainbow-delimiters-base-face :foreground ,(base16-color 'base03)))))
     `(rainbow-delimiters-depth-3-face
       ((t (:inherit rainbow-delimiters-base-face :foreground ,(base16-color 'base0E)))))))
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;; Allow indent guides.
(use-package highlight-indent-guides
  :init
  (setq highlight-indent-guides-method 'character)
  (setq highlight-indent-guides-responsive t))

;; Enable rainbow mode for color showing.
(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

;; Enable aggressive-indent-mode.
(use-package aggressive-indent
  :config
  (global-aggressive-indent-mode 1))
