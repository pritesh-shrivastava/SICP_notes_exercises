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

Newton's Method (also called the Newton-Raphson method) is a recursive algorithm for approximating the root of a differentiable function. 

The Newton-Raphson method is a method for approximating the roots of polynomial equations of any order. In fact the method works for any equation, polynomial or not, as long as the function is differentiable in a desired interval. 

In order to explain Newton's method, imagine that x 0 {\displaystyle x_{0}} x_{0} is already very close to a 0 of f ( x ) {\displaystyle f(x)} f(x) . We know that if we only look at points very close to x 0 {\displaystyle x_{0}} x_{0} then f ( x ) {\displaystyle f(x)} f(x) looks like its tangent line. If x 0 {\displaystyle x_{0}} x_{0} was already close to the place where f ( x ) {\displaystyle f(x)} f(x) was 0, and near x 0 {\displaystyle x_{0}} x_{0} we know that f ( x ) {\displaystyle f(x)} f(x) looks like its tangent line, then we hope the 0 of the tangent line at x 0 {\displaystyle x_{0}} x_{0} is a better approximation then x 0 {\displaystyle x_{0}} x_{0} itself.

The equation for the tangent line to f ( x ) {\displaystyle f(x)} f(x) at x 0 {\displaystyle x_{0}} x_{0} is given by

  `  y = f ′ ( x 0 ) ⋅ ( x − x 0 ) + f ( x 0 ) {\displaystyle y=f'(x_{0})\cdot (x-x_{0})+f(x_{0})} {\displaystyle y=f'(x_{0})\cdot (x-x_{0})+f(x_{0})} `

Now we set y = 0 {\displaystyle y=0} y=0 and solve for x {\displaystyle x} x .

  `  0 = f ′ ( x 0 ) ⋅ ( x − x 0 ) + f ( x 0 ) {\displaystyle 0=f'(x_{0})\cdot (x-x_{0})+f(x_{0})} `
[Wiki](https://en.wikibooks.org/wiki/Calculus/Newton%27s_Method)

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