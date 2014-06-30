;;; 10-font.el

;;フォント
;;Ricty (http://save.sys.t.u-tokyo.ac.jp/~yusa/fonts/ricty.html)
;;window-system入れとかないとターミナルでエラーがでる
(if (eq window-system 'ns)
    (progn
      (set-face-attribute 'default nil
                          :family "Ricty"
                          :height 130)
      ;; 日本語
      (set-fontset-font
       nil 'japanese-jisx0208
       ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
       (font-spec :family "Hiragino Kaku Gothic ProN")))) ;; font

(defun set-charset-ricty ()
  (interactive)
  (progn
    (set-face-attribute 'default nil
                          :family "Ricty"
                          :height 130)
      ;; 日本語
      (set-fontset-font
       nil 'japanese-jisx0208
       ;; (font-spec :family "Hiragino Mincho Pro")) ;; font
       (font-spec :family "Hiragino Kaku Gothic ProN")))) ;; font
;;;
