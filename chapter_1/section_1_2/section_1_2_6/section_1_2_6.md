
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