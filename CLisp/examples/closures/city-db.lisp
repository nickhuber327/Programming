;;;; City database

;;; Define a function that creates a way to interact with a database of cities and countries
(defun make-dbms (db)                  ; create free variable db
  (list                                ; Create list of functions to interact with free variable
    #'(lambda (key)
        (cdr (assoc key db )))         ; Access country
    #'(lambda (key val)
        (push (cons key val) db)       ; Add key value pair
       key)
    #'(lambda (key)
        (setf db (delete key db :key #'car)) ; Remove pair
        key)))

(setq cities (make-dbms '((boston . us) (paris . france)))) ; Initialize database

;;; Access first function to lookup country
(funcall (car cities) 'boston)        ;=>US
;;; Access second function to add pair
(funcall ( second cities) 'london 'england) ;=>LONDON
;;; Lookup country 
(funcall (car cities) 'london)        ;=>ENGLAND

;;; Define funcion to lookup value 
(defun lookup (key db)
  (funcall (car db) key))
