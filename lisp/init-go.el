(require-package 'ob-go)
(require-package 'go-mode)

(add-hook 'go-mode-hook
          (lambda ()
            (setq indent-tabs-mode nil)
            (setq tab-width 4)
            )
          )
(add-hook 'before-save-hook 'go-fmt-before-save)
(defun my/gofmt-and-indent ()
  "run gofmt and then indent the buffer"
  (interactive)
  (gofmt)
  (untabify (point-min) (point-max)))

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'my/gofmt-and-indent nil 'local)))
(add-hook 'go-mode-hook 'lsp-mode)
(add-hook 'go-mode-hook 'yas-minor-mode)

(provide 'init-go)
