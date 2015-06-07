(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

(setq mu4e-html2text-command 'my-render-html-message)
