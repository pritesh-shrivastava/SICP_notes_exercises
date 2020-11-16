(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op 
                      initial 
                      (cdr sequence))
      )
  )
)

;; Horner's rule optimizes the no of * & + steps to a minimum
(define (horner-eval x coefficient-sequence)
  (accumulate 
    (lambda (this-coeff higher-terms) (+ this-coeff (* x higher-terms)))
    0
    coefficient-sequence
  )
)


;; testing
;;  1 + 3 x + 5 x^3 + x^5 at x = 2 gives 79
(horner-eval 2 (list 1 3 0 5 0 1))