;;; 30-popwin.el

; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq anything-samewindow nil)
(setq popwin:close-popup-window-timer-interval 0.05)
(push '("*anything*" :height 25) popwin:special-display-config)
(push '("*anything for files*" :height 25) popwin:special-display-config)
(push '("*Moccur*" :width 80 :height 35) popwin:special-display-config)
(push '("*grep*" :width 80 :height 35) popwin:special-display-config)
;;;
