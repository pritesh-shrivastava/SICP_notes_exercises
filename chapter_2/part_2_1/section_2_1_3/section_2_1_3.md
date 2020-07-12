#### Ex2.4

Here is an alternative procedural representation of pairs. For this representation, verify that `(car (cons x y))` yields `x` for any objects `x` and `y`.
```
(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))
```
What is the corresponding definition of `cdr`? 
(Hint: To verify that this works, make use of the substitution model of 1.1.5.)

_Solution_ : Check script _alt_pairs.scm_ .
Also, check this great explanation on [codology.net](https://codology.net/post/sicp-solution-exercise-2-4/).

#### Ex2.5

Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair `a` and `b` as the integer that is the product `2^a * 3^b` . Give the corresponding definitions of the procedures `cons`, `car`, and `cdr`.

_Solution_ : 
