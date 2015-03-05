;;; ruby-mode.el

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
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))


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

;; rcodetools
(require 'rcodetools)
(setq rct-find-tag-if-available nil)
(defun enh-ruby-mode-hook-rcodetools ()
  (define-key ruby-mode-map "\M-\C-i" 'rct-complete-symbol)
  (define-key ruby-mode-map "\C-c\C-t" 'ruby-toggle-buffer)
  (define-key ruby-mode-map "\C-c\C-f" 'rct-ri))
(add-hook 'ruby-mode-hook 'ruby-mode-hook-rcodetools)

;;rdefs
(require 'anything)
;; (require 'anything-rdefs)
;; (add-hook 'enh-ruby-mode-hook
;;           (lambda ()
;;             (define-key enh-ruby-mode (kbd "C-M-r") 'anything-rdefs)))


;rhtml
(add-hook 'rhtml-mode-hook
          (lambda()
            (setq sgml-basic-offset 4)
            (setq indent-tabs-mode nil)))
