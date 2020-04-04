## Section 1.1

#### Ex1.5

Applicative order evaluation (evaluate the arguments and then apply) vs
Normal order evaluation (fully expand and then reduce)
```
define (p) (p))

  (define (test x y)
    (if (= x 0)
        0
        y))

  (test 0 (p))
```
The online [REPL](https://repl.it/@priteshshrivast/Ex15) crashed suggesting it was using applicative order evaluation, 
which is what the interpreter always uses !
