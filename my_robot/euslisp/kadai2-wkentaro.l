#!/usr/bin/env roseus
; P16
; 3 練習問題

(ros::load-ros-manifest "roseus")

(load "package://daisya_euslisp_tutorials/euslisp/maze.l")
(load "package://daisya_euslisp_tutorials/euslisp/sample-robot-server.l")
(load "package://dxl_armed_turtlebot/euslisp/dxl-armed-turtlebot-interface.l")
(load "model-wkentaro.l")

;; init-server
(defun init-server (&optional (world 'simple))
  ()
  (let (objects init-coords)
    (case
      world
      ('wkentaro
       (setq goal (make-macbookpro))
       (setf (get goal :face-color) :red)
       (send goal :locate (float-vector (* 470 5.5) (* 470 4.5) 0))
       (send goal :rotate 1.57 :z)
       ;;
       (setq maze 
             (make-maze *m*
                        :remove-wall-list (list '((5 4) (5 5)))
                        :maze-length 470
                        :maze-height 200))
       (setq objects (list maze goal))
       (setq init-coords (make-coords :pos
                                      (generate-coords-from-nodenum 1)
                                      :rpy (float-vector pi/2 0 0))))
      (t
       (setq *obstacle1* (make-cube 100 200 200))
       (send *obstacle1* :locate #f(600 0 100))
       (setq *obstacle2* (make-cube 100 200 200))
       (send *obstacle2* :locate #f(-400 0 100))
       (send *obstacle1* :set-color :red)
       (send *obstacle2* :set-color :red)
       (setq objects (list *obstacle1* *obstacle2*))
       (setq init-coords (make-coords)))
     )
    (dxl-armed-turtlebot-init :objects objects)
    ))

(defun kadai2
  (&key (start 1) (goal 25))
  (let ((path (maze-search start goal *m*))
        (prev-coords (make-coords :pos #f(200 200 0)
                                  :rpy (float-vector pi/2 0 0)))
        curr-coords pos rot c v)
    (init-server 'wkentaro)
    (send *dxl-armed-turtlebot* :tuckarm-pose)
    (send *ri* :angle-vector (send *dxl-armed-turtlebot* :angle-vector) 3000)
    (send *ri* :wait-interpolation)
    (send *ri* :go-pos 0.2 0.2 0)
    (warn "solved path is ~a~%" path)
    (dolist (p (cdr path))
      (setq c (generate-coords-from-nodenum p))
      (setq pos (send prev-coords :inverse-transform-vector
                      (float-vector (elt c 0) (elt c 1) 0)))
      (setq curr-coords (send prev-coords :copy-worldcoords))
      (send curr-coords :translate pos)
      (if (> (abs (elt pos 1)) (abs (elt pos 0)))
          (setq rot (if (> (elt pos 0) (elt pos 1)) -90 90))
        (setq rot 0))
      (send curr-coords :rotate (deg2rad rot) :z)
      (print (list p c pos rot))
      (send *ri* :go-pos (* 1e-3 (elt c 0)) (* 1e-3 (elt c 1)) 0)
      (setq prev-coords curr-coords)
      )
    (send *dxl-armed-turtlebot* :arm :move-end-pos #f(150 0 -320) :world
          :rotation-axis nil)
    (send *ri* :angle-vector (send *dxl-armed-turtlebot* :angle-vector) 2000)
    (send *ri* :wait-interpolation)
    (send *dxl-armed-turtlebot* :arm :inverse-kinematics (make-coords :pos (send *dxl-armed-turtlebot* :transform-vector #f(430 0 250))) :rotation-axis nil)
    (send *ri* :angle-vector (send *dxl-armed-turtlebot* :angle-vector) 2000)
    (send *ri* :wait-interpolation)
    ))

(kadai2)