;;; private/yanndepps/init.el -*- lexical-binding: t; -*-
(load! +ui)
;; Mac kbd setup
;; ----------------------------------------------------------
(setq default-input-method "MacOSX")
(setq mac-command-modifier 'meta
      mac-option-modifier nil
      mac-allow-anti-aliasing t
      mac-command-key-is-meta t)
;; extempore mode
;; ----------------------------------------------------------
(use-package extempore-mode
:ensure t
)
;; processing mode
;; ----------------------------------------------------------
(use-package processing-mode
  :ensure t
  :init
  (add-hook 'processing-mode-hook 'processing-mode-init))

(setq processing-location "/usr/local/bin/processing-java")
(setq processing-application-dir "/Applications/Processing.app")
(setq processing-sketchbook-dir "~/Documents/Processing")

;; LAMBDA DISPLAY AS SYMBOLS
;; ----------------------------------------------------------

(global-prettify-symbols-mode 1)
(setq prettify-symbols-alist '(("lambda" . 955)))

(defun my-add-pretty-lambda ()
  "make some word or string show as pretty Unicode symbols"
  (setq prettify-symbols-alist
        '(
          ("lambda" . 955) ; λ
          ("->" . 8594)    ; →
          ("=>" . 8658)    ; ⇒
          ("map" . 8614)   ; ↦
          )))

(add-hook 'clojure-mode-hook 'my-add-pretty-lambda)
(add-hook 'extempore-mode-hook 'my-add-pretty-lambda)

;; Tidal
;; ----------------------------------------------------------
(setq load-path (cons "~/tidal/" load-path))
(require 'tidal)
(setq tidal-interpreter "/usr/local/bin/ghci")

;; init.el ends here !
