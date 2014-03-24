;; Flycheck
(require-package 'flycheck)
(global-flycheck-mode 1)
(setq flycheck-check-syntax-automatically '(mode-enabled save))

;; MaGIT
(require-package 'magit)
(require-package 'magit-find-file)

;; Extra Language Modes
(require-package 'go-mode)
(require-package 'markdown-mode)
(require-package 'puppet-mode)

;; Jabber mode
(require-package 'jabber)
(setq jabber-roster-show-title nil)
(setq jabber-roster-line-format " %c %-25n %u %-8s (%r)")
(setq jabber-account-list '(("chris@britecore.com"
                            ;;   (:password . nil)
                            (:network-server . "talk.google.com")
                            (:port . 443)
                            (:connection-type . ssl))))

(provide 'packages)
