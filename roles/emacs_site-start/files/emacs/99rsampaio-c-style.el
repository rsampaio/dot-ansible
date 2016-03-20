(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(M-tab)] 'company-complete)
(define-key c++-mode-map  [(M-tab)] 'company-complete)
