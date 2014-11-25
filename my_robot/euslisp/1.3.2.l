#!/usr/bin/env roseus

(ros::load-ros-manifest "roseus")

(load "package://dxl_armed_turtlebot/euslisp/dxl-armed-turtlebot.l")
(setq *daisya* (instance dxl-armed-turtlebot-robot :init))

(load "package://daisya_euslisp_tutorials/euslisp/maze.l")
(setq *maze* (make-maze *m*))

(objects (list *maze* *daisya*))

(send *daisya* :locate (generate-coords-from-nodenum 1) :world)

(objects (list *maze* *daisya*))

(send *daisya* :locate (generate-coords-from-nodenum 2) :world)
