
(define (cont-frac n d k)
	;; Start from 1 and go to k
 	(define (rec x) 
     	(if (> x k) 
         	0 
         	(/ (n x) (+ (d x) (rec (+ x 1)))))) 
   	(rec 1)
) 

;; Note that even for a pure recursive process, we had to define an inner loop because 
;; the index needed to start from 1, not k !!

;; Check by approximating the golden ratio by passing n & d to return 1 always
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)

