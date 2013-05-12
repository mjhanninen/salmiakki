;;; color-theme-salmiakki.el -- a color theme for Emacs
;;; Copyright (C) 2012-13 Matti Hänninen <mha@iki.fi>
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(require 'color-theme)

(defun salmiakki-substitute-bindings (bindings form)
  (if (consp form)
      (cons (salmiakki-substitute-bindings bindings (car form))
	    (salmiakki-substitute-bindings bindings (cdr form)))
    (or (and (symbolp form) (second (assq form bindings))) form)))

(defmacro salmiakki-with-bindings (bindings &rest body)
  `(quote ,@(salmiakki-substitute-bindings bindings body)))

;;;###autoload
(defun color-theme-salmiakki ()
  (interactive)
  (color-theme-install
   (salmiakki-with-bindings
    ;; Color bindings
    (;; Black is black
     (black "black")
     ;; For neutral text
     (celeste-gray "#d5d7d0")
     ;; Highlighted text
     (white "white")
     ;; Literal values, constants, quotes, etc.
     (chateu-green "#43b25e")
     ;; Keywords, prompts, user interface hilights etc.
     (shakespeare-blue "#4f9db0")
     ;; For names of stuff at the point of definition.
     (tussock-brown "#b99246")
     ;; Comments and lower priority information.
     ;; NB: Not used; will go out of door pretty soon.
     (falcon-brown "#755169")
     ;; The primary attention color
     (bright-red "#ff0000")
     ;; The secondary attention color
     (yellow "yellow")
     ;; Inactive background elements
     (passive-background "gray10")
     ;; Line numbers and stuff like that
     (passive-foreground "gray30")
     ;; There shouldn't be any of these
     (undefined "violet"))
    ;; Theme definition
    (color-theme-salmiakki
     ((foreground-color . celeste-gray)
      (background-color . black)
      (background-mode . dark)
      (cursor-color . bright-red)
      (mouse-color . bright-red))
     ;; Basic and GUI element faces
     (default ((t (:background black :foreground celeste-gray))))
     (fringe ((t (:background passive-background))))
     (linum ((t (:background black :foreground passive-foreground))))
     ;; TODO: Figure out where this shows.
     (border ((t (:background undefined))))
     (mode-line ((t (:background bright-red :foreground celeste-gray))))
     (mode-line-buffer-id ((t (:background nil
			       :foreground yellow))))
     (mode-line-inactive ((t (:background passive-background
			      :foreground celeste-gray))))
     (minibuffer-prompt ((t (:foreground shakespeare-blue))))
     (completions-first-difference ((t (:foreground shakespeare-blue))))
     ;; TODO: find better color
     (region ((t (:background "navy"))))
     ;; Matching parenthesis
     ;; TODO: Not totally satisfied how these two work.
     (show-paren-match-face ((t (:foreground black
			         :background shakespeare-blue))))
     (show-paren-mismatch-face ((t (:foreground black
				    :background yellow))))
     ;; Isearch
     (isearch ((t (:foreground white
                   :background bright-red))))
     (lazy-highlight ((t (:foreground black
                          :background shakespeare-blue))))
     (isearch-fail ((t (:foreground black
                        :background yellow))))
     ;; Standard font lock faces
     (font-lock-comment-face ((t (:foreground passive-foreground))))
     (font-lock-comment-delimiter-face ((t (:foreground passive-foreground))))
     (font-lock-doc-face ((t (:foreground passive-foreground))))
     (font-lock-doc-string-face ((t (:foreground passive-foreground))))
     (font-lock-string-face ((t (:foreground chateu-green))))
     (font-lock-constant-face ((t (:foreground chateu-green))))
     (font-lock-builtin-face ((t (:foreground shakespeare-blue))))
     (font-lock-keyword-face ((t (:foreground shakespeare-blue))))
     (font-lock-type-face ((t (:foreground shakespeare-blue))))
     (font-lock-function-name-face ((t (:foreground tussock-brown))))
     (font-lock-variable-name-face ((t (:foreground tussock-brown))))
     (font-lock-preprocessor-face ((t (:foreground bright-red))))
     (font-lock-warning-face ((t (:bold t :foreground bright-red))))
     ;; Line highlighting
     (highlight ((t (:background bright-red :foreground nil))))
     (highlight-current-line-face ((t (:foreground nil
				       :background undefined))))
     ;; Comint
     (comint-history-input ((t (:foreground shakespeare-blue))))
     (comint-history-prompt ((t (:foreground shakespeare-blue))))
     ;; Calendar
     (holiday-face ((t (:foreground undefined))))
     ;; Info
     (info-xref ((t (:foreground undefined))))
     (info-xref-visited ((t (:foreground undefined))))
     ;; AUCTeX
     (font-latex-sectioning-5-face ((t (:foreground undefined :bold t))))
     (font-latex-bold-face ((t (:foreground undefined :bold t))))
     (font-latex-italic-face ((t (:foreground undefined :italic t))))
     (font-latex-math-face ((t (:foreground undefined))))
     (font-latex-string-face ((t (:foreground undefined))))
     (font-latex-warning-face ((t (:foreground undefined))))
     (font-latex-slide-title-face ((t (:foreground undefined))))
     ;; Post
     (post-emoticon-face ((t (:background undefined
			      :foreground black))))
     (post-header-value-face ((t (:foreground undefined))))
     (post-header-keyword-face ((t (:foreground undefined :bold t))))
     (post-signature-text-face ((t (:foreground undefined))))
     (post-quoted-text-face ((t (:foreground undefined :slant normal))))
     (post-double-quoted-text-face ((t (:foreground undefined :slant normal))))
     (post-multiply-quoted-text-face ((t (:foreground undefined :slant normal))))
     (post-email-address-text-face ((t (:foreground undefined :bold t))))
     (post-url-face ((t (:foreground undefined :bold t))))
     ;; Compilation
     (compilation-column-number ((t (:foreground shakespeare-blue))))
     (compilation-error ((t (:foreground bright-red))))
     (compilation-info ((t (:foreground chateu-green))))
     (compilation-line-number ((t (:foreground shakespeare-blue))))
     (compilation-warning ((t (:foreground bright-red))))
     ;; Dired
     (dired-directory ((t (:foreground shakespeare-blue))))
     (dired-flagged ((t (:foreground chateu-green))))
     (dired-header ((t (:foreground white))))
     (dired-ignored ((t (:foreground passive-foreground))))
     (dired-mark ((t (:foreground chateu-green))))
     (dired-marked ((t (:foreground chateu-green))))
     (dired-symlink ((t (:foreground shakespeare-blue))))
     (dired-warning ((t (:foreground passive-foreground))))))))

(provide 'color-theme-salmiakki)
