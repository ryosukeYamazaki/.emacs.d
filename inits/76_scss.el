;;; scss config --- css mode config

;;; Commentary: css mode config
(defun scss-custom-hook ()
  (setq indent-tabs-mode nil)
  (setq css-indent-offset 2)
)

(add-hook 'scss-mode-hook 'scss-custom-hook)
