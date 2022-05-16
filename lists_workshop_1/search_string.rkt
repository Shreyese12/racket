#lang racket

(define (SearchStr l1 str n)
    (if (null? l1)
        (printf "~a is ~a times in the list.\n" str n)
        (if (string=? str (car l1))
            (SearchStr (cons (cdr l1) l1) str (+ n 1))
            (SearchStr (cons (cdr l1) l1) str n)
        )
    )
)

(define (Main)
    (define l1 (list "hello" "world" "name" "list" "and" "new" "hello" "world" "hello" "world" "name" "list"))
    (define str 0)

    (printf "Please enter a string to search (Use double quotation marks): ")
    (set! str (read))

    (printf "~a\n" l1)
    (SearchStr l1 str 0)
)

(Main)