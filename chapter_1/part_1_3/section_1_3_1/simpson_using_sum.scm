(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))



(define (integral f a b n)
	;; Helper constants
	(define h ( / (- b a) n ))
	;; Helper functions
	(define (y_k k) (f (+ a (* k h))))
	(define (even? x) (= (remainder x 2) 0))
	(define (inc x) (+ x 1))
	;; Calculate kth term, without h/3 multiplier
	(define (simpson_term k)
		(if (even? k) 
  			(* 2 (y_k k))
  			(* 4 (y_k k))
  		)
	)
	;; Calculate sum
	(* (/ h 3)
	   (sum simpson_term 0 inc n))
)



;(define (cube x)(* x x x)) ;; cube is a predefined function

(integral cube 0 1 100)

(integral cube 0 1 1000)