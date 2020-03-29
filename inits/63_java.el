;; java-lsp
(use-package lsp-java :ensure t)
;; (use-package dap-java :after (lsp-java))
;; (require 'lsp-java-boot)

(add-hook 'java-mode-hook #'lsp)
;; (add-hook 'lsp-mode-hook #'lsp-lens-mode)
;; (add-hook 'java-mode-hook #'lsp-java-boot-lens-mode)
