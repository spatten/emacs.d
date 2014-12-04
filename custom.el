;; All your customizations go in this file

;; TODO:
;; whitespace-stripping

;; Always able to answer 'y' instead of 'yes'
(defalias 'yes-or-no-p 'y-or-n-p)

;; turn off icons at the top of the window
(tool-bar-mode -1)

(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)

(load-theme 'solarized-light t)

(textmate-mode)
(autopair-global-mode) ;; enable autopair in all buffers

(mouse-wheel-mode t)

(setq standard-indent 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(server-start) ;; start the emacs server

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings 'super) ;; Command+direction

;; settings help from http://stackoverflow.com/questions/293761/how-do-i-make-emacs-show-blank-spaces
;; make whitespace-mode use just basic coloring
;; (setq whitespace-style (quote (face spaces newline tabs space-mark tab-mark newline-mark)))
;; http://pastebin.com/ieAcvLTJ
 (make-face 'whitespace-light-face)
  (set-face-attribute 'whitespace-light-face nil
                      :background nil
                      :foreground "#909090"
                      :weight 'ultra-light)
(setq whitespace-trailing 'whitespace-light-face)
(setq trailing-whitespace 'whitespace-light-face)
(setq show-trailing-whitespace 1)
;; (setq whitespace-space 'whitespace-light-face)
;; make whitespace-mode use just basic coloring
(setq whitespace-style (quote
  ( tabs newline space-mark tab-mark newline-mark face)))
(setq whitespace-hspace 'underline)
(setq whitespace-display-mappings
          '((space-mark   ?\    [? ]     [? ])	; space
            (space-mark   ?\xA0 [?\xA4]     [? ])	; hard space
            (trailing-space-mark   ?\    [?\xB7]     [?.])	; trailing space
            (newline-mark ?\n   [?\xB6 ?\n] [?$ ?\n])	; end-of-line
            ))
;; turn on whitespace mode globally
(global-whitespace-mode 1)


(global-linum-mode)
;; format for line numbers
(setq linum-format "%3d")

; Missing from ruby-mode.el, see https://groups.google.com/group/emacs-on-rails/msg/565fba8263233c28
(defun ruby-insert-end () 
  "Insert \"end\" at point and reindent current line." 
  (interactive) 
  (insert "end") 
  (ruby-indent-line t) 
  (end-of-line))

(add-hook 'ruby-mode-hook (lambda () (ruby-electric-mode t)))
(add-hook 'ruby-mode-hook 'flymake-ruby-load)

(set-face-attribute 'default nil :font "Anonymous Pro")

;; http://nileshk.com/2009/06/13/prompt-before-closing-emacs.html
(defun ask-before-closing ()
  "Ask whether or not to close, and then close if y was pressed"
  (interactive)
  (if (y-or-n-p (format "Are you sure you want to exit Emacs? "))
      (if (< emacs-major-version 22)
          (save-buffers-kill-terminal)
        (save-buffers-kill-emacs))
    (message "Canceled exit")))

(when window-system
  (global-set-key (kbd "C-x C-c") 'ask-before-closing))

;; disable minimize window
(global-unset-key "\C-x\C-z")

;; Use PCRE regexes instead of emacs regexes
(global-set-key [(meta %)] 'pcre-query-replace-regexp)
(global-set-key [(ctrl meta %)] 'pcre-query-replace-regexp)

(scroll-bar-mode -1)
(set-fringe-mode 1)

;; bindings for the move-text package
(global-set-key [s-M-down] 'move-text-down)
(global-set-key [s-M-up] 'move-text-up)

(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-x g") 'magit-status)

;; Font size
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

;; Use regex searches by default.
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

