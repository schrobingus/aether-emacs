;; Install Deft for notes management.
(use-package deft
  :config
  (setq deft-extensions '("md" "tex" "org" "md"))
  (setq deft-directory "~/Documents/Deft")
  (setq deft-recursive t))
