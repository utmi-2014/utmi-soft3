(defclass bodyset-link
  :super bodyset
  :slots (joint parent-link child-links analysis-level default-coords
                weight acetroid inertia-tensor
                angular-velocity angular-acceleration
                spacial-veocity spacial-acceleration
                momentum-velocity angular-momentum-velocity
                momentum angular-momentum
                force moment ext-force ext-moment))
;; joint
(defclass joint
  :super propertied-object
  :slots (parent-link child-link joint-angle min-angle max-angle default-coords))
(defmethod joint
  (:init (&key name
               ((:child-link clink)) ((:parent-link plink))
               (min -90) (max 90) &allow-other-keys)
         (send self :name name)
         (setq parent-link plink child-link clink
               min-angle min max-angle max)
         self))
(defclass rotational-joint
     :super joint
     :slots (axis))
(defmethod rotational-joint
  (:init (&rest args &key ((:axis ax) :z) &allow-other-keys)
         (setq axis ax joint-angle 0.0)
         (send-super* :init args)
  (:joint-angle
    (&optional v)
    (when v
      (setq relang (- v joint-angle) joint-angle v)
      (send child-link :rotate (deg2rad relang) axis)))
  joint-angle))

;; make servo module
(defun make-servo nil
  (let (b1 b2)
    (setq b1 (make-cube 35 20 46))
    (send b1 :locate #f(9.5 0 0))
    (setq b2 (make-cylinder 3 60))
    (send b2 :locate #f(0 0 -30))
    (setq b1 (body+ b1 b2))
    (send b1 :set-color :gray20)
    b1))
(defun make-hinji nil
  (let ((b2 (make-cube 22 16 58))
        (b1 (make-cube 26 20 54)))
    (send b2 :locate #f(-4 0 0))
    (setq b2 (body- b2 b1))
    (send b1 :set-color :gray80)
    b2))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-servo))))
(setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
;; instance cascaded coords
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
; (setq (r . joint-list) (list j1))
; (send r :init-ending)
