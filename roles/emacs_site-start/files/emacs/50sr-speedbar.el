(unless (package-installed-p 'sr-speedbar)
  (package-install 'sr-speedbar))
(require 'sr-speedbar)
(speedbar-add-supported-extension ".go")
