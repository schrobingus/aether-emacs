;; Enable Ivy and Counsel with Prescient filtering.
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
(use-package prescient
  :after ivy company
  :config
  (use-package ivy-prescient
    :config
    (ivy-prescient-mode 1))
  (use-package company-prescient
    :config
    (company-prescient-mode 1)))

;; Enable Projectile.
(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1)
  (define-key projectile-mode-map
    (kbd "C-c p") 'projectile-command-map))
