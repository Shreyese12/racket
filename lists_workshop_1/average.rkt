#lang racket

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 0 10) l1))
        l1
    )
)

(define (Listlength i l1)
    (if (null? l1)
        i
        (Listlength (+ i 1) (cdr l1))
    )
)

(define (ListAverage i n l1)
    (if (> i 0)
        (ListAverage (- i 1) (+ n (car l1)) (cdr l1))
        n
    )
)

(define (Main)
    (define size 0)
    (define l1 (list))

    (printf "Please enter the number of initial values of the list: ")
    (set! size (read))

    (if (and (> size 0) (> size 0))
        (begin
            (set! l1 (Fill size l1))
            (printf "~a\n" l1)
            (printf "Values average: ~a\n" (/ (ListAverage size 0 l1) size))
        )
        (begin
            (printf "Invalid values.")
            (newline)
            (Main)
        )
    )
)

(Main)
