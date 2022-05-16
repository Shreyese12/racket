#lang racket

(define (SaveNumber n l)
    (if (not (= n 0))
        (SaveNumber (quotient n 10) (cons (remainder n 10) l))
        l
    )
)

(define (Main)
    (define number 0)
    (define l (list))

    (printf "Please enter a number: ")
    (set! number (read))

    (if (and (positive? number) (integer? number))
        (begin
            (set! l (SaveNumber number l))
            (printf "Now this is the list: \n~a\n" l)
        )
        (begin
            (printf "Invalid number.\n")
            (newline)
            (Main)
        )
    )
)

(Main)