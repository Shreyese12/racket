#lang racket

(define (Listlength i l1)
    (if (null? l1)
        i
        (Listlength (+ i 1) (cdr l1))
    )
)

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 1 100) l1))
        l1
    )
)

(define (Main)
    (define l1 (list))
    (define size 0)

    (printf "Please enter the number of initial values of the list: ")
    (set! size (read))

    (if (and (number? size) (> size 1))
        (begin
            (set! l1 (Fill size l1))
            (printf "~a\n" l1)
            (printf "That list have ~a items.\n" (Listlength 0 l1))
        )
        (begin
            (printf "Invalid number.\n")
            (newline)
            (Main)
        )
    )
)

(Main)
