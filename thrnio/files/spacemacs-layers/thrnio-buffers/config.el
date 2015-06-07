(defun rename-buffer-to-projectile ()
  "Add the path within the projectile project to the buffer name"
  (interactive)
  (let ((newname (get-proposed-projectile-buffer-name "" ""))
        (when newname
          (rename-buffer newname)))))

(defun get-proposed-projectile-buffer-name (base dirname &optional depth)
  (when (and (projectile-project-p)
             (projectile-project-buffer-p (current-buffer)
                                          (projectile-project-root))
             (buffer-file-name))
    (concat (mapconcat
             'identity
             (split-string (buffer-file-name) (projectile-project-root))
             "")
            "<"
            (projectile-project-name)
            ">"
            )))

(advice-add 'uniquify-get-proposed-name
            :before-until #'get-proposed-projectile-buffer-name)

(defun rename-python-init ()
  "Name a Python __init__.py file to be more useful"
  (interactive)
  (when (string= (file-name-nondirectory (buffer-file-name))
                 "__init__.py")
    (rename-buffer-to-projectile)))

(defun rename-puppet-buffer ()
  "Name a puppet buffer after the class name it contains"
  (interactive)
  (goto-char 1)
  (when (re-search-forward "^\\(class\\|define\\) \\([a-z_]+\\(::[a-z_]+\\)*\\)")
    (rename-buffer (concat (match-string 2)
                           ".pp"))))

(add-hook 'puppet-mode-hook 'rename-puppet-buffer)
(add-hook 'yaml-mode-hook 'rename-buffer-to-projectile)
(add-hook 'python-mode-hook 'rename-python-init)
