(unless (package-installed-p 'sr-speedbar)
  (package-install 'neotree))
(require 'neotree)
(setq neo-theme (if window-system 'icons 'arrow))
