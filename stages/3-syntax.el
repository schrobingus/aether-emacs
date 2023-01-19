;; Disable certain Flycheck checkers.
(setq-default
 flycheck-disabled-checkers
 '(
   c/c++-clang ;; Clang
   emacs-lisp emacs-lisp-checkdoc ;; Emacs Lisp
   markdown-markdownlint-cli markdown-mdl ;; Markdown
   ))

;; For C#.
(use-package csharp-mode
  :mode "\\.cs\\'")

;; For Dart, add Flutter.el.
(use-package dart-mode
  :mode "\\.dart\\'"
  :hook ((dart-mode . lsp)
	 (dart-mode . flutter-test-mode)))
(use-package flutter
    :after dart-mode
    :bind (:map dart-mode-map
		("C-M-x" . #'flutter-run-or-hot-reload))
    :custom
    (flutter-sdk-path "/Users/brent/Sources/flutter"))

;; For GDScript on Godot.
(use-package gdscript-mode
  :mode "\\.gd\\'")

;; For Lua.
(use-package lua-mode
  :mode "\\.lua\\'")

;; For Markdown.
(use-package markdown-mode
  :mode "\\.md\\'")

; For Nix and NixOS.
(use-package nix-mode
  :mode "\\.nix\\'")

;; For Processing sketches.
(use-package processing-mode
  :mode "\\.pde\\'")

;; For Swift.
(use-package swift-mode
  :mode "\\.swift\\'")

;; For Vim and Vimscript.
(use-package vimrc-mode
  :mode "\\.vim\\(rc\\)?\\'")

;; For YAML and Ansible.
(use-package yaml-mode
  :mode "\\.yml\\'")

