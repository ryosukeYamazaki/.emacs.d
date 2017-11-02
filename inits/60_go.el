;; Goのパスを通す
(add-to-list 'exec-path (expand-file-name "/Users/yamazaki-ryosuke/go/bin"))

;; 必要なパッケージのロード
(require 'go-mode)
(require 'company-go)
(require 'go-eldoc)

;; 諸々の有効化、設定
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)
(add-hook 'go-mode-hook (lambda()
                          (setq gofmt-command "goimports")
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (local-set-key (kbd "M-.") 'godef-jump)
                          (local-set-key (kbd "M-,") 'pop-tag-mark)
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)
                          (setq indent-tabs-mode nil)    ; タブを利用
                          (setq c-basic-offset 8)        ; tabサイズを2にする
                          (setq tab-width 8)))
