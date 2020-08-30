#### Ex2.7

Alyssa’s program is incomplete because she has not specified the implementation of the interval abstraction. Here is a definition of the interval constructor:
```
(define (make-interval a b) (cons a b))
```
Define selectors `upper-bound` and `lower-bound` to complete the implementation.

_Solution_ : Check script _interval_arithmetic.scm_ .


#### Ex2.8

Using reasoning analogous to Alyssa’s, describe how the difference of two intervals may be computed. Define a corresponding subtraction procedure, called sub-interval.

_Solution_ : Check script _interval_arithmetic.scm_ .


#### Ex2.9

The width of an interval is half of the difference between its upper and lower bounds. The width is a measure of the uncertainty of the number specified by the interval. For some arithmetic operations the width of the result of combining two intervals is a function only of the widths of the argument intervals, whereas for others the width of the combination is not a function of the widths of the argument intervals. 

Show that the width of the sum (or difference) of two intervals is a function only of the widths of the intervals being added (or subtracted). Give examples to show that this is not true for multiplication or division. 

_Solution_ : Check script _interval_arithmetic.scm_ for definition of `width` function.
Width for addition of intervals :
```
(width (add-interval x y))
=>  (width  (make-interval  (+  (lower-bound x) 
                                (lower-bound y))
                            (+  (upper-bound x) 
                                (upper-bound y))
            )
    )
=>  (/  (-  (+  (upper-bound x) 
                (upper-bound y)
            )
            (+  (lower-bound x) 
                (lower-bound y)
            )
        )
        2
    )
=> Equivalent to
    (/  (+  (- (upper-bound x) (lower-bound x))
            (- (upper-bound y) (lower-bound y))
        )
        2
    )
=> Equivalent to 
    (+  (width x)
        (width y)
    )
```

Similarly, check [this](https://codology.net/post/sicp-solution-exercise-2-9/) link for proof on substraction of intervals, and for example on why this does not hold true for multiplication & division.

#### Ex2.10

Ben Bitdiddle, an expert systems programmer, looks over Alyssa’s shoulder and comments that it is not clear what it means to divide by an interval that spans zero. Modify Alyssa’s code to check for this condition and to signal an error if it occurs.

_Solution_ : Check script _interval_arithmetic.scm_ for updated division function, `div-interval2`.


#### Ex2.11

In passing, Ben also cryptically comments: “By testing the signs of the endpoints of the intervals, it is possible to break mul-interval into nine cases, only one of which requires more than two multiplications.” Rewrite this procedure using Ben’s suggestion.

_Solution_ : Check `mul-interval2` function in  _interval_arithmetic.scm_ .


#### Ex2.12 

Define a constructor `make-center-percent` that takes a center and a percentage tolerance and produces the desired interval. You must also define a selector percent that produces the percentage tolerance for a given interval. The center selector is shown below :
```
(define (center i)
  (/ (+ (lower-bound i) 
        (upper-bound i)) 
     2))
```

_Solution_ : Check script _center_tolerance.scm_ .


#### Ex2.13

Show that under the assumption of small percentage tolerances there is a simple formula for the approximate percentage tolerance of the product of two intervals in terms of the tolerances of the factors. You may simplify the problem by assuming that all numbers are positive.

_Solution_ : Check Community Scheme [Wiki](http://community.schemewiki.org/?sicp-ex-2.13) for the mathematical derivation of multiplication of 2 intervals with small % tolerances. The % tol of the product is ~ equal to the sum of % tol of the original factors when the % tol of original factors is small.
A test case for this is added to the script _center_tolerance.scm_ .


#### Ex2.14, Ex2.15 & 2.16

Following 2 programs are written by Lem for computing eq resistance for 2 resistors in parallel :
```
(define (par1 r1 r2)
  (div-interval 
   (mul-interval r1 r2)
   (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval 
     one
     (add-interval 
      (div-interval one r1) 
      (div-interval one r2)))))
```


Demonstrate that Lem is right. Investigate the behavior of the system on a variety of arithmetic expressions. Make some intervals A and B , and use them in computing the expressions A / A and A / B . You will get the most insight by using intervals whose width is a small percentage of the center value. Examine the results of the computation in center-percent form.

Eva Lu Ator, another user, has also noticed the different intervals computed by different but algebraically equivalent expressions. She says that a formula to compute with intervals using Alyssa’s system will produce tighter error bounds if it can be written in such a form that no variable that represents an uncertain number is repeated. Thus, she says, par2 is a “better” program for parallel resistances than par1. Is she right? Why? 

Explain, in general, why equivalent algebraic expressions may lead to different answers. Can you devise an interval-arithmetic package that does not have this shortcoming, or is this task impossible? (Warning: This problem is very difficult.)

_Solution_ : Look at the explanation from [Community Scheme Wiki](http://community.schemewiki.org/?sicp-ex-2.14-2.15-2.16) for each of these 3 questions.