;;; 5-go.el --- This is for my GO mode

(add-hook 'before-save-hook 'gofmt-before-save)


;; (eval-after-load "go-mode"
;;   '(progn
;;      (require 'go-autocomplete)
;;      (require 'go-eldoc)
;;      (require 'go-flycheck)
;;      (add-hook 'go-mode-hook 'go-eldoc-setup)))
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-eldoc) ;; Don't need to require, if you install by package.el
(add-hook 'go-mode-hook 'go-eldoc-setup)

;; (add-to-list 'load-path "~/gocode/src/github.com/dougm/goflymake")
;; (require 'go-flymake)

;; (defvar my/helm-go-source
;;   '((name . "Helm Go")
;;     (candidates . (lambda ()
;;                     (cons "builtin" (go-packages))))
;;     (action . (("Show document" . godoc)
;;                ("Import package" . my/helm-go-import-add)))))

;; (defun my/helm-go-import-add (candidate)
;;   (dolist (package (helm-marked-candidates))
;;     (go-import-add current-prefix-arg package)))

;; (defun my/helm-go ()
;;   (interactive)
;;   (helm :sources '(my/helm-go-source) :buffer "*helm go*"))

;; (with-eval-after-load 'go-mode
;;   ;; auto-complete
;;   (require 'go-autocomplete)

;;   ;; company-mode
;;   (add-to-list 'company-backends 'company-go)

;;   ;; eldoc
;;   (add-hook 'go-mode-hook 'go-eldoc-setup)

;;   ;; key bindings
;;   (define-key go-mode-map (kbd "M-.") 'godef-jump)
;;   (define-key go-mode-map (kbd "M-,") 'pop-tag-mark))

;;;
