#!/usr/bin/env roseus

(ros::load-ros-manifest "image_view2")
(ros::load-ros-manifest "sound_play")
(ros::load-ros-manifest "posedetection_msgs")
(ros::load-ros-manifest "checkerboard_detector")
;;;
;;;

;; vision callback
(defun checkerboard-cb (msg)
  (let ((mrk (instance image_view2::ImageMarker2 :init))
	cam target-local target-world)
    (if (null (send msg :objects)) (return-from checkerboard-cb nil))
    (setq pose (car (send msg :objects)))
    (setq target-local (ros::tf-pose->coords (send pose :pose)))

    ;; for display
    (send mrk :type image_view2::ImageMarker2::*FRAMES*)
    (send mrk :frames (list "/camera"))
    (send *tfb* :send-transform
          target-local (send msg :header :frame_id) "/checkerboard_pose_frame")
    (ros::ros-info "~A" target-local)
    (ros::publish "image_marker" mrk)
    ;;
    ;; calc world coordinates of target object pose
    ;; (setq cam (send *pr2* :camera "wide_stereo/right")) see https://github.com/jsk-ros-pkg/jsk_pr2eus/issues/61
    ; (setq cam (find :wide_stereo/right (send *dxl-armed-turtlebot* :cameras)  :key #'(lambda (a) (send a :name))))
    (setq cam (send *dxl-armed-turtlebot* :arm :end-coords))
    (setq target-world (send target-local :transform (send cam :worldcoords) :parent))
    (send-all (send *ri* :objects) :move-to target-world :world)

    ;; reach to the target
    (send *dxl-armed-turtlebot* :rarm :inverse-kinematics
	  target-world :rotation-axis nil
	  :stop 3 :revert-if-fail nil :warnp nil)
    (send *ri* :angle-vector (send *dxl-armed-turtlebot* :angle-vector) 1000)
    (send (send target-world :copy-worldcoords)  :draw-on :flush t :size 200)
    ;;
    ))

;; init robot
(defun init-robot ()
  (warning-message 2 "loading dxl-armed-turtlebot robot information~%")
  (load "package://dxl_armed_turtlebot/euslisp/dxl-armed-turtlebot.l")
  (load "package://dxl_armed_turtlebot/euslisp/dxl-armed-turtlebot-interface.l")
  (load "models/chessboard-30-7x5-object.l")
  (warning-message 2 "setup visualizer~%")
  (if (not (boundp '*dxl-armed-turtlebot*)) (setq *dxl-armed-turtlebot* (dxl-armed-turtlebot)))
  (if (not (boundp '*target-object*)) (setq *target-object* (chessboard-30-7x5 :name "/test_object")))
  (send *target-object* :locate (send *dxl-armed-turtlebot* :arm :end-coords :worldpos))
  (setq *ri* (instance dxl-armed-turtlebot-interface :init :objects (list *target-object*)))
  (send *dxl-armed-turtlebot* :reset-pose))

;; init roseus
(defun init-roseus ()
  (warning-message 2 "setup roseus~%")
  (setq *tfb* (instance ros::transform-broadcaster :init))
  (ros::advertise "robotsound" sound_play::SoundRequest 5)
  (ros::advertise "image_marker" image_view2::ImageMarker2 1)
  (ros::subscribe "ObjectDetection" posedetection_msgs::ObjectDetection #'checkerboard-cb))

;;
(ros::roseus "kadai2-wkentaro")
(init-robot)
(init-roseus)
;; main loop
(warning-message 2 "start main loop~%")
(ros::rate 10)
(while (ros::ok)
  (ros::spin-once)
  (ros::sleep)
  (x::window-main-one)
  )
(ros::exit)



