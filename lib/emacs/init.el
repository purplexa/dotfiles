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

;; Use Solarized theme
(add-to-list 'custom-theme-load-path (expand-file-name "themes" user-init-dir))
(load-theme 'solarized-light t)

;; Use Evil modal editing
(user-load-path-add "contrib/evil")
(require 'evil)
(evil-mode 1)

;; Various configurations
(set-default-font "Ubuntu Mono-12")
(custom-set-variables
 '(global-linum-mode t)  ; show line numbers on the side
 '(column-number-mode t) ; show column number in modeline
 '(scroll-bar-mode nil)  ; hide scrollbar
 '(tool-bar-mode nil)    ; hide toolbar
 '(menu-bar-mode nil))   ; hide menubar

;; Put autosave/backup files in one place
(setq backup-directory-alist (expand-file-name "saves" user-init-dir))
(setq auto-save-file-name-transforms (expand-file-name "saves" user-init-dir))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;; Load extra config files
(load-user-file "functions.el")
(load-user-file "bindings.el")
