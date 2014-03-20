;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Add the package manager
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

;; Org-Mode stuff from http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; Globally add line numbers and create a margin
(global-linum-mode 1)
(setq linum-format "%d ")

;; Create a key-binding for pudb
(global-set-key (kbd "C-c p") 'pudb)

;; python-mode hooks
(add-hook 'python-mode-hook (lambda () (setq truncate-lines t)))
(add-hook 'python-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

;; Save my place yo!
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; Implement vi-style o
(global-set-key (kbd "C-c o") 'vi-open-line-below)

;; Implemet vi-style O
(global-set-key (kbd "C-c O") 'vi-open-line-above)

;; Implement vi-style dd
(global-set-key (kbd "C-c d") 'kill-current-line)
