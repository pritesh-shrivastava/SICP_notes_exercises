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
                      (cdr sequence)))))

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