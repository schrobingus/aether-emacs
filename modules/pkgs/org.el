;; Start working on basic Org features.
(use-package org
  :mode ("\\.org\\'" . org-mode)
  :custom
  (org-directory (file-truename "~/Notes/"))
  (org-agenda-files (file-truename "~/Notes/Agenda/"))
  (org-priority-highest 1)
  (org-priority-lowest  8)
  (org-priority-default 3)
  (org-todo-keywords '((sequence
			"TODO(t!)" "|" "DONE(d!)")))
  :config
  (custom-set-faces
   '(org-level-1 ((t (:inherit outline-1 :height 1.9 :family "SF Pro"))))
   '(org-level-2 ((t (:inherit outline-2 :height 1.5 :family "SF Pro"))))
   '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
   '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
   '(org-level-5 ((t (:inherit outline-5 :height 1.0))))))

;; Set up Org Roam.
(use-package org-roam
  :after org
  :custom
  (org-roam-directory (file-truename "~/Notes/")))

;; Set up Org Modern for Styling.
(use-package org-modern
  :after org
  :init
  (setq
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-ellipsis "…"
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "⭠ now ─────────────────────────────────────────────────")
  :config
  (add-hook 'org-mode-hook #'org-modern-mode)
  (add-hook 'org-agenda-finalize-hook #'org-modern-agenda))
