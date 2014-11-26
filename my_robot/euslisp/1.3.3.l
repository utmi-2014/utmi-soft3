#!/usr/bin/env roseus
; P5

(ros::load-ros-manifest "roseus")

(make-irtviewer)

(load "package://daisya_euslisp_tutorials/euslisp/daisya-maze.l")

(maze-init)

(maze-demo 1 21 :extender #'depth-extender)