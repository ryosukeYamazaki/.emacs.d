;; org-mode設定
;; 見出しをインデントする
(setq org-startup-indented t)

;; 見出しをインデントした時にアスタリスクが減るのを防ぐ
(setq org-indent-mode-turns-on-hiding-stars nil)

;; org-mode設定
;; 見出しをインデントする
(setq org-startup-indented t)

;; 見出しをインデントした時にアスタリスクが減るのを防ぐ
(setq org-indent-mode-turns-on-hiding-stars nil)

;; インデントの幅を設定
(setq org-indent-indentation-per-level 2)

;; 見出しの初期状態（見出しだけ表示）
(setq org-startup-folded 'show-all)
(add-hook 'org-mode-hook
          (lambda()
            (setq tab-width 2 indent-tabs-mode nil)))
