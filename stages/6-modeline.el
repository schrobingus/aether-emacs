;; Configure the modeline.
(use-package mini-modeline
  :init

  ;; This is used to highlight errors.
  (defun d/flycheck-lighter (state)
    "Return flycheck information for the given state, pulled from Spacemacs."
    (let* ((counts (flycheck-count-errors flycheck-current-errors))
           (errorp (flycheck-has-current-errors-p state))
           (err (or (cdr (assq state counts)) "?"))
           (running (eq 'running flycheck-last-status-change)))
      (if (or errorp running) (format " %s " err))))

  ;; Tweak the evil indicator format.
  (setq-default evil-mode-line-format '(before . mode-line-front-space))
  
  ;; These are the different faces for sections.
  (defface modeline-evil-indicator-face
    `((t :background "#A3BE8C" :foreground "#2E3440" :weight bold))
    "Evil indicator face for modeline.")
  (defface modeline-start-section-face
    `((t :background "#434C5E"))
    "Major mode and file name face for modeline.")
  (defface modeline-end-section-face
    `((t :background "#3B4252"))
    "Line / column number face for modeline.")

  ;; Set padding of line.
  (setq-default mini-modeline-right-padding 2)

  ;; These are the different faces for the Evil indicators.
  (add-hook 'evil-normal-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#A3BE8C"))) ;; For normal mode.
  (add-hook 'evil-insert-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#88C0D0"))) ;; For insert mode.
  (add-hook 'evil-visual-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#81A1C1"))) ;; For visual mode.
  (add-hook 'evil-replace-state-entry-hook
            (lambda ()
              (set-face-background
	       'modeline-evil-indicator-face
	       "#EBCB8B"))) ;; For replace mode.

  ;; This is where the modeline gets configured.
  (setq-default
   mini-modeline-r-format
   
   ;; Start with the Evil indicator.
   '("%e" (:eval (propertize evil-mode-line-tag 'face 'modeline-evil-indicator-face))

     ;; Show a section for buffer information.
     (:eval (propertize (concat " %b ") 'face 'modeline-start-section-face))
     ;; %b is buffer name, %m is major mode name, %l and $c are line and character.

     ;; Finally, show a section for line / character number, and flycheck status.
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

  ;; Set the modeline background to the minibuffer background.
  (set-face-background 'mode-line "#2E3440")

  ;; Also customize the window divider lines to match.
  (custom-set-faces
   '(mini-modeline-mode-line ((t (:background "#4C566A" :box nil :height 0.14))))
   '(mini-modeline-mode-line-inactive ((t (:background "#434C5E" :box nil :height 0.2)))))

  ;; Finally, enable mini modeline.
  :config
  (mini-modeline-mode t))
