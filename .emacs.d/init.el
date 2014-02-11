(tool-bar-mode -1)
(menu-bar-mode -1)
(add-hook 'lisp-interaction-mode-hook 'auto-fill-mode)
(require 'server)
(unless (server-running-p)
  (server-start))
(add-to-list 'load-path "~/.emacs.d/slime/")
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(require 'slime)
(require 'slime-autoloads)
(slime-setup '(slime-fancy))
(global-set-key (kbd "RET") 'newline-and-indent)


#|(require 'auto-complete-config)|#
;(add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict/")
;(global-auto-complete-mode t)
;(auto-complete-mode t)
#|(ac-config-default)|#

;(require 'ac-slime)
;(add-hook 'slime-mode-hook 'set-up-slime-ac)
;(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
;(eval-after-load "auto-complete"
                 #|'(add-to-list 'ac-modes 'slime-repl-mode))|#

(define-globalized-minor-mode real-global-auto-complete-mode
  auto-complete-mode (lambda ()
                       (if (not (minibufferp (current-buffer)))
                         (auto-complete-mode 1))))
(real-global-auto-complete-mode t)
(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(when (require 'auto-complete-config nil 'noerror)
  (add-to-list 'ac-dictionary-directories "~/.emacs.d/auto-complete/ac-dict")
  (setq ac-comphist-file  "~/.emacs.d/ac-comphist.dat")
  (auto-complete-mode t)
  (ac-config-default))

(setq make-backup-files nil)
(setq auto-save-default nil)


#|(load (expand-file-name "~/.emacs.d/package.el"))|#
;(require 'package)
;(add-to-list 'package-archives
		 ;'("marmalade" . "http://marmalade-repo.org/packages/"))
;(package-initialize)

;(defun turn-on-paredit () (paredit-mode 1))
;(add-hook 'clojure-mode-hook
	  ;'(lambda ()
		 ;(progn
		   ;(turn-on-orgtbl)
		   #|(setq inferior-lisp-program "lein repl"))))|#
