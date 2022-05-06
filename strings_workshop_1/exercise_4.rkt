#lang racket

; Point 1 convert from lowercase to uppercase
(define (Uppercase i str)
    (if (< i (string-length str))
		(if (and (>= (char->integer (string-ref str i)) 97) (<= (char->integer (string-ref str i)) 122))
			(begin
				(string-set! str i (integer->char (- (char->integer (string-ref str i)) 32)))
				(Uppercase (+ i 1) str)
			)
			(Uppercase (+ i 1) str)
		)
		(printf "This is the string without lowercase: ~a\n" str)
	)
)

; Point 2 convert from uppercase to lowercase
(define (Lowercase i str)
	(if (< i (string-length str))
		(if (and (>= (char->integer (string-ref str i)) 65) (<= (char->integer (string-ref str i)) 90))
			(begin
				(string-set! str i (integer->char (+ (char->integer (string-ref str i)) 32)))
				(Lowercase (+ i 1) str)
			)
			(Lowercase (+ i 1) str)
		)
		(printf "This is the string without uppercase: ~a\n" str)
	)
)

; Point 3 extract a fragment from the text
(define (Fragment i str p1 p2 sub_string)
	(if (<= p1 p2)
		(begin
			(string-set! sub_string i (string-ref str p1))
			(Fragment (+ i 1) str (+ p1 1) p2 sub_string)
		)
		(printf "This is the substring with that positions: ~a\n" sub_string)
	)
)

(define (GetPositions str p1 p2)
	(printf "Please enter initial position: ")
	(set! p1 (read))
	(printf "Please enter initial position: ")
	(set! p2 (read))
	
	(if (and (number? p1) (number? p2) (>= p1 0) (>= p2 0) (<= p1 (string-length str)) (<= p2 (string-length str)))
		(if (< p1 p2)
			(Fragment 0 str p1 p2 (make-string (+ (- p2 p1) 1)))
			(Fragment 0 str p2 p1 (make-string (+ (- p2 p1) 1)))
		)
		(begin
			(printf "Invalid position.\n")
			(newline)
			(Main)
		)
	)
)

; Point 4 delete spaces from the text
(define (DeleteSpace i str)
	(if (< i (- (string-length str) 1))
		(begin
			(string-set! str i (string-ref str (+ i 1)))
			(DeleteSpace (+ i 1) str)
		)
		(string-set! str i #\ )
	)
)

(define (FindSpace i str)
	(if (< i (string-length str))
		(if (char=? (string-ref str i) #\ )
			(begin
				(DeleteSpace i str)
				(FindSpace (+ i 1) str)
			)
			(FindSpace (+ i 1) str)
		)
		(printf "This is the string without blank spaces: ~a\n" str)
	)
)

;Point 5 add a string to the text
(define (AddString i counter str1 str2 final_string)
	(if (< i (string-length str1))
		(begin
			(string-set! final_string i (string-ref str1 i))
			(AddString (+ i 1) counter str1 str2 final_string)
		)
		(if (< i (string-length final_string))
			(begin
				(string-set! final_string i (string-ref str2 counter))
				(AddString (+ i 1) (+ counter 1) str1 str2 final_string)
			)
			(printf "These is the concatenation of two strings: ~a\n" final_string)
		)
	)
)

(define (GetNewString str)
	(define new_string 0)
	(printf "Please enter a text to add it (Use double quotation marks): ")
	(set! new_string (read))
	(AddString 0 0 str new_string (make-string (+ (string-length str) (string-length new_string))))
)

;Point 6 Show times that appears a substring
(define (CompareSubString i p str sub_string flag)
	(if (< i (string-length sub_string))
		(if (char=? (string-ref sub_string i) (string-ref str p))
			(begin
				(set! flag 1)
				(CompareSubString (+ i 1) (+ p 1) str sub_string flag)
			)
			(set! flag 0)
		)
		(void)
	)
	flag
)

(define (SearchSubString i str sub_string n)
	(if (< i (- (string-length str) 1))
		(if (char=? (string-ref str i) (string-ref sub_string 0))
			(begin
				(set! n (+ n (CompareSubString 1 (+ i 1) str sub_string 0)))
				(SearchSubString (+ i 1) str sub_string n)
			)
			(SearchSubString (+ i 1) str sub_string n)
		)
		(printf "That sub string is ~a times in the text.\n" n)
	)
)

(define (GetSubString str)
	(define sub_string 0)
	
	(printf "Please enter a sub string to search: ")
	(set! sub_string (read))

	(if (string? sub_string)
		(SearchSubString 0 str sub_string 0)
		(begin
			(printf "Invaild string.")
			(newline)
			(Main)
		)
	)
)

(define (Main)
	(define input 0)
	(define user 0)
	
	(printf "Enter somenthing: ")
	(set! input (read-line))
	(newline)
	(printf "What do you want to do?\n")
	(printf "Convert text from lowercase to uppercase. (1)\n")
	(printf "Convert text from uppercase to lowercase. (2)\n")
	(printf "Extact a fragment from the text. (3)\n")
	(printf "Remove blank spaces. (4)\n")
	(printf "Add a new string to the text. (5)\n")
	(printf "Indicate the number of times a substring x appears in the text. (6)\n")
	(printf "-> ")
	(set! user (read))
	(newline)
	
	(if (and (>= user 1) (<= user 6))
		(cond
			((= user 1) (Uppercase 0 input))
			((= user 2) (Lowercase 0 input))
			((= user 3) (GetPositions input 0 0))
			((= user 4) (FindSpace 0 input))
			((= user 5) (GetNewString input))
			((= user 6) (GetSubString input))
		)
		(begin
			(printf "Invalid answer.\n")
			(newline)
			(Main)
		)
	)
)

(Main)
