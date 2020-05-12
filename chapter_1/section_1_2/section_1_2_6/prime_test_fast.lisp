(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) 
         n)
        ((divides? test-divisor n) 
         test-divisor)
        (else (find-divisor 
               n 
               (next test-divisor))
        )
  )
)

(define (divides? a b)
  (= (remainder b a) 0))


(define (next divisor)
  (if (= divisor 2) 
    3
    (+ divisor 2)
  )
)

;(smallest-divisor 199)
;(smallest-divisor 1999)
;(smallest-divisor 19999)

; Timed Prime test

(define (prime? n)
  (= n (smallest-divisor n)))

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

; Original time -> 1000000007 *** .04999999999999999
(timed-prime-test 1000000007) ; 1000000007 *** .03
; Original time -> 10000000019 *** .17000000000000004
(timed-prime-test 10000000019) ; 10000000019 *** .09999999999999998
; Original time -> 100000000003 *** .52
(timed-prime-test 100000000003) ; 100000000003 *** .31999999999999995