## Section 1.1

For complex procedures (function calls), there are 2 possible orders of evaluation :
- Applicative order evaluation (evaluate the arguments first and then apply function) vs
- Normal order evaluation (fully expand the function by substituting arguments and then evaluate)

#### Ex1.5

```
define (p) (p))

  (define (test x y)
    (if (= x 0)
        0
        y))

(test 0 (p))
```
Normal order evaluation wouln't have called the procedure p, because the if condition wouln't have evaluated the else clause.
The online [REPL](https://repl.it/@priteshshrivast/Ex15) crashed suggesting it was using applicative order evaluation, 
which is what the interpreter always uses !

#### Ex1.6

The normal if form is special – it evaluates its then-clause part only if the predicate is true, and its else-clause part only if the predicate is false. The new-if function proposed here evaluates both parts, always, because of applicative-order evaluation, as they are the arguments of the procedure. 

Therefore, the else-clause (sqrt-iter (improve guess x)) will be evaluated unconditionally, which never terminates causing the program to crash !!

```
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate 
                then-clause 
                else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(sqrt 100)
```
