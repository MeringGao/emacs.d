(require-package 'ob-go)
(require-package 'go-mode)

(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            )
          )
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer nil t)
  (add-hook 'before-save-hook #'lsp-organize-imports nil t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
(add-hook 'go-mode-hook 'lsp-deferred)
(add-hook 'go-mode-hook 'yas-minor-mode)
;; Configure gopls specific settings
(setq lsp-gopls-staticcheck t)
(setq lsp-gopls-go-diff t)
(setq lsp-gopls-codelens '((generate . t) (regenerate_cgo . t) (tidy . t) (upgrade_dependency . t) (vendor . t)))
(provide 'init-go)
