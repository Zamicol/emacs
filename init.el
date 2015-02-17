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

;sr-speedbar on start
(when window-system
  (sr-speedbar-open))

;(set-face-foreground 'speedbar-directory-face "#8AE234")

(custom-set-faces
  '(speedbar-directory-face ((t (:foreground "#8AE234" :weight bold)))))

;Stop speedbar from changing size on window resize
;(with-current-buffer sr-speedbar-buffer-name
;  (setq window-size-fixed 'width))




;GUI options
;Turn off the tool bar
(tool-bar-mode -1)

;; prevent silly initial splash screen
(setq inhibit-splash-screen t)

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



;;Coding Preferences
;allows to type just y instead of yes
(defalias 'yes-or-no-p 'y-or-n-p)

;Set default tab size
(setq tab-width 4)

;Overwrite default keyboard bindings
(global-set-key (kbd "C-x m") 'eshell)

;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;Turn on line numbers everywhere
(global-linum-mode t)

;;Not working experiment function
(defun split-buffer-window()
  (kbd "<C-x b> *SPEEDBAR* <RET>")
  (kbd "<C-x 2>")
  (buffer-menu))



;;Go settings
;run gofmt whenever via ke binding.  
(global-set-key (kbd "C-x f") 'gofmt)
;;this is not working as the "current buffer"? is speedbar, not the buffer where the file is being opened.  
;(add-hook 'go-mode-hook 
;	(lambda ()
;		(local-set-key (kbd "C-x f") 'gofmt nil 'make-it-local)))



(provide 'init)
;;; init.el ends here

