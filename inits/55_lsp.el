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
(push 'company-lsp company-backends)
(use-package lsp-ui-flycheck)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-after-open-hook (lambda () (lsp-ui-flycheck-enable 1)))
  )
