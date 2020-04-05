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

#### Ex1.7

The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

_Solution_ : Instead of having an threshold of absolute difference, we have used a threshold of % error threshold, so this can take care of both small and large nos alike as shown below

```
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y) 
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< 
		(abs 
			(/ (- (square guess) x) x)
		) 
		0.001)
	)


(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 0.0001)
```

#### Ex1.8

Newton’s method for cube roots is based on the fact that if y is an approximation to the cube root of x, then a better approximation is given by the value : (x/y^2+2y) / 3
Use this formula to implement a cube-root procedure analogous to the square-root procedure.

```
(define (cbrt x)
  (cbrt-iter 1.0 x))

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x) x)))

(define (improve guess x)
  (/ 
		(+ 
			(/ x 
				(square guess)
			) 
			(* 2 guess)
		)
		3
	)
)


(define (good-enough? guess x)
  (< 
		(abs 
			(/ (- (cube guess) x) x)
		) 
		0.001)
	)

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))


(cbrt 1000)
```
