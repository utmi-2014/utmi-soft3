; P8
(format t "3-12 反復(Iteration)~%--~%")

(defun show-squares (start end)
  (do ((i start (+ i 1)))
    ((> i end) 'done)
    (format t "~A ~A.~%" i (* i i))))

(show-squares 3 5)

(defun show-squares (i end)
  (if (> i end)
    'done
    (progn (format t "~A ~A~%" i (* i i))
           (show-squares (+ i 1) end))))
(show-squares 3 5)

(dolist (a (list 1 2 3)) (print a))
(dotimes (i 4) (print i))

(defun factorial (n)
  (do ((j n (- j 1))
       (f 1 (* j f)))
    ((= j 0) f)))
(print (factorial 5))
