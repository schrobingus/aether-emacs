;; Install Evil and configure some stock settings.
(use-package evil
  :init
  (setq evil-shift-width 2)
  (setq evil-want-keybinding nil)
  (setq evil-want-integration t)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-d-scroll t)
  (setq evil-want-C-i-jump t)
  (setq evil-echo-state nil)
  :config
  (evil-mode 1))

;; Replicate the `jj` binding with Keychord.
(use-package key-chord
  :config
  (setq key-chord-two-keys-delay 0.25)
  (key-chord-define
   evil-insert-state-map "jj"
   'evil-normal-state) ;;; switch from INSERT to NORMAL
  (key-chord-mode 1))

;; Enable black hole register (delete rather than cut.)
(defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
  (apply orig-fn beg end type ?_ args))
(advice-add 'evil-delete :around 'bb/evil-delete)

;; Enable the LEADER bind for Evil.
(use-package evil-leader
  :config
  (evil-leader/set-leader ",")
  (evil-leader/set-key "op" 'open-line) ;; opening line
  (evil-leader/set-key "SPC e" 'flycheck-list-errors)  ;;; list Flycheck errors
  (evil-leader/set-key "[d" 'flycheck-previous-error)  ;;; previous Flycheck error
  (evil-leader/set-key "]d" 'flycheck-next-error)  ;;; next Flycheck error
  (global-evil-leader-mode 1))

;; Install evil-commentary, use with `gc.`
(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

;; Enable undo-tree and goto-chg.
(use-package undo-tree
  :config
  (setq undo-tree-history-directory-alist
	'(("." . "~/.emacs.d/temporary/undo")))
  (global-undo-tree-mode 1)
  (evil-set-undo-system 'undo-tree))
(use-package goto-chg)

;; Enable evil-surround.
(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

;; Set some Counsel related bindings.
(evil-global-set-key 'normal "bf" 'counsel-switch-buffer)
(evil-global-set-key 'normal "fb" 'counsel-bookmark)
(evil-global-set-key 'normal "bf" 'counsel-recentf)
