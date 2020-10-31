;; Accumulate procedure
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


;; map
(define (my-map p sequence)
  (accumulate (lambda (x acc) (cons (p x) acc) )  
              '() 
              sequence
  )
)

;; testing
(my-map square (list 1 2 3))

;; the trickiest thing about these accumulate problems is how accumulates works. Consider a 2 item seq.
;; accumulate for 2 item seq: 
;; (op (car seq) (op (car (cdr seq)) initial)) 
;; append
(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1)
)

;;testing
(my-append (list 1 2 3) (list 4 5 6))

;; length
(define (my-length sequence)
  (accumulate (lambda (x acc) (+ 1 acc)) 0 sequence))

;; testing
(my-length (list 1 2 3 4 5 6 7))
