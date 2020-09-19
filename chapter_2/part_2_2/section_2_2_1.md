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

