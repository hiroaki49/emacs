;;; 30-anything.el

;;anythingの設定
(require 'anything)
(require 'anything-config)
(setq anything-sources (list anything-c-source-buffers
                             anything-c-source-bookmarks
                             anything-c-source-recentf
                             anything-c-source-file-name-history
                             anything-c-source-locate))
;;(global-set-key (kbd "C-x ;") 'anything) ;; C-x ; でanything起動
;;30-eshellで定義
(require 'anything-startup)
(global-set-key (kbd "C-x b") 'anything-for-files)
(global-set-key (kbd "M-y") 'anything-show-kill-ring)
(global-set-key (kbd "M-x") 'anything-M-x)
;(global-set-key (kbd "C-u") 'anything-gtags)
;kill-ringの設定
(defadvice yank-pop (around anything-kill-ring-maybe activate)
  (if (not (eq last-command 'yank))
      (anything-kill-ring)
    ad-do-it))


;; ;; update GTAGS C-u M-x update-gtagsでも可
;; (defun update-gtags (&optional prefix)
;;   (interactive "P")
;;   (let ((rootdir (gtags-get-rootpath))
;;         (args (if prefix "-v" "-iv")))
;;     (when rootdir
;;       (let* ((default-directory rootdir)
;;              (buffer (get-buffer-create "*update GTAGS*")))
;;         (save-excursion
;;           (set-buffer buffer)
;;           (erase-buffer)
;;           (let ((result (process-file "gtags" nil buffer nil args)))
;;             (if (= 0 result)
;;                 (message "GTAGS successfully updated.")
;;               (message "update GTAGS error with exit status %d" result))))))))
;; (add-hook 'after-save-hook 'update-gtags)
;; ;; gtags-find-tag で検索時に以前のバッファが残らないようにクリアする
;; (setq gtags-select-buffer-single t)
;; ;; anything-gtagsでgtagsの候補バッファを奪うときに違う名前でバッファを作りまくるのでどんどん残る。
;; ;; gtags-select-buffer-singleを真似して事前に以前のバッファをクリアする
;; (defadvice ag-hijack-gtags-select-mode (before before-ag-hijack-gtags-select-mode activate)
;;   "clear buffers before hijack"
;;   (setq anything-buffers nil) ;; resume用の変数もクリア。この後に来るanythingの候補が入るので直前のresumeはできる。
;;   (let (now-buffer-list now-buffer)
;;     (setq now-buffer-list (buffer-list))
;;     (while now-buffer-list
;;       (setq now-buffer (car now-buffer-list))
;;       (if (string-match "*anything gtags*" (buffer-name now-buffer))
;;           (kill-buffer now-buffer))
;;       (setq now-buffer-list (cdr now-buffer-list)))))
;;;
