;;; 25-elisp.el

;; powerline
(require 'powerline)
;;;

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

