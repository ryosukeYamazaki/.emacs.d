(require 'package)
(package-initialize)

(setq package-archives
      '(
	("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")
	)
      )
;; caskの読み込み
;; (if (eq system-type 'gnu/linux) (require 'cask "~/.cask/cask.el"))  ; Linuxの場合
;; (if (eq system-type 'darwin) (require 'cask)) ; macの場合
;; (cask-initialize)

(unless package-archive-contents
  (package-refresh-contents))
;;;;; ensure to use use-package
(when (not (package-installed-p 'use-package))
  (package-install 'use-package))
(require 'use-package)

;;;;; init-loader
(use-package init-loader
  :ensure t
  :config
  (init-loader-load "~/.emacs.d/inits"))
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    (quote
;;     (treemacs-icons-dired treemacs-evil lsp-mode helm-egats-plus helm-git-grep magit helm-projectile auto-highlight-symbol path-headerline-mode coffee-mode helm-ag helm-config git-gutter madhat2r-theme init-loader use-package)))
;;  '(ruby-insert-encoding-magic-comment nil)
;;  '(safe-local-variable-values
;;    (quote
;;     ((eval setq flycheck-command-wrapper-function
;; 	   (lambda
;; 	     (command)
;; 	     (append
;; 	      (quote
;; 	       ("bundle" "exec"))
;; 	      command)))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (highlight-indent-guides-mode highlight-indentation-mode add-node-modules-path ripgrep helm-rg sbt-mode scala-mode yasnippet yaml-mode web-mode use-package treemacs-projectile treemacs-icons-dired treemacs-evil rubocop rbenv prettier-js path-headerline-mode magit madhat2r-theme lsp-ui lsp-treemacs init-loader helm-projectile helm-lsp helm-git-grep helm-ag go-guru go-eldoc git-gutter flycheck dap-mode csv-mode company-lsp company-go coffee-mode auto-highlight-symbol ag)))
 '(ruby-insert-encoding-magic-comment nil t))
(put 'upcase-region 'disabled nil)
