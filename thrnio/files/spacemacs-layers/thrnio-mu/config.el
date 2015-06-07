(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(defun my-render-html-message ()
  (let ((dom (libxml-parse-html-region (point-min) (point-max))))
    (erase-buffer)
    (shr-insert-document dom)
    (goto-char (point-min))))

(setq mu4e-html2text-command 'my-render-html-message)
