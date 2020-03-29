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

;; .jsファイルなどでjs2-jsx-modeを有効にする
;; (use-package js2-mode :ensure t)
;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-jsx-mode))

;; (use-package flow-minor-mode :ensure t)

;; js2-jsx-modeでflycheckを有効にする
;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
;; (add-hook 'js2-jsx-mode-hook 'flycheck-mode)
(use-package prettier-js :ensure t)
(defun my/use-prettier-from-node-modules ()
  "use node_modules/.bin/prettier if exists"
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (prettier (and root
                      (expand-file-name "node_modules/.bin/eslint --fix"
                                        root))))
    (when (and prettier (file-executable-p prettier))
      (setq-local prettier-js-command prettier))))
(add-hook 'prettier-js-mode-hook #'my/use-prettier-from-node-modules)
(add-hook 'web-mode-hook 'prettier-js-mode)

;; (add-hook 'js2-mode-hook 'prettier-js-mode)
;; (add-hook 'js2-mode-hook 'flycheck-mode)
;; (add-hook 'js2-mode-hook 'lsp)
;; (add-hook 'js2-mode-hook 'lsp-ui-mode)
