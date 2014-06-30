;;; 30-php-mode.php


;; php-mode
(load-library "php-mode")
(require 'php-mode)
(add-hook 'php-mode-hook
		  '(lambda()
			 (setq tab-width 4)
			 (setq c-basic-offset 4)
			 (c-set-offset 'case-label' 4)
			 (c-set-offset 'arglist-intro' 4)
			 (c-set-offset 'arglist-cont-nonempty' 4)
			 (c-set-offset 'arglist-close' 0)
             (require 'php-completion)
             (php-completion-mode t)
             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
             (make-local-variable 'ac-sources)
             (setq ac-sources '(
                                ac-source-words-in-same-mode-buffers
                                ac-source-php-completion
                                ac-source-filename
                                ))))
(add-hook 'php-mode-hook 'flycheck-mode)


;;emmet-mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; マークアップ言語全部で使う
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) ;; C-j は newline のままにしておく
(keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
(define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開


;; ;; mmm-mode
;; (require 'mmm-mode)
;; (require 'mmm-auto)
;; (setq mmm-submode-decoration-level 2)
;; (invert-face 'mmm-default-submode-face t)
;; (setq mmm-font-lock-available-p t)
;; (setq mmm-global-mode 'maybe)
;; (set-face-bold-p 'mmm-default-submode-face t)
;; (set-face-background 'mmm-default-submode-face nil)
;; (mmm-add-mode-ext-class nil "\\.php?\\'" 'html-php)
;; (mmm-add-classes
;;  '((html-php
;;     :submode php-mode
;;     :front "<\\?\\(php\\)?"
;;     :back "\\?>")))
;; (add-to-list 'auto-mode-alist '("\\.php?\\'" . html-mode))
;; ;; タブの改善
;; (defun save-mmm-c-locals ()
;;   (with-temp-buffer
;;     (php-mode)
;;     (dolist (v (buffer-local-variables))
;;       (when (string-match "\\`c-" (symbol-name (car v)))
;;         (add-to-list 'mmm-save-local-variables `(,(car v) nil, mmm-c-derived-modes))))))
;; (save-mmm-c-locals)
;;;
