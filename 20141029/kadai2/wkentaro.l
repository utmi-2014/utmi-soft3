;; define making object funcs
(defun make-laptop-base nil
  (let (b)
    (setq b (make-cube 60 40 2))
    (send b :locate #f(0 20 0))
    (send b :set-color :gray60)
    b))
(defun make-laptop-desktop-front nil
  (let (b)
    (setq b (make-cube 60 1 40))
    (send b :locate #f(0 -1 20))
    (send b :set-color :gray60)
    b))
(defun make-laptop-desktop-back nil
  (let (b)
    (setq b (make-cube 59 1.01 39))
    (send b :locate #f(0 -0.99 20))
    (send b :set-color :black)
    b))
(defun make-laptop-axis nil
  (let (b)
    (setq b (make-cylinder 1.2 44))
    (send b :locate #f(-22 0 1))
    (send b :rotate 1.5707 :y)
    (send b :set-color :gray10)
    b))
(defun make-keyboard (offset xsize)
  (let (b)
    (setq b (make-cube xsize 1 2.3))
    (send b :locate (float-vector (- 25 offset) 5 0.3))
    (send b :set-color :black)
    b))

;; set objects
(setq b1 (make-laptop-base))
(setq b2 (make-laptop-desktop-front))
(setq b3 (make-laptop-desktop-back))
(send b2 :assoc b3)
(setq b4 (make-laptop-axis))
(send b3 :assoc b4)
(setq k1 (make-keyboard 0.0 3.5))
(setq k2 (make-keyboard 4.1 3.5))
(setq k3 (make-keyboard (* 4.1 2) 3.5))
(setq k4 (make-keyboard (* 4.1 3) 3.5))
(setq k5 (make-keyboard (* 4.1 4) 3.5))
(setq k6 (make-keyboard (* 4.1 5) 3.5))
(setq k7 (make-keyboard (* 4.1 6) 3.5))
(setq k8 (make-keyboard (* 4.1 7) 3.5))
(setq k9 (make-keyboard (* 4.1 8) 3.5))
(setq k10 (make-keyboard (* 4.1 9) 3.5))
(setq k11 (make-keyboard (* 4.1 10) 3.5))
(setq k12 (make-keyboard (* 4.1 11) 3.5))
(setq k13 (make-keyboard (* 4.1 12) 3.5))
(send b1 :assoc k1)
(send b1 :assoc k2)
(send b1 :assoc k3)
(send b1 :assoc k4)
(send b1 :assoc k5)
(send b1 :assoc k6)
(send b1 :assoc k7)
(send b1 :assoc k8)
(send b1 :assoc k9)
(send b1 :assoc k10)
(send b1 :assoc k11)
(send b1 :assoc k12)
(send b1 :assoc k13)
;; set instances
;; laptop body
(setq h1 (instance bodyset-link
                   :init (make-cascoords)
                   :bodies (list b1 k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13)))
;; laptop desktop
(setq s1 (instance bodyset-link
                   :init (make-cascoords)
                   :bodies (list b2 b3 b4)))
;; laptop joint
(setq j1 (instance rotational-joint
                   :init :parent-link h1
                   :child-link s1
                   :axis
                   :x))
; instance cascaded coords
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)
(objects (list r))

;; move it
(setq i 0)
(do-until-key
  (setq rad (* 90 (sin (/ i 100.0))))
  (if (< rad 60)
    (progn
      (setq vec (float-vector rad))
      (send r :angle-vector vec)
      (send *irtviewer* :draw-objects)
      (x::window-main-one)
      )
    nil
    )
  (setq i (+ i 1))
  )
