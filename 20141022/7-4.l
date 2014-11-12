;; sort algorithms

(load "output_macro.l")

;; selectionsort
(defun selection-sort (l)
  (labels ((min-list (l)
                     (let ((best (car l)))
                       (dolist (el l best)
                         (if (<= el best) (setf best el))))))
    (do* ((so-far nil (push (min-list lis) so-far))
          (lis l (remove (min-list lis) lis :count 1)))
        ((null lis) (reverse so-far)))))

;; sample output
(output
 (selection-sort (list 3 0 -4 -2 1))
 )

;; quicksort
(defun quick-sort (l)
  (if (null l) nil
    (labels ((bigger-el (x) (>= x (car l))))
      (let ((smaller (remove-if #'bigger-el (cdr l)))
            (bigger (remove-if-not #' bigger-el (cdr l))))
        (append (quick-sort smaller) (list (car l)) (quick-sort bigger))))))

(defun quick-sort (l &optional (comp #'>=))
  (if (null l) nil
    (labels ((bigger-el (x) (funcall comp x (car l))))
      (let ((smaller (remove-if #'bigger-el (cdr l)))
            (bigger (remove-if-not #'bigger-el (cdr l))))
        (append (quick-sort smaller comp) (list (car l)) (quick-sort bigger comp))))))

;; sample output
(output
 (quick-sort (list 3 0 -4 -2 1) #'>=)
 )

(output
 (quick-sort (list 3 0 -4 -2 1) #'<=)
 )

(output
 (quick-sort (list 3 0 -4 -2 1) #'(lambda (a b) (<= (* a a) (* b b))))
 )


;; mergesort
(defun merge (left right comp)
  (cond ((null left)
         right)
        ((null right)
         left)
        (t
         (if (funcall comp (car left) (car right))
             (append (list (car right)) (merge left (cdr right) comp))
           (append (list (car left)) (merge (cdr left) right comp))
             ))))

(defun right-half (list)
  (subseq list (/ (length list) 2)))

(defun left-half (list)
  (subseq list 0 (/ (length list) 2)))

(defun merge-sort (l &optional (comp #'<))
  (let ((len (length l)))
    (cond ((< len 2) l)
          (t (merge (merge-sort (left-half l) comp)
                    (merge-sort (right-half l) comp) comp))
          )))

;; sample output
(output
 (merge-sort (list 3 0 -4 -2 1) #'>=)
 )

(output
 (merge-sort (list 3 0 -4 -2 1) #'<=)
 )

(output
 (merge-sort (list 3 0 -4 -2 1) #'(lambda (a b) (<= (* a a) (* b b))))
 )
