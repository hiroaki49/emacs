;;; 30-flycheck.el

(add-hook 'after-init-hook #'global-flycheck-mode)

;;flycheck package
;; (add-hook 'after-init-hook #'global-flycheck-mode)

;; (eval-after-load 'flycheck
;;   '(custom-set-variables
;;    '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; (global-set-key (kbd "C-c f") 'flycheck-first-error)
;; (global-set-key (kbd "C-c n") 'flycheck-next-error)
;; (global-set-key (kbd "C-c p") 'flycheck-previous-error)

;; Aspell
;; (setq ispell-program-name "/usr/local/bin/aspell")
;; (setq-default ispell-program-name "/usr/local/bin/aspell")
;; (eval-after-load "ispell"
;;  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))
;;

;; (global-set-key (kbd "M-$") 'ispell-buffer)
;; (global-set-key (kbd "C-M-$") 'ispell-complete-word)
;; (global-set-key (kbd "<f7>") 'flyspell-mode)

;;;
