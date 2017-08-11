; -*- mode: emacs-lisp; -*-
(unless (package-installed-p 'go-mode)
  (package-install 'go-mode))
(unless (package-installed-p 'go-complete)
  (package-install 'go-complete))
(unless (package-installed-p 'go-autocomplete)
  (package-install 'go-autocomplete))
(unless (package-installed-p 'go-guru)
  (package-install 'go-guru))

(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-guru)

(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
(add-hook 'before-save-hook 'gofmt-before-save)

(ac-config-default)
(setq gofmt-command "goimports")
