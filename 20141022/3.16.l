; P12

(print
  (macroexpand '(when t (print 1)))
  )

(print
  (setq a 3)
  )

(print
  ; '(1 2 ,a) ; this raises error
  `(1 2 ,a)
  )

(print
  (setq b (list 1 2 3))
  )

(print
  ; '(1 2 ,@b) ; this raises error
  `(1 2 ,@b)
  )
