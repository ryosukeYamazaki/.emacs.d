;; Goのパスを通す
(add-to-list 'exec-path (expand-file-name "/Users/yamazaki-ryosuke/go/bin"))

;; 必要なパッケージのロード
(use-package go-mode :ensure t)

;; 諸々の有効化、設定
(add-hook 'go-mode-hook (lambda()
                          (setq gofmt-command "goimports")
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (setq tab-width 2)))
(add-hook 'go-mode-hook #'lsp)

