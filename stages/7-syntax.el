;; Enable Flycheck.
(use-package flycheck
  :config
  (global-flycheck-mode 1))

;; Enable LSP.
(use-package lsp-mode
  :config
  (setq lsp-idle-delay 0.500)
  (setq lsp-headerline-breadcrumb-enable nil))
(use-package lsp-ui
  :after lsp-mode)

;; Add some debug features with DAP mode.
(use-package dap-mode
  :ensure t)

;; Disable certain Flycheck checkers.
(setq-default
 flycheck-disabled-checkers
 '(
   c/c++-clang ;; Clang
   emacs-lisp emacs-lisp-checkdoc ;; Emacs Lisp
   markdown-markdownlint-cli markdown-mdl ;; Markdown
   dart
   ))


;; The section below is reserved for adding language support.

;; For C#.
(use-package csharp-mode
  :mode "\\.cs\\'")

;; For Dart, add Flutter.el.
(use-package dart-mode
  :mode "\\.dart\\'")
(use-package lsp-dart
  :after dart-mode
  :hook (dart-mode . lsp))
(use-package flutter
    :after dart-mode
    :bind (:map dart-mode-map
		("C-M-x" . #'flutter-run-or-hot-reload))
    :custom
    (flutter-sdk-path "/Users/brent/Sources/flutter")
    :config
    (setq lsp-dart-flutter-widget-guides nil)
    :hook (dart-mode . flutter-test-mode))

;; For Lua.
(use-package lua-mode
  :mode "\\.lua\\'")

;; For Markdown.
(use-package markdown-mode
  :mode "\\.md\\'")

; For Nix and NixOS.
(use-package nix-mode
  :mode "\\.nix\\'")

;; For Swift.
(use-package swift-mode
  :mode "\\.swift\\'")

;; For Vim and Vimscript.
(use-package vimrc-mode
  :mode "\\.vim\\(rc\\)?\\'")

;; For YAML and Ansible.
(use-package yaml-mode
  :mode "\\.yml\\'")

