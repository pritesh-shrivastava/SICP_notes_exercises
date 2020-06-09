;; Using recursive definition of k-term finite continued fraction
(define (cont-frac n d k)
	;; Start from 1 and go to k
 	(define (rec x) 
     	(if (> x k) 
         	0 
         	(/ (n x) (+ (d x) (rec (+ x 1)))))) 
   	(rec 1)
)

;; 3n-1 or 3n+2 are 2n, else all are 1 !!
(define (di x)
	(if (= (remainder x 3) 
			2
		)
		(* 2 (/ (+ x 1) 3))
		1
	)
)



;; Approximate e
(cont-frac (lambda (i) 1.0)
		   di
		   10
)
