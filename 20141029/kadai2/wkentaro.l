(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 35 20 46))
    (send b1 :locate #f(9.5 0 0))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 -30))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))
(defun make-hinji nil
  (let ((b2 (make-cube 22 16 58))
        (b1 (make-cube 26 20 54)))
    (send b2 :locate #f(-4 0 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))

(defun make-under nil
  (let (b)
    (setq b (make-cube 60 40 3))
    (send b :locate #f(-4 0 0))
    (send b :set-color :gray60)
    b))

(setq b1 (make-under))
(objects (list b1))
