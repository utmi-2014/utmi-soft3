; P10

(print
  (progn
    (format t "a")
    (format t "b")
    (+ 11 12))
  )

(format t "~%")
(print
  (block head
         (format t "Here we go.")
         (return-from head 'idea)
         (format t "We'll never see this."))
  )

(print
  (dolist (x '(a b c d e))
    (print x)
    (if (eql x 'c)
      (return)))
  )

(print
  (tagbody
    (setq x 0)
    top
    (setq x (+ x 1))
    (print x)
    (if (< x 10) (go top)))
  )

(defun sub () (throw 'abort 99))
(catch 'abort (sub) (format t "We'll never see this."))
(catch 'abort (unwind-protect (sub) (format t "We'll never see this.")))
