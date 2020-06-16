;; cubic is a procedure that returns a function of x
(define (cubic a b c)
    (lambda (x)
        (+ (cube x)           ;; pre-defined procedure
        (* (square x) a)   ;; pre-defined procedure
        (* x b)
        c
        )
    )
)

;; Derivative of a function g(x) at x is needed for Newton's method :
(define (deriv g)
  (lambda (x)
    (/ (- (g (+ x dx)) (g x))
       dx)))

(define dx 0.00001)

;; Fixed point procedure is needed for Newton's method
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (newline)              ;; To display the results of ...
    (display guess)        ;; ... subsequent iterations
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;; Newton's method as a fixed-point process, using `deriv` and `fixed-point` procedures :
(define (newton-transform g)
  (lambda (x)
    (- x (/ (g x) 
            ((deriv g) x)))))

(define (newtons-method g guess)
  (fixed-point (newton-transform g) 
               guess))


;; Use Newton's method to find roots of cubic polynomial 
;; with some sample values of cubic's arguemnts for testing
(define a 1)
(define b 1)
(define c 1)
(newtons-method (cubic a b c) 1.0)