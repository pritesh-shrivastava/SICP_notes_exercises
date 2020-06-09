;; Approximate tan(x)
(define (tan-cf x k)

	;; Denominator is just odd no : 2n-1
	(define (tan-denom i)
		(-(* 2 i) 1)
	)
	
	;; Numerator is a function of x (radians) as well as index i
	(define (tan-num i x)
		(if (= i 1 )
			x
			(- (* x x))	
		)
	)

	;; Using recursive definition of k-term finite continued fraction
	(define (cont-frac n d k)
		;; Start from 1 and go to k
 		(define (rec i) 
     		(if (> i k) 
         		0 
         		(/ (n i x) (+ (d i) (rec (+ i 1)))))) 
   		(rec 1)
	)

	(cont-frac tan-num
		       tan-denom
		       k
	)
) 

;; tan(0) == 0
(tan-cf 0 10)

;; tan(pi) == 0
(tan-cf 3.14 10)

;; tan(pi/4) == 1
(tan-cf 0.785398 10)

