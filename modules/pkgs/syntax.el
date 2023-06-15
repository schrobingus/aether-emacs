;; ;; Enable Flycheck.
(use-package flycheck
  :init
  ;; Disable some Flycheck checkers prior.
  (setq-default
   flycheck-disabled-checkers
   '(
     c/c++-clang   ;;; clang
     emacs-lisp-checkdoc emacs-lisp   ;;; emacs lisp
     html  ;;; html
     markdown-markdownlint-cli markdown-mdl  ;;; markdown
     ))
  :config
  (global-flycheck-mode 1))

;; ;; Enable LSP.
(use-package lsp-mode
  :config
  (setq lsp-idle-delay 0.500)
  (setq lsp-headerline-breadcrumb-enable nil))
(use-package lsp-ui
  :after lsp-mode)

;; ;; For Clojure.
(use-package clojure-mode
  :mode (("\\.clj\\'"  . clojure-mode)
	 ("\\.cljs\\'" . clojurescript-mode)
	 ("\\.cljc\\'" . clojurec-mode))
  :hook ((clojure-mode       . lsp)
	 (clojurescript-mode . lsp)
	 (clojurec-mode      . lsp)))

;; ;; For C#.
(use-package csharp-mode
  :mode "\\.cs\\'"
  :hook (csharp-mode . lsp))

;; ;; For Dart, add Flutter.el.
(use-package dart-mode
  :mode "\\.dart\\'")
(use-package lsp-dart
  :after dart-mode
  :hook (dart-mode . lsp))
(use-package flutter
  :after dart-mode lsp-dart
  :init
  (setq lsp-dart-flutter-widget-guides nil)
  :bind (:map dart-mode-map
	      ("C-M-x" . #'flutter-run-or-hot-reload))
  :config
  :hook (dart-mode . flutter-test-mode))

;; ;; For Java.
(use-package lsp-java
  :config
  (add-hook 'java-mode-hook 'lsp))

;; ;; For Lua and Fennel.
(use-package lua-mode
  :mode "\\.lua\\'")
(use-package fennel-mode
  :after lua-mode
  :mode "\\.fnl\\'")

;; ;; For Markdown.
(use-package markdown-mode
  :mode "\\.md\\'")

;; ;; For Nix and NixOS.
(use-package nix-mode
  :mode "\\.nix\\'")

;; ;; For Swift.
(use-package swift-mode
  :mode "\\.swift\\'")

;; ;; For Vim and Vimscript.
(use-package vimrc-mode
  :mode "\\.vim\\(rc\\)?\\'")

;; ;; For YAML.
(use-package yaml-mode
  :mode "\\.yml\\'")
