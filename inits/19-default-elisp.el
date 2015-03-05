;;; 25-default-elisp.el

;;built-inの拡張の設定

;;wdired mode
(require 'wdired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)


;;uniquify
;;同じファイル名を開いた場合のバッファの名付け方
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;c-mode
(add-hook
 'c-mode-hook
 (lambda ()
   (setq indent-tabs-mode nil)
   (setq c-basic-offset 4)))

;;;

