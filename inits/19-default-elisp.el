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


;;ediff
;; コントロール用のバッファを同一フレーム内に表示
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
;; diffのバッファを上下ではなく左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)
;;;

