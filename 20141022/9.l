;; P26

;; (car (x (cdr '(a (b c) d))))
(print
  (car (car (cdr '(a (b c) d))))
  )

;; (x 13 (/ 1 0)
;; 13
(print 
  (or 13 (/ -1 0))
  )

;; (x #'list 1 nil)
;; (1)
(print 
  (apply #'list 1 nil)
  )
