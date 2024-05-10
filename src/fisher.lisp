;; The Fisher test implemented in lisp
;; For now I only implemented 2×2 tables.
;; r×c tables are on my todo list.

(defun factorial (n)
  "Calculate the factorial of n, known as n!"
  ; 0! = 0
  (cond ((eql n 0) 1)
        ; Here we calculate (n -1)! × n = n!
        (t (* n (factorial (- n 1))))))

(defun choose (n k)
    "Binomial coeficient"
    (/ (factorial n) 
       ( * (factorial k)
           (factorial (- n k)))))

; (defun fisher-odds-ratio (a b c d))

(defun fisher-p (a b c d)
  "The Fisher exact test p value "
  (let ((n (+ a b c d)))
   (/ ( * (choose (+ a c) a)
          (choose (+ b d) b)
          (factorial (+ a b))
          (factorial (+ c d)))
     (factorial n))))

;; TODO calculate the confidence intervals, and the odds ratio. Allow for
;; alternatives

(defun main ()
  "Run the fisher test. Compilation written with the help of chat GPT"
  (let ((a (parse-integer (nth 1 sb-ext:*posix-argv*)))
        (b (parse-integer (nth 2 sb-ext:*posix-argv*)))
        (c (parse-integer (nth 3 sb-ext:*posix-argv*)))
        (d (parse-integer (nth 4 sb-ext:*posix-argv*))))
    (format t "~a~%" 
            (float (fisher-p a b c d)))))


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
(assert (approx-equal (float (fisher-p 1 9 11 3)) 0.001346076))
