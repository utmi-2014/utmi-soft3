(setq c1 (make-cube 100 100 100))
(send c1 :set-color :red)
(setq c2 (make-cylinder 30 100))
(send c2 :set-color :green)
(send c1 :assoc c2)
(setq b1 (instance bodyset :init
                   (make-cascoords)
                   :bodies (list c1 c2)))
(objects (list b1))
