(add-to-list 'load-path "/usr/local/Cellar/mu/0.9.11/share/emacs/site-lisp/mu4e")
(require 'mu4e)
(setq mu4e-maildir                        "~/.mail/plgmail"
      mu4e-sent-messages-behavior         'delete
      mu4e-get-mail-command               "offlineimap"
      mu4e-update-interval                300
      mu4e-view-show-images               t
      mu4e-compose-signature-auto-include nil
      user-mail-address                   "rw@puppetlabs.com")

(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq message-send-mail-function    'smtpmail-send-it
      smtpmail-stream-type          'starttls
      smtpmail-default-smtp-server  "smtp.gmail.com"
      smtpmail-smtp-server          "smtp.gmail.com"
      smtpmail-smtp-service         587)

(defun my-render-html-message ()
  (let ((dom (libxml-parse-html-region (point-min) (point-max))))
    (erase-buffer)
    (shr-insert-document dom)
    (goto-char (point-min))))

(setq mu4e-html2text-command 'my-render-html-message)
