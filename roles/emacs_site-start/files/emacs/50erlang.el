(unless (package-installed-p 'erlmode)
  (package-install 'erlmode))

(require 'ac-erlmode)
(require 'erlmode-start)
