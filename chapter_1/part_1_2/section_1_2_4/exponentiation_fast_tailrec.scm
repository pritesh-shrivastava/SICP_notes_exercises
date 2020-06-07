(define (is_even x) (= (remainder x 2) 0))

(define (square x) (* x x))

(define (fast_expt_iter b n)

	(define (iter base power a)
		(cond 
			( (= power 0) a) 
			( (is_even power) (iter (square base) (/ power 2) a ) )
			( else (iter base (- power 1) (* a base) ) )
	  	)
	)

	(iter b n 1)

)

(fast_expt_iter 2 3)
(fast_expt_iter 3 5)
