(advice-add 'uniquify-get-proposed-name
            :before-until #'get-proposed-projectile-buffer-name)

(add-hook 'puppet-mode-hook 'rename-puppet-buffer)
(add-hook 'yaml-mode-hook 'rename-buffer-to-projectile)
(add-hook 'python-mode-hook 'rename-python-init)
