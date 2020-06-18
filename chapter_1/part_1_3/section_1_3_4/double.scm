;#lang sicp  ;; For DrRacket IDE

(define (inc x)
    (newline)
    (display x)
    (+ x 1)
)

(define (double f)
    (lambda (x) 
        (f (f x))
    )
)

((double inc) 1)  ;; Apply double procedure on inc, then apply that compounded procedure on 1

(((double (double double)) inc) 5)