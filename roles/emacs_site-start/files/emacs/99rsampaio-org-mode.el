(require 'org)

(setq org-directory "~/Dropbox/org")
(setq org-agenda-files (file-expand-wildcards "~/Dropbox/org/*.org"))
(setq org-log-done t)
(add-to-list 'org-agenda-files org-journal-dir)
(setq org-agenda-file-regexp "\\`[^.].*\\.org'\\|[0-9]+")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(setq
 org-capture-templates
 '(
   ("T" "Personal Todo" entry (file+headline (concat org-directory "/mytodo.org") "Tasks")
    "* TODO %?\n  %u")
   ("t" "Work Todo" entry (file+headline (concat org-directory "/worktodo.org") "Tasks")
    "* TODO %?\n  %u")
   ("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
    "* %?\nEntered on %U\n  %i")
   ("r" "Random" entry (file+datetree (concat org-directory "/random.org"))
    "* %?\nEntered on %U\n  %i")
   )
 )

(define-key global-map "\C-ct"
  (lambda () (interactive) (org-capture nil "t")))

(define-key global-map "\C-cT"
  (lambda () (interactive) (org-capture nil "T")))

(define-key global-map "\C-cr"
  (lambda () (interactive) (org-capture nil "r")))

(define-key global-map "\C-cj"
  (lambda () (interactive) (org-capture nil "j")))
