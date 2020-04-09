(define (fib_tree_rcrsn n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib_tree_rcrsn (- n 1))
                 (fib_tree_rcrsn (- n 2))))))



(define (fib_iter n) 
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))
