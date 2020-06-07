
#### Ex1.35

Show that the golden ratio φ (1.2.2) is a fixed point of the transformation x ↦ 1 + 1 / x , and use this fact to compute φ by means of the fixed-point procedure. 

_Solution_ : 
φ is the root of equation `x^2 = x + 1`
```
φ^2 = φ + 1
=> φ = 1 + 1 / φ
``` 
=> φ is the fixed point of `f(x) = 1 + 1/x `

φ is computed in script _golden_ratio_fixed_pt.scm_ = 1.6180 (rounded).


#### Ex1.36

Modify fixed-point so that it prints the sequence of approximations it generates, using the newline and display primitives. Then find a solution to x x = 1000 by finding a fixed point of x ↦ log ⁡ ( 1000 ) / log ⁡ ( x ) . (Use Scheme’s primitive log procedure, which computes natural logarithms.) Compare the number of steps this takes with and without average damping. (Note that you cannot start fixed-point with a guess of 1, as this would cause division by log ⁡ ( 1 ) = 0 .) 

_Solution_ : Check script _fixed_pt_steps.scm_ .
Without avg damping, the solution took ~ 36 steps starting with 2 .
With avg damping, it only took 8 steps starting with 2 as the first guess !!


#### Ex1.37

An infinite continued fraction is an expression of the form
f = N 1 D 1 + N 2 D 2 + N 3 D 3 + … .
As an example, one can show that the infinite continued fraction expansion with the N i and the D i all equal to 1 produces 1 / φ , where φ is the golden ratio (described in 1.2.2). One way to approximate an infinite continued fraction is to truncate the expansion after a given number of terms. Such a truncation—a so-called finite continued fraction k-term finite continued fraction—has the form
N 1 D 1 + N 2 ⋱ + N k D k .
Suppose that n and d are procedures of one argument (the term index i ) that return the N i and D i of the terms of the continued fraction. Define a procedure cont-frac such that evaluating (cont-frac n d k) computes the value of the k -term finite continued fraction. Check your procedure by approximating 1 / φ using

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)

for successive values of k. How large must you make k in order to get an approximation that is accurate to 4 decimal places?
If your cont-frac procedure generates a recursive process, write one that generates an iterative process. If it generates an iterative process, write one that generates a recursive process. 

_Solution_ : 
Part - I :
When all Ni & Di are 1, we get,
```
f = 1 / (1 + f)   (since it is an infinite loop, taking one term out of it will still be equal to f)
=> f + f^2-1 = 0
=> 1/phi + 1/phi^2 - 1 = 0 (replacing f by 1/phi as said in the problem)
=> phi + 1 - phi^2 = 0
=> phi^2 = phi + 1 
```
We already know phi is the root of the equation `x^2 = x+1`. Hence, the above statement `(f = 1 / phi)` is true !


Now, `1/phi = 0.6180`

Check script _continued_fraction.scm_ for a tail recursive (iterative) solution. 
For k as low as 11, we are getting accurate approximation upto 4 decimal places.

Part - II : 
For a recursive solution, check script _continued_fraction_rcrsn.scm_ .
From community of scheme wiki,
"The number of steps would be k. Now, the tricky part is sequence of the count from 1 to k. 
For the recursive process, the fraction is built, in a way, from the outside to the inside. 
So the count should go from 1 to k. 
For the iterative process, however, the fraction accumulates from the inside to the outside, 
and the count should consequently go from k to 1."

For the recursive process as well, the min no of iterations to get 4 decimal accuracy was 11 ! 

#### Ex1.38

In 1737, the Swiss mathematician Leonhard Euler published a memoir De Fractionibus Continuis, which included a continued fraction expansion for e − 2 , where e is the base of the natural logarithms. In this fraction, the N i are all 1, and the D i are successively 1, 2, 1, 1, 4, 1, 1, 6, 1, 1, 8, …. Write a program that uses your cont-frac procedure from Exercise 1.37 to approximate e , based on Euler’s expansion. 






