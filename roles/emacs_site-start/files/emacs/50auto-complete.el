; -*- mode: emacs-lisp; -*-

(unless (package-installed-p 'auto-complete)
  (package-install 'auto-complete))

(require 'auto-complete)
