(define (integral f a b n)
	;; Using Simpson's rule
	(define h ( / (- b a) n ))

	(define (simpson_term k)
		(define (y_k k) (f (+ a (* k h))))
  		(define (even? x) (= (remainder x 2) 0))
		(if (even? k) 
  			(* 2 (y_k k))
  			(* 4 (y_k k))
  		)
	)
	
	(define (loop k accumulator)
		(if (> k n)
			accumulator
			(loop (+ k 1)
				  (+ accumulator (simpson_term k)))
		)
	)
	

	(* (/ h 3)
	   (loop 0 (f a))
	)
)



;(define (cube x)(* x x x)) ;; cube is a predefined function

(integral cube 0 1 100)

(integral cube 0 1 1000)