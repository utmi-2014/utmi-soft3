;; P20

;; (setq c1 (make-cube 5 5 5))
(setq c1 (make-gdome (make-icosahedron 5.0)))
(send c1 :set-color :yellow)
(send c1 :locate #f(30 30 0))

(setq c2 (make-gdome (make-icosahedron 10.0)))
;; (setq c2 (make-cube 100 100 100))
(send c2 :set-color :cyan)

(send c2 :assoc c1)

(objects (list c1 c2))

(do-until-key
  (send c2 :rotate (deg2rad 5) :z)
  (send *irtviewer* :draw-objects)
  (x::window-main-one))
