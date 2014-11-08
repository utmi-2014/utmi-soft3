; P7

(format t "~A plus ~A equals ~A.~%" 2 3 (+ 2 3))

(defun ask (string)
  (format t "~A" string)
  (finish-output)
  (read))

(setq year (ask "How old are you ? "))
(if (< year 20)
  (format t "--~%~A years old!?~%You are so young!~%" year)
  (format t "--~%~A years old.~%So you are mature.~%" year)
  )
