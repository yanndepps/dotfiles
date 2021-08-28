;;;  -*- lexical-binding: t; -*-
;; nov.el
(defun my-nov-font-setup ()
  (face-remap-add-relative 'variable-pitch :family "JetBrains Mono"
                                           :size 12))
(add-hook 'nov-mode-hook 'my-nov-font-setup)
