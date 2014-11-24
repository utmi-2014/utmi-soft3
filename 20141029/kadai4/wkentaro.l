;; P17,18
(load "models/h7-robot.l")
(load "wkentaro-model.l")
(setq *mac* (macbookpro))
(setq *robot* (h7))

(send *mac* :locate #f(600 0 800))
(send *mac* :rotate 1.57 :z)

(send *robot* :reset-pose)
(send *robot* :locate #f(0 0 550))

(objects (list *robot* *mac*))

(setq c (make-cascoords :pos #f(550 40 742) :rpy (float-vector 0 0 0)))
(send *robot* :head :look-at (send *mac* :worldpos))
(send *robot* :larm :inverse-kinematics c
      :link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
      :move-target (send *robot* :larm :end-coords)
      :rotation-axis :z
      :debug-view t)

(send *robot* :larm :end-coords :assoc *mac*)
(send *robot* :larm :move-end-pos #f(200 0 100) :world
      :debug-view t :look-at-target t)

(send *robot* :larm :end-coords :dissoc *mac*)
(send *robot* :larm :move-end-pos #f(-400 200 100) :world
      :debug-view t :look-at-target nil)

; (send *robot* :larm :end-coords :assoc *mac*)
; (send *robot* :larm :move-end-pos #f(0 0 100) :world
;       :debug-view t :look-at-target t)
; (send *robot* :head :look-at (send *kettle* :worldpos))

; (send *irtviewer* :look-all
; 	(geo::make-bounding-box
; 		(flatten (send-all (send *robot* :bodies) :vertices))))
;
; (setq *kettle* (send *room* :object "room73b2-kettle"))
;
; (if (send *kettle* :parent) (send (send *kettle* :parent) :dissoc *kettle*))
;
; (send *robot* :head :look-at (send *kettle* :worldpos))
;
; (send *robot* :larm :inverse-kinematics
; 	(car (send *kettle* :handle))
; 	:link-list (send *robot* :link-list (send *robot* :larm :end-coords :parent))
; 	:move-target (send *robot* :larm :end-coords)
; 	:rotation-axis :z
; 	:debug-view t)
;
; (send *robot* :larm :end-coords :assoc *kettle*)
;
; (send *robot* :larm :move-end-pos #f(0 0 100) :world
; 	:debug-view t :look-at-target t)
