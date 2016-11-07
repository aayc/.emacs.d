(require 'package)

(add-to-list 'package-archives
       '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(better-defaults
    paredit
    elpy
    clojure-mode
    clojure-mode-extra-font-locking
    cider
    rainbow-delimiters
    magit
    tagedit
    material-theme))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(global-visual-line-mode t)
(global-linum-mode t)

;; CLOJURE MODE
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(require 'clojure-mode-extra-font-locking)
(show-paren-mode 1)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


(elpy-enable)
