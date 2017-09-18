(package-initialize)

;; caskの読み込み
(if (eq system-type 'gnu/linux) (require 'cask "~/.cask/cask.el"))  ; Linuxの場合
(if (eq system-type 'darwind) (require 'cask)) ; macの場合
(cask-initialize)

(require 'init-loader)
(init-loader-load)
