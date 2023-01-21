;; Functions to insert lines below and above for input.
(defun insert-line-below ()
  "Insert an empty line below the current line."
  (interactive)
  (save-excursion
    (end-of-line)
    (open-line 1)))
(defun insert-line-above ()
  "Insert an empty line above the current line."
  (interactive)
  (save-excursion
    (end-of-line 0)
    (open-line 1)))


;; This block of code is all for Evil mode. Comment to disable.
(use-package evil
  :config

  ;; Hook undo-tree to Evil.
  (evil-set-undo-system 'undo-tree)
  
  ;; Bind jj for NORMAL mode using Keychord. 
  (use-package key-chord
    :config
    (setq key-chord-two-keys-delay 0.25)
    (key-chord-define
     evil-insert-state-map "jj"
     'evil-normal-state) ;; Switch from INSERT to NORMAL.
    (key-chord-mode 1))

  ;; D goes to the black hole register, deleting rather than cutting to the clipboard.
  (defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
    (apply orig-fn beg end type ?_ args))
  (advice-add 'evil-delete :around 'bb/evil-delete)
  
  ;; Configure Evil leader.
  (use-package evil-leader
    :config
    (evil-leader/set-leader "Q") ;;; Capital Q is the leader key.
    (evil-leader/set-key "p" 'open-line) ;; For adding a line between the cursor.
    (evil-leader/set-key "o" 'insert-line-below) ;; For adding a line below.
    (evil-leader/set-key "O" 'insert-line-above) ;; For adding a line above.
    (global-evil-leader-mode 1))

  ;; Use Evil Commentary, bound by "gc".
  (use-package evil-commentary
    :after evil
    :config
    (evil-commentary-mode))

  ;; Disable Evil in term-specific buffers.
  (add-hook 'term-mode-hook 'evil-local-mode)
  (add-hook 'eshell-mode-hook 'evil-local-mode) ;; Doesn't work for some reason.

  ;; Do not echo messages, like noshowmode.
  (setq evil-echo-state nil)
  
  ;; Enable Evil.
  (evil-mode 1))
