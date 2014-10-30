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

;; Rearrange buffers in windows
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

;; Disable Drupal mode's stupid C-a rebinding
(define-key drupal-mode-map (kbd "C-a") nil)

;; Evil bindings
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-normal-state)
;; Redefine movement keys
(define-key evil-normal-state-map (kbd "k") 'evil-delete)
(define-key evil-normal-state-map (kbd "j") 'evil-find-char-to)
(define-key evil-normal-state-map (kbd "l") 'evil-search-next)
(define-key evil-normal-state-map (kbd "d") 'evil-backward-char)
(define-key evil-normal-state-map (kbd "h") 'evil-next-line)
(define-key evil-normal-state-map (kbd "t") 'evil-previous-line)
(define-key evil-normal-state-map (kbd "n") 'evil-forward-char)
(define-key evil-normal-state-map (kbd "C-t") nil)
(define-key evil-normal-state-map (kbd "u") 'undo)
(define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-visual-state-map (kbd "k") 'evil-delete)
(define-key evil-visual-state-map (kbd "j") 'evil-find-char-to)
(define-key evil-visual-state-map (kbd "l") 'evil-search-next)
(define-key evil-visual-state-map (kbd "d") 'evil-backward-char)
(define-key evil-visual-state-map (kbd "h") 'evil-next-line)
(define-key evil-visual-state-map (kbd "t") 'evil-previous-line)
(define-key evil-visual-state-map (kbd "n") 'evil-forward-char)
(define-key evil-visual-state-map (kbd "C-t") nil)
(define-key evil-visual-state-map (kbd "u") 'undo)
(define-key evil-visual-state-map (kbd "q") nil)
(define-key evil-normal-state-map "\C-e" 'evil-end-of-line)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-visual-state-map "\C-e" 'evil-end-of-line)
(define-key evil-motion-state-map "\C-e" 'evil-end-of-line)
(define-key evil-normal-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-insert-state-map "\C-f" 'evil-forward-char)
(define-key evil-normal-state-map "\C-b" 'evil-backward-char)
(define-key evil-insert-state-map "\C-b" 'evil-backward-char)
(define-key evil-visual-state-map "\C-b" 'evil-backward-char)
(define-key evil-normal-state-map "\C-d" 'evil-delete-char)
(define-key evil-insert-state-map "\C-d" 'evil-delete-char)
(define-key evil-visual-state-map "\C-d" 'evil-delete-char)
(define-key evil-normal-state-map "\C-n" 'evil-next-line)
(define-key evil-insert-state-map "\C-n" 'evil-next-line)
(define-key evil-visual-state-map "\C-n" 'evil-next-line)
(define-key evil-normal-state-map "\C-p" 'evil-previous-line)
(define-key evil-insert-state-map "\C-p" 'evil-previous-line)
(define-key evil-visual-state-map "\C-p" 'evil-previous-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
(define-key evil-normal-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-normal-state-map "\C-k" 'kill-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-visual-state-map "\C-k" 'kill-line)
(define-key evil-normal-state-map "Q" 'call-last-kbd-macro)
(define-key evil-visual-state-map "Q" 'call-last-kbd-macro)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;; God mode bindings
;; (global-set-key (kbd "<escape>") 'god-local-mode)
;; (define-key god-local-mode-map (kbd ".") 'repeat)
;; (define-key god-local-mode-map (kbd "i") 'god-local-mode)

;; Minor mode bindings
(defvar thrn-keys-minor-mode-map (make-keymap) "thrn-keys-minor-mode keymap.")

(define-key thrn-keys-minor-mode-map (kbd "C-t") 'Control-X-prefix)

(define-minor-mode thrn-keys-minor-mode
  "A minor mode so that my key settings override any major modes."
  t " thrn-keys" 'thrn-keys-minor-mode-map)

(thrn-keys-minor-mode 1)
