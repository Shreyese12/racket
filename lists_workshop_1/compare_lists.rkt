#lang racket

(define (Fill i l)
    (if (> i 0)
        (Fill (- i 1) (cons (random 0 3) l))
        l
    )
)

(define (CompareLists i l1 l2 index)
    (if (> i 0)
        (if (= (car l1) (car l2))
            (CompareLists (- i 1) (cons (cdr l1) l1) (cons (cdr l2) l2) 1)
            (set! index 0)
        )
        (void)
    )
    index
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
            (if (= (CompareLists size l1 l2 0) 1)
                (printf "There are the same.\n")
                (printf "There aren't the same.\n")
            )
        )
        (begin
            (printf "Invalid values.")
            (newline)
            (Main)
        )
    )
)

(Main)
