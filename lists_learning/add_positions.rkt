#lang racket

(define (AddPositions i l1 l2 l3)
    (if (> i 0)
        (AddPositions (- i 1) (cdr l1) (cdr l2) (cons (+ (car l1) (car l2)) l3))
        l3
    )
)

(define (SettingList i l1 l2)
    (if (> i 0)
        (SettingList (- i 1) (cdr l1) (cons (car l1) l2))
        l2
    )
)

(define (Fill i l1)
    (if (> i 0)
        (Fill (- i 1) (cons (random 1 100) l1))
        l1
    )
)

(define (Main)
    (define size 0)
    (define l1 (list))
    (define l2 (list))

    (printf "Please enter the number of initial values of the list: ")
    (set! size (read))

    (if (and (number? size) (> size 1))
        (begin
            (set! l1 (Fill size l1))
            (set! l2 (Fill size l2))
            (printf "~a\n" l1)
            (printf "~a\n" l2)
            (printf "-> ~a\n" (SettingList size (AddPositions size l1 l2 (list)) (list)))
        )
        (begin
            (printf "Invalid number.\n")
            (newline)
            (Main)
        )
    )
)

(Main)
