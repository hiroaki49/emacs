;;; 30-color-moccur.el

;; migemoの記述
(require 'migemo)
(setq migemo-command "/usr/local/bin/cmigemo")
;; 上のパスには自分の環境でcmigemoをインストールしたときのパスを入力してください
(setq migemo-options '("-q" "--emacs"))
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)
(setq migemo-coding-system 'utf-8-unix)
(load-library "migemo")
(migemo-init)

;; color-moccurの設定
(when (require 'color-moccur nil t)
;;M-oにoccur-by-moccurを割り当て
(define-key global-map (kbd "M-o") 'occur-by-moccur)
;;スペース区切りでAND検索
(setq moccur-split-word t)
;;ディレクトリ検索するときの除外ファイル
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")
;;Migemoを利用できる環境であればMigemoを使う
(when (and (executable-find "/usr/local/bin/cmigemo") ;;このパスも、自分の環境に合わせて変更してください
     (require 'migemo nil t))
(setq moccur-use-migemo t)))

;; moccur-editの設定
(require 'moccur-edit nil t)


;; (setq moccur-split-word t) ;スペースで区切られた複数の単語にマッチさせる
;; (when (require 'anything-c-moccur nil t)
;;     (setq
;;      ;; anything-c-moccur用 `anything-idle-delay'
;;      anything-c-moccur-anything-idle-delay 0.1
;;      ;; バッファの情報をハイライトする
;;      anything-c-moccur-higligt-info-line-flag t
;;      ;; 現在選択中の候補の位置を他のwindowに表示する
;;      anything-c-moccur-enable-auto-look-flag t
;;      ;; 起動時にポイントの位置の単語を初期パターンにする
;;      anything-c-moccur-enable-initial-pattern t))
;; (global-set-key (kbd "C-M-o")
;;                 'anything-c-moccur-occur-by-moccur)
;; (global-set-key (kbd "C-M-j")
;;                 'moccur)

;;;
