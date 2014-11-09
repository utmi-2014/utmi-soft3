; P11

(defun our-member (obj lst)
  (if (atom lst)
    nil
    (if (eql (car lst) obj)
      lst
      (our-member obj (cdr lst)))))

(setq lst (list 'a 'b 'c 'd))
(print
  (our-member 'c lst)
  )

(defun our-member (obj lst)
  (cond ((atom lst) nil)
        ((eql (car lst) obj) lst)
        (t (our-member obj (cdr lst)))))
(print
  (our-member 'c lst)
  )

(defun month-length (mon)
  (case mon
    (('jan 'mar 'may 'jul 'aug 'oct 'dec) 31)
    (('apr 'jun 'sept 'nov) 30)
    ('feb 28)))
(print (month-length 'feb))


(setq that 3)
(when (oddp that)
  (print "Humm, that's odd.")
  (+ that 1))
(if (oddp that)
  (progn
    (print "Humm, that's odd.")
    (+ that 1)))
