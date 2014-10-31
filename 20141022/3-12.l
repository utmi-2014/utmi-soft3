(defun show-squares (start end)
  (do ((i start (+ i 1)))
    ((> i end) 'done)
    (format t "~A ~A.~%" i (* i i))))

(show-squares 3 5)
