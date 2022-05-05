#lang racket

(define (DeleteChar i str char)
    (if (< i (- (string-length str) 1))
        (begin
            (string-set! str i (string-ref str (+ i 1)))
            (DeleteChar (+ i 1) str char)
        )
        (string-set! str i #\space)
	)
)

(define (FindChar i str char)
    (if (< i (string-length str))
        (if (char=? (string-ref str i) char)
     	    (begin
                (DeleteChar i str char)
                (FindChar (+ i 1) str char)
            )
            (FindChar (+ i 1) str char)
        )
        (printf "Now this is the string without ~a.\n -> ~a\n" char str)
	)
)

(define (Main)
    (define str 0)
	(define char 0)

	(printf "Please enter a string: ")
	(set! str (read-line))
	(printf "Please enter a character to delete: ")
	(set! char (read))

	(if (char? char)
        (FindChar 0 str char)
        (begin
	        (printf "Invalid Character.\n")
            (newline)
            (Main)
        )
	)
)

(Main)
