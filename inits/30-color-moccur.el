;;; 30-color-moccur.el

;;; color-occur.el

(setq moccur-split-word t) ;スペースで区切られた複数の単語にマッチさせる
(when (require 'anything-c-moccur nil t)
    (setq
     ;; anything-c-moccur用 `anything-idle-delay'
     anything-c-moccur-anything-idle-delay 0.1
     ;; バッファの情報をハイライトする
     anything-c-moccur-higligt-info-line-flag t
     ;; 現在選択中の候補の位置を他のwindowに表示する
     anything-c-moccur-enable-auto-look-flag t
     ;; 起動時にポイントの位置の単語を初期パターンにする
     anything-c-moccur-enable-initial-pattern t))
(global-set-key (kbd "C-M-o")
                'anything-c-moccur-occur-by-moccur)
(global-set-key (kbd "C-M-p")
                'moccur)

;; moccur-editを加える
(load "moccur-edit")
;;;
