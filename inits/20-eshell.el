;;; eshell.el

(setq eshell-path-env (getenv "PATH"))

;; 補完時に大文字小文字を区別しない
(setq eshell-cmpl-ignore-case t)

(defvar anything-c-eshell-directory-history
  '((name . "Directory History")
    (candidates . (lambda () 
                    (set-buffer anything-current-buffer) 
                    (delete-dups (ring-elements eshell-last-dir-ring))))
    (action . (("Change Directory" . anything-eshell-change-directory)))))

(defvar anything-c-eshell-command-history
  '((name . "Command History")
    (candidates . (lambda ()
                    (set-buffer anything-current-buffer)
                    (remove-if (lambda (str) (string-match "^cd *" str))
                               (delete-dups (ring-elements eshell-history-ring)))))
    (action . (("Insert" . insert))))) ;; この行をコメントアウトして次の行を使う手もあるが
    ;; (action . (("Execute" . anything-eshell-exec-command))))) ;; 使わないほうが無難

(defun anything-eshell-change-directory (dir)
  (insert (concat "cd " dir))
  (eshell-send-input))

(defun anything-eshell ()
  (interactive)
  (anything
   (list
    anything-c-eshell-directory-history
    anything-c-eshell-command-history)))

(global-set-key (kbd "C-x ;") 
                (lambda () (interactive)
                  (cond
                   ((eq major-mode 'eshell-mode) (call-interactively 'anything-eshell))
                   (t (call-interactively 'anything)))))


(defadvice eshell-send-input (after eshell-send-input-after-advice)
  (eshell-save-some-history)
  (eshell-save-some-last-dir))

(ad-activate 'eshell-send-input)
;;;
