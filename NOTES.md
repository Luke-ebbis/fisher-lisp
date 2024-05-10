# Speed comparison with optimised C

```bash
sibbe@sibbe-ThinkPad-T15-Gen-2i ~/Documents/private/projects/programming-projects/fisher-lisp (main) $ time ./examples/fisher.out 100 9000 11 30000
8.481e-51

real	0m0.002s
user	0m0.002s
sys	0m0.000s
sibbe@sibbe-ThinkPad-T15-Gen-2i ~/Documents/private/projects/programming-projects/fisher-lisp (main) $ time ./bin/fisher 100 9000 11 30000
0.0

real	0m0.762s
user	0m0.702s
sys	0m0.060s
```
