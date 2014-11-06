(setq c1 (make-cube 100 100 100))
(send c1 :locate #f(0 0 50))
(send c1 :rotate (deg2rad 30) :x)
(send c1 :set-color :yellow)
(objects (list c1))

(setq c2 (make-cylinder 50 100))
(send c2 :move-to
      (make-coords
        :pos #f(20 30 40)
        :rpy (float-vector 0 0 (deg2rad 90)))
      :world)
(send c2 :set-color :green)
(objects (list c1 c2))

(setq c3 (body+ c1 c2))
(setq c4 (body- c1 c2))
(setq c5 (body* c1 c2))
