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

;;(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)
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

(require-package 'protobuf-mode)
(require-package 'clang-format+)

(add-hook 'protobuf-mode-hook 'lsp-deferred)
(add-hook 'protobuf-mode-hook 'company-mode)
;; go install github.com/bufbuild/buf-language-server/cmd/bufls@latest
;; go install github.com/bufbuild/buf/cmd/buf@latest
;; go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
;; go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
;; go get golang.org/x/tools/cmd/goimports@latest
;; sudo yum install protobuf-compiler
;;
;; 还需要安装 clang-format
;; .clang-format 文件内容
;; BasedOnStyle: Google
;; IndentWidth: 2
;; ColumnLimit: 0
;; BreakBeforeBraces: Allman
;; AllowShortFunctionsOnASingleLine: None
;; AlignConsecutiveAssignments: true
;; AlignConsecutiveDeclarations: true
;; AlignTrailingComments: true

(use-package clang-format
  :ensure t
  :hook (protobuf-mode . (lambda ()
                           (add-hook 'before-save-hook 'clang-format-buffer nil 'local))))

(setq clang-format-style-option "file")

;; 这里是为了方便在 org-mode 下编写 go 代码
;; go install github.com/mdempsky/gocode@latest
(require-package 'company-go)
(with-eval-after-load 'go-mode
  (require 'company-go)
  (add-hook 'go-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends) '(company-go))
              (company-mode))))

(defun gofmt-and-untabify-buffer ()
  "Format the entire buffer with gofmt and then untabify."
  (interactive)
  (when (eq major-mode 'go-mode)
    (let ((buf (current-buffer)))
      ;; Run gofmt
      (shell-command-on-region (point-min) (point-max) "gofmt" buf t)
      ;; Untabify the buffer
      (untabify (point-min) (point-max)))))

(global-set-key (kbd "C-c g") 'gofmt-and-untabify-buffer)

(provide 'init-go)
