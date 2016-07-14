(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))

(unless (package-installed-p 'rustfmt)
  (package-install 'rustfmt))

(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)
