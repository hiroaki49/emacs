;;; 11-color.el

;;重たい
;; ;; 現在行のハイライト
;; (defface hlline-face
;;   '((((class color)
;;       (background dark))
;;      (:background "#2f4f4f"))
;;      ;(:background "#232526"))
;;     (((class color)
;;       (background light))
;;      (:background  "#98FB98"))
;;     (t
;;      ()))
;;   "*Face used by hl-line.")
;; (setq hl-line-face 'hlline-face)
;; (global-hl-line-mode)
;; カーソル点滅
(blink-cursor-mode 1)

;;カラーテーマ
(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0")
(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/emacs-color-theme-solarized")
;(load-theme 'solarized-dark t)
(require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;     (load-theme 'solarized-dark t)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/")
(setq molokai-theme-kit t)
(load-theme 'molokai t)

;; (if (daemonp)
;;     (add-hook 'after-make-frame-functions
;;               '(lambda (f)
;;                  (with-selected-frame f
;;                    (when (eq window-system nil)
;;                      (progn
;;                        (color-theme-initialize)
;;                        (color-theme-molokai))))))
;;   (progn
;;     (add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/")
;;     (setq molokai-theme-kit t)
;;     (load-theme 'molokai t)))

;; (cond ((eq window-system nil)
;;        (if (daemonp)
;;            (add-hook 'after-make-frame-functions
;;                      '(lambda (f)
;;                         (with-selected-frame f
;;                           (when (eq window-system nil)
;;                             (progn
;;                               (require 'color-theme)
;;                               (color-theme-initialize)
;;                               (color-theme-molokai))))))
;;          (progn
;;            (add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/")
;;            (setq molokai-theme-kit t)
;;            (load-theme 'molokai t))))
;;       (t
;;        (progn
;;          (add-to-list 'custom-theme-load-path "~/.emacs.d/elisp/")
;;          (setq molokai-theme-kit t)
;;          (load-theme 'molokai t))))


;; スクリーンの最大化
(if (eq window-system 'ns)
    (set-frame-parameter nil 'fullscreen 'maximized))
;;;