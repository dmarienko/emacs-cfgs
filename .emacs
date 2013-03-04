;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
					;(when
					;    (load
					;     (expand-file-name "~/.emacs.d/elpa/package.el"))
					;  (package-initialize))

(add-to-list 'load-path "~/.emacs.d/my/")
(require 'package)
(add-to-list 'package-archives 
	     '("marmalade" .
	       "http://marmalade-repo.org/packages/"))
(package-initialize)

;; ------ Loading my custom functions ------
(load-file "~/.emacs.d/my/myfuncs.el")

(require 'sr-speedbar)
(require 'linum+)
(require 'bm)

;; Prevent the startup message
(setq inhibit-startup-message t)

;; Don't make backup files
(setq make-backup-files nil)

;; Some usefull settings
(show-paren-mode 1) 
(setq-default truncate-lines t)
(setq-default cursor-type 'bar)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default tab-width 4)
(setq file-name-coding-system 'utf-8)
(desktop-save-mode t)
(recentf-mode 1)
(setq bm-highlight-style 'bm-highlight-only-fringe)
;;(setq bm-cycle-all-buffers t)

(setq redisplay-dont-pause t
      scroll-margin 1
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Linum+ mode
(setq linum-format "% 4d")
(global-linum-mode 1)

;; Show line/column number in the mode line
(line-number-mode 1)
(column-number-mode 1)

;; usefull keybindings
(global-set-key [(M-up)] 'windmove-up)
(global-set-key [(M-down)] 'windmove-down)
(global-set-key [(M-left)] 'windmove-left)
(global-set-key [(M-right)] 'windmove-right)
(global-set-key "\M-z" 'comment-or-uncomment-region-or-line)
(global-set-key "\M-e" 'yank)
(global-set-key "\C-q" 'quit-window)
(global-set-key "\C-g" 'goto-line)
(global-set-key [(C-left)] 'previous-buffer)
(global-set-key [(C-right)] 'next-buffer)
(global-set-key "\C-z" 'undo)
(global-set-key [(f10)] 'kill-emacs)
(global-set-key [(f2)] 'save-buffer)
(global-set-key [(f3)] 'sr-speedbar-toggle)
(global-set-key [(C-f11)] 'linum-mode)
(global-set-key [home] 'smart-beginning-of-line)
(global-set-key [(C-tab)] 'bs-show)
(global-set-key "\C-e" 'recentf-open-files)
(global-set-key "\C-a" 'bm-toggle)
(global-set-key (kbd "C-`") 'bm-next)

;;(define-key input-decode-map "\e[1;2A" [S-up])  
;;(define-key input-decode-map "\e[2H" [S-end])  
;;(define-key input-decode-map "\e[2F" [S-home])

(global-set-key [next]
		(lambda () (interactive)
		  (condition-case nil (scroll-up)
		    (end-of-buffer (goto-char (point-max))))))

(global-set-key [prior]
		(lambda () (interactive)
		  (condition-case nil (scroll-down)
		    (beginning-of-buffer (goto-char (point-min))))))

(delete-selection-mode t)

;; Support for the mouse in terminal
(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))

;; IDO mode
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)


;;(setq initial-frame-alist '((width . 150) (height . 60)))
(setq default-frame-alist
      '(
	;;(menu-bar-lines . 1)
        (left-fringe)
        (right-fringe)
        (width . 150)
        (height . 62)
        ))

;; ------ Loading my dark color theme ------
(load-file "~/.emacs.d/my/mycolor.el")
(color-theme-dark-mde)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(global-hl-line-mode t)
 '(hl-line-sticky-flag t)
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(speedbar-default-position (quote left))
 '(speedbar-directory-button-trim-method (quote trim))
 '(speedbar-indentation-width 2)
 '(speedbar-show-unknown-files t)
 '(speedbar-supported-extension-expressions (quote (".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ada" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".clj")))
 '(sr-speedbar-right-side nil)
 '(sr-speedbar-width-console 50)
 '(sr-speedbar-width-x 50)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil 
						 :strike-through nil :overline nil :underline nil 
						 :slant normal :width normal :height 90 :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(ac-candidate-face ((t (:background "gray30" :foreground "gray80"))))
 '(linum ((t (:inherit (shadow default) :foreground "gray40" :height 80)))))


(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/dima/.emacs.d/my/ac-dict")
(ac-config-default)
(ac-set-trigger-key "TAB")
(setq ac-auto-start nil)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode)

(require 'bs)
(add-to-list 'bs-configurations
	     '("channels" nil nil "^[^#]" nil nil))
(add-to-list 'bs-configurations
	     '("targets" nil nil nil
	       (lambda (buf)
		 (with-current-buffer buf
		   (not (erc-default-target)))) nil))
(add-to-list 'bs-configurations
	     '("dired" nil nil nil
	       (lambda (buf)
		 (with-current-buffer buf
		   (not (eq major-mode 'dired-mode)))) nil))

;; Expand region like IDEA
(add-to-list 'load-path "~/.emacs.d/my/expand-region.el-master")
(require 'expand-region)
(global-set-key (kbd "M-v") 'er/expand-region)
