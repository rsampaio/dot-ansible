(unless (package-installed-p 'diff-hl)
  (package-install 'diff-hl))

(add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

