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
(add-hook 'ruby-mode-hook
          (lambda()
            (setq tab-width 2 indent-tabs-mode nil)))
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
(defun set-rubocop-wrapper-hook ()
  (setq flycheck-command-wrapper-function
        (lambda (command) (append '("bundle" "exec") command)))
  )
(add-hook 'ruby-mode-hook 'set-rubocop-wrapper-hook)
(autoload 'inf-ruby "inf-ruby" "Run an inferior Ruby process" t)
(add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
(add-hook 'ruby-mode-hook 'turn-on-ctags-auto-update-mode)
(defun ruby-ctags-options-hook ()
     (custom-set-variables
      '(ctags-update-other-options
        (list
         "--exclude=log"
         "--exclude=node_modules"
         "--exclude=tmp"
         "--exclude=stories"
         "--exclude=*.coffee"
         "--exclude='.git'"
         "--exclude='.github'"
         "--exclude='.storybook'"
         "--exclude='.temp'"
         "--exclude='front'"
         "--exclude='app/assets'"
         "--exclude='.svn'"
         "--exclude='SCCS'"
         "--exclude='RCS'"
         "--exclude='CVS'"
         "--exclude='EIFGEN'"
         "--exclude='.#*'"
         "--exclude='*~'")
        )
      '(ctags-update-command "ripper-tags")
      )
     )
(add-hook 'ruby-mode-hook 'ruby-ctags-options-hook)

;; magic comment 無効
(setq ruby-insert-encoding-magic-comment nil)
