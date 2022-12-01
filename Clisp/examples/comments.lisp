;;;; Top of source files
;;; Beginning of line
(defun test (x)
  ;; Comments indented with code
  (princ "text")                        ; Comment indented at column 40 or 
  (princ "string")                      ; last column +1 space if line excedes
  (princ "foo"))                        ; 38 columns
#|
multi
line
|#

#||
also multiline
comment
||#