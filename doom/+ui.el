;;;  -*- lexical-binding: t; -*-

;; Fonts
;; (setq doom-font (font-spec :family "Fira Code" :size 13))
;; (setq doom-font (font-spec :family "JetBrains Mono" :size 12))
;; (setq doom-big-font (font-spec :family "Fira Code" :size 16))
;; (setq doom-big-font (font-spec :family "JetBrains Mono" :size 14))
;; Dash highlighting
;; (after! dash (dash-enable-font-lock))
;; nov.el
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "JetBrains Mono"
                                           :size 12))
(add-hook 'nov-mode-hook 'my-nov-font-setup)
