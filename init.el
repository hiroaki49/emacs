;;; init.el

;; caskを導入！
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

(require 'cl)

;;ベンチマークテスト
;; (defadvice require (around require-benchmark activate)
;;   (let* ((before (current-time))
;;          (result ad-do-it)
;;          (after  (current-time))
;;          (time (+ (* (- (nth 1 after) (nth 1 before)) 1000)
;;                   (/ (- (nth 2 after) (nth 2 before)) 1000))))
;;     (when (> time 50)
;;       (message "%s: %d msec" (ad-get-arg 0) time))))

(add-to-list 'load-path "~/.emacs.d/elisp")

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(setq inits_dir (expand-file-name "~/.emacs.d/inits/"))
(init-loader-load inits_dir)

(defun init-loader-re-load (re dir &optional sort)
  (let ((load-path (cons dir load-path)))
    (dolist (el (init-loader--re-load-files re dir sort))
      (condition-case e
          (let ((time (car (benchmark-run (load (file-name-sans-extension el))))))
            (init-loader-log (format "loaded %s. %s" (locate-library el) time)))
        (error
         ;; (init-loader-error-log (error-message-string e)) ；削除
         (init-loader-error-log (format "%s. %s" (locate-library el) (error-message-string e))) ;追加
         )))))

;;; initsフォルダのみ、保存時に自動コンパイルして即反映させる
;一旦なし
;; (defun auto-save-byte-compile-file ()
;;   "Do `byte-compile-file' and reload setting immediately, When elisp file saved only in inits folder."
;;   (interactive)
;;   (when (or (equal default-directory inits_dir)
;;             (equal default-directory (abbreviate-file-name inits_dir)))
;;     (byte-compile-file buffer-file-name t)
;;     ))
;; (add-hook 'emacs-lisp-mode-hook
;;   (lambda ()
;;     (add-hook 'after-save-hook 'auto-save-byte-compile-file nil t)))


(message "window-system:  %s" window-system)

;; UTF-8とする
(prefer-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-buffer-file-coding-system 'utf-8)
;; (set-language-environment 'Japanese)

;; emacsclient でアクセスした時の文字コード設定
;; バグ: "emacsclient -c" で起動すると実行されない
(add-hook 'server-visit-hook
          (lambda ()
            (set-terminal-coding-system 'utf-8)
            (set-keyboard-coding-system 'utf-8)
            ))

(if (eq window-system 'nil)
    (color-theme-molokai))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(pallet-mode t)
 '(yas-prompt-functions (quote (my-yas/prompt)))
 '(yas-trigger-key "TAB"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
