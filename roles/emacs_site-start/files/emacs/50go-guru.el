(unless (package-installed-p 'go-guru)
  (package-install 'go-guru))
(add-hook 'go-mode-hook #'go-guru-hl-identifier-mode)
