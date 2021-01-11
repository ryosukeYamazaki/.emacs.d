;;; org-mode --- config
(setq org-directory "~/Documents/org")
;(setq org-directory "~/Dropbox/Org")
(setq org-default-notes-file "notes.org")
; Org-captureの設定

; Org-captureを呼び出すキーシーケンス
(define-key global-map "\C-cc" 'org-capture)
; Org-captureのテンプレート（メニュー）の設定
(setq org-capture-templates
      '(("n" "Note" entry (file+headline "~/Documents/org/notes.org" "Notes")
	 "* %?\nEntered on %U\n %i\n %a")
	)
      )

(setq org-log-done 'time)
