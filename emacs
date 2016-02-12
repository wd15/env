  ;; custom-set-variables was added by Custom.
(custom-set-variables
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(add-to-list 'load-path "~/.emacs.d/lisp/")
(setq py-install-directory "~/.emacs.d")


(when (load "flymake" t)
         (defun flymake-pyflakes-init ()
           (let* ((temp-file (flymake-init-create-temp-buffer-copy
                              'flymake-create-temp-inplace))
              (local-file (file-relative-name
                           temp-file
                           (file-name-directory buffer-file-name))))
             (list "pyflakes" (list local-file))))

         (add-to-list 'flymake-allowed-file-name-masks
                  '("\\.py\\'" flymake-pyflakes-init)))

   (add-hook 'find-file-hook 'flymake-find-file-hook)

(put 'scroll-left 'disabled nil)
(put 'set-goal-column 'disabled nil)

(add-to-list 'load-path "~/.elisp")
(require 'cython-mode)
(add-to-list 'auto-mode-alist '("\\.pyx?\\'" . cython-mode))

(require 'ido)

(defun shift-text (distance)
  (if (use-region-p)
      (let ((mark (mark)))
        (save-excursion
          (indent-rigidly (region-beginning)
                          (region-end)
                          distance)
          (push-mark mark t t)
          (setq deactivate-mark nil)))
    (indent-rigidly (line-beginning-position)
                    (line-end-position)
                    distance)))

(defun shift-right (count)
  (interactive "p")
  (shift-text count))

(defun shift-left (count)
  (interactive "p")
  (shift-text (- count)))

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;;(add-to-list 'load-path "~/.emacs.d/")

;;(require 'python)


(setq py-install-directory "~/.emacs.d")
(require 'python-mode)
(setq py-shell-name "ipython")

;;(require 'cython-mode)

;;(require 'ipython)

;;(require 'anything) (require 'anything-ipython)
;;  (when (require 'anything-show-completion nil t)
;;   (use-anything-show-completion 'anything-ipython-complete
;;                                   '(length initial-pattern)))

(autoload 'autopair-global-mode "autopair" nil t)
  (autopair-global-mode)
  (add-hook 'lisp-mode-hook #'(lambda () (setq autopair-dont-activate t)))

(add-hook 'python-mode-hook
          #'(lambda () (push '(?' . ?')
                              (getf autopair-extra-pairs :code))
 (setq autopair-handle-action-fns
      (list #'autopair-default-handle-action
            #'autopair-python-triple-quote-action))))

(require 'python-pep8)
(require 'python-pylint)

;;(add-hook 'before-save-hook 'delete-trailing-whitespace)

(define-key global-map "\C-l" 'goto-line)
(define-key global-map "\M-/" 'hippie-expand)

;;(set-frame-parameter (selected-frame) 'alpha '(<active> [<inactive>]))
;;(set-frame-parameter (selected-frame) 'alpha '(85 50))
;;(add-to-list 'default-frame-alist '(alpha 85 50))


;;(define-key global-map "\C-j" 'comment-region)
;;(define-key global-map "\C-o" 'uncomment-region)
;;(global-set-key (kbd "C-m") 'comment-or-uncomment-region)
(define-key global-map "\C-t" 'comment-or-uncomment-region)

(require 'tramp)
(setq tramp-default-method "scp")

(setq emerge-diff-options "--ignore-all-space")

(require 'cl)
(require 'flyspell)
(require 'git-commit)
(add-hook 'git-commit-mode-hook 'flyspell-mode-on)

(add-to-list 'load-path "~/.emacs.d/emacs-color-theme-solarized")
(if
    (equal 0 (string-match "^24" emacs-version))
    ;; it's emacs24, so use built-in theme 
    (require 'solarized-dark-theme)
  ;; it's NOT emacs24, so use color-theme
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (require 'color-theme-solarized)
    (color-theme-solarized-dark)))

;; (custom-set-variables
;;  '(initial-frame-alist (quote ((fullscreen . maximized)))))

(menu-bar-mode -1)
(tool-bar-mode -1)

(global-linum-mode t)

(fset 'insert-debug
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("import ipdb; ipdb.set_trace(" 0 "%d")) arg)))

(global-set-key (kbd "C-o") 'insert-debug)

(setq-default indent-tabs-mode nil)

(add-hook 'python-mode-hook 
  (lambda () (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

(add-hook 'before-save-hook 'delete-trailing-whitespace)



