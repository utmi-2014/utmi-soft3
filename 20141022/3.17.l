; P12-13

(print
  (mapcar #'(lambda (x) (+ x 10)) '(1 2 3))
  )

(print
  (mapcar #'list '(a b c) '(1 2 3 4))
  )

; (reduce #'fn '(a b c d))
(print
  (reduce #'intersection '((b r e a d 's) (b a d) (c a t)))
  )
(print
  (reduce #'+ '(1 2 3 4 5 6 7 8 9 10))
  )
(print
  (reduce #'(lambda (x y) (if (< x y) x y))
          (mapcar #'(lambda (x) (* x x)) '(3 -4 2 -1)))
  )
