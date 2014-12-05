;; make unicycle
(defun make-tire nil
  (let (b1 b2 b3 b4 c1 c2)
    (setq b1 (make-cylinder 30 8))
    (setq b2 (make-cylinder 2 25))
    (setq b3 (make-cylinder 1.5 10))
    (setq b4 (make-cylinder 1.5 10))
    (setq c1 (make-cube 6 25 2))
    (setq c2 (make-cube 6 25 2))
    (send b1 :locate #f(0 0 -4))
    (send b2 :locate #f(0 0 -12.5))
    (send c1 :locate #f(0 10 10))
    (send c2 :locate #f(0 -10 -10))
    (send b3 :locate #f(0 20 10))
    (send b4 :locate #f(0 -20 -20))    
    (setq b1 (body+ b1 b2))
    (setq b1 (body+ b1 c1 c2 b3 b4))
    (send b1 :set-color :gray10)
    b1)
  )
(defun make-frame nil
  (let (
	(b1 (make-cube 8 50 15)) 
        (b2 (make-cube 8 40 10))
        (b3 (make-cube 8 40 5))
        )
    (send b1 :locate #f(0 -20 0))
    (send b2 :locate #f(0 -15 0))
    (send b3 :locate #f(0 -65 0))
    ;(send b3 :rotate (deg2rad 90) :x)
    (setq b1 (body- b1 b2))
    (setq b1 (body+ b1 b3))
    (send b1 :set-color :green)
    b1)
  )

(defun make-saddle nil
  (let (
	(b1 (make-cube 30 10 5))
	)
    (send b1 :locate #f(0 -90 0))
    (send b1 :set-color :gray10)
    b1)
  )
)

(defclass unicycle-model
  :super cascaded-link
  :slots (f1 t1 s1 j1)) 
(defmethod unicycle-model
  (:init ()
	 (let ()
           (send-super :init)
           (setq f1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-frame))))
           (setq t1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-tire))))
	   (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-saddle))))
	   (setq j1 (instance rotational-joint :init :parent-link f1 :child-link t1 :axis :z))
           ;; instance cascaded coords
           (setq links (list f1 t1 s1))
           (setq joint-list (list j1))
           ;;
           (send self :assoc f1)
           (send f1 :assoc t1)
	   (send f1 :assoc s1)
	   ;;(send s1 :assoc f1)
	   ;;
           (send self :init-ending)
           self)
	 )
  (:f1 (&rest args) (forward-message-to f1 args))	
  (:t1 (&rest args) (forward-message-to t1 args))	
  (:s1 (&rest args) (forward-message-to s1 args))
  (:j1 (&rest args) (forward-message-to j1 args))		 
  )

(setq r (instance unicycle-model :init))
(send r :rotate (deg2rad 45) :y)
(objects (list r))
(setq i 0)
(do-until-key
 ;(send r :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
 (send r :t1 :rotate (deg2rad (/ i 100)) :z)
 (send *irtviewer* :draw-objects)
 (incf i))

;(send *irtviewer* :draw-objects)







