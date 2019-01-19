(package-initialize)

;; caskの読み込み
(if (eq system-type 'gnu/linux) (require 'cask "~/.cask/cask.el"))  ; Linuxの場合
(if (eq system-type 'darwin) (require 'cask)) ; macの場合
(cask-initialize)

(require 'init-loader)
(init-loader-load)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ruby-insert-encoding-magic-comment nil)
 '(safe-local-variable-values
   (quote
    ((eval setq flycheck-command-wrapper-function
	   (lambda
	     (command)
	     (append
	      (quote
	       ("bundle" "exec"))
	      command)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
