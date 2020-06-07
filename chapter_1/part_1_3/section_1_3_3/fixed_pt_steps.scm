;; To run in DrRacket, uncomment this line
;#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (newline)
    (display guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (trfm x)
  (/ (log 1000)
     (log x)
  )
)

;(fixed-point trfm 2.0)  ;; Take first guess as 2 because dividing by (log 1) will lead to NA

;; If we use average damping
(define (average x y) (/ (+ x y) 2))

(fixed-point (lambda (x) (average x (trfm x)))
             2.0)