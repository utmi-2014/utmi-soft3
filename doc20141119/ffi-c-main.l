;; ffi-c-main.l
;; P6

(setq m (load-foreign "./ffi-c.so"))
(defforeign sinc m "sinc" (:float) :float)
(defforeign hello m "hello" (:string) :integer)
(format t "sinc=~a~%" (sinc 1.0))
(format t "hello ")
(hello "world")