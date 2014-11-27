#!/usr/bin/env roseus
; P10

(ros::load-ros-manifest "roseus")

(load "package://daisya_euslisp_tutorials/euslisp/sample-robot-server.l")

(init-server)

(send *ri* :angle-vector #f(90 0 0 0 90 0 0) 1000)

(send *ri* :go-pos 0.4 0 90)

(print
  (send *ri* :state)
  )
(print
  (send *ri* :bumper-vector)
  )