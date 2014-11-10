; P22

(print
  (list 0 1 2)
  )
(print
  (cons 0 (cons 1 (cons 2 nil)))
  )

(print
  (car (list 0 1 2))
  )
(print
  (cdr (list 0 1 2))
  )
(print
  (car (cdr (list 0 1 2)))
  )
(print
  (cdr (cdr (list 0 1 2)))
  )
(print
  (cdr (cdr (cdr (list 0 1 2))))
  )

(print
  (append (list 0 1 2) (list 'A 'B 'C))
  )
(print
  (reverse (list 0 1 2))
  )

(defun my-append (a b)
  (cond ((null a) b)
        (t (cons (car a) (my-append (cdr a) b))))
  )
(print
  (my-append '(0 1 2) '(A B C))
  )

(defun my-reverse (x)
  (cond ((null x) nil)
        (t (append (my-reverse (cdr x)) (list (car x)))))
  )
(print
  (my-reverse (list 0 1 2))
  )
