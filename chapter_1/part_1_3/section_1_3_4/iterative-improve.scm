(define (iterative-improve good-enough? improve)
    (lambda (guess) 
        (if (good-enough? guess)
            guess
            ((iterative-improve good-enough? improve) (improve guess))
        )
    )
)

;; sqrt procedure of Section 1.1.7
;(define (sqrt-iter guess x)
;  (if (good-enough? guess x)
;      guess
;      (sqrt-iter (improve guess x) x)
;  )
;)

(define (sqrt-new x)
    (define tolerance 0.0001)
    (define (good-enough? guess)
        (<  (abs(- x (* guess guess)))
            tolerance
        )
    )
    
    (define (improve guess)
      (/ (+ guess (/ x guess))
         2
      )
    )

    ((iterative-improve good-enough? improve) 1.0)
)
(sqrt-new 64)

;; Fixed point of Section 1.3.3
;(define (fixed-point f first-guess)
;  (define (close-enough? v1 v2)
;    (< (abs (- v1 v2)) 
;       tolerance))
;  (define (try guess)
;    (let ((next (f guess)))
;      (if (close-enough? guess next)
;          next
;          (try next))))
;  (try first-guess))

(define (fixed-point-new f)
    (define tolerance 0.0001)
    (define (good-enough? guess)
        (<  (abs (- guess 
                    (f guess)
                 )
            )
            tolerance
        )
    )

    (define (improve guess)
        (f guess)
    )

    ((iterative-improve good-enough? improve) 1.0)
)
(fixed-point-new cos)
(fixed-point-new (lambda (x) (+ (* x x) (* -3 x) 4))  ;; 2 is fixed point of f(x) = x^2 -3x + 4
)

