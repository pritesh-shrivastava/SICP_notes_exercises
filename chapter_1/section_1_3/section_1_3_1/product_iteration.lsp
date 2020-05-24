;; Defining product recursively
(define (product term a next b)
  (if (> a b)
      1 ;; Identity for multiplication, like 0 is identity for sum
      (* (term a)
         (product term (next a) next b)
      )
  )
)


(define (product_iter term a next b)
	(define (loop i accumulator)
		(if (> i b)
			accumulator
			(loop (next i) (* accumulator (term i)))
		)
	)
	(loop a 1)
)

;; For testing
(define (inc x) (+ x 1))

(define (pi-term n) 
   (if (even? n)                 ;; even? is a predefined function in MIT-Scheme
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2))))

(* 4.0 (product_iter pi-term 1.0 inc 100)) 

