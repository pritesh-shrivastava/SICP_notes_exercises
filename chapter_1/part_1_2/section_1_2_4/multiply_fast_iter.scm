;#lang sicp
(define (even? x) (= (remainder x 2) 0))

(define (double x) (+ x x)) ; * is not defined in the language

(define (halve x) (/ x 2))

(define (fast_multiply_iter a b)
	;(display a) (display " & ")  ;; For debugging
	;(display b) (newline)
	(define  (iter A B inv)
		(cond 
			(
				(= B 0) inv
			)
			(
				(even? B) (iter (double A) (halve B) inv)  ; extra brackets cause errors !!
			)
			(
				else (iter A (- B 1) (+ A inv))
			)
		)
	)

	(iter a b 0)
)

(halve 2)
(double 1)
(fast_multiply_iter 2 1)
(fast_multiply_iter 2 2)
(fast_multiply_iter 3 7)
(fast_multiply_iter 2 9)
(fast_multiply_iter 4 8)