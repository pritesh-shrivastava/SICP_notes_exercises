#### Lambda procedures

The sum of a sequence of terms in the series, 
```
1/ (1 ⋅ 3) + 1/ (5 ⋅ 7) + 1/(9 ⋅ 11) + … ~  π / 8 (converges very slowly)
```
can be evaluated using the generic sum function from Section 1.3.1 as :
```
(define (pi-sum a b)
  (sum (lambda (x) (/ 1.0 (* x (+ x 2))))
       a
       (lambda (x) (+ x 4))
       b
  )
)
```
Again using lambda, we can write the integral procedure without having to define the auxiliary procedure add-dx:
```
(define (integral f a b dx)
  (* (sum f 
  		  (+ a (/ dx 2.0))
          (lambda (x) (+ x dx))
          b
     )
     dx
  )
)
```
#### Ex1.34

Suppose we define the procedure
```
(define (f g) (g 2))
```
Then we have
```
(f square)
4
(f (lambda (z) (* z (+ z 1))))
6
```
What happens if we (perversely) ask the interpreter to evaluate the combination `(f f)` ? Explain. 

_Solution_ :

Normal order evaluation (expand function definition first, then evaluate arguments) - 
```
(f f)  ;; Expand definition
(f 2)  ;; Expand again
(2 2)
```
Error : The object 2 is not applicable

Trace is similar for applicative order evaluation (?!).