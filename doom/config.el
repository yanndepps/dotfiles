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

;; Window title, just the buffer name + project folder
(setq frame-title-format
    '(""
      (:eval
       (if (s-contains-p org-roam-directory (or buffer-file-name ""))
           (replace-regexp-in-string ".*/[0-9]*-?" "🢔 " buffer-file-name)
         "%b"))
      (:eval
       (let ((project-name (projectile-project-name)))
         (unless (string= "-" project-name)
           (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; Do not add package src directories to projectile
(setq projectile-ignored-projects '("~/" "/tmp" "~/.emacs.d/.local/straight/repos/"))
(defun projectile-ignored-project-function (filepath)
  "Return t if FILEPATH is within any of `projectile-ignored-projects'"
  (or (mapcar (lambda (p) (s-starts-with-p p filepath)) projectile-ignored-projects)))


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
(set-frame-parameter (selected-frame) 'alpha '(85 60))
(add-to-list 'default-frame-alist '(alpha 85 60))

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

(doom-themes-treemacs-config)
(doom-themes-org-config)

;; Modules
(load! "+ui") ;; ui mods and ligature stuff
;; (load! "+ranger") ;; file manager stuff
(ranger-override-dired-mode t)

(setq org-superstar-headline-bullets-list '("◉" "○" "✸" "✿" "✤" "✜" "◆" "▶")
      org-superstar-prettify-item-bullets t )

;; (setq org-ellipsis "▼")

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


(setq org-directory "~/Documents/Kode/org/")

(setq projectile-project-search-path '("~/Documents/Kode/"))

(setq mac-command-modifier 'meta)

;; (setq
;;  web-mode-markup-indent-offset 2
;;  web-mode-code-indent-offset 2
;;  js-indent-level 2
;;  json-reformat:indent-width 2
;;  css-indent-offset 2
;;  )

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
