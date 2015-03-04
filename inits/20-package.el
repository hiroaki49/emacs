;;; 20-package.el

;package
(require 'package)
(setq package-archives '( 
("gnu" . "http://elpa.gnu.rg/packages/") 
("marmalade" . "http://marmalade-repo.org/packages/") 
("melpa" . "http://melpa.milkbox.net/packages/")))
;Initialize
(package-initialize)

;; (defvar installing-package-list
;;   '(
;;     anything
;;     anything-config
;;     auto-complete
;;     color-moccur
;;     color-theme
;;     color-theme-molokai
;;     dirtree
;;     ensime
;;     exec-path-from-shell
;;     flycheck
;;     git-gutter-fringe
;;     go-mode
;;     go-autocomplete
;;     haml-mode
;;     php-mode
;;     popwin
;;     recentf-ext
;;     sass-mode
;;     sbt-mode
;;     scala-mode2
;;     scss-mode
;;     undo-tree
;;     wgrep
;;     ))

;; (let ((not-installed (loop for x in installing-package-list
;;                             when (not (package-installed-p x))
;;                             collect x)))
;;   (when not-installed
;;     (package-refresh-contents)
;;     (dolist (pkg not-installed)
;;         (package-install pkg))))

;pathの引き継ぎ package
(exec-path-from-shell-initialize)

;git gutter
(require 'git-gutter-fringe)
(global-git-gutter-mode)

;; wgrep
(require 'wgrep)
(setq wgrep-enable-key "r")

;; smooth_scroll
;; (require 'smooth-scroll)
;; (smooth-scroll-mode t)

(require 'dirtree)
(require 'ensime)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;(setq ensime-default-server-port 9000)

(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)

(defun projectile-rails-goto-template-at-point ()
  (interactive)
  (let* ((template (projectile-rails-filename-at-point))
         (dir (projectile-rails-template-dir template))
         (name (projectile-rails-template-name template))
         (format (projectile-rails-template-format template)))
    (if format
        (loop for processor in '("erb" "haml" "slim")
              for template = (s-lex-format "${dir}${name}.${format}.${processor}")
              for partial = (s-lex-format "${dir}_${name}.${format}.${processor}")
              for partial-2 = (expand-file-name
                               (s-lex-format "_${name}.${format}.${processor}")
                               (projectile-expand-root "app/views/application"))
              for partial-3 = (expand-file-name
                               (s-lex-format "_${name}.${format}.${processor}")
                               (projectile-expand-root "app/views/shared"))
              until (or
                     (projectile-rails-ff template)
                     (projectile-rails-ff partial)
                     (projectile-rails-ff partial-2)
                     (projectile-rails-ff partial-3)))
      (message "Could not recognize the template's format")
            (dired dir))))


;;enh-ruby
(autoload 'enh-ruby-mode "enh-ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))

;;ruby-electric
(require 'ruby-electric)
(add-hook 'enh-ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)

;; ruby-block.el --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)

;rhtml
(require 'rhtml-mode)

; robe
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'robe-ac-setup "robe-ac" "robe auto-complete" nil nil)
(add-hook 'robe-mode-hook 'robe-ac-setup)

;;yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"
        "~/.emacs.d/snippets/yasnippets-rails/rails-snippets"
        "~/.emacs.d/snippets/enh-ruby-mode"
        "~/.emacs.d/elpa/yasnippet-20141102.1554/snippets"
        ))
(yas-load-directory "~/.emacs.d/snippets")
(yas-load-directory "~/.emacs.d/snippets/yasnippets-rails/rails-snippets")
(yas-load-directory "~/.emacs.d/snippets/enh-ruby-mode")
(yas-global-mode 1)

;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x y i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

;;トリガーキーをTABからSPCに変更
(define-key yas-minor-mode-map (kbd "SPC") 'yas/expand)
(define-key yas-minor-mode-map (kbd "TAB") nil)

;; chromeの拡張
(require 'edit-server)
(edit-server-start)

;;open-junk
(require 'open-junk-file)
(setq open-junk-file-format "~/develop/junk/%Y/%m/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-x j") 'open-junk-file)
;;;
