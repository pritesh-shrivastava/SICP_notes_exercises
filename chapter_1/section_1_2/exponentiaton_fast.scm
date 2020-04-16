#lang sicp
(define (fast-expt b n)
  (cond ( (= n 0) 1) 
	( (is_even n) (square (fast-expt b (/ n 2))))
	( else (* b (fast-expt b (- n 1)))))
  (define (is_even x) (= (remainder x 2) 0))
  (define (square x) (* x x))
)

(fast-expt 2 2)