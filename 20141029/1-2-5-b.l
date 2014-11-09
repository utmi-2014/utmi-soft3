;; P10

(load "make-funcs.l")

;; define class and method
(defclass hinji-servo-robot
  :super cascaded-link)
(defmethod hinji-servo-robot
  (:init
    ()
    (let (h1 s1 h2 s2 l1 l2 l3)
      (send-super :init)
      (setq h1 (make-hinji))
      (setq s1 (make-servo))
      (setq h2 (make-hinji))
      (setq s2 (make-servo))
      (send h2 :locate #f(42 0 0))
      (send s1 :assoc h2)
      (setq l1 (instance bodyset-link :init (make-cascoords) :bodies (list h1)))
      (setq l2 (instance bodyset-link :init (make-cascoords) :bodies (list s1 h2)))
      (setq l3 (instance bodyset-link :init (make-cascoords) :bodies (list s2)))
      (send l3 :locate #f(42 0 0))
      (send self :assoc l1)
      (send l1 :assoc l2)
      (send l2 :assoc l3)

      (setq joint-list
            (list
              (instance rotational-joint
                        :init :parent-link l1 :child-link l2
                        :axis :z)
              (instance rotational-joint
                        :init :parent-link l2 :child-link l3
                        :axis :z)))
      (setq links (list l1 l2 l3))
      (send self :init-ending)
      )))
(setq r (instance hinji-servo-robot :init))
(objects (list r))

(dotimes (i 10000)
  (send r :angle-vector (float-vector (* 90 (sin (/ i 500.0))) (* 90 (sin (/ i 1000.0)))))
  (send *irtviewer* :draw-objects))


