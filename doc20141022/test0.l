;; test0.l
(defun test (i j)
  (* i j))

(setq i 3)
(setq j 2)
(setq k (test i j))
(if (> k 5)
  (print ">5")
  (print "<=5")
  )
