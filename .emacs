
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(global-linum-mode 1)
;;(add-hook 'prog-mode-hook 'linum-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (plantuml-mode lua-mode go-mode magit sr-speedbar wanderlust)))
 '(speedbar-show-unknown-files t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(tool-bar-mode -1)

(setq next-line-add-newlines t)

;; org mode starts
;; https://orgmode.org/worg/org-tutorials/orgtutorial_dto.html
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq calendar-week-start-day 1)
;(setq org-agenda-files (list "~/projects/home/org/work.org"
;                             "~/projects/home/org/home.org"));

(setq org-agenda-files '("~/projects/home/org/home"
                         "~/projects/home/org/work"));

(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)
;; org mode ends

;;(toggle-scroll-bar -1)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; whitespaces
(setq-default show-trailing-whitespace t)

(setq inhibit-startup-screen t)

(column-number-mode 1)

;; tabs
(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(defvaralias 'c-basic-offset 'tab-width)
(setq-default tab-always-indent t)


;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;; Erlang
(cond
 (
   (string-equal system-type "darwin")
   (setq load-path (cons  "/usr/local/opt/erlang@19/lib/erlang/lib/tools-2.9.1/emacs" load-path))
   (setq erlang-root-dir "/usr/local/opt/erlang@19/lib/erlang")
   (setq exec-path (cons "/usr/local/opt/erlang@19/lib/erlang/bin" exec-path))
 )
 (
  (string-equal system-type "gnu/linux")
  (setq load-path (cons  "/usr/lib/erlang/lib/tools-2.10.1/emacs" load-path))
  (setq erlang-root-dir "/usr/lib/erlang")
  (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
 )
)
(require 'erlang-start)

;; Go
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(global-auto-revert-mode 1)
(setq backup-directory-alist
      `(("." . ,(concat user-emacs-directory "backups"))))


(add-to-list 'load-path "/usr/local/share/distel/elisp")
(require 'distel)
(distel-setup)


(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; WanderLust
;; IMAP, gmail:
(setq elmo-imap4-default-server "imap.gmail.com"
      elmo-imap4-default-user "leonst998@gmail.com"
      elmo-imap4-default-authenticate-type 'clear
      elmo-imap4-default-port '993
      elmo-imap4-default-stream-type 'ssl

      ;; For non ascii-characters in folder-names
      elmo-imap4-use-modified-utf7 t)

;; SMTP
(setq wl-smtp-connection-type 'starttls
      wl-smtp-posting-port 587
      wl-smtp-authenticate-type "plain"
      wl-smtp-posting-user "leonst998"
      wl-smtp-posting-server "smtp.gmail.com"
      wl-local-domain "gmail.com"
      wl-message-id-domain "smtp.gmail.com")

(setq wl-from "Lev <leonst998@gmail.com>"

      ;; All system folders (draft, trash, spam, etc) are placed in the
      ;; [Gmail]-folder, except inbox. "%" means it's an IMAP-folder
      wl-default-folder "%inbox"
      wl-draft-folder   "%[Gmail]/Черновики"
      wl-trash-folder   "%[Gmail]/Корзина"
      ;; The below is not necessary when you send mail through Gmail's SMTP server,
      ;; see https://support.google.com/mail/answer/78892?hl=en&rd=1
      wl-fcc            "%[Gmail]/Отправленные"

      ;; Mark sent messages as read (sent messages get sent back to you and
      ;; placed in the folder specified by wl-fcc)
      wl-fcc-force-as-read    t

      ;; For auto-completing foldernames
      wl-default-spec "%")


(require 'sr-speedbar)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; plantuml
(setq plantuml-jar-path "/usr/local/bin/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)

;; window resize
(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
