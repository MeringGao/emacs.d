(require-package 'ivy)
(require-package 'counsel)
(ivy-mode 1)
(counsel-mode 1)
(global-set-key (kbd "M-x") 'counsel-M-x)
(savehist-mode 1)
(setq savehist-additional-variables '(extended-command-history))

(require-package 'counsel-projectile)
(counsel-projectile-mode 1)
(require-package 'evil)
(require-package 'evil-multiedit)

(require-package 'evil-collection)

(require-package 'evil-leader)
(setq evil-want-keybinding nil)
(setq evil-disable-insert-state-bindings t)

(evil-collection-init)
(evil-mode 1)

(global-evil-leader-mode)

(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
  "0" 'treemacs
  "1" 'delete-other-windows
  "2"  'split-window-below
  "3" 'split-window-right
  "4" 'delete-window
  "o" 'switch-window

  "pf1" 'projectile-find-file
  "pf3" 'projectile-find-file-other-window
  "pp" 'projectile-switch-project
  "ps" 'projectile-ripgrep
  "prs" 'projectile-replace
  "pre" 'projectile-replace-regexp

  "gs" 'magit
  "gb" 'magit-blame
  "gp" 'magit-pull

  "mgg" 'xref-find-definitions
  "mgb" 'xref-go-back
  "ma" 'lsp-execute-code-action
  "ml" 'lsp-mode
  "m=" 'lsp-format-buffer
  "mcp" 'flycheck-previous-error
  "mcn" 'flycheck-next-error
  "mcl" 'flycheck-list-errors

  "b1" 'find-file
  "b3" 'find-file-other-window
  "bb" 'switch-to-buffer
  "bd" 'kill-buffer
  "b4" 'kill-buffer-and-window
  "bi" 'ibuffer

  "dbd" 'dap-breakpoint-delete
  "dba" 'dap-breakpoint-add
  "dd"  'dap-debug
  "dn"  'dap-next
  "dsi" 'dap-step-in
  "dso" 'dap-step-out
  "dc"  'dap-continue
  "dx" 'dap-disconnect
  "der" 'dap-eval-region
  "dep" 'dap-eval-thing-at-point
  "dee" 'dap-eval
  )


;;; treemacs 中绑定特殊按键
(evil-define-key 'normal treemacs-mode-map
  (kbd "TAB") 'treemacs-TAB-action
  (kbd "RET") 'treemacs-RET-action
  "cf" 'treemacs-create-file
  "cd" 'treemacs-create-dir
  "R"  'treemacs-rename-file
  "df" 'treemacs-delete-file
  "oh" 'treemacs-visit-node-horizontal-split
  "yf" 'treemacs-copy-file
  "g" 'treemacs-refresh
  )

;;; treemacs 中绑定特殊按键
(evil-define-key 'normal org-mode-map
  (kbd "TAB") 'org-cycle
  )

(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode 1)
(setq history-length 1000)
(setq savehist-additional-variables '(ivy-history))

(provide 'init-evil)
