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
(defun make-keyboard nil
  (let (b)
    (setq b (make-cube 3 1 2.3))
    (send b :locate #f(25 5 0.3))
    (send b :set-color :black)
    b))

;; set objects
(setq b1 (make-laptop-base))
(setq b2 (make-laptop-desktop-front))
(setq b3 (make-laptop-desktop-back))
(setq b4 (make-laptop-axis))
(send b3 :assoc b4)
(send b2 :assoc b3)
(setq b5 (make-keyboard))
(send b1 :assoc b5)
;; set instances
(setq h1 (instance bodyset-link
                   :init (make-cascoords)
                   :bodies (list b1 b5)))
(setq s1 (instance bodyset-link
                   :init (make-cascoords)
                   :bodies (list b2 b3 b4)))
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
