(unless (package-installed-p 'neotree)
  (package-install 'neotree)
  (package-install 'all-the-icons)
(require 'neotree)
(setq neo-theme (if (display-graphic-p 'icons 'arrow))
=======
