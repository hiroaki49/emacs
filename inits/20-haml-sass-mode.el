;;; 30-haml-sass-mode.el

;;haml-modeの設定
(add-hook 'haml-mode-hook
               (lambda ()
                 (setq indent-tabs-mode nil)
                 (define-key haml-mode-map "\C-m" 'newline-and-indent)))

;;scss-mode
(autoload 'sass-mode "scss-mode")
(setq scss-compile-at-save nil) ;; 自動コンパイルをオフにする

;; パスを指定
(add-to-list 'load-path "~/.emacs.d/vendor")

(add-to-list 'auto-mode-alist '("\\.scss$" . scss-mode))

;; ;; インデント幅を2にする
;; ;; コンパイルは compass watchで行うので自動コンパイルをオフ
;; (defun scss-custom ()
;;   "scss-mode-hook"
;;   (and
;;    (set (make-local-variable 'css-indent-offset) 2)
;;    (set (make-local-variable 'scss-compile-at-save) nil)
;;    )
;;   )
;; (add-hook 'scss-mode-hook
;;   '(lambda() (scss-custom)))

;; sass-mode
(autoload 'sass-mode "sass-mode")
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))
;;;
