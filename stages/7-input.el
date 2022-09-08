;; Install and configure God Mode.
(use-package god-mode
  :bind ("<escape>" . god-local-mode))

;; Make Command (super on Linux) simulate Control.
(setq mac-command-modifier 'control)

;; Add a quick binding for switching to a Projectile project.
(global-set-key (kbd "C-x C-S-f") #'projectile-switch-project)
