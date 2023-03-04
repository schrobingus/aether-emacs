;; Add some additions for Org in Evil mode.
(use-package org-evil)

;; Add Org Bullets and Org Superstar.
(use-package org-bullets
  :hook (org-mode . org-bullets-mode))
(use-package org-superstar
  :hook (org-mode . org-superstar-mode))

;; Install Org Roam.
(use-package org-roam
  :custom
  (org-roam-directory (file-truename "~/Notes/"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  ;; If you're using a vertical completion framework, you might want a more informative completion interface
  (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (org-roam-db-autosync-mode)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

;; Blocked tasks should not be dimmed.
(setq org-agenda-dim-blocked-tasks nil)

;; Compact the block view for Org Agenda.
(setq org-agenda-compact-blocks t)

;; Import notes directory to Org Agenda. Modify for your directory.
(setq org-agenda-files (quote "~/Notes"))

;; Tags with fast selection keys
(setq org-tag-alist
      (quote
       ((:startgroup)
	;; Locations
        ("@home"      . ?H)
        ("@work"      . ?W)
        ("@school"    . ?S)
	("@elsewhere" . ?E)
        (:endgroup)
	;; General Tags
        ("" . ?w)
	("ASAP"     . ?!)
        ("PERSONAL" . ?p)
        ("WORK"     . ?w)
        ("SCHOOL"   . ?s)
        ("DEV"      . ?d)
        ("UNNEEDED" . ?u)
        ("FLAGGED"  . ??))))
