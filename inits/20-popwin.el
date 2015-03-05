;;; 30-popwin.el

; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:close-popup-window-timer-interval 0.05)
(push '("helm" :regexp t :height 0.4) popwin:special-display-config)
(push '(" *undo-tree*" :width 0.3 :position right) popwin:special-display-config)
;;;
