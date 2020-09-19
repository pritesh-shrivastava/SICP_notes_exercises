## Hierarchical Structures

Counting the no of leaves / nodes in a nested list / tree :
```
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))
  )
)
```
vs Length - which only counts no of elements at the top level, & ignores nesting :
```
(define (length x)
    (if (null? x) 
        0
        (+ 1 (length (cdr x))
    )
)
```

#### Ex2.24

Suppose we evaluate the expression `(list 1 (list 2 (list 3 4)))`. Give the result printed by the interpreter, the corresponding box-and-pointer structure, and the interpretation of this as a tree.

_Solution_ : 
```
                            (1, (2, (3, 4)))
                        1           (2, (3, 4))
                                2       (3, 4)
                                        3    4    
```

#### Ex2.25

Give combinations of cars and cdrs that will pick 7 from each of the following lists:
```
(define x (list 1 3 (list 5 7) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
```

_Solution_ : Checking solution at Scheme command line interpreter (For explanation, check [here](http://community.schemewiki.org/?sicp-ex-2.25)) :

Beware of the extra `car` at the end : (It's a list, not a simple pair of cons)
```
(car (cdr (car (cdr (cdr x)))))
```
Simpler for y :
```
(car (car y))
```
This is wrong:
~(cdr (cdr (cdr (cdr (cdr (cdr z))))))~
as they are not cons simple pairs, but lists. There is nil as well!!
So we need to add some `car`s too!
```
z ->(cons   
        1 
        (cons   
            2 
            (cons   
                3 
                (cons 
                    4 
                    (cons 
                        5 
                        (cons 
                            6 
                            (cons 
                            7 
                            nil
                            )
                        ) 
                        nil
                    ) 
                    nil
                ) 
                nil
            ) 
            nil
        ) 
        nil
    )
7 => (car (cdr (car (cdr (car ( cdr (car (cdr (car (cdr (car (cdr z))))))))))))
```

#### Ex2.26

Suppose we define x and y to be two lists:
```
(define x (list 1 2 3))
(define y (list 4 5 6))
```
What result is printed by the interpreter in response to evaluating each of the following expressions:
```
(append x y)
(cons x y)
(list x y)
```

_Solution_ : Fairly non-intuitive. Have to look at the details : 
```
1 ]=> (append x y)

;Value: (1 2 3 4 5 6)

1 ]=> (cons x y)

;Value: ((1 2 3) 4 5 6)

1 ]=> (list x y)

;Value: ((1 2 3) (4 5 6))
```

#### Ex2.27

Modify your reverse procedure of Exercise 2.18 to produce a deep-reverse procedure that takes a list as argument and returns as its value the list with its elements reversed and with all sublists deep-reversed as well. For example,
```
(define x 
  (list (list 1 2) (list 3 4)))

x
((1 2) (3 4))

(reverse x)
((3 4) (1 2))

(deep-reverse x)
((4 3) (2 1))
```

_Solution_ : 