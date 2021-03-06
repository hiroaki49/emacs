;;; 30-auto-complete.el

;; ;;auto_complete
;; (require 'auto-complete)
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "/Users/hiroaki/.emacs.d/elisp/ac-dict")
;; (ac-config-default)
;; (global-auto-complete-mode t)

;; ;;; 適用するメジャーモードを足す
;; (add-to-list 'ac-modes 'scss-mode)
;; (add-to-list 'ac-modes 'web-mode)
;; (add-to-list 'ac-modes 'coffee-mode)
;; (add-to-list 'ac-modes 'enh-ruby-mode)
;; (add-to-list 'ac-modes 'rhtml-mode)
;; (add-to-list 'ac-modes 'php-mode)

;; ;;; ベースとなるソースを指定
;; (defvar my-ac-sources
;;               '(ac-source-yasnippet
;;                 ac-source-abbrev
;;                 ac-source-dictionary
;;                 ac-source-words-in-same-mode-buffers))

;; ;;; web mode
;; (setq web-mode-ac-sources-alist
;;       '(("php" . (ac-source-yasnippet ac-source-php-auto-yasnippets))
;;         ("html" . (ac-source-emmet-html-aliases ac-source-emmet-html-snippets))
;;         ("css" . (ac-source-css-property ac-source-emmet-css-snippets))))




;; ;;; yasnippetのbindingを指定するとエラーが出るので回避する方法。
;; (setf (symbol-function 'yas-active-keys)
;;       (lambda ()
;;         (remove-duplicates (mapcan #'yas--table-all-keys (yas--get-snippet-tables)))))
;;;
