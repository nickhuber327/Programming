;;;; Counter program
;;; Function for incrementing and resetting a counter

(let ((counter 0))                      ; Set free variable
  (defun new-id ()   (incf counter))    ; Increment counter
  (defun reset-id () (setq counter 0))) ; Reset counter