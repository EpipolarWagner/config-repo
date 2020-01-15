
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(safe-local-variable-values (quote ((TeX-master . t) (TeX-electric-sub-and-superscript) (TeX-brace-indent-level . 0)))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

 	

(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)



;; CUA Mode
(cua-mode t)
    (setq cua-auto-tabify-rectangles nil) ;; Don't tabify after rectangle commands
    (transient-mark-mode 1) ;; No region when it is not highlighted
    (setq cua-keep-region-after-copy t) ;; Standard Windows behaviour
;;last three are are optinal

;;highlight matching parenthesis
(show-paren-mode 1)

;; auto fill columns
 (add-hook 'text-mode-hook 'turn-on-auto-fill)

;; coumn length
(setq-default fill-column 90) 

;; don't copy \ in line wrapping
(set-display-table-slot standard-display-table 'wrap ?\ )


;;Singular start
;;(setq load-path (cons "/usr/site-local/share/singular/emacs" load-path))


;;Singular start
(setq load-path (cons "/usr/share/singular/emacs" load-path))
(autoload 'singular "singular"
  "Start Singular using default values." t)
(autoload 'singular-other "singular"
  "Ask for arguments and start Singular." t)

;; turn on c++-mode for files ending in ".sing" and ".lib"
(setq auto-mode-alist (cons '("\\.sing\\'" . c++-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.lib\\'" .  c++-mode) auto-mode-alist))
;; turn-on fontification for c++-mode
(add-hook 'c++-mode-hook
         (function (lambda () (font-lock-mode 1))))
;; turn on aut-new line and hungry-delete
(add-hook 'c++-mode-hook
          (function (lambda () (c-toggle-auto-hungry-state 1))))
;; a handy function for customization
(defun customize-face-at-point ()
  "Customize face which point is at."
  (interactive)
  (let ((face (get-text-property (point) 'face)))
    (if face
        (customize-face face)
      (message "No face defined at point"))))

;; ;;octave mode
;; (autoload 'octave-mode "octave-mode" nil t)
;; (setq auto-mode-alist(cons '("\\.m$" . octave-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.m\\'" .  octave-mode) auto-mode-alist))

;; ;;matlab octave mode;;
;; (autoload 'matlab-mode "ocatve" "Matlab Editing Mode" t)
;; (add-to-list
;;  'auto-mode-alist
;;  '("\\.m$" . matlab-mode))
;; (setq matlab-indent-function t)
;; (setq matlab-shell-command "octave")

;; powerline mode
(add-to-list 'load-path "~/.emacs.d/emacs-powerline")
(require 'powerline)
(require 'cl)
;;(setq powerline-arrow-shape 'curve)   ;; give your mode-line curves
(custom-set-faces
  '(mode-line ((t (:foreground "#030303" :background "#bdbdbd" :box nil))))
  '(mode-line-inactive ((t (:foreground "#f9f9f9" :background "#666666" :box nil)))))
 

;;dead key bug
(require 'iso-transl)


;; ;;e1-get
;; (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; (unless (require 'el-get nil 'noerror)
;;   (with-current-buffer
;;       (url-retrieve-synchronously
;;        "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
;;     (goto-char (point-max))
;;     (eval-print-last-sexp)))

;; (add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
;; (el-get 'sync)


;;customize theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/moe-theme.el/")
;; (add-to-list 'load-path "~/.emacs.d/moe-theme.el/")
;;     (require 'moe-theme)
;;     (moe-dark)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/badger-theme")
;; (load-theme 'badger t)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;   '(default ((t (:family "Inconsolata")))))

;; Macaulay 2 start
(load "~/.emacs-Macaulay2" t)
;; Macaulay 2 end
