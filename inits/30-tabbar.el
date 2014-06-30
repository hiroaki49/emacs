;;; @ tabbar.el:

;; タブ化
;; http://www.emacswiki.org/emacs/tabbar.el
;;(require 'cl)
(require 'tabbar nil t)

;; tabbarを有効にする
(tabbar-mode 1)

;; ボタンをシンプルにする
(setq tabbar-home-button-enabled "")
(setq tabbar-scroll-right-button-enabled "")
(setq tabbar-scroll-left-button-enabled "")
(setq tabbar-scroll-right-button-disabled "")
(setq tabbar-scroll-left-button-disabled "")

;; タブ上でマウスホイール操作無効
(tabbar-mwheel-mode -1)

;; グループ化しない
(setq tabbar-buffer-groups-function nil)

;; 左に表示されるボタンを無効化
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; ウインドウからはみ出たタブを省略して表示
(setq tabbar-auto-scroll-flag nil)

;; タブとタブの間の長さ
(setq tabbar-separator '(1.5))

;; Ctrl-Tab, Ctrl-Shift-Tab でタブを切り替える
(dolist (func '(tabbar-mode tabbar-forward-tab tabbar-forward-group tabbar-backward-tab tabbar-backward-group))
  (autoload func "tabbar" "Tabs at the top of buffers and easy control-tab navigation"))
(defmacro defun-prefix-alt (name on-no-prefix on-prefix &optional do-always)
  `(defun ,name (arg)
     (interactive "P")
     ,do-always
     (if (equal nil arg)
         ,on-no-prefix
       ,on-prefix)))
(defun-prefix-alt shk-tabbar-next (tabbar-forward-tab) (tabbar-forward-group) (tabbar-mode 1))
(defun-prefix-alt shk-tabbar-prev (tabbar-backward-tab) (tabbar-backward-group) (tabbar-mode 1))
(global-set-key (kbd "<C-tab>") 'shk-tabbar-next)
(global-set-key (kbd "<C-S-tab>") 'shk-tabbar-prev)

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "Comic Sans MS"
 :background "black"
 :foreground "gray72"
 :height 1.0)
(set-face-attribute
 'tabbar-unselected nil
 :background "black"
 :foreground "grey72"
 :box nil)
(set-face-attribute
 'tabbar-selected nil
 :background "black"
 :foreground "#c82829"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.2)

;; タブに表示させるバッファの設定
(defvar my-tabbar-displayed-buffers
 '("scratch*" "*Messages*" "*Backtrace*" "*Colors*" "*Faces*" "*vc-" "*eshell*")
  "*Regexps matches buffer names always included tabs.")
(defun my-tabbar-buffer-list ()
  "Return the list of buffers to show in tabs.
Exclude buffers whose name starts with a space or an asterisk.
The current buffer and buffers matches `my-tabbar-displayed-buffers'
are always included."
  (let* ((hides (list ?\  ?\*))
         (re (regexp-opt my-tabbar-displayed-buffers))
         (cur-buf (current-buffer))
         (tabs (delq nil
                     (mapcar (lambda (buf)
                               (let ((name (buffer-name buf)))
                                 (when (or (string-match re name)
                                           (not (memq (aref name 0) hides)))
                                   buf)))
                             (buffer-list)))))
    ;; Always include the current buffer.
    (if (memq cur-buf tabs)
        tabs
      (cons cur-buf tabs))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; ディレクトリは表示しない
(require 'dired)
(defun dired-open-in-accordance-with-situation ()
    (interactive)
    (cond ((string-match "\\(?:\\.\\.?\\)"
                         (format "%s" (thing-at-point 'filename)))
           (dired-find-alternate-file))
          ((file-directory-p (dired-get-filename))
           (dired-find-alternate-file))
          (t
           (dired-find-file))))
;; RETに割り当てる
(define-key dired-mode-map (kbd "RET") 'dired-open-in-accordance-with-situation)
;; 左右キーにも割り当てる
(define-key dired-mode-map (kbd "<left>") 'dired-up-directory)
(define-key dired-mode-map (kbd "<right>") 'dired-open-in-accordance-with-situation)

;; ;; GUIで直接ファイルを開いた場合フレームを作成しない
;; (add-hook 'before-make-frame-hook
;;           (lambda ()
;;             (when (eq tabbar-mode t)
;;               (switch-to-buffer (buffer-name))
;;               (delete-this-frame))))

;; Sort tabbar buffers by name
;; (defun tabbar-add-tab (tabset object &amp;optional append_ignored)
;;  "Add to TABSET a tab with value OBJECT if there isn't one there yet.
;;  If the tab is added, it is added at the beginning of the tab list,
;;  unless the optional argument APPEND is non-nil, in which case it is
;;  added at the end."
;;   (let ((tabs (tabbar-tabs tabset)))
;;     (if (tabbar-get-tab object tabset)
;;         tabs
;;       (let ((tab (tabbar-make-tab object tabset)))
;;         (tabbar-set-template tabset nil)
;;         (set tabset (sort (cons tab tabs)
;;                           (lambda (a b) (string&lt; (buffer-name (car a)) 



;; (defun tabbar-sort-tab ()
;;   (interactive)
;;   (let* ((ctabset (tabbar-current-tabset 't))
;;          (ctabs (tabbar-tabs ctabset)))
;;     (if (and ctabset ctabs)
;;         (progn
;;           (set ctabset (sort ctabs (lambda (b1 b2)
;;                                      (string-lessp (buffer-name (car b1))
;;                                                    (buffer-name (car b2))))))
;;           (put ctabset 'template nil)
;;           (tabbar-display-update)))))
;;;
