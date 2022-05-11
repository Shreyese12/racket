#lang racket

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 1 100) l1))
        l1
    )
)

(define (TripleValues i l1 l2)
    (if (> i 0)
        (TripleValues (- i 1) (cdr l1) (cons (* (car l1) 3) l2))
        l2
    )
)

(define (SettingList i l1 l2)
    (if (> i 0)
        (SettingList (- i 1) (cdr l1) (cons (car l1) l2))
        l2
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
            (printf "Now with tripled values: \n~a\n" (SettingList size (TripleValues size l1 (list)) (list)))
        )
        (begin
            (printf "Invalid number.\n")
            (newline)
            (Main)
        )
    )
)

(Main)
