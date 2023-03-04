;; Load all of the stages.
(mapc 'load (file-expand-wildcards "~/.emacs.d/stages/*.el"))

;; Load individual extra stages; comment any to disable.
(load-file "~/.emacs.d/extra-stages/org-md.el")
(load-file "~/.emacs.d/extra-stages/ranger.el")
