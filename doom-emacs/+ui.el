;;; +ui.el --- description -*- lexical-binding: t; -*-

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(setq ns-use-proxy-icon nil)

(setq doom-font (font-spec :family "Hasklig" :size 13))
(setq doom-variable-pitch-font (font-spec :family "Hasklig"))
(setq doom-unicode-font (font-spec :family "Hasklig"))
(setq doom-big-font (font-spec :family "Hasklig" :size 18))

(setq doom-theme 'doom-nord)

; (add-variable-watcher
;  'posframe--frame
;  (lambda (_sym frame op _where)
;    (when (and (eq op 'set) frame)
;      (with-selected-frame frame
;        (setq-local whitespace-style nil)))))

(after! neotree
  (setq doom-neotree-enable-variable-pitch nil)
  (setq neo-autorefresh t))

(def-package! resize-window
  :commands  (resize-window))

(provide '+ui)

;;; +ui.el ends here
