; P6

(defun our-third (x) (car (cdr (cdr x))))

(print
  (setq a '(1 2 3 4 5))
  )

(print
  (our-third a)
  )
