#lang racket

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 1 100) l1))
        l1
    )
)

(define (BiggestNumber i n l1)
    (if (> i 0)
        (if (> (car l1) n)
            (BiggestNumber (- i 1) (car l1) (cdr l1))
            (BiggestNumber (- i 1) n (cdr l1))
        )
        n
    )
)

(define (Main)
    (define l1 (list))
    (define size 0)

    (printf "Please enter the number of initial values of the list: ")
    (set! size (read))

    (if (and (number? size) (positive? size))
        (begin
            (set! l1 (Fill size l1))
            (printf "~a\n" l1)
            (printf "This is the biggest number in the list: ~a\n" (BiggestNumber size 0 l1))
        )
        (begin
            (printf "Invalid number.\n")
            (newline)
            (Main)
        )
    )
)

(Main)
