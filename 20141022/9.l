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

;; 正の整数を引数とし, その数のピリオドを表示する


;; 一つのリストを引数とし, aというシンボルがいくつあるか返す.
(setq lst (list 'a 'b 'test 'a 't 'a 'test))
;; iteration
(defun n-a-symbol-iter (lst)
  (setq cnt 0)
  (dolist (itm lst)
    ; (print (eq itm 'a))
    (if (eq itm 'a)
      (setq cnt (+ cnt 1))
      )
    )
  cnt
  )
(format t "~%number of lst is: ~A." (n-a-symbol-iter lst))
;; recurrence
(defun n-a-symbol-recur (lst cnt)
  (if lst
    (if (eq (car lst) 'a)
      (n-a-symbol-recur (cdr lst) (+ cnt 1))
      (n-a-symbol-recur (cdr lst) cnt)
      )
    cnt
    )
  )
(format t "~%number of lst is: ~A." (n-a-symbol-recur lst 0))
