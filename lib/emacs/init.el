;; Use this function to load all relevant files by name
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))
;; Use this function to add a directory to the path
(defun user-load-path-add (file)
  (interactive "f")
  "Add a folder in the current user's configuration directory to the load-path"
  (add-to-list 'load-path (expand-file-name file user-init-dir)))

;; Use Evil modal editing
(user-load-path-add "contrib/evil")
(require 'evil)
(evil-mode 1)

;; Use Ido Mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Setup emacs for Drupal development
;;; nXhtml
(load-user-file "contrib/nxhtml/autostart.el")

;;; Setup drupal-mode and related files
(load-user-file "contrib/drupal/autostart.el")

;;; Setup Drupal file associations
(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\|module\\|test\\|install\\|theme\\)$" . drupal-mode))
;(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))


;; Use Solarized theme
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-init-dir))
(load-theme 'solarized-light t)

;; Show line numbers always
(require 'linum)
(global-linum-mode)

;; Various configurations
(set-default-font "Ubuntu Mono-12")
(custom-set-variables
 '(global-linum-mode t)         ; show line numbers on the side
 '(column-number-mode t)        ; show column number in modeline
 '(scroll-bar-mode nil)         ; hide scrollbar
 '(tool-bar-mode nil)           ; hide toolbar
 '(menu-bar-mode nil)           ; hide menubar
 '(inhibit-startup-screen t)    ; don't display the startup screen
 '(initial-scratch-message "")  ; don't show anything in the scratch buffer
 '(vc-handled-backends nil)     ; disable version control
 '(backup-by-copying t)         ; copy original files to new backup location
 '(delete-old-versions t)       ; delete old backup files silently
 '(kept-new-versions 6)         ; keep 6 new versions
 '(kept-old-versions 2)         ; keep 2 old versions
 '(version-control t))          ; number version all backup files

(setq-default indent-tabs-mode nil) ; disable inserting tab characters

;; Put autosave/backup files in one place
(defvar user-backup-directory (expand-file-name "backups" user-init-dir))
(setq backup-directory-alist '(("." . user-backup-directory)))
(setq auto-save-list-file-prefix (expand-file-name "autosaves/" user-init-dir))
(setq auto-save-file-name-transforms `((".*" ,(concat (expand-file-name "autosaves" user-init-dir) "/\\1") t)))

;; Load extra config files
(load-user-file "functions.el")
(load-user-file "bindings.el")
