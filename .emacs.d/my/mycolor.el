(require 'color-theme)
(color-theme-initialize) 

(defun color-theme-dark-mde ()
  "Color theme by Dmitry Marienko, created 2013-mar-02."
  (interactive)
  (color-theme-install
   '(color-theme-dark-mde
     ((background-color . "gray10")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "orange")
      (foreground-color . "#2BB22B") ;;"azure3")
      (mouse-color . "yellow"))
     ((help-highlight-face . underline)
      (list-matching-lines-face . bold)
      (senator-eldoc-use-color . t)
      (view-highlight-face . highlight)
      (widget-mouse-face . highlight))
     (default ((t (:stipple nil :background "gray12" :foreground "green" :inverse-video nil :box nil
			    :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width
			    normal :family "outline-courier new"))))
     (Info-title-1-face ((t (:bold t :weight bold :family "helv" :height 1.728))))
     (Info-title-2-face ((t (:bold t :family "helv" :weight bold :height 1.44))))
     (Info-title-3-face ((t (:bold t :weight bold :family "helv" :height 1.2))))
     (Info-title-4-face ((t (:bold t :family "helv" :weight bold))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (border ((t (:background "black" :foreground "green"))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (cparen-around-andor-face ((t (:bold t :foreground "maroon" :weight bold))))
     (cparen-around-begin-face ((t (:foreground "maroon"))))
     (cparen-around-conditional-face ((t (:bold t :foreground "RoyalBlue" :weight bold))))
     (cparen-around-define-face ((t (:bold t :foreground "Blue" :weight bold))))
     (cparen-around-lambda-face ((t (:foreground "LightSeaGreen"))))
     (cparen-around-letdo-face ((t (:bold t :foreground "LightSeaGreen" :weight bold))))
     (cparen-around-quote-face ((t (:foreground "SaddleBrown"))))
     (cparen-around-set!-face ((t (:foreground "OrangeRed"))))
     (cparen-around-syntax-rules-face ((t (:foreground "Magenta"))))
     (cparen-around-vector-face ((t (:foreground "chocolate"))))
     (cparen-binding-face ((t (:foreground "ForestGreen"))))
     (cparen-binding-list-face ((t (:bold t :foreground "ForestGreen" :weight bold))))
     (cparen-conditional-clause-face ((t (:foreground "RoyalBlue"))))
     (cparen-normal-paren-face ((t (:foreground "grey50"))))
     (cursor ((t (:background "orange"))))
     (custom-button-face ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style
											    released-button)))))
     (custom-button-pressed-face ((t (:background "lightgrey" :foreground "black" :box (:line-width
											2 :style pressed-button)))))
     (custom-changed-face ((t (:background "blue" :foreground "white"))))
     (custom-comment-face ((t (:background "dim gray"))))
     (custom-comment-tag-face ((t (:foreground "gray80"))))
     (custom-documentation-face ((t (nil))))
     (custom-face-tag-face ((t (:bold t :family "helv" :weight bold :height 1.2))))
     (custom-group-tag-face ((t (:bold t :foreground "light blue" :weight bold :height 1.2))))
     (custom-group-tag-face-1 ((t (:bold t :family "helv" :foreground "pink" :weight bold :height 1.2))))
     (custom-invalid-face ((t (:background "red" :foreground "yellow"))))
     (custom-modified-face ((t (:background "blue" :foreground "white"))))
     (custom-rogue-face ((t (:background "black" :foreground "pink"))))
     (custom-saved-face ((t (:underline t))))
     (custom-set-face ((t (:background "white" :foreground "blue"))))
     (custom-state-face ((t (:foreground "lime green"))))
     (custom-variable-button-face ((t (:bold t :underline t :weight bold))))
     (custom-variable-tag-face ((t (:bold t :family "helv" :foreground "light blue" :weight bold :height 1.2))))
     (eieio-custom-slot-tag-face ((t (:foreground "light blue"))))
     (extra-whitespace-face ((t (:background "pale green"))))
     (fixed-pitch ((t (:family "courier"))))
     (font-latex-bold-face ((t (:bold t :foreground "OliveDrab" :weight bold))))
     (font-latex-italic-face ((t (:italic t :foreground "OliveDrab" :slant italic))))
     (font-latex-math-face ((t (:foreground "burlywood"))))
     (font-latex-sedate-face ((t (:foreground "LightGray"))))
     (font-latex-string-face ((t (:foreground "OrangeRed"))))
     (font-latex-warning-face ((t (:bold t :foreground "Red" :weight bold))))
					; ---------------
     (font-lock-builtin-face ((t (:foreground "DodgerBlue1")))); "LightSteelBlue"))))
     (font-lock-comment-face ((t (:foreground "#505050"))))
     (font-lock-constant-face ((t (:bold t :foreground "Aquamarine"))))
     (font-lock-doc-face ((t (:foreground "LightSalmon"))))
     (font-lock-function-name-face ((t (:bold t :foreground "#a0d0a0"))))
;;     (font-lock-keyword-face ((t (:bold t :foreground "LimeGreen")))) ; "#bcf0f1"))))
     (font-lock-keyword-face ((t (:bold t :foreground "#2437FF")))) ; "#bcf0f1"))))
     (font-lock-string-face ((t (:foreground "goldenrod"))))
     (font-lock-type-face ((t (:bold t :foreground "#364498"))))
     (font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink" :weight bold))))
					; ---------------
     (fringe ((t (:background "grey10"))))
     (mode-line-custom ((t (:bold t :foreground "LimeGreen" :weight bold))))
     (header-line ((t (:box (:line-width -1 :style released-button) :background "grey20" :foreground "grey90" :box nil))))
     (highlight ((t (:background "darkolivegreen"))))
     (info-header-node ((t (:italic t :bold t :weight bold :slant italic :foreground "white"))))
     (info-header-xref ((t (:bold t :weight bold :foreground "cyan"))))
     (info-menu-5 ((t (:foreground "red1"))))
     (info-menu-header ((t (:bold t :family "helv" :weight bold))))
     (info-node ((t (:italic t :bold t :foreground "white" :slant italic :weight bold))))
     (info-xref ((t (:bold t :foreground "cyan" :weight bold))))
     (isearch ((t (:background "DarkGoldenrod" :foreground "brown4"))))
     (isearch-lazy-highlight-face ((t (:background "paleturquoise4"))))
     (italic ((t (:italic t :slant italic))))
     (jde-bug-breakpoint-cursor ((t (:background "brown" :foreground "cyan"))))
     (jde-db-active-breakpoint-face ((t (:background "red" :foreground "black"))))
     (jde-db-requested-breakpoint-face ((t (:background "yellow" :foreground "black"))))
     (jde-db-spec-breakpoint-face ((t (:background "green" :foreground "black"))))
     (jde-java-font-lock-api-face ((t (:foreground "light goldenrod"))))
     (jde-java-font-lock-bold-face ((t (:bold t :weight bold))))
     (jde-java-font-lock-code-face ((t (nil))))
     (jde-java-font-lock-constant-face ((t (:foreground "Aquamarine"))))
     (jde-java-font-lock-doc-tag-face ((t (:foreground "light coral"))))
     (jde-java-font-lock-italic-face ((t (:italic t :slant italic))))
     (jde-java-font-lock-link-face ((t (:foreground "blue" :underline t :slant normal))))
     (jde-java-font-lock-modifier-face ((t (:foreground "LightSteelBlue"))))
     (jde-java-font-lock-number-face ((t (:foreground "LightSalmon"))))
     (jde-java-font-lock-operator-face ((t (:foreground "medium blue"))))
     (jde-java-font-lock-package-face ((t (:foreground "steelblue1"))))
     (jde-java-font-lock-pre-face ((t (nil))))
     (jde-java-font-lock-underline-face ((t (:underline t))))
     (menu ((t (nil))))
     (mouse ((t (:background "yellow"))))
     (region ((t (:background "gray25"))))
     (scroll-bar ((t (nil))))
     (secondary-selection ((t (:background "SkyBlue4"))))
     (semantic-dirty-token-face ((t (:background "gray10"))))
     (semantic-unmatched-syntax-face ((t (:underline "red"))))
     (senator-intangible-face ((t (:foreground "gray75"))))
     (senator-momentary-highlight-face ((t (:background "gray30"))))
     (senator-read-only-face ((t (:background "#664444"))))
     (show-paren-match-face ((t (:background "gray20"))))
     (show-paren-mismatch-face ((((class color)) (:background "red" :foreground "white"))))
     (speedbar-button-face ((t (:foreground "green3"))))
     (speedbar-directory-face ((t (:bold t :weight bold :foreground "green2"))))
     (speedbar-file-face ((t (:foreground "cyan"))))
     (speedbar-highlight-face ((t (:background "sea green"))))
     (speedbar-selected-face ((t (:foreground "red" :underline t))))
     (speedbar-separator-face ((t (:background "blue" :foreground "white" :overline "gray"))))
     (speedbar-tag-face ((t (:foreground "yellow"))))
     (tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button)))))
     (trailing-whitespace ((t (:background "red"))))
     (underline ((t (:underline t))))
     (variable-pitch ((t (:family "helv"))))
     (widget-button-face ((t (:bold t :weight bold))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "lime green"))))
     (widget-field-face ((t (:background "dim gray"))))
     (widget-inactive-face ((t (:foreground "light gray"))))
     (hl-line ((t (:background "#252525"))))
     ;;(mode-line ((t (:background "grey75" :foreground "black" :box (:line-width -1 :style released-button)))))
     (mode-line ((t (:foreground "#ffffff" :background "#333333" :box (:line-width -1 :style released-button)))))
     (minibuffer-prompt ((default (:foreground "SeaGreen")) (nil (:foreground "SeaGreen"))))
     (widget-single-line-field-face ((t (:background "dim gray")))))))


;; use setq-default to set it for /all/ modes
(setq-default mode-line-format
      (list
       ;; the buffer name; the file name as a tool tip
       '(:eval (propertize "     %b " 'face 'mode-line-custom ;;'font-lock-keyword-face
			   'help-echo (buffer-file-name)))
       
       ;; line and column
       "(" ;; '%02' to set to 2 chars at least; prevents flickering
       (propertize "%02l" 'face 'font-lock-type-face) ","
       (propertize "%02c" 'face 'font-lock-type-face) 
       ") "
       
       ;; relative position, size of file
       "["
       (propertize "%p" 'face 'font-lock-constant-face) ;; % above top
       "/"
       (propertize "%I" 'face 'font-lock-constant-face) ;; size
       "] "
       
       ;; the current major mode for the buffer.
       "["
       '(:eval (propertize "%m" 'face 'font-lock-string-face
			   'help-echo buffer-file-coding-system))
       "] "
       
        
       "[" ;; insert vs overwrite mode, input-method in a tooltip
       '(:eval (propertize (if overwrite-mode "Ovr" "Ins")
			   'face 'font-lock-preprocessor-face
			   'help-echo (concat "Buffer is in "
					      (if overwrite-mode "overwrite" "insert") " mode")))
       
       ;; was this buffer modified since the last save?
       '(:eval (when (buffer-modified-p)
		 (concat ","  (propertize "Mod"
					  'face 'font-lock-warning-face
					  'help-echo "Buffer has been modified"))))
       
       ;; is this buffer read-only?
       '(:eval (when buffer-read-only
		 (concat ","  (propertize "RO"
					  'face 'font-lock-type-face
					  'help-echo "Buffer is read-only"))))  
       "] "

       ;; add the time, with the date and the emacs uptime in the tooltip
       '(:eval (propertize (format-time-string "%H:%M")
			   'help-echo
			   (concat (format-time-string "%c; ")
				   (emacs-uptime "Uptime:%hh"))))
       ;;" --"
       ;; i don't want to see minor-modes; but if you want, uncomment this:
       ;; minor-mode-alist  ;; list of minor modes
       ;;"%-" ;; fill with '-'
       ))




