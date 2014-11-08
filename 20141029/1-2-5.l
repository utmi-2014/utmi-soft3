;; P8

;; make servo module
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

(defclass servo-model
  :super cascaded-link
  :slots (h1 s1 j1))
(defmethod servo-model
  (:init ()
         (let ()
           (send-super :init)
           (setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
           (setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-servo))))
           (setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
           ;; instance cascaded coords
           (setq links (list h1 s1))
           (setq joint-list (list j1))
           ;;
           (send self :assoc h1)
           (send h1 :assoc s1)
           ;;
           (send self :init-ending)
           self))
  ;;
  ;; (send r :j1 :joint-angle 30)
  (:j1 (&rest args) (forward-message-to j1 args))
  )

(setq r (instance servo-model :init))
(objects (list r))
; (dotimes (i 300)
;   (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
;   (send *irtviewer* :draw-objects))
(setq i 0)
(do-until-key
  (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
  (send *irtviewer* :draw-objects)
  (incf i))
