;; Bootstrap straight.el, disable package.el.
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)

;; Install use-package, and hook straight.el to it.
(straight-use-package 'use-package)
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; Bind CMD to CTRL. (disable elsewhere from MacOS)
(setq mac-command-modifier 'control)

;; Disable auto save.
(auto-save-mode -1)

;; Disable unneeded UI elements.
(menu-bar-mode 1) ; Only keep enabled on MacOS.
(toggle-scroll-bar -1)
(tooltip-mode -1)
(tool-bar-mode -1)

;; Install and enable Evil, add undo-tree to go with it.
(use-package evil
 :config
 (evil-mode 1)
 (use-package undo-tree
   :after evil
   :config
   (setq undo-tree-history-directory-alist
	 '(("." . "~/.emacs.d/undo"))) ;; Prevent cluttering.
   (evil-set-undo-system 'undo-tree)
   (global-undo-tree-mode 1)))

;; Disable the suspend binding.
(global-unset-key (kbd "C-z"))

;; Disable cl-related warnings.
(setq byte-compile-warnings '(cl-functions))
