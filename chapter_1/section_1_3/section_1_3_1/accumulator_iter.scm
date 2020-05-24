(define (accumulator_iter combiner null-value term a next b)
  (define (loop i result)
    (if (> i b)
        result
        (loop  (next i) 
        	     (combiner (term i) 
                         result
            	 )
       	)
    )
  )
  (loop a null-value)
)

;; Testing
(define (sum term a next b)
  (accumulator_iter + 
        0
        term
        a
        next
        b
  )
)

(define (product term a next b)
  (accumulator_iter * 
        1
        term
        a
        next
        b
  )
)

(define (inc x) (+ x 1))
(define (id x) x)

(sum square 3 inc 5)
(product id 1 inc 4)
