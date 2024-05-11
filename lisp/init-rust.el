;;; init-rust.el --- Support for the Rust language -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;;; local.el

(require-package 'rustic)
(setq rustic-format-on-save nil)
(setq rustic-format-trigger 'on-save)
(defun rk/rustic-mode-hook () (when buffer-file-name (setq-local buffer-save-without-query t))
       (add-hook 'before-save-hook 'lsp-format-buffer nil t))
(add-hook 'rustic-mode-hook 'rk/rustic-mode-hook)

(setq lsp-rust-analyzer-binding-mode-hints nil)
(setq lsp-rust-analyzer-closure-return-type-hints t)
(setq lsp-rust-analyzer-cargo-watch-command "clippy")
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "always")
(setq lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial")
(setq lsp-rust-analyzer-display-chaining-hints t)
(setq lsp-rust-analyzer-display-lifetime-elision-hints-use-parameter-names nil)
(setq lsp-rust-analyzer-display-closure-return-type-hints t)
(setq lsp-rust-analyzer-display-parameter-hints nil)
(setq lsp-rust-analyzer-display-reborrow-hints nil)
(setq lsp-ui-sideline-show-diagnostics nil)

;; (use-package dap-mode
;;   :ensure
;;   :config
;;   (dap-ui-mode)
;;   (dap-ui-controls-mode 1)
;;   (require 'dap-lldb)
;;   (require 'dap-gdb-lldb)
;;   ;; installs .extension/vscode
;;   (dap-gdb-lldb-setup)
;;   (dap-register-debug-template
;;    "Rust::LLDB Run Configuration"
;;    (list :type "lldb"
;;          :request "launch"
;;          :name "LLDB::Run"
;;          :gdbpath "rust-lldb"
;;          :target nil
;;          :cwd nil)))

(provide 'init-rust) 

;;; init-rust.el ends here
