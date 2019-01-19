(require 'markdown-mode)
(defun markdown-custom ()
  (and (set (make-local-variable 'tab-width) 4))
  )
(add-hook 'markdown-mode
  '(lambda() (markdown-custom)))
