#### Fermat's test for prime numbers

Check Khan Academy's [video](https://www.khanacademy.org/computing/computer-science/cryptography/random-algorithms-probability/v/fermat-s-little-theorem-visualization) for a visualizing Fermat's little theorem.


#### Ex1.21

Use the smallest-divisor procedure to find the smallest divisor of each of the following numbers: 199, 1999, 19999.

_Solution_: See script _smallest_divisor.lsp_ .

#### Ex1.22

Most Lisp implementations include a primitive called `runtime` that returns an integer that specifies the amount of time the system has been running (measured, for example, in microseconds). The following timed-prime-test procedure, when called with an integer n , prints n and checks to see if n is prime. If n is prime, the procedure prints three asterisks followed by the amount of time used in performing the test.
```
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) 
                       start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
```

Using this procedure, write a procedure `search-for-primes` that checks the primality of consecutive odd integers in a specified range. Use your procedure to find the three smallest primes larger than 1000; larger than 10,000; larger than 100,000; larger than 1,000,000. Note the time needed to test each prime. 

Since the testing algorithm has order of growth of Θ ( sqrt(n) ) , you should expect that testing for primes around 10,000 should take about sqrt(10) times as long as testing for primes around 1000. Do your timing data bear this out? How well do the data for 100,000 and 1,000,000 support the Θ ( sqrt(n) ) prediction? Is your result compatible with the notion that programs on your machine run in time proportional to the number of steps required for the computation ?

_Solution_ : See script _prime_test.lsp_ .
We find that the time taken increases by a factor of ~3 (sqrt(10) when we find the prime of no that is 10x the given no.
However, since the speed of modern computers is much higher than when this book was written, we had to check for much larger nos to see comparable time difference in seconds.
This result is also compatible with the notion that programs on any machine run in time proportional to the number of steps required for the computation !


#### Ex1.23

The smallest-divisor procedure shown at the start of this section does lots of needless testing: After it checks to see if the number is divisible by 2 there is no point in checking to see if it is divisible by any larger even numbers. This suggests that the values used for test-divisor should not be 2, 3, 4, 5, 6, …, but rather 2, 3, 5, 7, 9, …. To implement this change, define a procedure next that returns 3 if its input is equal to 2 and otherwise returns its input plus 2. Modify the smallest-divisor procedure to use (next test-divisor) instead of (+ test-divisor 1). With timed-prime-test incorporating this modified version of smallest-divisor, run the test for each of the 12 primes found in Exercise 1.22. Since this modification halves the number of test steps, you should expect it to run about twice as fast. Is this expectation confirmed? If not, what is the observed ratio of the speeds of the two algorithms, and how do you explain the fact that it is different from 2? 

_Solution_ :  See script _prime_test_fast.lisp_ .
The time taken for prime test does not half ! In fact, it reduced by ~60-70% !
The observed ratio is not 2, but ~ 5/3 ! This could be attributed to the additional comparison step added in the _if_ clause of the _next_ function !

#### Ex1.24

Modify the timed-prime-test procedure of Exercise 1.22 to use fast-prime? (the Fermat method), and test each of the 12 primes you found in that exercise. Since the Fermat test has Θ ( log ⁡ n ) growth, how would you expect the time to test primes near 1,000,000 to compare with the time needed to test primes near 1000? Do your data bear this out? Can you explain any discrepancy you find? 

_Solution_ : Check script _prime_test_fermal.lsp_
From the collected timing data, we can observe that testing a number with twice as many digits (6 digits -> 1e-2 vs. 12 digits -> 2e-2) is roughly twice as slow. This supports the theory of logarithmic growth.


#### Ex1.25

Alyssa P. Hacker complains that we went to a lot of extra work in writing expmod. After all, she says, since we already know how to compute exponentials, we could have simply written
```
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
```
Is she correct? Would this procedure serve as well for our fast prime tester? Explain. 

_Solution_ : Yes, we can replace the original expmod procedure with the fast-expt procedure. This procedure is okay for small nos. However, for large nos, this will make the overall procedure very slow. Check script _Ex_1_25.lisp_ .

The remainder operation inside the original expmod implementation, keeps the numbers being squared less than the number tested for primality m. fast-expt however squares huge numbers of a^m size. Also check this [link](https://codology.net/post/sicp-solution-exercise-1-25/).

#### Ex1.26

Louis Reasoner is having great difficulty doing Exercise 1.24. His fast-prime? test seems to run more slowly than his prime? test. Louis calls his friend Eva Lu Ator over to help. When they examine Louis’s code, they find that he has rewritten the expmod procedure to use an explicit multiplication, rather than calling square:
```
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder 
          (* (expmod base (/ exp 2) m)
             (expmod base (/ exp 2) m))
          m))
        (else
         (remainder 
          (* base 
             (expmod base (- exp 1) m))
          m))))
```
“I don’t see what difference that could make,” says Louis. “I do.” says Eva. “By writing the procedure like that, you have transformed the Θ ( log ⁡ n ) process into a Θ ( n ) process.” Explain.

_Solution_ : 