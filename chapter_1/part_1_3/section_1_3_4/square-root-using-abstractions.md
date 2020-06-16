## Procedures as returned values

Square root procedure can be reformulated as :
```
(define (sqrt x)
  (fixed-point 
   (average-damp 
    (lambda (y) (/ x y)))
   1.0))
```

Similarly, for cube root, we get :
```
(define (cube-root x)
  (fixed-point 
   (average-damp 
    (lambda (y) 
      (/ x (square y))))
   1.0))
```
where, `average-damp` is defined as :
```
(define (average-damp f)
  (lambda (x) 
    (average x (f x))))
```

and `fixed-point` is defined as :
```
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
```

#### Newton's method

Derivative of a function g(x) at x :
```
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)
```

Newton's method as a fixed-point process, using `deriv` procedure :
```
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) 
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) 
               guess))
```

#### Square root using Newton's method

We will find the fixed point of the function : `y -> y^2 − x`
```
(define (sqrt x)
  (newtons-method 
   (lambda (y) 
     (- (square y) x)) 
   1.0))
```

#### Square root using 2 higher-level abstractions 

Square root as the fixed point of the average-damped version of `y -> x / y` :
```
(define (sqrt x)
  (fixed-point-of-transform 
   (lambda (y) (/ x y))
   average-damp
   1.0))
```

& using the Newton transform of the function, `y -> y^2 − x` :

```
(define (sqrt x)
  (fixed-point-of-transform 
   (lambda (y) (- (square y) x))
   newton-transform
   1.0))
)

where, `fixed-point-of-transform` is defined as :
```
(define (fixed-point-of-transform 
         g transform guess)
  (fixed-point (transform g) guess))
```