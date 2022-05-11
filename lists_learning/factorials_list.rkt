#lang racket

(define (Factorial n)
    (if (= n 0)
        1
        (* n (Factorial (- n 1)))
    )
)

(define (FactorialsList i l1)
    (if (> i 0)
        (FactorialsList (- i 1) (cons (Factorial i) l1))
        l1
    )
)

(define (Main)
    (define n 0)

    (printf "Please enter the numer of factorials to show: ")
    (set! n (read))

    (if (and (number? n) (> n 1))
        (begin
            (printf "~a\n" (FactorialsList n (list)))
        )
        (begin
            (printf "Invalid number.\n")
            (newline)
            (Main)
        )
    )
)

(Main)
