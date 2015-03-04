;;; init.el


;; ~/.emacs.d/site-lisp 以下全部読み込み
;; (let ((default-directory (expand-file-name "~/.emacs.d/elisp")))
;;   (add-to-list 'load-path default-directory)
;;   (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
;;       (normal-top-level-add-subdirs-to-load-path)))

(require 'cl)

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
(defun auto-save-byte-compile-file ()
  "Do `byte-compile-file' and reload setting immediately, When elisp file saved only in inits folder."
  (interactive)
  (when (or (equal default-directory inits_dir)
            (equal default-directory (abbreviate-file-name inits_dir)))
    (byte-compile-file buffer-file-name t)
    ))
(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (add-hook 'after-save-hook 'auto-save-byte-compile-file nil t)))


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

;基本設定

;; ; バッファの移動
;; (setq windmove-wrap-around t)
;; (windmove-default-keybindings)

;; ;; flymake
;; (defun flymake-php-init ()
;;   (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                      'flymake-create-temp-inplace))
;;          (local-file (file-relative-name
;;                       temp-file
;;                       (file-name-directory buffer-file-name))))
;;     (list "php" (list "-l" local-file))))
;; (push '(".+\\.php$" flymake-php-init) flymake-allowed-file-name-masks)
;; (push '("(Parse|Fatal) error: (.*) in (.*) on line ([0-9]+)" 3 4 nil 2) flymake-err-line-patterns)

;; (add-hook 'php-mode-hook (flymake-mode t))




;; ;;auto-install
;; (require 'auto-install)
;; (setq auto-install-directory "~/.emacs.d/elisp/") ;Emacs Lispをインストールするディレクトリの指定
;; (auto-install-update-emacswiki-package-name t)
;; (auto-install-compatibility-setup) ;install-elisp.elとコマンド名を同期
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
