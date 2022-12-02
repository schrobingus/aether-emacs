;; FIXME: Elisp seems to stop working due to a mode formatting error.
;; Commented everything to avoid until fixed.

;; For C#.
(use-package csharp-mode
  :mode "\\.cs\\'")

;; For Dart, add LSP and Flutter.el.
(use-package dart-mode
  :mode "\\.dart\\'"
  :hook (dart-mode . flutter-test-mode)
  :config
  (use-package flutter
    :after dart-mode
    :bind (:map dart-mode-map
		("C-M-x" . #'flutter-run-or-hot-reload))
    :custom
    (flutter-sdk-path "/Users/brent/Sources/flutter")))

;; For GDScript on Godot.
(use-package gdscript-mode
  :mode "\\.gd\\'")

;; For Lua.
(use-package lua-mode
  :mode "\\.lua\\'")

(use-package markdown-mode
  :mode "\\.md\\'")

;; For Nix and NixOS.
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

;; For YAML.
(use-package yaml-mode
  :mode "\\.yml\\'"
  :config
  (use-package ansible ; Add Ansible support to the mix.
    :after yaml-mode
    :hook (yaml-mode-hook . (lambda () (ansible 1)))))
