;;; init.el

;; caskを導入！
(require 'cask "/usr/local/Cellar/cask/0.7.2/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; (require 'cl)

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

;; (if (eq window-system 'nil)
;;     (color-theme-molokai))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.

;; '(ansi-color-faces-vector
 ;;   [default bold shadow italic underline bold bold-italic bold])
 ;; '(ansi-color-names-vector
 ;;   (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 ;; '(custom-enabled-themes (quote (sanityinc-solarized-dark)))
 '(custom-safe-themes
   (quote
    ("4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "4587f73c1f503f01e82ae7da64202834c93e83b10624517145c9e237103ad650" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "cbef37d6304f12fb789f5d80c2b75ea01465e41073c30341dc84c6c0d1eb611d" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 ;; '(fci-rule-color "#424242")
 ;; '(nrepl-message-colors
 ;;   (quote
 ;;    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")));
 '(pallet-mode t)
 ;; '(vc-annotate-background nil)
 ;; '(vc-annotate-color-map
 ;;   (quote
 ;;    ((20 . "#d54e53")
 ;;     (40 . "#e78c45")
 ;;     (60 . "#e7c547")
 ;;     (80 . "#b9ca4a")
 ;;     (100 . "#70c0b1")
 ;;     (120 . "#7aa6da")
 ;;     (140 . "#c397d8")
 ;;     (160 . "#d54e53")
 ;;     (180 . "#e78c45")
 ;;     (200 . "#e7c547")
 ;;     (220 . "#b9ca4a")
 ;;     (240 . "#70c0b1")
 ;;     (260 . "#7aa6da")
 ;;     (280 . "#c397d8")
 ;;     (300 . "#d54e53")
 ;;     (320 . "#e78c45")
 ;;     (340 . "#e7c547")
 ;;     (360 . "#b9ca4a"))))
 ;; '(vc-annotate-very-old-color nil)
 ;; '(yas-prompt-functions (quote (my-yas/prompt)))
 ;; '(yas-trigger-key "TAB"))
)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F")))))
