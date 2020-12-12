#### Filter & Accumulate functions

Filter procedure :
```
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate 
                       (cdr sequence))))
        (else  (filter predicate 
                       (cdr sequence)))))
```

Accumulate procedure :
```
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
```
Procedure to enumerate a tree, ie, take a nested list & return a list of all elements in left->right order
```
(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append 
               (enumerate-tree (car tree))
               (enumerate-tree (cdr tree)))
        )
  )
)
```

Examples of a signal-processing program -> like the magrittr chains with dplyr in R:
Sum of odd squares in a tree - original
```
(define (sum-odd-squares tree)
  (cond ((null? tree) 0)
        ((not (pair? tree))
         (if (odd? tree) (square tree) 0))
        (else (+ (sum-odd-squares (car tree))
                 (sum-odd-squares (cdr tree))
              )
        )
  )
)
```
Sum of odd squares in a tree - As a signal processing flow :
```
(define (sum-odd-squares tree)
  (accumulate 
   +
   0
   (map square
        (filter odd?
                (enumerate-tree tree)
        )
   )
  )
)
```

Another example - find the list of even Fibonacci nos less than or equal to Fib(n):
Original implementation:
```
(define (even-fibs n)
  (define (next k)
    (if (> k n)
        nil
        (let ((f (fib k)))
          (if (even? f)
              (cons f (next (+ k 1)))
              (next (+ k 1))
          )
        )
    )
  )
  (next 0)
)
```
Now, `even-fibs` as a sequence of operations like in a signal processing flow:
```
(define (even-fibs n)
  (accumulate 
   cons
   '()
   (filter even?
           (map fib
                (enumerate-interval 0 n)))))
```

Another example, the list of squares of Fib nos < Fib(n):
```
(define (list-fib-squares n)
  (accumulate 
   cons
   nil
   (map square
        (map fib
             (enumerate-interval 0 n)))))
```

#### Ex2.33

Fill in the missing expressions to complete the following definitions of some basic list-manipulation operations as accumulations:
```
(define (map p sequence)
  (accumulate (lambda (x y) ⟨??⟩) 
              nil sequence))

(define (append seq1 seq2)
  (accumulate cons ⟨??⟩ ⟨??⟩))

(define (length sequence)
  (accumulate ⟨??⟩ 0 sequence))
```

_Solution_ : See script `hof_accumulate.scm`.


#### Ex2.34

Evaluating a polynomial in x at a given value of x can be formulated as an accumulation. We evaluate the polynomial
`a_n x^n + a_n − 1 x^n − 1 + ⋯ + a 1 x + a 0`
using a well-known algorithm called Horner’s rule, which structures the computation as
( … ( a n x + a n − 1 ) x + ⋯ + a 1 ) x + a 0 .
In other words, we start with a n , multiply by x , add a n − 1 , multiply by x , and so on, until we reach a 0 .82

Fill in the following template to produce a procedure that evaluates a polynomial using Horner’s rule. Assume that the coefficients of the polynomial are arranged in a sequence, from a 0 through a n .
```
(define 
  (horner-eval x coefficient-sequence)
  (accumulate 
   (lambda (this-coeff higher-terms)
     ⟨??⟩)
   0
   coefficient-sequence))
```
For example, to compute `1 + 3 x + 5 x 3 + x 5 at x = 2` you would evaluate
`(horner-eval 2 (list 1 3 0 5 0 1))`

_Solution_ : Check _horners_rule.scm_ .


#### Ex2.35

Redefine count-leaves from 2.2.2 as an accumulation:
```
(define (count-leaves t)
  (accumulate ⟨??⟩ ⟨??⟩ (map ⟨??⟩ ⟨??⟩)))
```

_Solution_ : Check script `count_leaves.scm`.


#### Ex2.36

Design the procedure `accumulate-n` which is similar to accumulate except that it takes as its third argument a sequence of sequences, which are all assumed to have the same number of elements. It applies the designated accumulation procedure to combine all the first elements of the sequences, all the second elements of the sequences, and so on, and returns a sequence of the results. For instance, if s is a sequence containing four sequences, ((1 2 3) (4 5 6) (7 8 9) (10 11 12)), then the value of (accumulate-n + 0 s) should be the sequence (22 26 30). 

_Solution_ : Check script `accumulate-n.scm`.


#### Ex2.37

Suppose we represent vectors v = ( v i ) as sequences of numbers, and matrices m = ( m i j ) as sequences of vectors (the rows of the matrix). For example, the matrix
`( 1 2 3 4 4 5 6 6 6 7 8 9 )`
is represented as the sequence `((1 2 3 4) (4 5 6 6) (6 7 8 9))`. With this representation, we can use sequence operations to concisely express the basic matrix and vector operations. These operations (which are described in any book on matrix algebra) are the following: 
(dot-product v w) returns the sum Σ i v i w i ; 
(matrix-*-vector m v) returns the vector t , where t i = Σ j m i j v j ; 
(matrix-*-matrix m n) returns the matrix p , where p i j = Σ k m i k n k j ; 
(transpose m) returns the matrix n , where n i j = m j i 
We can define the dot product with a more general map as :
```
(define (dot-product v w)
  (accumulate + 0 (map * v w)))
```
Fill in the missing expressions in the following procedures for computing the other matrix operations. (The procedure accumulate-n is defined in Exercise 2.36.)
```
(define (matrix-*-vector m v)
  (map ⟨??⟩ m))

(define (transpose mat)
  (accumulate-n ⟨??⟩ ⟨??⟩ mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map ⟨??⟩ m)))
```

_Solution_ : Using the more general `map` provided in Scheme, see `general_map.scm`.


#### Ex2.38

