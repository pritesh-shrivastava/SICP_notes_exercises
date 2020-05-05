;#lang sicp

(define (exp_rcrsn b n)
  (if (= n 0)
      1
      (* b (exp_rcrsn b  (- n 1)))
  )
)

(define (exp_iter b n)
  (define (loop counter product)
    (if (= counter 0)
        product
	(loop (- counter 1) (* b product) )
    )
  )
	
  (loop n 1)
)

(exp_rcrsn 2 1)
(exp_iter 2 2)
(exp_rcrsn 2 3)
(exp_iter 2 4)
