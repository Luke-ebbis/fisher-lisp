(defun parse-file (file-path)
  "Read the contents of the file at the specified path and return as string."
  (with-open-file (stream file-path
                          :direction :input
                          :element-type 'character
                          :if-does-not-exist nil)
    (if stream
        (let ((contents (make-string (file-length stream))))
          (read-sequence contents stream)
          contents)
        (error "Failed to open file: ~A" file-path))))
(defun split-by-one-delimiter (string delimiter) 
  "Returns a list of substrings of string divided by ONE space each. 
  Note: Two consecutive spaces will be seen as if there were an empty string 
  between them." 
  (loop 
    for i = 0 then (1+ j) 
    as j = (position delimiter  string :start i) 
    collect (subseq string i j) 
    while j))

(defun without-last(l)
    "Return a list without the last element"
    (reverse (cdr (reverse l))))

; Parse two-column tabbed file
(defun parse-two-tabbed-file (filename)
    (let ((data (car (split-by-one-delimiter 
                      (car (split-by-one-delimiter 
                             (parse-file filename)
                             '#\Newline))
                      '#\Tab)))) 
      data))

