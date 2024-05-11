;;; init-recentf.el --- Settings for tracking recent files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 10
 recentf-exclude `("/tmp/" "/ssh:" ,(concat package-user-dir "/.*-autoloads\\.el\\'")))


(provide 'init-recentf)
;;; init-recentf.el ends here
