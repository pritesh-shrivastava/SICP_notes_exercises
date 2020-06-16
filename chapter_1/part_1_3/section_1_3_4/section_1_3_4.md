## Section 1.3.4

For various implementations of the square root procedure (and cube root), using higher level abstractions, 
check `square-root-using-abstractions.md`.

#### Ex1.40
Define a procedure cubic that can be used together with the newtons-method procedure in expressions of the form

`(newtons-method (cubic a b c) 1)`

to approximate zeros of the cubic `x^3 + a x^2 + b x + c` .

_Solution_ : Check script `cubic_poly_root.scm`.

#### Ex1.41

Define a procedure double that takes a procedure of one argument as argument and returns a procedure that applies the original procedure twice. For example, if inc is a procedure that adds 1 to its argument, then (double inc) should be a procedure that adds 2. What value is returned by

`(((double (double double)) inc) 5)`

_Solution_ : 