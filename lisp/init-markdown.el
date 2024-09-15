;;; init-markdown.el --- Markdown support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'markdown-mode)
  (add-auto-mode 'markdown-mode "\\.md\\.html\\'")
  (with-eval-after-load 'whitespace-cleanup-mode
    (add-to-list 'whitespace-cleanup-mode-ignore-modes 'markdown-mode)))

(require-package 'markdown-preview-mode)
(add-hook 'makrdown-mode-hook 'gfm-view-mode)
(provide 'init-markdown)
;;; init-markdown.el ends here
