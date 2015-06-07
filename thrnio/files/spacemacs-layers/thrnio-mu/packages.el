;;; packages.el --- thrnio-mu Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar thrnio-mu-packages
  '((mu4e :variables
          mu4e-maildir                        "~/.mail/plgmail"
          mu4e-sent-messages-behavior         'delete
          mu4e-get-mail-command               "offlineimap"
          mu4e-update-interval                nil
          mu4e-view-show-images               t
          mu4e-compose-signature-auto-include nil
          user-mail-address                   "rw@puppetlabs.com"
          message-send-mail-function          'smtpmail-send-it
          smtpmail-stream-type                'starttls
          smtpmail-default-smtp-server        "smtp.gmail.com"
          smtpmail-smtp-server                "smtp.gmail.com"
          smtpmail-smtp-service               587))
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar thrnio-mu-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function thrnio-mu/init-<package-thrnio-mu>
;;
;; (defun thrnio-mu/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
