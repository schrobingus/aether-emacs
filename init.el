;; Make a function for loading a module.
(defun load-module (file) 
  (load (concat (expand-file-name file (concat (file-truename user-emacs-directory) "modules/")) ".el")))

(load-module "core")  ;;; use-package and straight.el
(load-module "vanilla") ;;; stock package configuration

(load-module "pkgs/mac")  ;;; mac specific settings
(load-module "pkgs/evil") ;;; evil configuration
(load-module "pkgs/editing")  ;;; editing essentials
(load-module "pkgs/extension")  ;;; extensions to editor functionality
(load-module "pkgs/syntax")   ;;; syntax checking and lsp
(load-module "pkgs/theming")  ;;; theming and colors for emacs
(load-module "pkgs/modeline")  ;;; modeline configuration
