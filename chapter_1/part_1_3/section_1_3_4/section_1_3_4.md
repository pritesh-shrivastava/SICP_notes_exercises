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

_Solution_ : Check script _double.scm_ . You can also refer [this](https://codology.net/post/sicp-solution-exercise-1-41/) link for explanation of expansion.

#### Ex1.42

Let f and g be two one-argument functions. The composition f after g is defined to be the function `x ↦ f ( g ( x ) )`. Define a procedure `compose` that implements composition. For example, if inc is a procedure that adds 1 to its argument,
```
((compose square inc) 6)
49
```
_Solution_ : Check script _compose.scm_.

#### Ex1.43

If f is a numerical function and n is a positive integer, then we can form the n th repeated application of f , which is defined to be the function whose value at x is `f ( f ( … ( f ( x ) ) … ) )` . For example, if f is the function `x ↦ x + 1` , then the n th repeated application of f is the function `x ↦ x + n` . If f is the operation of squaring a number, then the n th repeated application of f is the function that raises its argument to the `2^n` -th power. Write a procedure that takes as inputs a procedure that computes f and a positive integer n and returns the procedure that computes the n th repeated application of f . Your procedure should be able to be used as follows:
```
((repeated square 2) 5)
625
```
_Solution_ : Check script _repeated.scm_.

#### Ex1.44

The idea of smoothing a function is an important concept in signal processing. If f is a function and dx is some small number, then the smoothed version of f is the function whose value at a point x is the average of f ( x − d x ) , f ( x ) , and f ( x + d x ). 
Write a procedure `smooth` that takes as input a procedure that computes f and returns a procedure that computes the smoothed f . It is sometimes valuable to repeatedly smooth a function (that is, smooth the smoothed function, and so on) to obtain the n-fold smoothed function. Show how to generate the n-fold smoothed function of any given function using smooth and repeated from Ex1.43.

_Solution_ : Check script _smoothed.scm_ .


#### Ex1.45

We saw in 1.3.3 that attempting to compute square roots by naively finding a fixed point of y ↦ x / y does not converge, and that this can be fixed by average damping. The same method works for finding cube roots as fixed points of the average-damped y ↦ x / y 2 . Unfortunately, the process does not work for fourth roots—a single average damp is not enough to make a fixed-point search for y ↦ x / y 3 converge. On the other hand, if we average damp twice (i.e., use the average damp of the average damp of y ↦ x / y 3 ) the fixed-point search does converge. Do some experiments to determine how many average damps are required to compute n th roots as a fixed-point search based upon repeated average damping of y ↦ x / y n − 1 . Use this to implement a simple procedure for computing n th roots using fixed-point, average-damp, and the repeated procedure of Exercise 1.43. Assume that any arithmetic operations you need are available as primitives.

_Solution_ : 

