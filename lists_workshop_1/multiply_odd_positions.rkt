#lang racket

(define (Fill i l)
    (if (> i 0)
        (Fill (- i 1) (cons (random 0 10) l))
        l
    )
)

(define (SettingList i l1 l2)
    (if (> i 0)
        (SettingList (- i 1) (cdr l1) (cons (car l1) l2))
        l2
    )
)

(define (MultiplyOddPositions i i2 l1 l2)
    (if (> i 0)
        (if (= (remainder (+ i 1) 2) 0)
            (MultiplyOddPositions (- i 1) i2 (cdr l1) (cons (car l1) l2))
            (MultiplyOddPositions (- i 1) i2 (cdr l1) (cons (* (car l1) 2) l2))
        )
        (begin
            (set! l2 (SettingList i2 l2 (list)))
            l2
        )
    )
)

(define (Main)
    (define size 0)
    (define l (list))

    (printf "Please enter the initial number of values of the list: ")
    (set! size (read))

    (if (and (integer? size) (> size 0))
        (begin
            (set! l (Fill size l))
            (printf "~a\n" l)
            (set! l (MultiplyOddPositions size size l (list)))
            (printf "~a\n" l)
        )
        (begin
            (printf "Invalid values.\n")
            (newline)
            (Main)
        )
    )
)

(Main)