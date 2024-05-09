;; The Fisher test

(defun factorial (n)
  "Calculate the factorial of n, known as n!"
  ; 0! = 0
  (cond ((eql n 0) 1)
        ; Here we calculate (n -1)! × n = n!
        (t (* n (factorial (- n 1))))))

;; Test code
(assert (eql (factorial 4) 24))
(assert (eql (factorial 0) 1))
(assert (eql (factorial 1) 1))
