;; READ in the go terms.

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

(defun parse-two-tabbed-file (filename)
  "Parse the file with the go terms

  Returns a list with lists of length 2 inside of it."
    (let ((data (split-by-one-delimiter 
                             (parse-file filename)
                             '#\Newline)))
      (let ((y ()))
        (loop for x in data
              do (setq y
                       (append (list (split-by-one-delimiter x '#\Tab))
                               y)))
        (cdr y))))


(defun read-go-annotation (annotation-file-path)
  (parse-two-tabbed-file annotation-file-path))

(defun read-gene-set (gene-set)
  "Read a list of genes, each gene must be separated by a newline symbol
  Returns a list of gene symbols"
    (let ((gene-set-string (parse-file gene-set)))
      (without-last (split-by-one-delimiter gene-set-string '#\Newline))))

; example code

(let* ((v0 1)
       (v1 (* v0 2))
       (v2 (- v1))))

(defun analyse-go-files (universe set1 set2)
  (let* ((universe (parse-two-tabbed-file superset))
         (examined (parse-two-tabbed-file subset)))
    (list universe examined)))

; https://stackoverflow.com/a/2712585
(defun flatten (l)
  (cond ((null l) nil)
        ((atom l) (list l))
        (t (loop for a in l appending (flatten a)))))

; Per function annotation, the second part of the list, we sum found records

(defun filter-annotation (annotation gene-name) 
  "Filter an annotation for all records that have a gene name"
  (let ((matches ()))
    (loop for x in annotation
          do (if (string= (car x) gene-name)
                  (setq matches (cons matches (cdr x)))))
    (flatten matches)))
