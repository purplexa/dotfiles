;;; RET indents the newly inserted line
(define-key global-map (kbd "RET") 'newline-and-indent)
;; (global-set-key "\C-w" 'backward-kill-word)
(global-set-key (kbd "C-a") 'beginning-of-line-or-indentation)
(global-set-key (kbd "C-t") 'Control-X-prefix)
(define-key ctl-x-map (kbd "-") 'split-window-vertically)
(define-key ctl-x-map (kbd "C--") 'split-window-vertically)
(define-key ctl-x-map (kbd "|") 'split-window-horizontally)
(define-key ctl-x-map (kbd "C-|") 'split-window-horizontally)
(define-key ctl-x-map (kbd "m") 'mc/mark-all-like-this)
(define-key ctl-x-map (kbd "M-m") 'mc/mark-next-like-this)
(make-command-repeatable 'mc/mark-next-like-this)
(define-key ctl-x-map (kbd "a=") 'align-region-on-equals)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-x o") 'switch-window)

(global-set-key (kbd "C-@") 'er/expand-region)

(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; Disable Drupal mode's stupid C-a rebinding
(define-key drupal-mode-map (kbd "C-a") nil)

;; God mode bindings
(global-set-key (kbd "<escape>") 'god-local-mode)
(define-key god-local-mode-map (kbd ".") 'repeat)
(define-key god-local-mode-map (kbd "i") 'god-local-mode)

;; Minor mode bindings
(defvar thrn-keys-minor-mode-map (make-keymap) "thrn-keys-minor-mode keymap.")

(define-key thrn-keys-minor-mode-map (kbd "C-t") 'Control-X-prefix)

(define-minor-mode thrn-keys-minor-mode
  "A minor mode so that my key settings override any major modes."
  t " thrn-keys" 'thrn-keys-minor-mode-map)

(thrn-keys-minor-mode 1)
