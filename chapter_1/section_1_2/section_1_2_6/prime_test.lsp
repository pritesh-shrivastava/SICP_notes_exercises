; Primality test using smalles-divisor procedure
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

; Timed test
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time)
      )
      (display " not prime")  
  )
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;(timed-prime-test 101)
;(timed-prime-test 139)
;(timed-prime-test 299)

; Search for primes
(define (search-for-primes a b)
	(cond 
		( (> a b) 
			(newline)
			(display " End of range")
		)
		( (divides? 2 a) (search-for-primes (+ a 1) b) )
		;( (prime? a) a)
		( else
			(timed-prime-test a) 
			(search-for-primes (+ a 2) b)
		)
	)	
)

; (search-for-primes 1000 1100)     	; Time elapsed for all these 100 nos was 0. Computers today are much faster than 30 years ago !
; (search-for-primes 10000 10100)   	; Time elapsed for all these 100 nos was 0.
; (search-for-primes 100000 100100) 	; Time elapsed for all these 100 nos was 0.
; (search-for-primes 1000000 1000100) 	; Time elapsed for all these 100 nos was 0.
; (search-for-primes 10000000 10000100) 		; Time elapsed for 10000079 *** 1.0000000000000009e-2
; (search-for-primes 100000000 100000100) 		; Time elapsed for 100000081 *** 2.0000000000000018e-2
; (search-for-primes 1000000000 1000000100) 	; Time elapsed for 1000000007 *** .12
; (search-for-primes 10000000000 10000000100) 	; Time elapsed for 10000000019 *** .37
(search-for-primes 100000000000 100000000100) 	; Time elapsed for 100000000003 *** 1.17
