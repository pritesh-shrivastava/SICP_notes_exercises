(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum_iter term a next b)
  (define (iter i result)
    (if (> i b)
        result
        (iter (next i) 
        	  (+ (term i) 
        	  	 result
        	  )
       	)
    )
  )
  (iter a 0)
)

;; To test
(define (inc x)(+ x 1))

(sum square 3 inc 5)
(sum_iter square 3 inc 5)

(define (pi-sum a b) 
  (define (pi-term x) 
          (/ 1.0 (* x (+ x 2)))) 
  (define (pi-next x) 
          (+ x 4)) 
  (sum_iter pi-term a pi-next b)
) 

(* 8 (pi-sum 1 1000))