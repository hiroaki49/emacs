
;; ==============================================
;; goの設定
;; ==============================================

(eval-after-load "go-mode"
  '(progn
     (require 'go-autocomplete)
     (require 'go-eldoc)
     (require 'go-flycheck)
     (add-hook 'go-mode-hook 'go-eldoc-setup)))


