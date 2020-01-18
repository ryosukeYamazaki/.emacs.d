(use-package lsp-mode
  :commands lsp
  :ensure t
  )

(use-package lsp-ui
  :commands lsp-ui-mode
  :ensure t
  :config

  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  )
(use-package company-lsp
  :commands company-lsp
  :ensure t
  )
(use-package helm-lsp :commands helm-lsp-workspace-symbol :ensure t)
(use-package hydra :ensure t)
(use-package lsp-treemacs :commands lsp-treemacs-errors-list :ensure t)
(push 'company-lsp company-backends)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1)))
  )
(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
    (dap-ui-mode t))
