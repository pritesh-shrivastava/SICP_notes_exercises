### Representing Sequences

Appending 2 lists :
```
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) 
            (append (cdr list1) 
                    list2
            )
        )
    )
)
```

#### Ex2.17

Define a procedure last-pair that returns the list that contains only the last element of a given (nonempty) list:
```
(last-pair (list 23 72 149 34))
(34)
```

_Solution_ : Check script _last_pair.scm_ .


#### Ex2.18

Define a procedure reverse that takes a list as argument and returns a list of the same elements in reverse order:
```
(reverse (list 1 4 9 16 25))
(25 16 9 4 1)
```

_Solution_ : Check script _reverse.scm_

#### Ex2.19

We want to rewrite the procedure cc so that its second argument is a list of the values of the coins to use rather than an integer specifying which coins to use. Define the procedures `first-denomination`, `except-first-denomination` and `no-more?` in terms of primitive operations on list structures. 

Does the order of the list `coin-values` affect the answer produced by `cc`? Why or why not? 

_Solution_ : Check script _coin_change.scm_ .

#### Ex2.20

Use dot notation to write a procedure `same-parity` that takes one or more integers and returns a list of all the arguments that have the same even-odd parity as the first argument. For example,
```
(same-parity 1 2 3 4 5 6 7)
=> (1 3 5 7)

(same-parity 2 3 4 5 6 7)
=> (2 4 6)
```

_Solution_ : Check script _same-parity.scm_ .


#### Ex 2.21

The procedure square-list takes a list of numbers as argument and returns a list of the squares of those numbers.
```
(square-list (list 1 2 3 4))
(1 4 9 16)
```
Here are two different definitions of square-list. 
Complete both of them by filling in the missing expressions:
```
(define (square-list items)
  (if (null? items)
      nil
      (cons ⟨??⟩ ⟨??⟩)))

(define (square-list items)
  (map ⟨??⟩ ⟨??⟩))
```

_Solution_ :
```
(define (square-list items)
  (if (null? items)
      nil
      (cons (square (car items)) (square-list (cdr items)) )
  )
)

(define (square-list items)
  (map (lambda (x) (* x x)) items)
)
```

#### Ex2.22

_Part-A_
Louis Reasoner tries to rewrite the first square-list procedure of Exercise 2.21 so that it evolves an iterative process:
```
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
```
Unfortunately, defining square-list this way produces the answer list in the reverse order of the one desired. Why?
_Solution_for_Part-A_ : Here the accumulater is list that adds the first item's square first, then conses the next items square before it, and so on. Hence, we get a reversed list !!

_Part-B_ :
Louis then tries to fix his bug by interchanging the arguments to cons:
```
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square 
                     (car things))))))
  (iter items nil))
```
This doesn’t work either. Explain. 

_Solution_for_Part-B_ : The accumulator in this case is a list. We need append operation. We can't cons a list on an element. The above program leads to an error.


#### Ex2.23

The procedure `for-each` is similar to `map`. It takes as arguments a procedure and a list of elements. However, rather than forming a list of the results, `for-each` just applies the procedure to each of the elements in turn, from left to right. The values returned by applying the procedure to the elements are not used at all. `for-each` is used with procedures that perform an action, such as printing. For example,
```
(for-each 
 (lambda (x) (newline) (display x))
 (list 57 321 88))
=>
57
321
88
```
The value returned by the call to `for-each` (not illustrated above) can be something arbitrary, such as `true`. Give an implementation of `for-each`.

_Solution_ : 
```
(define (for-each proc items)
    (if (null? items)
        #t
        (begin      (proc (car items) )
                    (for-each proc (cdr items) )
        )
    )
)
```

