#lang racket

(define (Fill i l)
    (if (> i 0)
        (Fill (- i 1) (cons (random 0 10) l))
        l
    )
)

(define (Main)
    (define size 0)
    (define l1 (list))
    (define l2 (list))

    (printf "Please enter the number of initial values of the lists: ")
    (set! size (read))

    (if (and (> size 0) (> size 0))
        (begin
            (set! l1 (Fill size l1))
            (set! l2 (Fill size l2))
            (printf "~a\n" l1)
            (printf "~a\n" l2)
        )
        (begin
            (printf "Invalid values.")
            (newline)
            (Main)
        )
    )
)

(Main)
