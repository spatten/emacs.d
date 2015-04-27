(require 'package)
(package-initialize)

(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

(defvar my-packages '(paredit color-theme-solarized ido-ubiquitous smex textmate magit pcre2el rust-mode lorem-ipsum haml-mode ruby-mode flymake-ruby ruby-electric web-mode yaml-mode move-text writeroom-mode ruby-hash-syntax))

;; TODO

;; To Try


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-hook 'after-init-hook (lambda () (load "~/.emacs.d/custom.el")))

;; Make it so that ruby-electric's expanding of quotes and braces is only turned on
;; for pipes. This means it doesn't mess with autopair
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ruby-electric-expand-delimiters-list (quote (124))))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; )

;; I like this older version of markdown-mode better as it doesn't
;; take-over M-<left> and M-<right> keys, which I use all the time
(add-to-list 'load-path (concat user-emacs-directory "/vendor"))
(require 'markdown-mode)
