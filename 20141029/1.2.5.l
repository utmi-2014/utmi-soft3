;; P8

(load "make-funcs.l")

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
