; Primality test using Fermat test

(define (square m)  
   (display "square ")(display m)(newline) 
   (* m m)) 

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

;; Replace expmod with fast_expt function
(define (is_even x) (= (remainder x 2) 0))

(define (fast_expt b n)
  (cond ( (= n 0) 1) 
  ( (is_even n) (square (fast_expt b (/ n 2))))
  ;( (is_even n) (fast_expt (square b) (/ n 2)))  ;; Can make this process tail-recursive
  ( else (* b (fast_expt b (- n 1))))
  )
)

(define (expmod_new base exp m)
  (remainder (fast_expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod_new a n n) a))
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


(expmod 5 101 101)
(expmod_new 5 101 101)

(timed-prime-test 101) ; 1.0e-2
(timed-prime-test 139)  ; 0.
; Original 100003 *** 0.
(timed-prime-test 100003) ; 67.82 !!
; Original 1000000007 *** .06
(timed-prime-test 1000000007) ; Still running !!
; Original 1000000009 *** .04999999999999999
