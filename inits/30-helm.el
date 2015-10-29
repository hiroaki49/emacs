;;; helm.el

(require 'helm)
(require 'helm-ag)
(require 'helm-config)
(require 'helm-migemo)
;;(require 'helm-c-yasnippet)
(require 'helm-c-moccur)
(require 'helm-swoop)
(require 'helm-mode)

(require 'helm-descbinds)

;;; キー設定i
;;; (global-set-key (kbd "C-;") 'helm-mini)
(global-set-key (kbd "C-x ;") 'helm-mini)
(global-set-key (kbd "C-x C-;") 'helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-o") 'helm-swoop)
(global-set-key (kbd "C-M-o") 'helm-do-ag)
(define-key helm-map (kbd "C-j") 'helm-maybe-exit-minibuffer)
(define-key helm-map (kbd "M-j") 'helm-select-3rd-action)
(define-key helm-map (kbd "C-;") 'anything-keyboard-quit)

(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

(add-to-list 'display-buffer-alist
                    `(,(rx bos "*helm" (* not-newline) "*" eos)
                         (display-buffer-in-side-window)
                         (inhibit-same-window . t)
                         (window-height . 0.4)))


;; ;;; 既存のコマンドを Helm インターフェイスに置き換える
(helm-mode 1)

;;; helm-mode で無効にしたいコマンド

;; (add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

(add-to-list 'helm-completing-read-handlers-alist '(dired . nil))

;; (add-to-list 'helm-completing-read-handlers-alist '(find-file-at-point . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(write-file . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(helm-c-yas-complete . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(dired-do-rename . nil))
;; (add-to-list 'helm-completing-read-handlers-alist '(dired-create-directory . nil))
