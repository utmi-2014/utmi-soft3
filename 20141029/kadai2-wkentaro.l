;; P20
;; 3 練習問題
;; Kentaro Wada <www.kentaro.wada@gmail.com>

;; make-funcs
(defun make-cylinder nil
  (let (b)
    (setq b (make-solid-of-revolution '(#f(0 0 10) #f(28 0 10) #f(28 0 80) #f(30 0 80) #f(30 0 0) #f(0 0 0))))
    (send b :locate #f(0 0 -80))
    (send b :set-color :gray20)
    b))
(defun make-piston nil
  (let (b)
    (setq b (make-solid-of-revolution '(#f(27 0 60) #f(27 0 0))))
    b))

(setq h1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-cylinder))))
(setq s1 (instance bodyset-link :init (make-cascoords) :bodies (list (make-piston))))
(setq j1 (instance linear-joint :init :parent-link h1 :child-link s1 :axis :z))
;; instance cascaded coords
(setq r (instance cascaded-link :init))
(send r :assoc h1)
(send h1 :assoc s1)
(setq (r . links) (list h1 s1))
(setq (r . joint-list) (list j1))
(send r :init-ending)

;; draw objects
(objects (list r))

;; make piston move
(setq i 0)
(do-until-key
  (send r :angle-vector (float-vector (* 30 (sin (/ i 1.0)))))
  (send *irtviewer* :draw-objects)
  (x::window-main-one)
  (setq i (+ i 1))
  )
