;; ------------------- My custom functions ----------------------
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
        (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position)))
    (comment-or-uncomment-region beg end)))

;; Smart home key
(defun smart-beginning-of-line ()
  (interactive)
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(defun kill-current-buffer ()
  (interactive)
  (kill-buffer (current-buffer)))
(global-set-key (kbd "C-x k") 'kill-current-buffer)

;; ------------------- My custom functions ----------------------

(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the middle"
  (let* ((win-edges (window-edges))
         (this-window-y-min (nth 1 win-edges))
         (this-window-y-max (nth 3 win-edges))
         (fr-height (frame-height)))
    (cond ((eq 0 this-window-y-min) "top")
          ((eq (- fr-height 1) this-window-y-max) "bot")
          (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the middle"
  (let* ((win-edges (window-edges))
         (this-window-x-min (nth 0 win-edges))
         (this-window-x-max (nth 2 win-edges))
         (fr-width (frame-width)))
    (cond ((eq 0 this-window-x-min) "left")
          ((eq (+ fr-width 4) this-window-x-max) "right")
          (t "mid"))))

(defun win-resize-enlarge-horiz ()
  (interactive)
  (cond ((equal "top" (win-resize-top-or-bot)) (enlarge-window -1))
        ((equal "bot" (win-resize-top-or-bot)) (enlarge-window 1))
        ((equal "mid" (win-resize-top-or-bot)) (enlarge-window -1))
        (t (message "nil"))))

(defun win-resize-minimize-horiz ()
  (interactive)
  (cond ((equal "top" (win-resize-top-or-bot))
         (enlarge-window 1))
        ((equal "bot" (win-resize-top-or-bot))
         (enlarge-window -1))
        ((equal "mid" (win-resize-top-or-bot)) (enlarge-window 1)) (t (message "nil"))))

(defun win-resize-enlarge-vert ()
  (interactive)
  (cond ((equal "left" (win-resize-left-or-right))
         (enlarge-window-horizontally -1))
        ((equal "right" (win-resize-left-or-right))
         (enlarge-window-horizontally 1))
        ((equal "mid" (win-resize-left-or-right))
         (enlarge-window-horizontally -1))))

(defun win-resize-minimize-vert ()
  (interactive)
  (cond ((equal "left" (win-resize-left-or-right))
         (enlarge-window-horizontally 1))
        ((equal "right" (win-resize-left-or-right))
         (enlarge-window-horizontally -1))
        ((equal "mid" (win-resize-left-or-right))
         (enlarge-window-horizontally 1))))

(global-set-key [M-S-down] 'win-resize-minimize-vert)
(global-set-key [M-S-up] 'win-resize-enlarge-vert)
(global-set-key [M-S-left] 'win-resize-minimize-horiz)
(global-set-key [M-S-right] 'win-resize-enlarge-horiz)
(global-set-key [M-S-up] 'win-resize-enlarge-horiz)
(global-set-key [M-S-down] 'win-resize-minimize-horiz)
(global-set-key [M-S-left] 'win-resize-enlarge-vert)
(global-set-key [M-S-right] 'win-resize-minimize-vert)

(defun search-selection (beg end)
  "search for selected text"
  (interactive "r")
  (let (
        (selection (buffer-substring-no-properties beg end))
        )
    (deactivate-mark)
    (isearch-mode t nil nil nil)
    (isearch-yank-string selection)
    )
  )
(define-key global-map (kbd "<C-f3>") 'search-selection)

(defun iwb ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(use-local-map (make-sparse-keymap))
(global-set-key "\M-f" ctl-x-map)
(global-set-key "\M-f\M-f" 'iwb)

; remap of up key in shell mode
(defun remap-up-key-in-shell ()
  (local-set-key (kbd "<up>") 'comint-previous-input))

(add-hook 'shell-mode-hook 'remap-up-key-in-shell)
