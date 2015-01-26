#!/usr/bin/env roseus
;; doc on 20141126 P8

(ros::load-ros-manifest "roseus")

(ros::roseus "add_two_ints_server")

(ros::advertise-service "add_two_ints" roseus::AddTwoInts #'(lambda (req) (let ((m (send req :response)))
    (format *error-output* "Returning [~d + ~d = ~d]~%"
            (send req :a) (send req :b)
            (+ (send req :a) (send req :b)))
    (send m :sum  (+ (send req :a) (send req :b)))
    m)))

(do-until-key
 (ros::spin-once))
