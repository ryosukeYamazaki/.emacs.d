;; ruby用
;; rbenv
(use-package rbenv :ensure t)
(global-rbenv-mode)
(setq rbenv-installation-dir "~/.rbenv")

(setq flycheck-check-syntax-automatically '(mode-enabled save))
(add-hook 'ruby-mode-hook 'flycheck-mode)
(use-package rubocop :ensure t)
(add-hook 'ruby-mode-hook 'rubocop-mode)
(add-hook 'ruby-mode-hook
          (lambda()
            (setq tab-width 2 indent-tabs-mode nil)))
(add-hook 'ruby-mode-hook
          '(lambda ()
             (setq flycheck-checker 'ruby-rubocop)
             (flycheck-mode 1)))
(flycheck-define-checker ruby-rubocop
   "ruby rubocop setting"
   :command ("rubocop" "--display-cop-names" "--format" "emacs"
             (option-flag "--lint" flycheck-rubocop-lint-only)
             "--stdin" source-original)
   :standard-input t
   :error-patterns
   ((warning line-start
             (file-name) ":" line ":" column ": " (or "C" "W") ": "
             (optional (id (one-or-more (not (any ":")))) ": ") (message)
             line-end)
    (error line-start
           (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
           line-end))
   :modes (ruby-mode motion-mode))
(defun set-rubocop-wrapper-hook ()
  (setq flycheck-command-wrapper-function
        (lambda (command) (append '("bundle" "exec") command)))
  )
(add-hook 'ruby-mode-hook 'set-rubocop-wrapper-hook)

;; magic comment 無効
(setq ruby-insert-encoding-magic-comment nil)
(custom-set-variables '(ruby-insert-encoding-magic-comment nil))

(add-hook 'ruby-mode-hook 'lsp)
(add-hook 'ruby-mode-hook 'lsp-ui-mode)
