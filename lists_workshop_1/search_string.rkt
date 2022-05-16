#lang racket

(define (ListLength i l)
    (if (null? l)
        i
        (ListLength (+ i 1) (cdr l))
    )
)

(define (SearchStr i len string_list str n)
    (if (< i len)
        (if (string=? str (car string_list))
            (SearchStr (+ i 1) len (cdr string_list) str (+ n 1))
            (SearchStr (+ i 1) len (cdr string_list) str n)
        )
        (printf "~a is ~a times in the list.\n" str n)
    )
)

(define (Main)
    (define string_list (list "hello" "world" "name" "list" "and" "new" "hello" "world" "hello" "world" "name" "list"))
    (define str 0)

    (printf "Please enter a string to search (Use double quotation marks): ")
    (set! str (read))

    (if (string? str)
        (begin
            (printf "~a\n" string_list)
            (SearchStr 0 (ListLength 0 string_list) string_list str 0)
        )
        (begin
            (printf "Invalid String\n")
            (newline)
            (Main)
        )
    )
)

(Main)