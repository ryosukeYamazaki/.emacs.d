;; projectileの設定
(use-package projectile :ensure t)
(projectile-global-mode)

(setq projectile-completion-system 'ivy)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; ivy-projectile
(use-package counsel-projectile :ensure t)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(counsel-projectile-mode 1)

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)
