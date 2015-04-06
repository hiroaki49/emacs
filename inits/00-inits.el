;;; inits.el:

;;基本設定
;; UTF-8とする
;; init.el topに移動


;; 起動時の画面はいらない
(setq inhibit-startup-message t)

;; メニューバーを隠す
(tool-bar-mode -1)

;; スクロールバーを隠す
(scroll-bar-mode -1)

;; 行番号を常に表示する
(global-linum-mode t)
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; ホームディレクトリを初期ディレクトリにする
(cd "~/")

;; tab 幅を 4 に設定
(setq tab-width 4)

;インデントにはスペースを用いる
(setq-default indent-tabs-mode nil)

;; Warning の抑制
(setq byte-compile-warnings
      '(;;not
        free-vars
        ;;unresolved
        ;;callargs
        ;;redefine
        ;; obsolete
        ;;noruntime
        ;;cl-functions
        ;;interactive-only
        ;; make-local
        ))

;１行ずつスクロールする
(setq scroll-step 1)

;;スクロールをスムーズに
;; マウスホイールでスクロール
(defun scroll-down-with-lines ()
  ""
  (interactive)
  (scroll-down 1)
  )
; スムーズに
(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
    (setq-default scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)

;
;; scroll one line at a time (less "jumpy" than defaults)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time


;; [基本] トラックパッド用のスクロール設定
(defun scroll-down-with-lines ()
  "" (interactive) (scroll-down 3))
(defun scroll-up-with-lines ()
  "" (interactive) (scroll-up 3))
(global-set-key [wheel-up] 'scroll-down-with-lines)
(global-set-key [wheel-down] 'scroll-up-with-lines)
(global-set-key [double-wheel-up] 'scroll-down-with-lines)
(global-set-key [double-wheel-down] 'scroll-up-with-lines)
(global-set-key [triple-wheel-up] 'scroll-down-with-lines)
(global-set-key [triple-wheel-down] 'scroll-up-with-lines)


;;kill-lineで行が連結したときにインデントを減らす
(defadvice kill-line (before kill-line-and-fixup activate)
      (when (and (not (bolp)) (eolp))
        (forward-char)
        (fixup-whitespace)
        (backward-char)))

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; 補完時に大文字小文字を区別しない
(setq eshell-cmpl-ignore-case t)

;; create backup file in ~/.emacs.d/backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; create auto-save file in ~/.emacs.d/backup
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))

;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; コマンドをめたキーとして使う（iterm）
;;(when (eq system-type 'darwin)
;;  (setq ns-command-modifier (quote meta)))

;; 括弧
(electric-pair-mode 1)

(require 'tramp)
(setq tramp-default-method "ssh")


;;;
