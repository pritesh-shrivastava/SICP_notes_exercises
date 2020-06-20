;; Average Damp
(define (average-damp f)
  (lambda (x) 
    (/ (+ x (f x))
       2)
  )
)

;; Fixed point
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) 
       tolerance))
  (define (try guess)
    (newline)             ;; To check
    (display guess)       ;; To check iterations and convergence
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))


;; Cube root
(define (cube-root x)
  (fixed-point 
        (average-damp 
            (lambda (y) 
                (/ x (square y)))
        )
        1.0)
)

;(cube-root 27)  ;; Average damping once works for square & cube roots

;; Helper functions for repeated
(define (compose f g)
    (lambda (x) 
        (f (g x))
    )
)

(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))
    )
)


;; 4th root
(define (fourth-root x)
    (fixed-point 
        ((repeated average-damp 2) 
            (lambda (y) 
                (/ x 
                   (* y y y)
                )
            )
        )
        1.0
    )
)

;;(fourth-root 16)  ;; Average damping once doesn't converge, converges after applying it twice !!

;; 5th root
(define (fifth-root x)
    (fixed-point 
        ((repeated average-damp 2) 
            (lambda (y) 
                (/ x 
                   (* y y y y)
                )
            )
        )
        1.0
    )
)

;(fifth-root 32)  ;; Converges with 2 avg dampings

;; 6th root
(define (sixth-root x)
    (fixed-point 
        ((repeated average-damp 2) 
            (lambda (y) 
                (/ x 
                   (* y y y y y)
                )
            )
        )
        1.0
    )
)

;(sixth-root 64)  ;; Converges with twice avg dampings

;; 7th root
(define (seventh-root x)
    (fixed-point 
        ((repeated average-damp 2) 
            (lambda (y) 
                (/ x 
                   (* y y y y y y)
                )
            )
        )
        1.0
    )
)

;(seventh-root 128)  ;; Converges with 2 avg dampings

;; 8th root
(define (eigth-root x)
    (fixed-point 
        ((repeated average-damp 3) 
            (lambda (y) 
                (/ x 
                   (* y y y y y y y)
                )
            )
        )
        1.0
    )
)

;(eigth-root 256)  ;; Needs 3 dampings (log 8 with base 2)

;; nth root

; Helper function to calculate y^(n-1)
(define (expt x n)
    (if (= n 0)
        1
        (* x 
           (expt x (- n 1))
        )
    )
)

(define (rep_needed n)
    (floor (/ (log n) (log 2))) 
)   ;; Integer part of log n base 2
        
(define (nth-root x n)
    (fixed-point
        (   
            (repeated average-damp (rep_needed n)) 
                (lambda (y) 
                    (/  x 
                        (expt y (- n 1))
                    )
                )
        )
        1.0
    )
)

(nth-root 1024 10)
(nth-root 243 5)


