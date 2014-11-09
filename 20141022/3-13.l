;; P9

(function +)
(print #'+)

(print
  (apply #'+ (list 1 2 3))
  )
(print
  (funcall #'+ 1 2 3)
  )

(print
  ((lambda (x y) (+ x y)) 1 2)
  )
(print
  (funcall #'(lambda (x y) (+ x y)) 1 2)
  )
