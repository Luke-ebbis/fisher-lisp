(load "src/fisher.lisp")
(declaim (sb-ext:muffle-conditions cl:warning))
;; Test code
(defun approx-equal (x y &optional (epsilon 1.0e-5))
  "Test if two floats are approximately equal within a given epsilon.
  Made with the help of Chatjippity"
  (<= (abs (- x y)) epsilon))

(assert (eql (factorial 4) 
             24))
(assert (eql (factorial 0) 
             1))
(assert (eql (factorial 1) 
             1))
(assert (approx-equal 
          (float (fisher-p 1 9 11 3))
          0.001346076))

(load "src/go.lisp")
(setq testData 
      (parse-two-tabbed-file "resources/test/test"))

(print testData)
(pprint "test sucessful!")
; (print (split-by-one-delimiter (parse-file "resources/test/test") '#\Newline))
(terpri)
(quit)
