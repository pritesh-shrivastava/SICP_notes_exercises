#lang racket

;; Defining helper functions
 (define (accumulate op initial sequence) 
   (if (null? sequence) 
       initial 
       (op (car sequence) 
           (accumulate op initial (cdr sequence))))) 

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map (car seqs)))
            (accumulate-n op init (map (cdr seqs)))
      )
  )
)

;; Define matrix operations
(define (dot-product v w)
  (accumulate + 0 (map * v w))
)

(define (matrix-*-vector m v)
  (map (lambda (m-row)(dot-product m-row v) m) )
)

(define (transpose mat)
  (accumulate-n cons nil mat)
)

(define (matrix-*-matrix m n)
  (let ((n-cols (transpose n)))
    (map (lambda (m-row)(matrix-*-vector n-cols m-row)) m)
  )
)

;; For testing
(define mat1 (list (list 1 2 3) (list 4 5 6) (list 7 8 9))) 
(define mat2 (list (list 1 0 0) (list 0 1 0) (list 0 0 1))) 

(define vec1 (list 1 2 3) )
(define vec2 (list 4 5 6) )

;; test cases
(dot-product vec1 vec2)

(transpose mat1)
(transpose mat2)

(matrix-*-vector mat2 vec1)

(matrix-*-matrix mat2 mat1)
