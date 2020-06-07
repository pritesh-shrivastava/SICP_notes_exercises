
(define (cont-frac n d k)
	(define (loop i frac-accumulator)
		(if (= i k)
			(frac-accumulator) ;; ??
			(loop (+ i 1) (/ (n i)
							 (d i)
						  )
			)
		)	
	)

	(loop 1 ??)

)




;; Start from k and go to 1





;; Check by approximating the golden ratio by passing n & d to return 1 always
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

