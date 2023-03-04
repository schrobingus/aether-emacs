;; Import ranger.el.
(use-package ranger
  :init
  (setq ranger-cleanup-on-disable t) ;; For cleaning up buffers on the fly.
  (setq ranger-cleanup-eagerly t)
  (setq ranger-modify-header nil) ;; For removing the headerline.
  (setq ranger-dont-show-binary t) ;; For disabling the preview of binaries.
  :config
  (ranger-override-dired-mode 1))
