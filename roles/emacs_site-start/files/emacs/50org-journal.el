(unless (package-installed-p 'org-journal)
  (package-install 'org-journal))
(setq org-journal-dir "~/Dropbox/journal/")
(require 'org-journal)
