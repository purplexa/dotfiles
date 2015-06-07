(defun projectile-set-venv ()
  "Set Python virtualenv to the one defined for the Projectile project."
  (let ((venv (cdr (assoc (projectile-project-name) projectile-venv-alist))))
    (when venv
      (setq python-shell-virtualenv-path venv)
      (setenv "PYTHONPATH" (concat
                          venv
                          "/lib/python2.7/site-packages/:"
                          (projectile-project-root))))))

