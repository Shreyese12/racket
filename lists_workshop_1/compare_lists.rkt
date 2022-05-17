#lang racket

(define (ListLength i l)
    (if (null? l)
        i
        (ListLength (+ i 1) (cdr l))
    )
)

(define (Compare i len l1 l2 m)
    (if (< i len)
        (if (not (= (car l1) (car l2)))
            (set! m 0)
            (begin
                (set! m 1)
                (printf "~a\n" l1)
                (printf "~a\n" l2)
                (Compare (+ i 1) len (cdr l1) (cdr l2) m)
            )
        )
        (void)
    )
    m
)

(define (Main)
    (define size 0)
    (define l1 (list 1 40 3 4))
    (define l2 (list 1 2 3 4))

    (printf "List 1: \n~a\n" l1)
    (newline)
    (printf "List 2: \n~a\n" l2)
    (newline)
    (Compare 0 (ListLength 0 l2) l1 l2 0)
)

(Main)