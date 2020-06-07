
(define (cont-frac n d k)
	;; Start from k and go to 1
	(define (loop i frac-accumulator)
		(if (= i 1)
			frac-accumulator ;; Just return the fraction created from k to 1
			(loop (- i 1) (/ (n (- i 1))
							 (+ (d ( - i 1))
							 	frac-accumulator
							 )  
						  )
			)
		)	
	)

	;; Initialize tail recursive loop from i = k
	(loop k (/ (n k) (d k)))
)

;; Check by approximating the golden ratio by passing n & d to return 1 always
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11
)

