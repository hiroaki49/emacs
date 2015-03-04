;;; 29_etc_pack.el

;;gtags
;;(require 'gtags)

;recentf-ext
;recentf
(require 'recentf)
(require 'recentf-ext)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
;;(require 'recentf)
(setq recentf-max-saved-items 2000)
;;(setq recentf-exclude '("^/[^/:]+:")) ;;tramp対策。
(setq recentf-exclude '(".recentf"))
;(setq recentf-auto-cleanup '10)
(run-with-idle-timer 30 t 'recentf-save-list)
(recentf-mode 1)

;rhtml
(add-hook 'rhtml-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode nil)))

;;;
