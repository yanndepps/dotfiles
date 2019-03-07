;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme
;; (load-theme 'doom-spacegrey t)
(load-theme 'doom-nord t)

;; Alt key
(setq ns-alternate-modifier 'none)

;; No title bar
;; (setq default-frame-alist '((undecorated . t)))

;; Dark title bar
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

(add-to-list 'default-frame-alist
             '(ns-appearance . dark))
;; Processing
(setq processing-location "/usr/local/bin/processing-java")
(setq processing-application-dir "/Applications/Processing.app")
(setq processing-sketchbook-dir "~/Documents/Processing")

;; SuperCollider
(add-to-list 'load-path "/Users/yanndepps/scsources/scel/el")
(require 'sclang)
(setenv "PATH" (concat (getenv "PATH") ":/Applications/SuperCollider.app/Contents/MacOS"))
(setq exec-path (append exec-path '("/Applications/SuperCollider.app"  "/Applications/SuperCollider.app/Contents/MacOS")))

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)
;; or for treemacs users
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Modules
(load! "+ui") ;; ui mods and ligature stuff
(load! "+ranger") ;; file manager stuff

;; Org setup
(after! org
  (setq org-agenda-files (list "~/org/work.org"
                               "~/org/notes.org"
                               "~/org/sosshit.org"
                               "~/org/home.org")))

;; LaTeX defaults
(with-eval-after-load 'ox-latex
                      (add-to-list 'org-latex-classes
                                   '("bjmarticle"
                                     "\\documentclass{article}
                                     \\usepackage[utf8]{inputenc}
                                     \\usepackage[T1]{fontenc}
                                     \\usepackage{graphicx}
                                     \\usepackage{longtable}
                                     \\usepackage{hyperref}
                                     \\usepackage{natbib}
                                     \\usepackage{amssymb}
                                     \\usepackage{amsmath}
                                     \\usepackage{geometry}
                                     \\geometry{a4paper,left=2.5cm,top=2cm,right=2.5cm,bottom=2cm,marginparsep=7pt, marginparwidth=.6in}"
                                     ("\\section{%s}" . "\\section*{%s}")
                                     ("\\subsection{%s}" . "\\subsection*{%s}")
                                     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                                     ("\\paragraph{%s}" . "\\paragraph*{%s}")
                                     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))


;; Tidal
(setq load-path (cons "~/tidal/" load-path))
(require 'tidal)
(setq tidal-interpreter "/usr/local/bin/ghci")
