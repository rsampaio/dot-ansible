(unless (package-installed-p 'erlang)
  (package-install 'erlang))
(require 'erlang-start)

(defun my/erlang-mode-hook nil
  (progn
    (turn-on-auto-fill)
    (subword-mode)))

(add-hook 'erlang-mode-hook 'my/erlang-mode-hook)

(defun my/whitespace-hook ()
  (setq show-trailing-whitespace 't))

(add-hook 'prog-mode-hook 'my/whitespace-hook)
(add-hook 'erlang-mode-hook 'my/whitespace-hook)
