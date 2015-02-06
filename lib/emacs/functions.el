;; Use this function to add a directory to the path
(defun user-load-path-add (file)
  (interactive "f")
  "Add a folder in the current user's configuration directory to the load-path"
  (add-to-list 'load-path (expand-file-name file user-init-dir)))

(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(defun powerline-default-evil-theme ()
  "Setup the default mode-line with evil."
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'powerline-active1 'powerline-inactive1))
                          (face2 (if active 'powerline-active2 'powerline-inactive2))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          powerline-default-separator
                                                          (car powerline-default-separator-dir))))
                          (separator-right (intern (format "powerline-%s-%s"
                                                           powerline-default-separator
                                                           (cdr powerline-default-separator-dir))))
                          (lhs (list (powerline-raw evil-mode-line-tag face1 'l)
                                     (funcall separator-left face1 mode-line)
                                     (powerline-raw "%*" nil 'l)
                                     (powerline-raw mode-line-mule-info nil 'l)
                                     (powerline-buffer-id nil 'l)
                                     (when (and (boundp 'which-func-mode) which-func-mode)
                                       (powerline-raw which-func-format nil 'l))
                                     (powerline-raw " ")
                                     (funcall separator-left mode-line face1)
                                     (when (boundp 'erc-modified-channels-object)
                                       (powerline-raw erc-modified-channels-object face1 'l))
                                     (powerline-major-mode face1 'l)
                                     (powerline-process face1)
                                     (powerline-minor-modes face1 'l)
                                     (powerline-narrow face1 'l)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-vc face2 'r)))
                          (rhs (list (powerline-raw global-mode-string face2 'r)
                                     (funcall separator-right face2 face1)
                                     (powerline-raw "%4l" face1 'l)
                                     (powerline-raw ":" face1 'l)
                                     (powerline-raw "%3c" face1 'r)
                                     (funcall separator-right face1 mode-line)
                                     (powerline-raw " ")
                                     (powerline-raw "%6p" nil 'r)
                                     (powerline-hud face2 face1))))
                     (concat (powerline-render lhs)
                             (powerline-fill face2 (powerline-width rhs))
                             (powerline-render rhs)))))))

(defun rename-buffer-to-projectile ()
  "Add the path within the projectile project to the buffer name"
  (interactive)
  (when (projectile-project-p)
    (when (projectile-project-buffer-p (current-buffer) (projectile-project-root))
      (rename-buffer (concat (mapconcat
                              'identity
                              (split-string (buffer-file-name) (projectile-project-root))
                              "")
                             "|"
                             (projectile-project-name)
                             )))))

(defun rename-puppet-buffer ()
  "Name a puppet buffer after the class name it contains"
  (interactive)
  (goto-char 1)
  (when (re-search-forward "^class \\([a-z_]+\\(::[a-z_]+\\)*\\)")
    (rename-buffer (concat (match-string 1)
                           ".pp"))))

(defun beginning-of-line-or-indentation ()
  "move to beginning of line, or indentation"
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))

(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(defun god-mode-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

;; emacs doesn't actually save undo history with revert-buffer
;; see http://lists.gnu.org/archive/html/bug-gnu-emacs/2011-04/msg00151.html
;; fix that.
(defun revert-buffer-keep-history (&optional IGNORE-AUTO NOCONFIRM PRESERVE-MODES)
  (interactive)

  ;; tell Emacs the modtime is fine, so we can edit the buffer
  (clear-visited-file-modtime)

  ;; insert the current contents of the file on disk
  (widen)
  (delete-region (point-min) (point-max))
  (insert-file-contents (buffer-file-name))

  ;; mark the buffer as not modified
  (not-modified)
  (set-visited-file-modtime))

;; Opening a file in Geben is way more complicated than it needs to be.
(defun geben-find-buffer (arg buf)
  (interactive "bBuffer to load: ")
  (geben-with-current-session session
                              (geben-open-fill (geben-source-fileuri session (buffer-file-name buf)))))

;; Auto align region on =.
(defun align-region-on-equals (beg end)
  "Align the region on =."
  (interactive "r")
  (align-regexp beg end "\\(\\s-*\\)="))

;; Eval sexp and replace with value
(defun replace-last-sexp ()
  (interactive)
  (let ((value (eval (preceding-sexp))))
    (kill-sexp -1)
    (insert (format "%S" value))))

(defun force-font (font-name)
  "Set the font used globally."
  (let ((font-value (concat font-name "-10")))
    (set-frame-font font-value)
    (set-face-attribute 'default t :font font-value)
    (add-to-list 'default-frame-alist '(font . font-value))))

(defun choose-font (font-list)
  "Set the global font to the first value installed."
  (if (find-font (font-spec :name (car font-list)))
      (force-font (car font-list))
    (choose-font (cdr font-list))))
