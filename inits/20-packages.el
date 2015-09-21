;;; 20-package.el

;;読み込む順番の関係ないものだけ先に記述しておく

;package
(require 'package)
(setq package-archives '(
("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("melpa" . "http://melpa.milkbox.net/packages/")))


;pathの引き継ぎ package
(exec-path-from-shell-initialize)
;; load environment variables
;; 追記 GEMに関する環境変数を設定すると rbenv経由で rubyがうまく使えなかったので削除
;; (let ((envs '("PATH" "VIRTUAL_ENV" "GOROOT" "GOPATH")))
(let ((envs '("VIRTUAL_ENV" "GOROOT" "GOPATH")))
  (exec-path-from-shell-copy-envs envs))

;git gutter
;; (require 'git-gutter-fringe+)
;; (global-git-gutter-mode +1)

;; wgrep
(require 'wgrep)
;;; rでwgrepモードにする
(setf wgrep-enable-key "r")
;;; wgrep終了時にバッファを保存
(setq wgrep-auto-save-buffer t)
;;; read-only bufferにも変更を適用する
(setq wgrep-change-readonly-file t)

;;あんま使わないかも
;;neotree
;; (require 'neotree)

;;scala用
;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;(setq ensime-default-server-port 9000)


;;projectile
;;helmと一緒に使うべし
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'helm)
(helm-projectile-on)


;;open-junk
(require 'open-junk-file)
(setq open-junk-file-format "~/develop/junk/%Y/%m/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-x j") 'open-junk-file)


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

;anzu
(require 'anzu)
(global-anzu-mode +1)

(set-face-attribute 'anzu-mode-line nil
                    :foreground "yellow" :weight 'bold)

;;color
(require 'color-theme-sanityinc-tomorrow)

;; chromeの拡張
(if (eq window-system 'ns)
    (when (require 'edit-server nil t)
      (setq edit-server-new-frame nil)
      (edit-server-start)))

;; ;; ace-jump
;; (require 'ace-jump-mode)
;; (global-set-key (kbd "M-i") 'ace-jump-mode)

;; ace-jump-zap
(global-set-key (kbd "M-z") 'ace-jump-zap-to-char)

;;; 3つの表示方法どれか1つ選ぶ
(which-key-setup-side-window-bottom)    ;ミニバッファ
;; (which-key-setup-side-window-right)     ;右端
;; (which-key-setup-side-window-right-bottom) ;両方使う

(which-key-mode 1)
;;;
