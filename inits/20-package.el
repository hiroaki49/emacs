;;; 20-package.el

;package
(require 'package)
(setq package-archives '( 
("gnu" . "http://elpa.gnu.org/packages/") 
("marmalade" . "http://marmalade-repo.org/packages/") 
("melpa" . "http://melpa.milkbox.net/packages/")))
;Initialize
(package-initialize)

(defvar installing-package-list
  '(
    anything
    auto-complete
    color-moccur
    color-theme
    color-theme-molokai
    exec-path-from-shell
    flycheck
    git-gutter-fringe
    haml-mode
    php-mode
    popwin
    recentf-ext
    sass-mode
    scss-mode
    smooth-scroll
;;    tabbar
    undo-tree
    wgrep
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))
;;;
