;; Specific settings to load for macOS.
(when
    (eq system-type 'darwin)
  (progn
    (use-package ns-auto-titlebar
      :config
      (ns-auto-titlebar-mode)) ;;; automatic titlebar mode
    (setq mac-command-modifier 'control) ;;; rebind CMD to CTRL
    (menu-bar-mode 1) ;;; enable menu bar if not already enabled
    ))
