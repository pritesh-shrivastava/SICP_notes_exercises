; Primality test using Fermat test
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else false)))

; Timed test
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 100)
      (report-prime (- (runtime) 
                       start-time)
      )
      (display " not prime")  
  )
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(timed-prime-test 101) ; 0.
(timed-prime-test 139)  ; 0.
; 100003 *** 0.
(timed-prime-test 100003) ; 1.0e-2
; 1000000007 *** .06
(timed-prime-test 1000000007) ; 1.0e-2
; 1000000009 *** .04999999999999999
(timed-prime-test 1000000009)   ; 9.999999999999981e-3
; 10000000019 *** .16000000000000003
(timed-prime-test 10000000019)  ; 1.0e-2
; 10000000033 *** .15999999999999992
(timed-prime-test 10000000033)  ; 1.99e-2
; 100000000003 *** .5999999999999999
(timed-prime-test 100000000003) ; 2.0e-2
; 100000000019 *** .54
(timed-prime-test 100000000019) ; 9.9e-3
