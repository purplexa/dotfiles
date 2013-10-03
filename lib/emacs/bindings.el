;; Evil keymappings ;;
;;; Unbind problem keys
(define-key evil-normal-state-map "d" nil)
(define-key evil-normal-state-map "D" nil)
(define-key evil-motion-state-map "j" nil)
(define-key evil-motion-state-map "e" nil)

;;; New mappings
(define-key evil-normal-state-map "s" 'execute-extended-command)
(define-key evil-normal-state-map ";" 'execute-extended-command)
(define-key evil-normal-state-map "S" 'evil-ex)
(define-key evil-motion-state-map "-" 'evil-end-of-line)
(define-key evil-normal-state-map "eff" 'find-file)
(define-key evil-normal-state-map "ebw" 'save-buffer)
(define-key evil-normal-state-map "ebs" 'switch-to-buffer)

;;; Rebind for Dvorak
(define-key evil-normal-state-map "j" 'evil-delete)
(define-key evil-normal-state-map "J" 'evil-delete-line)

(define-key evil-motion-state-map "d" 'evil-backward-char)
(define-key evil-motion-state-map "D" 'evil-window-top)
(define-key evil-motion-state-map "h" 'evil-next-line)
(define-key evil-motion-state-map "t" 'evil-previous-line)
(define-key evil-motion-state-map "n" 'evil-forward-char)
(define-key evil-motion-state-map "T" 'evil-lookup)
(define-key evil-motion-state-map "N" 'evil-window-bottom)
(define-key evil-motion-state-map "l" 'evil-search-next)
(define-key evil-motion-state-map "L" 'evil-search-previous)
(define-key evil-motion-state-map "k" 'evil-find-char-to)
(define-key evil-motion-state-map "K" 'evil-find-char-to-backward)

(define-key evil-window-map "d" 'evil-window-left)
(define-key evil-window-map "D" 'evil-window-move-far-left)
(define-key evil-window-map "h" 'evil-window-down)
(define-key evil-window-map "H" 'evil-window-move-very-bottom)
(define-key evil-window-map "t" 'evil-window-up)
(define-key evil-window-map "T" 'evil-window-move-very-top)
(define-key evil-window-map "n" 'evil-window-right)
(define-key evil-window-map "N" 'evil-window-move-far-right)
(define-key evil-window-map "l" 'evil-window-new)

;;; ESC quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; Non-Evil keymappings ;;
;;; RET indents the newly inserted line
(define-key global-map (kbd "RET") 'newline-and-indent)
