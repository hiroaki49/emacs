;;; 30-flymake.el

(require 'flymake)

;; GUIの警告は表示しない
(setq flymake-gui-warnings-enabled nil)

;; 全てのファイルで flymakeを有効化
(add-hook 'find-file-hook 'flymake-find-file-hook)

;; ;; M-p/M-n で警告/エラー行の移動
;; (global-set-key "\M-p" 'flymake-goto-prev-error)
;; (global-set-key "\M-n" 'flymake-goto-next-error)

;; 警告エラー行の表示
(global-set-key "\C-cd" 'flymake-display-err-menu-for-current-line)
;;;
