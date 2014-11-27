#!/usr/bin/env roseus
;; doc on 20141126 P8

(ros::load-ros-manifest "roseus")

(ros::roseus "add_two_ints_server")

(defclass add-two-ints-cb-class
  :super propertied-object
  :slots ())
(defmethod add-two-ints-cb-class
  (:init () (ros::advertise-service "add_two_ints" roseus::AddTwoInts #'send self :add-two-ints-cb))
  (:add-two-ints-cb (req)
                    (let ((m (send req :response)))
                      (format *error-output* "Returning [~d + ~d = ~d]~%"
                              (send req :a) (send req :b)
                              (+ (send req :a) (send req :b)))
                      (send m :sum (+ (send req :a) (send req :b)))
                      m)))
(setq m (instance add-two-ints-cb-class :init))

(do-until-key
 (ros::spin-once))
