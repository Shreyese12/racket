#lang racket

(define (FindNumber i n l1 index)
    (if (> i 0)
        (if (= n (car l1))
            (FindNumber (- i 1) n (cdr l1) (+ index 1))
            (FindNumber (- i 1) n (cdr l1) index)
        )
        index
    )
)

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 0 10) l1))
        l1
    )
)

(define (Main)
    (define size 0)
    (define n 0)
    (define l1 (list))

    (printf "Please enter the number of initial values of the list: ")
    (set! size (read))
    (printf "Please enter a number to search: ")
    (set! n (read))

    (if (and (> size 0) (> n 0))
        (begin
            (set! l1 (Fill size l1))
            (printf "~a\n" l1)
            (printf "~a is ~a times in the list.\n" n (FindNumber size n l1 0))
        )
        (begin
            (printf "Invalid values.")
            (newline)
            (Main)
        )
    )
)

(Main)
