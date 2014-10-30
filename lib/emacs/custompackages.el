;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(defvar user-custom-packages
  '(ack-and-a-half aggressive-indent-mode apache-mode auto-complete
                   base16-theme browse-kill-ring buffer-move
                   color-theme-sanityinc-tomorrow drupal-mode evil
                   expand-region feature-mode flycheck flymake-css
                   flymake-jslint flymake-php flymake-sass flx-ido
                   git-commit-mode gitconfig-mode geben god-mode
                   haskell-mode highlight-symbol js3-mode leuven-theme
                   markdown-mode multiple-cursors php-auto-yasnippets
                   php-mode powerline projectile puppet-mode
                   rainbow-delimiters scss-mode smex smooth-scrolling
                   solarized-theme ssh-config-mode switch-window
                   web-mode wrap-region yaml-mode yasnippet))

(defun custom-packages-installed ()
  (loop for p in user-custom-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

(unless (custom-packages-installed)
  ;; check for new packages/versions
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install missing packages
  (dolist (p user-custom-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(package-initialize)
(provide 'user-custom-packages)
