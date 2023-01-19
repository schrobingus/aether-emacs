;; Enable all-the-icons.
(use-package all-the-icons)

;; Enable Flycheck mode.
(use-package flycheck
  :config
  (global-flycheck-mode 1))

;; Enable company mode.
(use-package company
  :config
  (add-hook 'prog-mode-hook #'company-mode))

;; Use LSP.
(use-package lsp-mode)
(use-package lsp-ui
  :after lsp-mode)

;; Enable Projectile for Emacs.
(use-package projectile
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

;; Make temporary, configure auto save and backup for Emacs.
;;; (auto-save-mode -1) ;; Uncomment to disable autosave.
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

;; Enable Ivy and Counsel.
(use-package ivy
  :config
  (straight-use-package 'counsel)
  (ivy-mode 1)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c r")   'counsel-recentf)
  (global-set-key (kbd "C-c b")   'counsel-bookmark)
  (global-set-key (kbd "C-x C-b") 'counsel-switch-buffer))

;; Configure Evil Leader.
(use-package evil-leader
  :config
  (evil-leader/set-leader "Q")
  (global-evil-leader-mode 1))

;; Add functions to insert lines.
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

;; Bind as above, as well as a open-line key.
(evil-leader/set-key "p" 'open-line)
(evil-leader/set-key "o" 'insert-line-below)
(evil-leader/set-key "O" 'insert-line-above)

;; Do the equivalent of noshowmode.
(setq evil-echo-state nil)

;; Enable undo-tree as well, hook it to Evil.
(use-package undo-tree
  :after evil
  :config
  (setq undo-tree-history-directory-alist
	'(("." . "~/.emacs.d/temporary/undo"))) ;; Prevent cluttering.
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

;; Enable Keychord, as well as several bindings for Evil.
(use-package key-chord
  :after evil
  :config
  (setq key-chord-two-keys-delay 0.25)
  (key-chord-define evil-insert-state-map "jj"
		    'evil-normal-state) ;; Switch from INSERT to NORMAL.
  (key-chord-mode 1))

;; On Evil, also set D to the black hole register.
(defun bb/evil-delete (orig-fn beg end &optional type _ &rest args)
  (apply orig-fn beg end type ?_ args))
(advice-add 'evil-delete :around 'bb/evil-delete)

;; Also enable Evil Commentary.
(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

;; Configure visual lines and line truncation.
(global-visual-line-mode 1)
(add-hook 'prog-mode-hook
	  (lambda () (visual-line-mode -1) (setq truncate-lines 1)))

;; Enable Smartparens (bracket pairing).
(use-package smartparens
  :config
  (sp-local-pair 'emacs-lisp-mode "'" "'" :actions nil)
  (add-hook 'prog-mode-hook #'smartparens-mode)
  (add-hook 'foo-mode-hook #'smartparens-mode))

;; Enable and configure the TODO highlighting package.
(use-package hl-todo
  :config
  (setq hl-todo-keyword-faces
	'(("TODO"   . "#EBCB8B")
	  ("FIXME"  . "#BF616A")
	  ("DEBUG"  . "#A3BE8C")
	  ("STUB"   . "#B48EAD")
	  ("DONE"   . "#8FBCBB")
	  ("NOTE"   . "#81A1C1")))
  (add-hook 'prog-mode-hook #'hl-todo-mode))

;; Also enable and configure rainbow delimiters.
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  (custom-set-variables '(rainbow-delimiters-max-face-count 5))
  (custom-set-faces
   '(rainbow-delimiters-depth-1-face ((t (:inherit rainbow-delimiters-base-face :foreground "#EBCB8B"))))
   '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "#A3BE8C"))))
   '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "#81A1C1"))))
   '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "#B48EAD"))))
   '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "#BF616A"))))))

(use-package highlight-indent-guides
  :config
  (add-hook 'prog-mode-hook #'highlight-indent-guides-mode)
  (custom-set-variables '(highlight-indent-guides-method 'character)))

;; Enable Rainbow Mode (highlight colors.)
(use-package rainbow-mode
  :config
  (add-hook 'prog-mode-hook #'rainbow-mode))

;; Enable number lines.
(add-hook 'prog-mode-hook #'linum-mode)

;; Set font to SF Mono.
(set-face-attribute 'default nil :font "Liga SFMono Nerd Font" :height 124)

;; Set macOS settings.
(use-package ns-auto-titlebar
  :config
  (when (eq system-type 'darwin) (ns-auto-titlebar-mode)))

;; Set to NANO theme (Material Light + Nord).
(straight-use-package 'nano-theme)
(straight-use-package 'nord-theme)
;;(require 'nano-theme)
;;(load-theme 'nano-dark t)
;;(load-theme 'nano-light t)
(load-theme 'nord t)

;; Configure mini modeline.
;;; FORMAT: N | 2-workflow.el | 26:3 W2 E0
;;; BROKEN: Evil Status, File Name, Line and Character Numbers, Errors + Warnings
(defun d/flycheck-lighter (state)
  "Return flycheck information for the given error type STATE. Source: https://git.io/vQKzv"
  (let* ((counts (flycheck-count-errors flycheck-current-errors))
         (errorp (flycheck-has-current-errors-p state))
         (err (or (cdr (assq state counts)) "?"))
         (running (eq 'running flycheck-last-status-change)))
    (if (or errorp running) (format " %s " err))))
(defface modeline-evil-indicator-face
  `((t :background "#A3BE8C" :foreground "#2E3440" :weight bold))
  "Section 1 for modeline.")
(defface modeline-start-section-face
  `((t :background "#434C5E"))
  "Major mode and file name face for modeline.")
(defface modeline-end-section-face
  `((t :background "#3B4252"))
  "Line / column number face for modeline.")
(use-package mini-modeline
  :init
  (add-hook 'evil-normal-state-entry-hook
            (lambda ()
              (set-face-background 'modeline-evil-indicator-face "#A3BE8C"))) ;; For normal mode.
  (add-hook 'evil-insert-state-entry-hook
            (lambda ()
              (set-face-background 'modeline-evil-indicator-face "#88C0D0"))) ;; For insert mode.
  (add-hook 'evil-visual-state-entry-hook
            (lambda ()
              (set-face-background 'modeline-evil-indicator-face "#81A1C1"))) ;; For visual mode.
  (add-hook 'evil-replace-state-entry-hook
            (lambda ()
              (set-face-background 'modeline-evil-indicator-face "#EBCB8B"))) ;; For replace mode.
  (setq-default
   mini-modeline-r-format
   '("%e" (:eval (propertize evil-mode-line-tag 'face 'modeline-evil-indicator-face))
     (:eval (propertize (concat " %b ") 'face 'modeline-start-section-face)) ;; %b is buffer name, %m is major mode name.
     (:eval (propertize (concat " %l:%c ") 'face 'modeline-end-section-face))
     (:eval
      (when (and (bound-and-true-p flycheck-mode)
		 (or flycheck-current-errors
                     (eq 'running flycheck-last-status-change)))
	(concat
	 (cl-loop for state in '((error . "#BF616A")
				 (warning . "#EBCB8B")
				 (info . "#A3BE8C"))
		  as lighter = (d/flycheck-lighter (car state))
		  when lighter
		  concat (propertize
			  lighter
			  'face `(:foreground ,(cdr state) :background "#3B4252")))
	 " ")))))
  (set-face-background 'mode-line "#2E3440")
  (custom-set-faces
   '(mini-modeline-mode-line ((t (:background "#4C566A" :box nil :height 0.14))))
   '(mini-modeline-mode-line-inactive ((t (:background "#434C5E" :box nil :height 0.2)))))
  :config
  (mini-modeline-mode t))
(setq-default evil-mode-line-format '(before . mode-line-front-space))

;; Utilize frame to edit some settings.
(setq default-frame-alist
	      (append (list
	       '(width  . 138) ; Default width.
	       '(height . 48)  ; Default height.
	       '(vertical-scroll-bars  . nil) ; Disables vertical scroll bars.
               '(internal-border-width . 8)  ; Adds padding to Emacs.
               '(left-fringe    . 8) ; Add some fringe padding to the left.
               '(right-fringe   . 2) ; Likewise to the right.
	       '(line-spacing   . 0.2)))) ; Finally, add some line spacing.
(setq linum-format " %d") ; Also add a space at the end of the line number.

;; Set tab spacing to only 2.
(setq default-tab-width 2)

;; Enable window divider mode.
(setq-default window-divider-default-bottom-width 2)
(setq-default window-divider-default-right-width 2)
(set-face-foreground 'window-divider "#434C5E")
(window-divider-mode 1)

;; Disable Evil in term-specific buffers.
(add-hook 'term-mode-hook 'evil-local-mode)
(add-hook 'eshell-mode-hook 'evil-local-mode) ; Doesn't work for some reason.
