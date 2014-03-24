;; Functions (load all files in defuns-dir)
(setq defuns-dir (expand-file-name "defuns" user-emacs-directory))
(dolist (file (directory-files defuns-dir t "\\w+"))
  (when (file-regular-p file)
    (load file)))

;; Set up load path
(add-to-list 'load-path user-emacs-directory)

;; Setup Package commands
(require 'setup-package)
(require 'packages)

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
(add-hook 'python-mode-hook '(lambda () (local-set-key (kbd "RET") 'newline-and-indent)))

;; Turn on electric-pair-mode
(electric-pair-mode 1)

;; Show trailing whitespace 
(setq show-trailing-whitespace t)

;; Always truncate lines
(setq default-truncate-lines t)

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

;; Set appearance
(load-theme 'tango-dark)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Add two-finger scrolling
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

;; Stop the bell
(setq ring-bell-function 'ignore)

;; Setup extensions
(eval-after-load 'erc '(require 'setup-erc))

;; Save minibuffer history
(savehist-mode 1)
(setq history-length 1000)

;; Never insert tabs
(set-default 'indent-tabs-mode nil)

;; Sentences do not need double spaces to end. Period.
(set-default 'sentence-end-double-space nil)
