(require 'cc-mode)

(defun my-c-mode-common-hook ()
  (setq c-basic-offset 4)
  (setq c-set-style "linux"))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
