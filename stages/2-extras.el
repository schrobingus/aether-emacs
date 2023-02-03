;; Disable unneeded elements.
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tooltip-mode -1)
(tool-bar-mode -1)
(global-unset-key (kbd "C-z")) ;; Suspend binding.
(setq initial-scratch-message nil) ;; Splash screen.

;; Enable line numbers.
;; (add-hook 'prog-mode-hook #'line-number-mode)
;; (setq line-number-format " %d") ; Also add a space at the end of the line number.

;; Add some better scrolling.
;; (pixel-scroll-mode 1)
(setq scroll-step 1)
(setq hscroll-step 1)

;; Adjust some values for performance.
(setq redisplay-dont-pause nil)
;;(setq font-lock-maximum-decoration nil)
(setq gc-cons-threshold 512000000)
(setq read-process-output-max (* 2048 2048))

;; Configure window dividers.
(setq-default window-divider-default-bottom-width 2)
(setq-default window-divider-default-right-width 2)
(window-divider-mode 1)

;; Disable cl-related warnings.
(setq byte-compile-warnings '(cl-functions))

;; Set tab spacing to only 2.
(setq default-tab-width 2)

;; Configure visual lines and line truncation.
(global-visual-line-mode 1)
(add-hook 'prog-mode-hook
	  (lambda () (visual-line-mode -1) (setq truncate-lines 1)))

;; Configure autosave.
(auto-save-mode 1)
(if (file-directory-p "~/.emacs.d/temporary")
    nil
  (progn
    (make-directory "~/.emacs.d/temporary")
    (make-directory "~/.emacs.d/temporary/auto-save")
    (make-directory "~/.emacs.d/temporary/backup")
    (make-directory "~/.emacs.d/temporary/undo")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/temporary/auto-save" t)))
(setq backup-directory-alist
      `((".*" . "~/.emacs.d/temporary/backup")))

;; macOS-specific settings.
(when
    (eq system-type 'darwin)
  (progn
    (use-package ns-auto-titlebar
      :config
      (ns-auto-titlebar-mode)) ;; Automatic titlebar mode.
    (setq mac-command-modifier 'control) ;; Rebind CMD to CTRL.
    (menu-bar-mode 1) ;; Re-enable menu bar.
    ))
