;; projectileの設定
(use-package projectile :ensure t)
(use-package helm-projectile :ensure t)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(use-package helm-projectile :ensure t)
(helm-projectile-on)

(use-package treemacs-projectile :ensure t)
