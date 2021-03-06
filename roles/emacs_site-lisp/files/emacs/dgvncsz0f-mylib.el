; http://irreal.org/blog/?p=297
(defun eval-and-replace (value)
  "Evaluate the sexp at point and replace it with its value"
  (interactive (list (eval-last-sexp nil)))
  (kill-sexp -1)
  (insert (format "%S" value)))

(defun my-open-shell-sideways ()
  " Open shell in a window next to the current buffer "
  (interactive)
  (split-window)
  (other-window 1)
  (eshell))

(defun my-copy-line (&optional arg)
  " Do a kill-line but copy rather than kill.  This function
    directly calls kill-line, so see documentation of kill-line
    for how to use it including prefix argument and relevant
    variables.  This function works by temporarily making the
    buffer read-only.

    Reference: http://www.emacswiki.org/emacs/CopyingWholeLines
  "
  (interactive "P")
  (let ((buffer-read-only t)
        (kill-read-only-ok t))
    (save-excursion (kill-whole-line arg))))

(defun my-copy-region-or-whole-line ()
  (interactive)
  (if (or mark-active (use-region-p))
      (call-interactively 'copy-region-as-kill)
    (call-interactively 'my-copy-line)))

(defun my-prepend-line (&optional arg)
  " Insert a newline before the current one. C-a C-o achieves the
    same result.
  "
  (interactive "P")
  (move-beginning-of-line arg)
  (open-line 1))

(defun my-append-line (&optional arg)
  " Insert a newline after the current one. C-e C-o achieves the
    same result.
  "
  (interactive "P")
  (move-end-of-line arg)
  (open-line 1)
  (forward-line 1))

(defun my-bytecompile-and-exit ()
  " Recompile ~/.emacs and everything under ~/.libemacs "
  (byte-recompile-directory "~/.libemacs" 0)
  (byte-compile-file "~/.emacs")
  (kill-emacs 0))

(defun my-toggle-flyspell ()
  " Toggles flyspell-mode.
  "
  (interactive)
  (if (symbol-value 'flyspell-mode)
      (flyspell-mode (- 1))
    (flyspell-mode)
    (flyspell-buffer)))

(defun my-x-as-term ()
  (interactive)
  (when 'window-system
    (lambda ()
      ((toolbar-mode (- 1))
       (menu-bar-mode (- 1))
       (scroll-bar-mode (- 1))))))

(defun my-sgml-mode-hook ()
  (setq sgml-basic-offset 2))

(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

(defun my-delete-prefix (pfx str)
  (if (string-prefix-p pfx str)
      (substring str (length pfx))
    str
    ))

;; source: http://www.emacswiki.org/emacs/RecursiveEditPreservingWindowConfig
(defmacro my-recursive-edit-preserving-window-config (body)
  "*Return a command that enters a recursive edit after executing BODY.
    Upon exiting the recursive edit (with\\[exit-recursive-edit] (exit)
    or \\[abort-recursive-edit] (abort)), restore window configuration
    in current frame.
  "
  `(lambda ()
     "See the documentation for `recursive-edit-preserving-window-config'."
     (interactive)
     (save-window-excursion
       ,body
       (recursive-edit))))

(defun my-recursive-edit-without-this-window ()
  "Enters recursive edit without this window. When exiting edit
   restores window configuration
  "
  (let ((myf (command-remapping 'delete-window)))
    (if (commandp 'myf)
        (myf)
      (delete-window))))

;; source: http://www.emacswiki.org/emacs/RecursiveEditPreservingWindowConfig
(defun my-recursive-edit-with-single-window ()
  "Enters recursive edit leaving only a single window. When
   exiting all other windows are restored.
  "
  (let ((myf (command-remapping 'delete-other-windows)))
       (if (one-window-p 'ignore-minibuffer)
           (error "current window is the only window in its frame")
         (if (commandp 'myf)
             (myf)
           (delete-other-windows)))))

(defun my-browse-url-conkeror (url &rest ignore)
  "Browse url using conkeror"
  (interactive "sURL: ")
  (shell-command-to-string (concat "firecmd conkeror " (shell-quote-argument url))))

(defun my-locate-gitroot ()
  (locate-dominating-file (or buffer-file-name default-directory "~/") ".git/"))

(provide 'dgvncsz0f-mylib)
