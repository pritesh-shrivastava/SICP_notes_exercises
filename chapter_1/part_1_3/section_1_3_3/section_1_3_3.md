
#### Ex1.35

Show that the golden ratio φ (1.2.2) is a fixed point of the transformation x ↦ 1 + 1 / x , and use this fact to compute φ by means of the fixed-point procedure. 

_Solution_ : 
φ is the root of equation `x^2 = x + 1`
```
φ^2 = φ + 1
=> φ = 1 + 1 / φ
``` 
=> φ is the fixed point of `f(x) = 1 + 1/x `

φ is computed in script _golden_ratio_fixed_pt.scm_ .


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





