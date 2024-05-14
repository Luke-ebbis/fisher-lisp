;; Compile the main function
(load "src/fisher.lisp")
(sb-ext:save-lisp-and-die 
  "bin/fisher" 
  :executable t 
  :toplevel 'main-fisher-test)
