;;; package --- Summary

;;; Commentary:
;Zamicol's init.el settings \o/


;;; Code:
(setq 
 speedbar-use-images nil
 speedbar-show-unknown-files t
 sr-speedbar-right-side nil
; sr-speedbar-max-width 40
 sr-speedbar-width 25
; sr-speedbar-default-width 20
)

;Extra Packages 
(setq package-archives '(("melpa" .
			  "http://melpa.org/packages/")
			 ("gnu" .
			  "http://elpa.gnu.org/packages/")
			 ("marmalade" .
			  "http://marmalade-repo.org/packages/")
			 ("org" .
			  "http://orgmode.org/elpa/")))

(when (>= emacs-major-version 24)
	(require 'package)
	(package-initialize)) 

;Turn off the tool bar
(tool-bar-mode -1)

;sr-speedbar on start
(when window-system
  (sr-speedbar-open))

;Stop speedbar from changing size on window resize
;(with-current-buffer sr-speedbar-buffer-name
;  (setq window-size-fixed 'width))


;custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;allows to type just y instead of yes
(defalias 'yes-or-no-p 'y-or-n-p)

;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init)
;;; init.el ends here



