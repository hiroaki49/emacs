;;yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/snippets/yasnippets-rails/rails-snippets"
        "~/.emacs.d/snippets/enh-ruby-mode"
        "~/.emacs.d/elpa/yasnippet-20141102.1554/snippets"
        ))
(yas-load-directory "~/.emacs.d/snippets")
(yas-load-directory "~/.emacs.d/snippets/yasnippets-rails/rails-snippets")
(yas-load-directory "~/.emacs.d/snippets/enh-ruby-mode")
(yas-global-mode 1)

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;;トリガーキーの設定
(custom-set-variables '(yas-trigger-key "C-o"))


;; yasnippetとhelmの対応
(defun my-yas/prompt (prompt choices &optional display-fn)
  (let* ((names (loop for choice in choices
                      collect (or (and display-fn (funcall display-fn choice))
                                  coice)))
        (selected (helm-other-buffer
                    `(((name . ,(format "%s" prompt))
                       (candidates . names)
                       (action . (("Insert snippet" . (lambda (arg) arg))))))
                    "*helm yas/prompt*")))
    (if selected
        (let ((n (position selected names :test 'equal)))
          (nth n choices))
      (signal 'quit "user quit!"))))
(custom-set-variables '(yas/prompt-functions '(my-yas/prompt)))
