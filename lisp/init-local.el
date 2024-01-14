;;; local.el

(require-package 'lsp-mode)
(require-package 'lsp-ui)
(require-package 'iedit)

(setq lsp-ui-doc-enable nil)
(require-package 'helm-lsp)
(require-package 'treemacs)
(require-package 'yasnippet)
(require-package 'yasnippet-snippets)

;;(require-package 'web-mode)
(require-package 'emmet-mode)
;;(require-package 'vue-mode)
(require-package 'yapfify)
(require-package 'prettier)
(require-package 'elpy)

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
(setq lsp-keymap-prefix "C-c l")
(add-hook 'lsp-mode 'lsp-enable-which-key-integration)

;;; python config
;; pip install -U 'python-lsp-server[all]'

(add-hook 'python-mode-hook #'lsp-deferred)
(setq lsp-pylsp-plugins-flake8-enabled nil)
(setq lsp-pyls-plugins-flake8-enabled nil)
(setq lsp-pyls-plugins-pycodestyle-enabled t)
(setq lsp-pylsp-plugins-pydocstyle-enabled t)
(setq lsp-pylsp-plugins-pylint-enabled nil)
(setq lsp-pyls-plugins-pylint-enabled t)

(add-hook 'python-mode-hook 'yapf-mode)
(add-hook 'python-mode-hook 'yas-minor-mode)

;;; html config

(add-hook 'html-mode-hook #'lsp-deferred)
(add-hook 'html-mode-hook 'emmet-mode)
;; (add-hook 'html-mode-hook 'web-mode)
(add-hook 'html-model-hook 'prettier-mode)
;;; css config

(add-hook 'css-mode-hook #'lsp-deferred)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'yas-minor-mode)
(add-hook 'css-mode-hook 'prettier-mode)
(add-hook 'scss-mode #'lsp-deferred)

;;; typescript/javascript config
(add-hook 'typescript-mode-hook #'lsp-deferred)
(add-hook 'typescript-mode-hook 'prettier-mode)
(add-hook 'typescript-mode-hook 'yas-minor-mode)

(add-hook 'js-mode #'lsp-deferred)
(add-hook 'js-mode 'prettier-mode)
(add-hook 'js-mode 'yas-monir-mode)
;; (add-hook 'vue-mode 'prettier-mode)
;; (add-hook 'vue-mode 'yas-minor-mode)
;; (add-hook 'vue-mode #'lsp-deferred)
;; (add-hook 'vue-mode 'emmet-mode)

;;; html config
;;; m-x lsp-install-server emmet-ls
;;; m-x lsp-install-server html-ls
;;; npm install -g emmet-ls  vscode-html-languageserver-bin

;;; Angular config
;;; npm install -g @angular/language-service@next @angular/language-server

;;; vue config
;;; npm install -g @volar/server
;;; M-x lsp-install-server volar-api

;;; css/less/sass/scss config
;;; m-x lsp-install-server css-ls
;;; npm install -g vscode-css-languageserver-bin

;;; typescript config
;;; m-x lsp-install-server ts-ls
;;; npm install -g typescript-language-server typescript

;;; json config
;;; m-x lsp-install-server json-ls
;;; npm install -g vscode-json-languageserver

;;; yaml config
;;; m-x lsp-install-server yamlls
;;; npm install -g yaml-language-server

;;; Rust config
;; lsp rust
;; rustup update
;; rustup component add rls rust-analysis rust-src

;;; go config
;; lsp go
;; go install golang.org/x/tools/gopls@latest


;;; bash config
;; M-x lsp-install-server bash-ls
;; npm i -g bash-language-server

;;; Dockerfile config
;; m-x lsp-install-server dockerfile-ls
;; npm install -g dockerfile-language-server-nodejs


;;; sql config
;; go install github.com/lighttiger2505/sqls@latest
;; (add-hook 'sql-mode-hook 'lsp)
;; (setq lsp-sqls-workspace-config-path nil)
;; (setq lsp-sqls-connections
;;       '(((driver . "mysql") (dataSourceName . "yyoncho:local@tcp(localhost:3306)/foo"))
;;         ((driver . "mssql") (dataSourceName . "Server=localhost;Database=sammy;User Id=yyoncho;Password=hunter2;"))
;;         ((driver . "postgresql") (dataSourceName . "host=127.0.0.1 port=5432 user=yyoncho password=local dbname=sammy sslmode=disable"))))

(require-package 'spacemacs-theme)
(require-package 'ob-mongo)
(require-package 'ob-rust)
(require-package 'markdown-mode)
(require-package 'ob-restclient)
(require-package 'doom-themes)

(setq custom-safe-themes t)
(load-theme 'doom-one)


;; use org-bullets-mode for utf8 symbols as org bullets
(require-package 'org-bullets)
;; make available "org-bullet-face" such that I can control the font size individually
(setq org-bullets-face-name (quote org-bullet-face))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
;; (setq org-bullets-bullet-list '("✙" "♱" "♰" "☥" "✞" "✟" "✝" "†" "✠" "✚" "✜" "✛" "✢" "✣" "✤" "✥"))
(eval-after-load "org"
  '(require 'ox-md nil t))

;;;;;; org 源码前面不加空格
;;;(setq org-src-preserve-indentation t)

;;; org 中生成图片时自动打开行内图片显示
;;; display/update images in the buffer after I evaluate
;;;(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

;;; org mode 默认只显示一级标题
(setq org-startup-folded t)

;;; org mode C-c C-j  使用 n,p,q 快捷键移动到特定标题
(setq org-goto-auto-isearch nil)
(setq org-default-notes-file "~/projects/notes/TODO/capture.org")
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'electric-indent-local-mode nil)
(setq org-startup-indented t)
(setq org-babel-check-confirm-evaluate nil)
(setq org-confirm-babel-evaluate nil)
(setq org-html-htmlize-output-type 'css)
;;; emacs app 表格中文不对齐问题的解决
;;; https://github.com/be5invis/Sarasa-Gothic 下载字体 安装 Sarasa Mono Slab SC
;;; M-x customize-facs RET org-table
;;; 字体设置 Sarasa Mono Slab SC
(set-face-attribute 'default nil :font "PT Mono" :height 170)

;;; org-mode 下 python 运行报编码错误，加上 :preamble "# -*- coding: utf-8 -*-"


(setq image-types  '(png gif tiff jpeg xpm xbm pbm webp))

(imagemagick-register-types)
;;  主题设置
(defun light ()
  "Activate a light color theme."
  (interactive)
  (disable-theme 'doom-one)
  (load-theme 'doom-one-light)
  )

(defun dark ()
  "Activate a dark color theme."
  (interactive)
  (disable-theme 'doom-one-light)
  (load-theme 'doom-one)
  )

(global-hl-line-mode)
(menu-bar-mode -1)
(global-visual-line-mode 1)
(global-display-line-numbers-mode 0)
(display-line-numbers-mode t)

;;; 图形化界面 yank 乱码
(setenv "LANG" "en_US.UTF-8")


(setq projectile-project-search-path '("~/projects/"))

;;;(setq markdown-fontify-code-blocks-natively t)

;;; <s org mode tab complete
(require 'org-tempo)

(setq user-full-name "Mering Gao")
(setq user-email-address "canhuayin@gmail.com")
(setq user-mail-address "canhuayin@gmail.com")
(setq user-login-name "Mering Gao")

;;(add-to-list 'org-export-filter-body-functions 'my-org-export-body-append-js)
;;  导出网页时,哪些图片类型作为 inline image
(setq org-html-inline-image-rules '(("file" . #1="\\(?:\\.\\(?:gif\\|webp\\|\\(?:jpe?\\|pn\\|sv\\)g\\)\\)")
                                    ("http" . #1#)
                                    ("https" . #1#)))
(setq org-export-default-inline-image-rule '(("file" . "\\.\\(gif\\|webp\\|jp\\(?:e?g\\)\\|p\\(?:bm\\|gm\\|ng\\|pm\\)\\|tiff?\\|x\\(?:[bp]m\\)\\)\\'")))



(defun copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
(provide 'init-local)
