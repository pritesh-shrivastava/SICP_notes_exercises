;; Defining product recursively
(define (product term a next b)
  (if (> a b)
      1 ;; Identity for multiplication, like 0 is identity for sum
      (* (term a)
         (product term (next a) next b)
      )
  )
)


;; Factorial using product
(define (id x) x)
(define (inc x) (+ x 1))
(define (factorial n)
	(product id 1 inc n)
)

(factorial 5)

;; Aproximating pi using product
;; We are breaking down this patters into 4 series, 2 in numerator and 2 in denominator
;; Trying n = 50 for each of the 4 series. n = 100 is crashing everything
;; Defining helper functions
(define (series-1 n)  ;; 2 * 4 * 6 * 8 * .... n times 
	(* 2 n))
(define (series-2 n)  ;; 4 * 6 * 8 * 10 * ... n times
	(+ 2 (* 2 n)))
(define (series-3 n)  ;; 3 * 5 * 7 * 9 *  ... n times
	(+ 1 (* 2 n)))
;; Combining series using 50 terms in each series to get a total of 100 items in num / denom series
(/	(* 4.0  ;; Make sure that MIT-Scheme returns floating point no, not a fraction
   		(product series-1 1.0 inc 50)
   		(product series-2 1.0 inc 50) 	
	)
	(square (product series-3 1.0 inc 50)
	)
)


;; Simpler solution using just 1 series
(define (pi-term n) 
   (if (even? n) 
       (/ (+ n 2) (+ n 1)) 
       (/ (+ n 1) (+ n 2))))

(* 4.0 (product pi-term 1.0 inc 100)) 

