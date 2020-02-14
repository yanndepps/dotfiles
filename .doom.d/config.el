;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-nord-light t)
(load-theme 'doom-nord t)
;; (load-theme 'doom-gruvbox t)

;; Alt key
(setq ns-alternate-modifier 'none)

;; No title bar
;; (setq default-frame-alist '((undecorated . t)))

;; Dark title bar
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

;; Transparency
;; (set-frame-parameter (selected-frame) 'alpha '(85 60))
;; (add-to-list 'default-frame-alist '(alpha 85 60))

;; Processing
(setq processing-location "/usr/local/bin/processing-java")
(setq processing-application-dir "/Applications/Processing.app")
(setq processing-sketchbook-dir "~/Documents/Processing")

;; SuperCollider
(add-to-list 'load-path "/Users/yanndepps/scsources/scel/el")
(require 'sclang)
(setenv "PATH" (concat (getenv "PATH") ":/Applications/SuperCollider.app/Contents/MacOS"))
(setq exec-path (append exec-path '("/Applications/SuperCollider.app"  "/Applications/SuperCollider.app/Contents/MacOS")))

;; TidalCycles
;; (setq load-path (cons "~/tidal/" load-path))
(setq load-path (cons "~/tidal" load-path))
(setq tidal-interpreter "/usr/local/bin/ghci")

;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
;; (doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Modules
(load! "+ui") ;; ui mods and ligature stuff
(load! "+ranger") ;; file manager stuff

;; Zaiste setup
(after! org
  (setq org-bullets-bullet-list '("∵")))

(def-package! org-super-agenda
  :after org-agenda
  :init
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Big Outcomes"
                                         :tag "bo")))
  :config
  (org-super-agenda-mode))



;; (def-package! org-fancy-priorities
;;   :hook (org-mode . org-fancy-priorities-mode)
;;   :config
;;   (setq org-fancy-priorities-list '((?A . "⚡")
;;                                     (?B . "⚡")
;;                                     (?C . "⚡"))))

(setq
 web-mode-markup-indent-offset 2
 web-mode-code-indent-offset 2
 web-mode-css-indent-offset 2
 org-agenda-skip-scheduled-if-done t
 org-agenda-skip-deadline-if-done  t
 org-priority-faces '((65 :foreground "#e45649")
                      (66 :foreground "#da8548")
                      (67 :foreground "#0098dd"))
 mac-command-modifier 'meta
 js-indent-level 2
 json-reformat:indent-width 2
 css-indent-offset 2
 projectile-project-search-path '("~/Documents/Kode/")
 org-ellipsis " ▾ ")


;; start Pipenv
;; (use-package! pipenv
  ;; :hook (python-mode . pipenv-activate))
