;; usage
;; (output (hoge))
(defmacro output (x)
  `(progn ,(format t "~A" x)
          (prin1 " --> ")
          (format t "~A~%~%" ,x))
  )
