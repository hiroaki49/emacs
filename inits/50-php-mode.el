;;; 50-php-mode.php


;; php-mode
;; (load-library "php-mode")
(require 'php-mode)
(add-hook 'php-mode-hook 'php-enable-default-coding-style)

(add-hook 'php-mode-hook
         (lambda ()
             (require 'php-completion)
             (php-completion-mode t)
             (when (require 'auto-complete nil t)
             (make-variable-buffer-local 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (auto-complete-mode t))))

;; (autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;; (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))
;; (add-hook 'php-mode-hook
;; 		  '(lambda()
;; 			 (setq tab-width 4)
;; 			 (setq c-basic-offset 4)
;; 			 (c-set-offset 'case-label' 4)
;; 			 (c-set-offset 'arglist-intro' 4)
;; 			 (c-set-offset 'arglist-cont-nonempty' 4)
;; 			 (c-set-offset 'arglist-close' 0)
;;              (require 'php-completion)
;;              (php-completion-mode t)
;;              (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
;;              (make-local-variable 'ac-sources)
;;              (setq ac-sources '(
;;                                 ac-source-words-in-same-mode-buffers
;;                                 ac-source-php-completion
;;                                 ac-source-filename
;;                                 ))))
;; (add-hook 'php-mode-hook 'flycheck-mode)

;;;
