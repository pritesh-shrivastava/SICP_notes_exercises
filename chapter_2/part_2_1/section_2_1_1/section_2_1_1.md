## Arithmetic Operations for Rational Numbers

#### Operations with rational nos 
```
(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))
```

#### Representing Rational nos
```
(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
```

We can change the implementation of rational nos by bringing them to their lowest form.
But this implementation change will not affect any of the operations (eg `add-rat` or `div-rat`) we have seen above !! 

```
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) 
          (/ d g))))

;; Euclid's algorithm
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
```

#### Ex2.1

Define a better version of `make-rat` that handles both positive and negative arguments. `Make-rat` should normalize the sign so that if the rational number is positive, both the numerator and denominator are positive, and if the rational number is negative, only the numerator is negative.

_Solution_ : Check script _make_rat_improved.scm_ .
