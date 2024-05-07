;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; local.el

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'iedit)

(setq lsp-ui-doc-enable nil)
(require-package 'helm-lsp)
(require-package 'treemacs)
(require-package 'yasnippet)
(require-package 'yasnippet-snippets)

(require-package 'rustic) 
(setq rustic-format-on-save nil)
(setq rustic-format-trigger 'on-save)
(defun rk/rustic-mode-hook () (when buffer-file-name (setq-local buffer-save-without-query t))
       (add-hook 'before-save-hook 'lsp-format-buffer nil t))
(add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)
(require-package 'lsp-mode)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-inlay-hint-enable t)
(setq lsp-rust-analyzer-binding-mode-hints nil)
(setq lsp-rust-analyzer-closure-return-type-hints t)
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
(setq lsp-eldoc-render-all t)
(setq lsp-idle-delay 0.6)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "always")
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
(setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-parameter-hints nil)
(setq lsp-rust-analyzer-display-reborrow-hints nil)
(setq lsp-ui-sideline-show-diagnostics nil)
(setq company-minimum-prefix-length 1 company-idle-delay 0.5) ;; default is 0.2
(add-hook 'prog-mode-hook 'yas-minor-mode)
(add-hook 'text-mode-hook 'yas-minor-mode)



(use-package exec-path-from-shell :ensure :init (exec-path-from-shell-initialize))
(use-package dap-mode
  :ensure
  :config
  (dap-ui-mode)
  (dap-ui-controls-mode 1)
  (require 'dap-lldb)
  (require 'dap-gdb-lldb)
  ;; installs .extension/vscode
  (dap-gdb-lldb-setup)
  (dap-register-debug-template
   "Rust::LLDB Run Configuration"
   (list :type "lldb"
         :request "launch"
         :name "LLDB::Run"
         :gdbpath "rust-lldb"
         :target nil
         :cwd nil)))

;; (defun company-yasnippet-or-completion ()
;;   (interactive)
;;   (or (do-yas-expand)
;;       (company-complete-common)))

;; (defun check-expansion ()
;;   (save-excursion
;;     (if (looking-at "\\_>") t
;;       (backward-char 1)
;;       (if (looking-at "\\.") t
;;         (backward-char 1)
;;         (if (looking-at "::") t nil)))))
;; (defun do-yas-expand ()
;;   (let ((yas/fallback-behavior 'return-nil))
;;     (yas/expand)))

;; (defun tab-indent-or-complete ()
;;   (interactive)
;;   (if (minibufferp)
;;       (minibuffer-complete)
;;     (if (or (not yas/minor-mode)
;;             (null (do-yas-expand)))
;;         (if (check-expansion)
;;             (company-complete-common)
;;           (indent-for-tab-command)))))

(provide 'init-rust) 

;;; init-rust.el ends here
