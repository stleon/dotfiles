(global-linum-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(tool-bar-mode -1)

;; org mode starts
;; https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/home.org"));
;; org mode ends
(toggle-scroll-bar -1)
(setq show-trailing-whitespace t)
(setq inhibit-startup-screen t)

;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(setq-default tab-always-indent t)


;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;; Erlang
(setq load-path (cons  "/usr/local/opt/erlang/lib/erlang/lib/tools-2.11/emacs" load-path))
(setq erlang-root-dir "/usr/local/opt/erlang/lib/erlang")
(setq exec-path (cons "/usr/local/opt/erlang/lib/erlang/bin" exec-path))
(require 'erlang-start)

(global-auto-revert-mode 1)
(setq backup-directory-alist
          `(("." . ,(concat user-emacs-directory "backups"))))
