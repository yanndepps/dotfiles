;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-nord-light t)
(load-theme 'doom-nord t)
;; (load-theme 'doom-nova t)

;; Some Defaults
(setq-default
 delete-by-moving-to-trash t                      ; Delete files to trash
 tab-width 4                                      ; Set width for tabs
 uniquify-buffer-name-style 'forward              ; Uniquify buffer names
 window-combination-resize t                      ; take new window space from all other windows (not just current)
 x-stretch-cursor t)                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      inhibit-compacting-font-caches t            ; When there are lots of glyphs, keep them in memory
      truncate-string-ellipsis "…")               ; Unicode ellispis are nicer than "...", and also save /precious/ space

(delete-selection-mode 1)                         ; Replace selection when inserting text
(display-time-mode 1)                             ; Enable time in the mode-line
(unless (equal "Battery status not available"
               (battery))
  (display-battery-mode 1))                       ; On laptops it's nice to know how much power you have
(global-subword-mode 1)                           ; Iterate through CamelCase words

;; Fullscreen
;; (if (eq initial-window-system 'x)                 ; if started by emacs command or desktop file
;;     (toggle-frame-maximized)
;;   (toggle-frame-fullscreen))

;; Windows
;; which buffer after split
(setq evil-vsplit-window-right t
      evil-split-window-below t)

;; now pull up ivy
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit)
  (+ivy/switch-buffer))

;; preview are nice
(setq +ivy-buffer-preview t)

;; LF UTF-8 being the default file encoding,
;; let's conditionally hide it
(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))

(add-hook 'after-change-major-mode-hook #'doom-modeline-conditional-buffer-encoding)

;; Nicer default buffer names
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")


;; Company
;; (after! company
;;   (setq company-idle-delay 0.5
;;         company-minimum-prefix-length 2)
;;   (setq company-show-numbers t)
;; (add-hook 'evil-normal-state-entry-hook #'company-abort)) ;; make aborting less annoying.

;; History
(setq-default history-length 1000)
(setq-default prescient-history-length 1000)

;; Alt key
(setq ns-alternate-modifier 'none)

;; Dark title bar
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist
             '(ns-appearance . dark))

(setq ns-use-proxy-icon nil)
(setq frame-title-format nil)

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 60))
(add-to-list 'default-frame-alist '(alpha 85 60))

;; Processing
;;(setq processing-location "/usr/local/bin/processing-java")
;;(setq processing-application-dir "/Applications/Processing.app")
;;(setq processing-sketchbook-dir "~/Documents/Processing")

;; SuperCollider
(add-to-list 'load-path "~/emacs/scel/")
(require 'sclang)

;; TidalCycles
;; (setq load-path (cons "~/tidal/" load-path))
;; (setq load-path (cons "~/tidal" load-path))
;; (setq tidal-interpreter "/usr/local/bin/ghci")

(doom-themes-treemacs-config)
(doom-themes-org-config)

;; Modules
(load! "+ui")
(ranger-override-dired-mode t)

;; Org
(setq org-directory "~/Documents/Kode/org"        ; let's put files here
      org-use-property-inheritance t              ; it's convenient to have properties inherited
      org-log-done 'time                          ; having the time a item is done sounds convininet
      org-list-allow-alphabetical t               ; have a. A. a) A) list bullets
      org-export-in-background t                  ; run export processes in external emacs process
      org-catch-invisible-edits 'smart            ; try not to accidently do weird stuff in invisible regions
      org-re-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")

;; Default Babel Headers
(setq org-babel-default-header-args '((:session . "none")
                                      (:results . "replace")
                                      (:exports . "code")
                                      (:cache . "no")
                                      (:noweb . "no")
                                      (:hlines . "no")
                                      (:tangle . "no")
                                      (:comments . "link")))

;; List bullet sequence
(setq org-list-demote-modify-bullet '(("+" . "-") ("-" . "+") ("*" . "+") ("1." . "a.")))

;; Super Agenda
(use-package! org-super-agenda
  :commands (org-super-agenda-mode))
(after! org-agenda
  (org-super-agenda-mode))

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100 ;; from testing this seems to be a good value
      org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("o" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :todo "TODAY"
                                :scheduled today
                                :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
                                 :todo "NEXT"
                                 :order 1)
                          (:name "Important"
                                 :tag "Important"
                                 :priority "A"
                                 :order 6)
                          (:name "Due Today"
                                 :deadline today
                                 :order 2)
                          (:name "Due Soon"
                                 :deadline future
                                 :order 8)
                          (:name "Overdue"
                                 :deadline past
                                 :face error
                                 :order 7)
                          (:name "Assignments"
                                 :tag "Assignment"
                                 :order 10)
                          (:name "Issues"
                                 :tag "Issue"
                                 :order 12)
                          (:name "Emacs"
                                 :tag "Emacs"
                                 :order 13)
                          (:name "Projects"
                                 :tag "Project"
                                 :order 14)
                          (:name "Research"
                                 :tag "Research"
                                 :order 15)
                          (:name "To read"
                                 :tag "Read"
                                 :order 30)
                          (:name "Waiting"
                                 :todo "WAITING"
                                 :order 20)
                          (:name "University"
                                 :tag "uni"
                                 :order 32)
                          (:name "Trivial"
                                 :priority<= "E"
                                 :tag ("Trivial" "Unimportant")
                                 :todo ("SOMEDAY" )
                                 :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))))

;; Symbols
(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
        org-superstar-prettify-item-bullets t ))
(after! org
  (setq org-ellipsis " ▾ "
        org-priority-highest ?A
        org-priority-lowest ?E
        org-priority-faces
        '((?A . 'all-the-icons-red)
          (?B . 'all-the-icons-orange)
          (?C . 'all-the-icons-yellow)
          (?D . 'all-the-icons-green)
          (?E . 'all-the-icons-blue))))

(add-hook 'org-mode-hook #'+org-pretty-mode)

(after! org
  (setq org-ellipsis " ▾ "
        org-priority-highest ?A
        org-priority-lowest ?E
        org-priority-faces
        '((?A . 'all-the-icons-red)
          (?B . 'all-the-icons-orange)
          (?C . 'all-the-icons-yellow)
          (?D . 'all-the-icons-green)
          (?E . 'all-the-icons-blue))))

;; Exporting
(after! org (setq org-export-headline-levels 5))

;; Ignore headings
(after! org
  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines)))

;; GFM
(eval-after-load "org"
  '(require 'ox-gfm nil t))

;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))


(setq projectile-project-search-path '("~/Documents/Kode/"))

(setq mac-command-modifier 'meta)

;; Treemacs
(setq treemacs-position 'right)

(setq display-line-numbers-type 'relative)

(setq prettify-symbols-unprettify-at-point 'right-edge)

;; Deft
(setq deft-directory "~/Documents/Kode/org/"
      deft-extensions '("org" "txt")
      deft-recursive t)

;; Org Journal
(setq org-journal-date-prefix "#+TITLE: "
      org-journal-time-prefix "* "
      org-journal-date-format "%a, %Y-%m-%d"
      org-journal-file-format "%Y-%m-%d.org")

;; Org Roam
(setq org-roam-directory "~/Documents/Kode/org/roam/")
;; END
