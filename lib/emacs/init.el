;; Use this function to load all relevant files by name
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Load custom functions
(load-user-file "functions.el")

;; Instead of ~/.emacs.d, use this directory
(setq user-emacs-directory user-init-dir)

;; Provides loop
(require 'cl)

;; Load packages
(load-user-file "custompackages.el")

;; Use Evil modal editing
(require 'evil)
(evil-mode 1)

;; Use Ido Mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-save-directory-list-file (expand-file-name "cache/ido.last" user-init-dir))
(ido-mode 1)

;; Use Auto Complete Mode
;(add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict" user-init-dir))
(require 'auto-complete-config)
(ac-config-default)

;; Use smooth scrolling
(require 'smooth-scrolling)

;; Use Powerline for fancy modeline
(require 'powerline)
(powerline-default-evil-theme)

;; Setup emacs for Drupal development
(require 'web-mode)

;;; Setup Drupal file associations
(add-to-list 'auto-mode-alist
             '("\\.\\(php\\|inc\\|module\\|test\\|install\\|theme\\)$" . php-mode))
(add-to-list 'auto-mode-alist
             '("\\.info" . conf-windows-mode))

;; Use Solarized theme
(load-theme 'solarized-light t)

;; Use ibuffer mode
(defalias 'list-buffers 'ibuffer)

;; Highlight matching parens
(show-paren-mode 1)

;; Various configurations
(set-default-font "Ubuntu Mono-12")
(custom-set-variables
 '(font-lock-maximum-decoration t)        ; show maximum possible highlighting
 '(column-number-mode t)                  ; show column number in modeline
 '(scroll-bar-mode nil)                   ; hide scrollbar
 '(tool-bar-mode nil)                     ; hide toolbar
 '(menu-bar-mode nil)                     ; hide menubar
 '(inhibit-startup-screen t)              ; don't display the startup screen
 '(initial-scratch-message "")            ; don't show anything in the scratch buffer
 '(vc-handled-backends nil)               ; disable version control
 '(show-paren-delay 0)                    ; highlight matching parens immediately
 '(php-mode-coding-style (quote drupal))  ; use drupal coding standards in php-mode
 '(make-backup-files nil))                ; don't make backup files

(setq-default indent-tabs-mode nil) ; disable inserting tab characters

;; Put autosave/backup files in one place
;(defvar user-backup-directory (expand-file-name "backups" user-init-dir))
;(setq backup-directory-alist '(("." . user-backup-directory)))
(setq auto-save-list-file-prefix
      (expand-file-name "autosaves/" user-init-dir))
(setq auto-save-file-name-transforms
      `((".*" ,(concat (expand-file-name "autosaves" user-init-dir) "/\\1") t)))

;; Load extra config files
(load-user-file "bindings.el")
(load-user-file "drupal.el")
