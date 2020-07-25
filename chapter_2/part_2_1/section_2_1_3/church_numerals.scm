(define zero 
    (lambda (f) 
        (lambda (x) x)
    )
)

(define (add-1 n)
    (lambda (f) 
        (lambda (x) 
            (f ((n f) x)
            )
        )
    )
)

;; One & Two in terms of the procedures zero & add-1
(define one 
    (lambda (f) 
        (lambda (x) 
            (f x)
        )
    )
)

(define two 
    (lambda (f) 
        (lambda (x) 
            (f (f x))
        )
    )
)


;; Church numerals are basically the no of times you are composing a function f on x
((one square) 3)
((two square) 3)

(define (+ a b) 
   ( (a add-1) b)
) 

;; Testing
(+ zero one)
((two square) 2)            ;; sq (sq 2)
(((+ two one) square) 2)    ;; sq (sq (sq 2))