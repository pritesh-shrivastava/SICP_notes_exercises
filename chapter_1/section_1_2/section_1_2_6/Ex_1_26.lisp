;; Primality test using Fermat test

;; For debugging
(define (display-all . rest) (display rest))

;; Expmod procedure
(define (expmod base expt m)
	(newline)
	(display-all "expmod " base expt m)
	(cond ((= expt 0) 1)
        ((even? expt)
         (remainder 
          (square (expmod base (/ expt 2) m))
          m))
        (else
         (remainder 
          (* base (expmod base (- expt 1) m))
          m)))
)

;; Replace expmod with fast_expt function
(define (is_even x) (= (remainder x 2) 0))

(define (fast_expt b n)
  (cond ( (= n 0) 1) 
  ( (is_even n) (square (fast_expt b (/ n 2))))
  ;( (is_even n) (fast_expt (square b) (/ n 2)))  ;; Can make this process tail-recursive
  ( else (* b (fast_expt b (- n 1))))
  )
)

(define (expmod_new base expt m)
	(newline)
	(display-all "expmod_new " base expt m)
  (cond ((= expt 0) 1
        )
        ((even? expt)
         (remainder 
          (* (expmod_new base (/ expt 2) m)
             (expmod_new base (/ expt 2) m))
          m)
        )
        (else
         (remainder 
          (* base 
             (expmod_new base (- expt 1) m))
          m)
        )
  )
)
  	

;; Fermat's test for Prime nos - trying with only 1 value of a
(define (fermat-test n)
  (define (try-it a)
    ;(= (expmod a n n) a)       ;; Original expmod function
    (= (expmod_new a n n) a)  ;; Replacing square with * in expmod
  )	
  (try-it (+ 1 (random (- n 1))))
)

;; Repeating Fermat's test for a given no of "times"
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else false)))

;; Timed test -> Wil try 10 different values of 'a' in Fermat's test
(define (timed-prime-test n)
  ;(newline)
  ;(display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) 
                       start-time)
      )
      (display " not prime")  
  )
)

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))


(timed-prime-test 101)
(timed-prime-test 103)	;; 
(timed-prime-test 107)
(timed-prime-test 109)
(timed-prime-test 307) 	;; 
(timed-prime-test 661)
(timed-prime-test 139)
(timed-prime-test 1009)
(timed-prime-test 1019)	;; 
(timed-prime-test 1021) ;; 
; Original expmod -> 100003   expmod_new -> 
(timed-prime-test 100003) ; 
; Original expmod -> 1000000007  ; expmod_new -> 
(timed-prime-test 1000000007)
