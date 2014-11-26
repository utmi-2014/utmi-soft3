#!/usr/bin/env roseus
; P16
; 3 練習問題

(ros::load-ros-manifest "roseus")

(load "package://dxl_armed_turtlebot/euslisp/dxl-armed-turtlebot-interface.l")
(load "model-wkentaro.l")

;; init-server
(defun init-server (&optional (world 'simple))
  ()
  (let (objects init-coords)
    (case
     world
     ('wkentaro
      (setq box (make-cube 300 300 200))
      (send box :locate #f(500 0 100))
      (send box :set-color :red)
      (setq *macbookpro* (make-macbookpro))
      (send *macbookpro* :locate #f(600 0 200))
      (send *macbookpro* :rotate 1.57 :z)
      (setq objects (list box *macbookpro*))
      (setq init-coords (make-coords)))
     (t
       ;;世界を構成するobjectを生成する
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
    ;;(start-robotsim-server objects :init-coords init-coords)
    ))

; (setq *daisya* (instance dxl-armed-turtlebot-robot :init))
(init-server 'wkentaro)
