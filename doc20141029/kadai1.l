(setq sun (make-gdome (make-icosahedron 50.0)))
(setq earth (make-gdome (make-icosahedron 15.0)))
(setq moon (make-gdome (make-icosahedron 5.0)))

(send sun :set-color :red)
(send earth :set-color :blue)
(send moon :set-color :yellow)

(send earth :locate #f(300 0 0))
(send moon :locate #f(340 0 0))

(send sun :assoc earth)
(send earth :assoc moon)

(objects (list sun earth moon))
(do-until-key
  (send sun :rotate (deg2rad 1) :z)
  (send earth :rotate (deg2rad 2) :z)
  (send *irtviewer* :draw-objects)
  (x::window-main-one) ;; process window event
  )
