;;; package --- Summary

;;; Commentary:
;Zamicol's init.el settings \o/


;;; Code:

;Autoinstall packages
;black box function stole from qbit
(defun install-if-missing (lst)
	"Install missing packages on init"
		(when lst
		(let ((pkg (car lst))
			(rest (cdr lst)))
			(unless (package-installed-p pkg nil)
				(package-install pkg))
			(install-if-missing rest))))

(require 'package)

;repos that we wanna load in addition to the default
(setq package-archives 
	'(
		("melpa" .
			"http://melpa.org/packages/")
		("gnu" .
			"http://elpa.gnu.org/packages/")
		("marmalade" .
			"http://marmalade-repo.org/packages/")
		("org" .
			"http://orgmode.org/elpa/")))

(package-initialize)

(unless package-archive-contents
	(package-refresh-contents))

;Make sure to include packages here if you use them below.  
(install-if-missing
	'(
		flymake
		flymake-go
		go-mode
		golint
		magit
		org
		sr-speedbar
		php-mode
		web-mode
		color-theme
	))




;;Speedbar
(setq 
	speedbar-use-images nil
	speedbar-show-unknown-files t
	sr-speedbar-right-side nil
	sr-speedbar-width 25
;	sr-speedbar-default-width 20
;	sr-speedbar-max-width 40
)

;Toggle speedbar with F12
(global-set-key (kbd "<f12>") 'sr-speedbar-toggle)

;(set-face-foreground 'speedbar-directory-face "#8AE234")

(custom-set-faces
  '(speedbar-directory-face ((t (:foreground "#325E07" :weight bold)))))

;Stop speedbar from changing size on window resize
;(with-current-buffer sr-speedbar-buffer-name
;  (setq window-size-fixed 'width))




;GUI options
;Turn off the tool bar
(tool-bar-mode -1)

;make the cursor into a line
(setq-default cursor-type 'bar)

;Save and restore window sessions
(desktop-save-mode 1)

;sr-speedbar on start
;This causes an issue on my desktop for some reason
;Error (frameset): Window is dedicated to `*SPEEDBAR*'
;(when window-system
;  (sr-speedbar-open))

;When pasting, replace highlighted section instead of pasting after
(delete-selection-mode 1)

;; prevent silly initial splash screen
;(setq inhibit-splash-screen t)

;;Set theme using color-theme
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-dark-blue2)
;(color-theme-pierson

;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;(require 'color-theme)
;(color-theme-initialize)
;(load-file "~/.emacs.d/themes/color-theme-cobalt.el")
;(color-theme-cobalt)


(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1) ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour


;;Coding Preferences
;show matching parens
(show-paren-mode 1)
(setq show-paren-delay 0)

;Toggle truncate line mode
(global-set-key (kbd "<f9>") 'toggle-truncate-lines)

;No arrows on line wrap.  
(global-visual-line-mode 1)

;allows to type just y instead of yes
(defalias 'yes-or-no-p 'y-or-n-p)

;Set default tab size
(setq-default tab-width 4)
(setq tab-width 4)
(setq-default indent-tabs-mode t)

;make tab key always call a indent command.
(setq-default tab-always-indent t)


;(setq default-tab-width 4)
;(setq tab-width 4)
;(setq-default tab-width 4)
;(setq indent-line-function 'insert-tab)



;Overwrite default keyboard bindings
(global-set-key (kbd "C-x m") 'eshell)

;flycheck
;this was causing issues, commented out for now.  
;(add-hook 'after-init-hook #'global-flycheck-mode)

;Turn on line numbers everywhere
(global-linum-mode t)

;;Not working experiment function
;(defun split-buffer-window()
;  (kbd "<C-x b> *SPEEDBAR* <RET>")
;  (kbd "<C-x 2>")
;  (buffer-menu))



;;Go settings

;Auto fmt before save
(add-hook 'before-save-hook 'gofmt-before-save)

;Remove unused imports
(add-hook 'go-mode-hook (lambda ()
  (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))

;manual gofmt only in go mode
(add-hook 'go-mode-hook (lambda ()
(local-set-key (kbd "C-x f") 'gofmt)))

(provide 'init)
;;; init.el ends here

