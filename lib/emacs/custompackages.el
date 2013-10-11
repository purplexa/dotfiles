;; Packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar user-custom-packages
  '(auto-complete evil feature-mode geben haskell-mode markdown-mode php-mode
                  powerline scss-mode smooth-scrolling solarized-theme undo-tree
                  web-mode yaml-mode))

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
