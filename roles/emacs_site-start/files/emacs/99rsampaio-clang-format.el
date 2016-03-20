;; Hook function
(defun clang-format-before-save ()
  (interactive)
  (when (eq major-mode 'c++-mode) (clang-format-buffer)))

;; Install hook to use clang-format on save
(add-hook 'before-save-hook 'clang-format-before-save)
