;; The Fisher test implemented in lisp
;; For now I only implemented 2×2 tables.
;; r×c tables are on my todo list.

(defun factorial (n)
  "Calculate the factorial of n, known as n! exactly"
  ; 0! = 0
  (cond ((eql n 0) 1)
        ; Here we calculate (n -1)! × n = n!
        (t (* n (factorial (- n 1))))))

(defun choose (n k)
    "Binomial coeficient"
    (/ (factorial n)
       ( * (factorial k)
           (factorial (- n k)))))

; the odds ratio is the ratio of the rows devided per column
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
(defun main-fisher-test ()
  "Run the fisher test. Compilation written with the help of chat GPT"
  (let ((args sb-ext:*posix-argv*))
    (if (< (length args) 5)
        (error "Not enough arguments provided. Please provide exactly 4 arguments.")
        (let ((a (parse-integer (nth 1 args)))
              (b (parse-integer (nth 2 args)))
              (c (parse-integer (nth 3 args)))
              (d (parse-integer (nth 4 args))))
          (format t "~a~%" (float (fisher-p a b c d)))))))


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
