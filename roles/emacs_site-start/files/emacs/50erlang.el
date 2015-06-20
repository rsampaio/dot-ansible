(unless (package-installed-p 'erlang)
  (package-install 'erlang))
(require 'erlang-start)
