#### Ex2.4

Here is an alternative procedural representation of pairs. For this representation, verify that `(car (cons x y))` yields `x` for any objects `x` and `y`.
```
(define (cons x y) 
  (lambda (m) (m x y)))

(define (car z) 
  (z (lambda (p q) p)))
```
What is the corresponding definition of `cdr`? 
(Hint: To verify that this works, make use of the substitution model of 1.1.5.)

_Solution_ : Check script _alt_pairs.scm_ .
Also, check this great explanation on [codology.net](https://codology.net/post/sicp-solution-exercise-2-4/).

#### Ex2.5

Show that we can represent pairs of nonnegative integers using only numbers and arithmetic operations if we represent the pair `a` and `b` as the integer that is the product `2^a * 3^b` . Give the corresponding definitions of the procedures `cons`, `car`, and `cdr`.

_Solution_ : Solution from [codology.net](https://codology.net/post/sicp-solution-exercise-2-5/) is the best one.

#### Ex2.6

In case representing pairs as procedures wasn’t mind-boggling enough, consider that, in a language that can manipulate procedures, we can get by without numbers (at least insofar as nonnegative integers are concerned) by implementing 0 and the operation of adding 1 as
```
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
```
This representation is known as `Church numerals`, after its inventor, Alonzo Church, the logician who invented the `λ-calculus`.

Define one and two directly (not in terms of `zero` and `add-1`). (Hint: Use substitution to evaluate `(add-1 zero)`). Give a direct definition of the addition procedure `+` (not in terms of repeated application of `add-1`). 

_Solution_ : Check script _church_numerals_scm_ .

Using substitution to evaluate `(add-1 zero)`, ie, `one` :
```
(add-1 zero)
=>  (lambda (f)
      (lambda (x) 
            (f ((zero f) x)
            )
      )
    )

=>  ( lambda (f)
      (lambda (x)
            (f ((lambda (x) x) x)
            )
      )
    )

=>  (lambda (f)
      (lambda (x)
            (f x)
      )
    )
```

Hence we get, 
```
(define one (lambda (f) (lambda (x) (f x))))
```

Now, using substitution again to evauate `two`, ie, `(add-1 one)` :
```
(add-1 one)

=>  (lambda (f) (lambda (x) (f ((one f) x))))
```

Let's look at `(one f)` :
```
=>  ( (lambda (f) (lambda (x) (f x))) 
      f
    )

=> (lambda (x) (f x))
```
 Substituting this back into `(add-1 one)` :
 ```
 => (lambda (f) 
      ( lambda (x)  (f  ( (lambda (x) (f x)) 
                          x
                        )
                    )
      )
    )

=>  (lambda (f)
      (lambda (x) (f (f x)
                  )
      )
    )
 ```

 Hence, we get, 
`(define two (lambda (f) (lambda (x) (f (f x))))`

Now, for addition of 2 Church numerals `a` & `b`, `(add-1)` is repeatedly applied to `b`, `a` no of times.
So this definition also works, 
```
(define (+ a b) 
   ( (a add-1) b)
) 
```

Without using `add-1`, we will get, 
```
(define (+ a b) 
   (lambda (f) 
     (lambda (x) 
       ((a f) ((b f) x))))) 
```

For more details, refer [Community Scheme Wiki](http://community.schemewiki.org/?sicp-ex-2.6)

