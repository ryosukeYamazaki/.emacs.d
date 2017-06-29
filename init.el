;; show-paren-mode：対応する括弧を強調して表示する

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(show-paren-mode t)
(setq show-paren-delay 0) ;表示までの秒数。初期値は0.125
(setq show-paren-style 'expression)    ;括弧内も強調
(setq-default tab-width 2 indent-tabs-mode nil) ; タブはspace 2つで
(global-auto-revert-mode 1) ; ファイルが更新されたらreloadする

;; cask
;; Macの場合
(require 'cask)
;; Linuxの場合
;; (require 'cask "~/.cask/cask.el")
(cask-initialize)

;; gitの差分表示
(global-git-gutter-mode t)

;; helmを使う設定を入れる
(require 'helm-config)
(helm-mode 1)

;; The Silver Searcher を使うための設定 silver -> ag
(require 'helm-ag)
(setq helm-ag-base-command "ag --nocolor --nogrou")
(global-set-key (kbd "C-c s") 'helm-ag)

;; ctrl-hをバックスペースとして使う。
(global-set-key "\C-h" 'delete-backward-char)

;; バッファの左側に行番号を表示する
(global-linum-mode t)
;; 5 桁分の表示領域を確保する
(setq linum-format "%d ")
(column-number-mode t); 行番号と列番号を表示する

;; 括弧のペアとかは適宜入れて欲しい
(electric-pair-mode t)

;; ediffの設定
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;; 空白表示
(require 'whitespace)
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
                    :foreground "yellow4"
                    :background "yellow4"
                    :underline nil)
(set-face-attribute 'whitespace-space nil
                    :foreground "gray40"
                    :background "gray20"
                    :underline nil)

;; 空白表示の設定
(global-whitespace-mode 1)
;; pathをheaderに表示させる設定
(path-headerline-mode +1)

;; auto-highlight
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)
(add-hook 'after-init-hook 'global-auto-highlight-symbol-mode)

;; git 用
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(require 'helm-git-grep) ;; Not necessary if installed by package.el
(global-set-key (kbd "C-c g") 'helm-git-grep)
;; Invoke `helm-git-grep' from isearch.
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;; Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))

;; ruby用
;; rbenv
(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-installation-dir "~/.rbenv")

(add-hook 'ruby-mode-hook 'robe-mode)
(eval-after-load 'company
  '(push 'company-robe company-backends))
(require 'flycheck)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'ruby-mode-hook 'flycheck-mode)
(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)
(flycheck-define-checker ruby-rubocop
   "A Ruby syntax and style checker using the RuboCop tool."
   :command ("rubocop" "--format" "emacs"
             (config-file "--config" flycheck-rubocoprc)
             source)
   :error-patterns
   ((warning line-start
             (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
             line-end)
    (error line-start
           (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
           line-end))
    :modes (ruby-mode motion-mode))
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)

;; magic comment 無効
(setq ruby-insert-encoding-magic-comment nil)

;; rails用の設定
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)

(require 'helm-projectile)
(helm-projectile-on)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

;; coffee用
(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook
  '(lambda() (coffee-custom)))

;; javascript用
(add-to-list 'auto-mode-alist '(".*\\.js\\'" . rjsx-mode))
;;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'rjsx-mode 'flow-minor-mode)
(add-hook 'rjsx-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil) ;;インデントはタブではなくスペース
            (setq js-indent-level 2) ;;スペースは２つ、デフォルトは4
            (setq js2-strict-missing-semi-warning nil))) ;;行末のセミコロンの警告はオフ
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-flow))

;; コピペの設定を入れる
(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)


;; plantUML用の設定
(setq plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.13/libexec/plantuml.jar")

