(with-eval-after-load 'treemacs

  (treemacs-resize-icons 0)
  (setq treemacs-indentation 1) ;; 尝试最小化缩进
  (setq treemacs-indentation-string "  ")
  (custom-set-faces
   '(treemacs-root-face ((t (:inherit font-lock-string-face :height 1.0))))
   '(treemacs-directory-face ((t (:inherit font-lock-function-name-face :height 1.0))))
   '(treemacs-file-face ((t (:inherit font-lock-type-face :height 1.0))))
   '(treemacs-tags-face ((t (:inherit font-lock-variable-name-face :height 1.0))))))

(provide 'init-treemacs)
