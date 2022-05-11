#lang racket

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 1 100) l1))
        l1
    )
)

(define (BiggestNumber in n l1)
    ()
)

(define (Main)
    (define l1 (list))
    (define size 0)

    (printf "Please enter the number of initial values of the list: ")
    (set! size (read))

    (if (and (number? size) (positive? size))
        (begin
            (set! l1 (Fill size l1))
        )
        (begin
            (printf "Invalid number.\n")
            (newline)
            (Main)
        )
    )
)
