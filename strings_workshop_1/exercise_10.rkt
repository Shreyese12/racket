#lang racket

(define (UsingAppend str_1 str_2 final_str)
   (set! final_str (string-append str_1 str_2))
   (printf "This is the union of the two strings using append: ~a\n" final_str)
)

(define (ColombianAppend i i2 str_1 str_2 final_str)
	(if (< i (string-length str_1))
        (begin
            (string-set! final_str i (string-ref str_1 i))
            (ColombianAppend (+ i 1) i2 str_1 str_2 final_str)
        )
        (if (< i2 (string-length str_2))
	        (begin
                (string-set! final_str i (string-ref str_2 i2))
                (ColombianAppend (+ i 1) (+ i2 1) str_1 str_2 final_str)
            )
	        (printf "This is the union of the two strings using a Colombian Append: ~a\n" final_str)
        )
    )
)

(define (Main)
    (define str_1 0)
    (define str_2 0)
	(define ans 0)

	(printf "Please enter first string: ")
	(set! str_1 (read-line))
	(printf "Please enter second string: ")
	(set! str_2 (read-line))

	(define final_str (make-string (+ (string-length str_1) (string-length str_2))))

	(printf "Please select the method. \n Racket Append (1) | Colombian Append (2) \n")
	(printf "-> ")
	(set! ans (read))

	(cond
        ((= ans 1) (UsingAppend str_1 str_2 final_str))
        ((= ans 2) (ColombianAppend 0 0 str_1 str_2 final_str))
        (else (begin (printf "Invalid answer.") (Main)))
	)
)

(Main)
