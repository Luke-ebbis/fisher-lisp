(defun factorial (n)
  "Calculate the exact factorial of n"
  ; n! = 1
  (cond ((eql n 0) 1)
        ; 0! = 1
        ((eql n 1) 1)
        ; Here we calculate (n -1)! × n = n!
        (t (* n (factorial (- n 1))))))

