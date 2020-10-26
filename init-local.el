;; paste insideout
(setq x-select-enable-clipboard t)

;; for org-mode wrap words
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; pyx as python mode
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\.ppl\\'" . python-mode))

; EVIL
(require-package 'evil)
(evil-mode 1)

;;; The following makes you lose vim commands, but gives you back basic emacs
;;; commands, like C-y to paste in insert mode or C-r to search backward:
(define-key evil-insert-state-map "\C-y" 'yank)
(define-key evil-visual-state-map "\C-y" 'yank)
(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-normal-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-w" 'evil-delete)
(define-key evil-visual-state-map "\C-w" 'evil-delete)
(define-key evil-insert-state-map "\C-r" 'search-backward)

;EIN
(require-package 'ein)
;(require 'ein-loaddefs)
(maybe-require-package 'ein-notebook)
;(require 'ein-subpackages)

(electric-indent-mode 1)

                                        ; Grammarly
                                        ; Works only on Mac with grammarly installed

(unwind-protect
    (let ((debug-on-error nil))
      (with-demoted-errors
          (message "Try to load grammarly scripts")
        (load-file "~/.emacs.d/lisp/grammarly/emacs-grammarly.el")
        (global-set-key (kbd "C-c C-g") 'grammarly-save-region-and-run)
        (message "Grammarly load.")))
  (message "All done!"))

(provide 'init-local)
