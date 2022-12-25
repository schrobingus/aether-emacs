;; Configure Elisp.
(add-hook 'emacs-lisp-mode-hook
	  (lambda () (flycheck-mode -1)))

;; For C / C++.
(add-hook 'c-mode-hook #'flycheck-mode)
(add-hook 'c++-mode-hook #'flycheck-mode)

;; For C#.
(use-package csharp-mode
  :mode "\\.cs\\'")

;; For Dart, add Flutter.el.
(use-package dart-mode
  :mode "\\.dart\\'"
  :hook ((dart-mode . lsp)
	 (dart-mode . flutter-test-mode))
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

;; For Java.
(add-hook 'java-mode #'flycheck-mode)
(add-hook 'java-mode #'lsp)

;; For Javascript.
(add-hook 'js-mode #'flycheck-mode)

;; For Lua.
(use-package lua-mode
  :mode "\\.lua\\'"
  :hook (lua-mode . flycheck-mode))

;; For Markdown.
(use-package markdown-mode
  :mode "\\.md\\'")

;; For Nix and NixOS.
(use-package nix-mode
  :mode "\\.nix\\'"
  :hook (nix-mode . flycheck-mode))

;; For Processing sketches.
(use-package processing-mode
  :mode "\\.pde\\'")

;; For Python.
(add-hook 'python-mode-hook #'flycheck-mode)

;; For Shell scripts.
(add-hook 'sh-mode-hook #'flycheck-mode)

;; For Swift.
(use-package swift-mode
  :mode "\\.swift\\'"
  :hook (swift-mode . flycheck-mode))

;; For Vim and Vimscript.
(use-package vimrc-mode
  :mode "\\.vim\\(rc\\)?\\'")

;; For YAML.
(use-package yaml-mode
  :mode "\\.yml\\'"
  :config
  (use-package ansible ; Add Ansible support to the mix.
    :after yaml-mode
    :hook (yaml-mode . (lambda () (ansible 1)))
	   (yaml-mode . flycheck-mode)))
