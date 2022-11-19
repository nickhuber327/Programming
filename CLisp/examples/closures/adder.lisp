;;;; Adder functions
;;; Create adder functions 

;;; Simple generic function for adding two numbers
(defun make-adder (n)                   ; Create free variable
  #'(lambda (x)                         ; Create bound variable
      (+ x n)))                         ; Add variables

;;; Create specialized function for adding 2 to any number
(setq add2 (make-adder 2))              ; Bind 2 to n
;;; Must use funcall to call closure
(funcall add2 3)                        ; Call specialized function

;;; Make stateful `make-adder` function
(defun make-adderb (n)                  ; Create free variable
  #'(lambda (x &optional change)        ; Create bound and optional variables
      (if change                        ; Check if change is set
          (setq n x)                    ; If so set internal state to n
          (+ x n))))                    ; Else add values

(setq addx (make-adderb 3))             ; Set interal state to 3; n=>3
(funcall addx 4)                        ;=> 7
(funcall addx 5 t)                      ; Change internal state to 5; n=>5
(funcall addx 4)                        ;=>9