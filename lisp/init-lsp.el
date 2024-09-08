(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'lsp-treemacs)

(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-eldoc-render-all t)
(setq lsp-idle-delay 0.6)
(setq lsp-inlay-hint-enable t)


;; Enable inline hints for variable types
(setq lsp-lens-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-show-code-actions t)

;; Additional configuration for inline hints
(setq lsp-ui-sideline-show-symbol t)
(setq lsp-ui-sideline-show-hover t)
(setq lsp-ui-sideline-delay 0.05)
(setq lsp-ui-sideline-ignore-duplicate t)


(setq company-minimum-prefix-length 1 company-idle-delay 0.5) ;; default is 0.2

(require-package 'yasnippet)
(require-package 'yasnippet-snippets)
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'text-mode-hook 'yas-minor-mode)

(defun company-yasnippet-or-completion ()
  (interactive)
  (or (do-yas-expand)
      (company-complete-common)))

(defun check-expansion ()
  (save-excursion
    (if (looking-at "\\_>") t
      (backward-char 1)
      (if (looking-at "\\.") t
        (backward-char 1)
        (if (looking-at "::") t nil)))))
(defun do-yas-expand ()
  (let ((yas/fallback-behavior 'return-nil))
    (yas/expand)))

(defun tab-indent-or-complete ()
  (interactive)
  (if (minibufferp)
      (minibuffer-complete)
    (if (or (not yas/minor-mode)
            (null (do-yas-expand)))
        (if (check-expansion)
            (company-complete-common)
          (indent-for-tab-command)))))

(provide 'init-lsp)
