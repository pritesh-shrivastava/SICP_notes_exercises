(define (filtered-accumulate combiner null-value term a next b filter)
	(if (> a b)
		null-value
		(combiner   (if (filter a)
						(term a)
						null-value)
         			(filtered-accumulate combiner null-value term (next a) next b filter))
	)
)

; Sum of prime nos from a to b
;; Primality test using smallest-divisor procedure
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n)    ;; square is a pre defined function !!
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; Sum of squares using filtered-accumulate
(define (inc x) (+ x 1))

(define (sum-sq-prime a b)
	(filtered-accumulate + 0 square a inc b prime?)
)
(sum-sq-prime 2 8)

;; Product of all positive integers less than such that GCD (i, n) == 1
(define (id x) x)
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (relative-prime? m n) 
 (= (gcd m n) 1)) 

(define (product-rel-prime n)
	(define (filter a)     ;; Filter such that a is relatively prime to n
		(relative-prime? a n))
	(filtered-accumulate * 1 id 1 inc n filter)
)

(product-rel-prime 10)
