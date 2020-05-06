;#lang sicp
(define (even? x) (= (remainder x 2) 0))

(define (double x) (+ x x)) ; * is not defined in the language

(define (halve x) (/ x 2))

(define (fast_multiply a b)
	
	(display a) (display " & ")  ;; For debugging
	(display b) (newline)
	(cond 
		(
			(= b 0) 0
		)
		(
			;(even? b) (fast_multiply (double a) (halve b) )  ; converting this part to tailrec; Beware extra brackets cause errors !!
			(even? b) ( double (fast_multiply a (halve b) ) )
		)
		(
			else (+ a (fast_multiply a (- b 1) ) )
		)
	)
)

(halve 2)
(double 1)
(fast_multiply 2 1)
(fast_multiply 2 2)
(fast_multiply 3 7)
(fast_multiply 2 9)
(fast_multiply 4 8)