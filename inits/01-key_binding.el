;;; 01_key_binding.el

;; ctrl+gの弱い版
(global-set-key (kbd "C-M-g") 'keyboard-escape-quit)

;; window分割を便利に
;; C-:で分割、C-zで元に戻す
(defun split-window-vertically-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-vertically)
    (progn
      (split-window-vertically
       (- (window-height) (/ (window-height) num_wins)))
      (split-window-vertically-n (- num_wins 1)))))
(defun split-window-horizontally-n (num_wins)
  (interactive "p")
  (if (= num_wins 2)
      (split-window-horizontally)
    (progn
      (split-window-horizontally
       (- (window-width) (/ (window-width) num_wins)))
      (split-window-horizontally-n (- num_wins 1)))))
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (if (>= (window-body-width) 270)
        (split-window-horizontally-n 3)
      (split-window-horizontally)))
  (other-window 1))
(global-set-key (kbd "C-z") 'delete-window)
;; itermではC-<tab>はC-c lに置換
(if (eq window-system 'ns)
    (global-set-key (kbd "C-<tab>") 'other-window-or-split)
  (global-set-key (kbd "C-c l") 'other-window-or-split))
(global-set-key (kbd "C-:") 'other-window-or-split)


;; ctrl+aで行頭に
(defun beginning-of-indented-line (current-point)
  "インデント文字を飛ばした行頭に戻る。ただし、ポイントから行頭までの間にインデント文字しかない場合は、行頭に戻る。"
  (interactive "d")
  (if (string-match
       "^[ \t]+$"
       (save-excursion
         (buffer-substring-no-properties
          (progn (beginning-of-line) (point))
          current-point)))
      (beginning-of-line)
    (back-to-indentation)))

(defun beginning-of-visual-indented-line (current-point)
  "インデント文字を飛ばした行頭に戻る。ただし、ポイントから行頭までの間にインデント文 字しかない場合は、行頭に戻る。"
  (interactive "d")
  (let ((vhead-pos (save-excursion (progn (beginning-of-visual-line) (point))))
        (head-pos (save-excursion (progn (beginning-of-line) (point)))))
    (cond
     ;; 物理行の1行目にいる場合
     ((eq vhead-pos head-pos)
      (if (string-match
           "^[ \t]+$"
           (buffer-substring-no-properties vhead-pos current-point))
          (beginning-of-visual-line)
        (back-to-indentation)))
     ;; 物理行の2行目以降の先頭にいる場合
     ((eq vhead-pos current-point)
      (backward-char)
      (beginning-of-visual-indented-line (point)))
     ;; 物理行の2行目以降の途中にいる場合
     (t (beginning-of-visual-line)))))
(global-set-key "\C-a" 'beginning-of-visual-indented-line)


;クリップボードの設定
(global-set-key "\M-w" 'clipboard-kill-ring-save)  ; クリップボードにコピー
(global-set-key "\C-w" 'clipboard-kill-region)     ; 切り取ってクリップボードへ

;バックスペースの設定
(global-set-key "\C-h" 'delete-backward-char)

;バッファの再読み込み
(global-set-key (kbd "C-c r") 'revert-buffer)

;;;
