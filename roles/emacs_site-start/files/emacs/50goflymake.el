(unless (package-installed-p 'flymake)
  (package-install 'flymake)
  (package-install 'flycheck))
(add-to-list 'load-path "~/Code/go/src/github.com/dougm/goflymake")    
(require 'go-flymake)
(require 'go-flycheck)
