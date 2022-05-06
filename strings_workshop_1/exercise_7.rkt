#lang racket

(define (Main)
    (define str_1 0)
    (define str_2 0)

    (printf "Please enter first string: ")
    (set! str_1 (read-line))
    (printf "Please enter second string: ")
    (set! str_2 (read-line))

    (if (string<=? str_1 str_2)
        (printf "~a is less than ~a\n" str_1 str_2)
        (printf "~a is less than ~a\n" str_2 str_1)
    )
)

(Main)
