(require 'package)
(package-initialize)

(setq package-archives
      '(
	("gnu" . "http://elpa.gnu.org/packages/")
	("melpa" . "http://melpa.org/packages/")
	("org" . "http://orgmode.org/elpa/")
	)
      )

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
 '(indent-tabs-mode nil)
 '(package-selected-packages
   '(cargo rust-mode counsel-projectile counsel ivy mozc helm-rg yasnippet yaml-mode web-mode use-package treemacs-projectile treemacs-icons-dired treemacs-evil rubocop rbenv prettier-js path-headerline-mode magit madhat2r-theme lsp-ui lsp-treemacs init-loader helm-projectile helm-lsp helm-git-grep helm-ag go-guru go-eldoc git-gutter flycheck dap-mode csv-mode company-lsp company-go coffee-mode auto-highlight-symbol ag))
 '(ruby-insert-encoding-magic-comment nil t)
 '(tab-width 2))
(put 'upcase-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
