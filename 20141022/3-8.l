(format t "~A plus ~A equals ~A.~%" 2 3 (+ 2 3))

(defun ask (string)
  (format t "~A" string)
  (finish-output)
  (read))
(print (ask "How old are you ? "))
