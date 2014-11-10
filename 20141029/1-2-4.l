;; P7

(load "make-funcs.l")

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-hinji))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-servo))))
(setq j1 (instance rotational-joint :init :parent-link h1 :child-link s1 :axis :z))
;; instance cascaded coords
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

;; draw objects
(objects (list r))

;; make servo move
(setq i 0)
(do-until-key
  (send r :angle-vector (float-vector (* 90 (sin (/ i 100.0)))))
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
  (setq i (+ i 1))
  )
