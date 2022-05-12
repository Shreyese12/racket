#lang racket

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 0 10) l1))
        l1
    )
)

(define (SettingList i l1 l2)
    (if (> i 0)
        (SettingList (- i 1) (cdr l1) (cons (car l1) l2))
        l2
    )
)

(define (CopyList i i2 l1 l2)
    (if (> i 0)
        (CopyList (- i 1) i2 (cdr l1) (cons (car l1) l2))
        (SettingList i2 l2 (list))
    )
)

(define (AddPositions i i2 l1 l2 l3)
    (if (> i 0)
        (AddPositions (- i 1) i2 (cdr l1) (cdr l2) (cons (+ (car l1) (car l2)) l3))
        (SettingList i2 l3 (list))
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
            (printf "This is the new list:\n~a\n" (AddPositions size size l1 (CopyList size size l1 (list)) (list)))
        )
        (begin
            (printf "Invalid values.")
            (newline)
            (Main)
        )
    )
)

(Main)
