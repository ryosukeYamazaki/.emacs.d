(use-package madhat2r-theme :ensure t)
;; (unless (require 'madhat2r-theme nil t)
;;   (package-install 'madhat2r-theme))

(show-paren-mode t)
(setq show-paren-delay 0) ;表示までの秒数。初期値は0.125
(setq show-paren-style 'expression)    ;括弧内も強調
(global-auto-revert-mode 1) ; ファイルが更新されたらreloadする

;; (unless (require ' nil t)
;;   (package-install ' ))

;; gitの差分表示
(use-package git-gutter :ensure t)
;; (unless (require 'git-gutter nil t)
;;   (package-install 'git-gutter))
;; (require 'git-gutter)
(global-git-gutter-mode t)

(use-package which-key :ensure t)

(use-package ag :ensure t)

;; ctrl-hをバックスペースとして使う。
(global-set-key "\C-h" 'delete-backward-char)

;; バッファの左側に行番号を表示する
(global-linum-mode t)
;; 表示領域のフォーマットを確保する
(setq linum-format "%d ")
(column-number-mode t); 行番号と列番号を表示する

;; 括弧のペアとかは適宜入れて欲しい
(electric-pair-mode t)

;; yanipetの設定
;; (unless (require 'yasnippet nil t)
;;   (package-install 'yasnippet))
(use-package yasnippet :ensure t)
(yas/load-directory "~/.emacs.d/snippets")
(yas-global-mode 1)
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;; color theme
(load-theme 'madhat2r t)

;; ediffの設定
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; 空白表示
(use-package whitespace :ensure t)
(setq whitespace-style '(face           ; faceで可視化
                         trailing       ; 行末
                         tabs           ; タブ
                         spaces         ; スペース
                         empty          ; 先頭/末尾の空行
                         space-mark     ; 表示のマッピング
                         tab-mark))

(setq whitespace-display-mappings
      '(
        (space-mark ?\u3000 [?\u2423])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
        ))
(setq whitespace-trailing-regexp  "\\([ \u00A0]+\\)$")
(setq whitespace-space-regexp "\\(\u3000+\\)")
(set-face-attribute 'whitespace-trailing nil
                    :foreground "RoyalBlue4"
                    :background "RoyalBlue4"
                    :underline nil)
(set-face-attribute 'whitespace-tab nil
                    :foreground "color-247"
                    :background "color-234"
                    :underline nil)
(set-face-attribute 'whitespace-space nil
                    :foreground "gray40"
                    :background "gray20"
                    :underline nil)

;; 空白表示の設定
(global-whitespace-mode 1)
;; pathをheaderに表示させる設定
(use-package path-headerline-mode :ensure t)
(path-headerline-mode +1)

;; auto-highlight
(use-package auto-highlight-symbol :ensure t)
(global-auto-highlight-symbol-mode t)
(add-hook 'after-init-hook 'global-auto-highlight-symbol-mode)

(use-package ripgrep :ensure t)

;; git 用
(use-package magit :ensure t)
;; (use-package magit-delta
;;       :ensure t
;;       :hook (magit-mode . magit-delta-mode))
(with-eval-after-load "magit"
  (setq magit-completing-read-function 'ivy-completing-read))

(global-set-key (kbd "C-x g") 'magit-status)

(use-package flycheck :ensure t)
(global-flycheck-mode)

(use-package which-key :ensure t)
(which-key-mode)

;; plantUML用の設定
;; (setq plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.13/libexec/plantuml.jar")

;; 非同期実行した結果は表示しない。rubocopが走ったりしてwindowsがぽこぽこ立ち上がるのを防ぐ。
;; (add-to-list
;;  'display-buffer-alist
;;  (cons "\\*Async Shell Command\\*.*" (cons #'display-buffer-no-window nil)))

(use-package company
  :ensure t
  :config
  (setq lsp-completion-provider :capf))
