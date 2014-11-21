;; Use this function to load all relevant files by name
(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Load custom functions
(load-user-file "functions.el")

;; Instead of ~/.emacs.d, use this directory
(setq user-emacs-directory user-init-dir)

;; Store Customize directives in a single place
(setq custom-file (expand-file-name "customize.el" user-init-dir))
(load custom-file)

;; Listen to $PATH
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

;; Provides loop
(require 'cl)

;; Load packages
(load-user-file "custompackages.el")

;; Magic command repetition
(load-user-file "contrib/repeatable.el")

;; Use Evil modal editing
(require 'evil)
(evil-mode 1)
(evil-set-initial-state 'git-commit-mode 'insert)
(setq evil-want-fine-undo t)

;; Use God Mode
;; (require 'god-mode)
;; (god-mode)
;; (add-hook 'god-mode-enabled-hook 'god-mode-update-cursor)
;; (add-hook 'god-mode-disabled-hook 'god-mode-update-cursor)

;; Use Ido Mode
(require 'flx-ido)
(setq ido-everywhere t)
(setq ido-save-directory-list-file (expand-file-name "cache/ido.last" user-init-dir))
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; Use Auto Complete Mode
;(add-to-list 'ac-dictionary-directories (expand-file-name "ac-dict" user-init-dir))
(require 'auto-complete-config)
(ac-config-default)
(add-hook 'conf-mode-hook 'auto-complete-mode)
(add-hook 'prog-mode-hook 'auto-complete-mode)
(add-hook 'yaml-mode-hook 'auto-complete-mode)

;; Use Projectile
(projectile-global-mode t)

;; Rename buffers to include the project path from Projectile
(add-hook 'puppet-mode-hook 'rename-puppet-buffer)
(add-hook 'yaml-mode-hook 'rename-buffer-to-projectile)

;; Enable autoindenting in well-behaved modes
(add-hook 'lisp-mode-hook 'aggressive-indent-mode)
;(add-hook 'puppet-mode-hook 'aggressive-indent-mode)

;; Highlight matching symbols
(require 'highlight-symbol)
(add-hook 'find-file-hook 'highlight-symbol-mode)
(setq highlight-symbol-idle-delay .2)

;; Use arrow keys for navigation
(windmove-default-keybindings)

;; Visual window selection
(require 'switch-window)

;; Select increasingly large objects
(require 'expand-region)

;; Save minibuffer history between sessions
(savehist-mode)
(setq history-length 1000)

;; Recall recently opened files
(recentf-mode)
(setq recentf-max-saved-items 250)

;; Save undo history when reverting buffer
(setq revert-buffer-function 'revert-buffer-keep-history)

;; Enable visual regexp
(require 'visual-regexp-steroids)

;; Use YASnippet
(require 'yasnippet)
(yas/initialize)
;(setq yas/root-directory '((expand-file-name "yas" user-init-dir)
;                      (expand-file-name "elpa/yasnippet-20131010.2/snippets" user-init-dir)))
;(mapc 'yas/load-directory yas/root-directory)

;; Use smooth scrolling
(require 'smooth-scrolling)

;; Use Powerline for fancy modeline
(require 'powerline)
(powerline-evil-vim-color-theme)

;; Configure whitespace-mode
(require 'whitespace)
(setq whitespace-style '(face tabs trailing lines-tail))
;; (set-face-attribute 'whitespace-line nil
;;                     :background "#494949")
(global-whitespace-mode 1)

;; Setup emacs for Drupal development
(require 'web-mode)
(require 'drupal-mode)

;;; Setup Drupal file associations
(add-to-list 'auto-mode-alist
             '("\\.\\(php\\|inc\\|module\\|test\\|install\\|theme\\)$" . php-mode))
(add-to-list 'auto-mode-alist
             '("\\.info" . conf-windows-mode))
(add-to-list 'auto-mode-alist
             '("\\.make" . drush-make-mode))
(add-to-list 'auto-mode-alist
             '("\\.js" . js2-mode))

;; Use moe-dark theme
(require 'moe-theme)
(load-theme 'moe-dark t)

;; Use ibuffer mode
(defalias 'list-buffers 'ibuffer)

;; Highlight matching parens
(show-paren-mode 1)

;; Color parentheses based on nesting
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; Various configurations
(set-default-font "Menlo-12")
(add-to-list 'default-frame-alist
             '(font . "Menlo-12"))
(setq frame-title-format '("" invocation-name "@" system-name " : %b"))

(tool-bar-mode -1)                    ; hide toolbar
(menu-bar-mode -1)                    ; hide menubar
(scroll-bar-mode -1)                  ; hide scrollbar

(setq-default font-lock-maximum-decoration t)       ; show maximum possible highlighting
(setq-default column-number-mode t)                 ; show column number in modeline

(setq-default inhibit-startup-screen t)             ; don't display the startup screen
(setq-default initial-scratch-message "")           ; don't show anything in the scratch buffer
(setq-default vc-handled-backends nil)              ; disable version control
(setq-default show-paren-delay 0)                   ; highlight matching parens immediately
(setq-default make-backup-files nil)                ; don't make backup files
(setq-default require-final-newline t)              ; require newline at end of file
(setq-default php-mode-coding-style 'drupal)        ; use drupal coding standards in php-mode

(setq-default indent-tabs-mode nil)                 ; disable inserting tab characters
(setq-default sh-basic-offset 2)                    ; indent shell scripts two spaces
(setq-default css-indent-offset 2)                  ; indent CSS files two spaces
(setq-default js2-basic-offset 2)                   ; indent JS files two spaces
(setq-default js2-strict-missing-semi-warning nil)  ; allow missing semicolons
(setq-default apache-indent-level 2)                ; indent apache configs two spaces
(setq tab-stop-list (number-sequence 2 120 2))      ; put tab-stops every two characters
(setq-default scss-compile-at-save nil)             ; don't compile sass for me

;; Put autosave/backup files in one place
;(defvar user-backup-directory (expand-file-name "backups" user-init-dir))
;(setq backup-directory-alist '(("." . user-backup-directory)))
(setq auto-save-list-file-prefix
      (expand-file-name "autosaves/" user-init-dir))
(setq auto-save-file-name-transforms
      `((".*" ,(concat (expand-file-name "autosaves" user-init-dir) "/\\1") t)))

;; Make distinct buffer names useful
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; Load extra config files
(load-user-file "drupal.el")
(load-user-file "bindings.el")
