;; avy
(global-set-key (kbd "C-o") 'avy-goto-char)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g f") 'avy-goto-line)

;; avy-migemo
(require 'avy-migemo)
(avy-migemo-mode 1)

