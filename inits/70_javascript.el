(use-package web-mode :ensure t)
(add-to-list 'auto-mode-alist '("\\.jsx?$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.es$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-enable-auto-indentation nil)
  (setq web-mode-attr-indent-offset 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-sql-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq tab-width 2)
  (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-quotes" . nil))
  (add-to-list 'web-mode-indentation-params '("lineup-ternary" . nil))
  (add-to-list 'web-mode-indentation-params '("case-extra-offset" . nil))
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)

(setq web-mode-content-types-alist
  (if (boundp 'web-mode-content-types-alist) web-mode-content-types-alist '()))
(add-to-list 'web-mode-content-types-alist '("jsx" . "\\.jsx?$"))

(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (message (format "web-mode-content-type: %s" web-mode-content-type))
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
     ad-do-it))
(use-package add-node-modules-path :ensure t)
(add-hook 'web-mode-hook 'add-node-modules-path)
(add-hook 'web-mode-hook 'lsp)
(add-to-list 'exec-path "./node_modules/.bin")

;; (defun eslint-fix-file ()
;;   (interactive)
;;   (message "yarn -s run eslint --fix %s" (buffer-file-name))
;;   (async-shell-command (concat "yarn -s run eslint --fix " (buffer-file-name))))

;; (defun eslint-fix-file-and-revert ()
;;   (interactive)
;;   (eslint-fix-file)
;;   (revert-buffer t t))

;; (add-hook 'web-mode-hook
;; 	  (lambda ()
;; 	    (add-hook 'after-save-hook #'eslint-fix-file-and-revert)))

