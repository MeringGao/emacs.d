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
(add-hook 'go-mode-hook 'display-line-numbers-mode)
;; Configure gopls specific settings
(setq lsp-gopls-staticcheck t)
(setq lsp-gopls-go-diff t)
(setq lsp-gopls-codelens '((generate . t) (regenerate_cgo . t) (tidy . t) (upgrade_dependency . t) (vendor . t)))

(use-package dap-mode
  :ensure t
  :after lsp-mode
  :config
  (dap-auto-configure-mode)
  (require 'dap-dlv-go)
  )


;; (use-package dap-mode
;;   :ensure t
;;   :config
;;   (require 'dap-go)
;;   (dap-go-setup)
;;   )

;; (setq lsp-gopls-server-path "gopls")
;; (setq dap-go-debug-program `("dlv" "dap" "-l" "127.0.0.1:38697"))
(provide 'init-go)
