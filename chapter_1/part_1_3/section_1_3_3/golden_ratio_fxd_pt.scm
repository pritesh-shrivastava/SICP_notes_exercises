;; To run in DrRacket, uncomment this line
;#lang sicp

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (newline)
    (display guess)          ;; To check the series of approximations
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (trfm x)
  (+ 1
     (/ 1 x)))

;(fixed-point trfm 1.0)  ;; Golder ratio ~ 1.6180

;; If we use average damping
(define (average x y) (/ (+ x y) 2))

(fixed-point (lambda (x) (average x (trfm x)))
             1.0)