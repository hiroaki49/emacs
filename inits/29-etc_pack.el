;;; 29_etc_pack.el

;;gtags
;;(require 'gtags)

;pathの引き継ぎ package
(exec-path-from-shell-initialize)

;git gutter
(require 'git-gutter-fringe)
(global-git-gutter-mode)

;; wgrep
(require 'wgrep)
(setq wgrep-enable-key "r")

;; smooth_scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)

;recentf-ext
;recentf
(recentf-mode t)
;;(require 'recentf)
(setq recentf-max-saved-items 2000)
(setq recentf-exclude '(".recentf"))
(setq recentf-auto-cleanup 10)
(run-with-idle-timer 30 t 'recentf-save-list)
(recentf-mode 1)

;;;
