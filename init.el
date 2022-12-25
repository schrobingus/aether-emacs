;; Load all of the stages.
(mapc 'load (file-expand-wildcards "~/.emacs.d/stages/*.el"))
