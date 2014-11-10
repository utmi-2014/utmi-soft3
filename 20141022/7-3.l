; P24

; push
(defmacro my-push (x a)
  `(setf ,a (cons ,x ,a)))

(setq a (list 1 2 3))
(my-push 0 a)
(print a)

(print
  (macroexpand `(my-push 0 a))
  )

; pop
(defmacro my-pop (a)
  `(let ((x (car, a)))
     (setf ,a (cdr ,a)) x))
(setq a (list 1 2 3))
(my-pop a)
(print a)

; pop-back
(setq a (list 0 1 2 3))
(defmacro my-popback (a)
  `(let ((x, a))
     (while (consp (cddr x)) (setq x (cdr x)))
     (prog1 (cadr x) (setf (cdr x) nil))))
(my-popback a)
(print a)
