; P1
(load "../20141029/1.3.3.l")

(setq translation-axis t)
(setq rotation-axis t)
(setq i 0)
(do-until-key 
  (setq c (make-cascoords :pos (float-vector (* 100 (sin (/ i 300.0)))
                                             (* 100 (cos (/ i 300.0)))
                                             200)))
  (setq J (send r :calc-jacobian-from-link-list
                (send r :link-list (send r :end-coords :parent))
                :move-target (send r :end-coords)
                :rotation-axis rotation-axis
                :translation-axis translation-axis))
  (setq J# (sr-inverse J))
  (setq I-J#J (m+ (unit-matrix (array-dimension J 1)) (m* J# J)))
  (setq dif-pos (send (send r :end-coords) :difference-position c
                      :translation-axis translation-axis))
  (setq dif-rot (send (send r :end-coords) :difference-rotation c
                      :rotation-axis rotation-axis))
  (setq da (v+ (transform J#
                          (concatenate float-vector
                                       (calc-dif-with-axis dif-pos translation-axis)
                                       (calc-dif-with-axis dif-rot rotation-axis)))
               (transform I-J#J (float-vector 0.1 0 0))))
  (send r :angle-vector (v+ (send r :angle-vector) da))
  (send *irtviewer* :draw-objects :flush nil)
  (send c :draw-on :flush t)
  (x::window-main-one)
  (incf i)
  )
