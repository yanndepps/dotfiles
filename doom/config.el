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
;; (setq processing-location "/usr/local/bin/processing-java")
;; (setq processing-application-dir "/Applications/Processing.app")
;; (setq processing-sketchbook-dir "~/Documents/Processing")

;; SuperCollider
;; (add-to-list 'load-path "/Users/yanndepps/scsources/scel/el")
;; (require 'sclang)
;; (setenv "PATH" (concat (getenv "PATH") ":/Applications/SuperCollider.app/Contents/MacOS"))
;; (setq exec-path (append exec-path '("/Applications/SuperCollider.app"  "/Applications/SuperCollider.app/Contents/MacOS")))

;; TidalCycles
;; (setq load-path (cons "~/tidal/" load-path))
;; (setq load-path (cons "~/tidal" load-path))
;; (setq tidal-interpreter "/usr/local/bin/ghci")

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
;; (load! "+ranger") ;; file manager stuff

;; Org stuffs
(after! org
  (setq org-bullets-bullet-list '("∵")))

;; (def-package! org-super-agenda
;;   :after org-agenda
;;   :init
;;   (setq org-super-agenda-groups '((:name "Today"
;;                                          :time-grid t
;;                                          :scheduled today)
;;                                   (:name "Due today"
;;                                          :deadline today)
;;                                   (:name "Important"
;;                                          :priority "A")
;;                                   (:name "Overdue"
;;                                          :deadline past)
;;                                   (:name "Due soon"
;;                                          :deadline future)
;;                                   (:name "Big Outcomes"
;;                                          :tag "bo")))
;;   :config
;;   (org-super-agenda-mode))



;; (def-package! org-fancy-priorities
;;   :hook (org-mode . org-fancy-priorities-mode)
;;   :config
;;   (setq org-fancy-priorities-list '((?A . "⚡")
;;                                     (?B . "⚡")
;;                                     (?C . "⚡"))))

(setq
 ;; web-mode-markup-indent-offset 2
 ;; web-mode-code-indent-offset 2
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

;; Treemacs
(setq treemacs-position 'right)

(setq display-line-numbers-type 'relative)

(setq prettify-symbols-unprettify-at-point 'right-edge)

;; JetBrains Mono Ligatures
(defun jetbrains-ligature-mode--make-alist (list)
   "Generate prettify-symbols alist from LIST."
   (let ((idx -1))
     (mapcar
      (lambda (s)
        (setq idx (1+ idx))
        (if s
            (let* ((code (+ #X10001 idx))
                   (width (string-width s))
                   (prefix ())
                   (suffix '(?\s (Br . Br)))
                   (n 1))
              (while (< n width)
                (setq prefix (append prefix '(?\s (Br . Bl))))
                (setq n (1+ n)))
              (cons s (append prefix suffix (list (decode-char 'ucs code)))))))
      list)))

(defconst jetbrains-ligature-mode--ligatures
   '("-->" "//" "/**" "/*" "*/" "<!--" ":=" "->>" "<<-" "->" "<-"
     "<=>" "==" "!=" "<=" ">=" "=:=" "!==" "&&" "||" "..." ".."
     "|||" "///" "&&&" "===" "++" "--" "=>" "|>" "<|" "||>" "<||"
     "|||>" "<|||" ">>" "<<" "::=" "|]" "[|" "{|" "|}"
     "[<" ">]" ":?>" ":?" "/=" "[||]" "!!" "?:" "?." "::"
     "+++" "??" "###" "##" ":::" "####" ".?" "?=" "=!=" "<|>"
     "<:" ":<" ":>" ">:" "<>" "***" ";;" "/==" ".=" ".-" "__"
     "=/=" "<-<" "<<<" ">>>" "<=<" "<<=" "<==" "<==>" "==>" "=>>"
     ">=>" ">>=" ">>-" ">-" "<~>" "-<" "-<<" "=<<" "---" "<-|"
     "<=|" "/\\" "\\/" "|=>" "|~>" "<~~" "<~" "~~" "~~>" "~>"
     "<$>" "<$" "$>" "<+>" "<+" "+>" "<*>" "<*" "*>" "</>" "</" "/>"
     "<->" "..<" "~=" "~-" "-~" "~@" "^=" "-|" "_|_" "|-" "||-"
     "|=" "||=" "#{" "#[" "]#" "#(" "#?" "#_" "#_(" "#:" "#!" "#="
     "&="))

(dolist (pat jetbrains-ligature-mode--ligatures)
  (set-char-table-range composition-function-table
                      (aref pat 0)
                      (nconc (char-table-range composition-function-table (aref pat 0))
                             (list (vector (regexp-quote pat)
                                           0
                                    'compose-gstring-for-graphic)))))


(defvar jetbrains-ligature-mode--old-prettify-alist)

(defun jetbrains-ligature-mode--enable ()
    "Enable JetBrains Mono ligatures in current buffer."
    (setq-local jetbrains-ligature-mode--old-prettify-alist prettify-symbols-alist)
       (setq-local prettify-symbols-alist (append (jetbrains-ligature-mode--make-alist jetbrains-ligature-mode--ligatures) jetbrains-ligature-mode--old-prettify-alist))
       (prettify-symbols-mode t))

(defun jetbrains-ligature-mode--disable ()
    "Disable JetBrains Mono ligatures in current buffer."
    (setq-local prettify-symbols-alist jetbrains-ligature-mode--old-prettify-alist)
    (prettify-symbols-mode -1))

(define-minor-mode jetbrains-ligature-mode
    "JetBrains Mono ligatures minor mode"
    :lighter " JetBrains Mono"
    (setq-local prettify-symbols-unprettify-at-point 'right-edge)
    (if jetbrains-ligature-mode
        (jetbrains-ligature-mode--enable)
      (jetbrains-ligature-mode--disable)))

(defun jetbrains-ligature-mode--setup ()
    "Setup JetBrains Mono Symbols"
    (set-fontset-font t '(#X10001 . #X1009c) "JetBrains Mono"))

(provide 'jetbrains-ligature-mode)
;; END
