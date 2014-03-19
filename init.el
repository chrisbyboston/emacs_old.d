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

(defun pudb ()
  "Insert pudb debugger line at the cursor"
  (interactive)
  (insert "import pudb; pudb.set_trace()  # XXX BREAKPOINT"))

;; Truncate lines when in python-mode
(add-hook 'python-mode-hook (lambda () (setq truncate-lines t)))
