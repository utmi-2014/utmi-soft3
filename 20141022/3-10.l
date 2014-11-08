; P8

(print
  (setq a (list 1 2 3))
  )

(print
  (set (quote a) (list 1 2 3))
  )
(print a)

(print
  (setf (car a) 10)
  )
(print a)
