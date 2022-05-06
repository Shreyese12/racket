#lang racket

(define (DeleteChar i str)
    (if (< i (- (string-length str) 1))
        (begin
            (string-set! str i (string-ref str (+ i 1)))
            (DeleteChar (+ i 1) str)
        )
        (string-set! str i #\space)
	)
)

(define (DeleteWord i str)
	(if (not (char=? (string-ref str i) #\space))
		(begin
			(DeleteChar i str)
			(DeleteWord i str)
		)
		(DeleteChar i str)
	)
	(void)
)

(define (FindWord i str word_number n)
	(if (< i (string-length str))
		(if (and (char=? (string-ref str i) #\space) (= n word_number))
			(DeleteWord (+ i 1) str)
			(if (char=? (string-ref str i) #\space)
				(FindWord (+ i 1) str word_number (+ n 1))
				(FindWord (+ i 1) str word_number n)
			)
		)
		(void)
	)
)

(define (WordsCounter i str wordsNumber)
	(if (< i (string-length str))
		(if (char=? (string-ref str i) #\ )
			(WordsCounter (+ i 1) str (+ wordsNumber 1))
			(WordsCounter (+ i 1) str wordsNumber)
		)
		(begin
			(set! wordsNumber (+ wordsNumber 1))
			wordsNumber
		)
	)
)

(define (Main)
    (define word_number 0)
    (define str 0)

    (printf "Please enter a text (Use double quotation marks): ")
    (set! str (read))
	(printf "What word do you want to delete? ")
	(set! word_number (read))

	(if (and (number? word_number) (<= (string-length str) 100) (<= word_number (WordsCounter 0 str 0)))
		(begin
			(if (= word_number 1)
				(DeleteWord 0 str)
				(FindWord 0 str (- word_number 2) 0)
			)
			(printf "Now this is your string: ~a\n" str)
		)
		(begin
			(printf "Invalid input.\n")
			(newline)
			(Main)
		)
	)
)

(Main)
