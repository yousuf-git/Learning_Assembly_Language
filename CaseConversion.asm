# --------------- Program Intro ---------------- #

# Title: 			Convert a lowercase string to uppercase
# Author: 			Muhammad Yousuf
# Description: 		Converts a lowercase string to uppercase
# Date: 			Sep 28, 2024 
# INPUT: 			name /string in lowercase
# OUTPUT: 			INPUT in uppercase

# --------------- Data Segement / Variables ---------------- #

.data
	in_pmpt:	.asciiz		"Input Name (a-z): "	
	out_pmpt:	.asciiz		"Name in Capital: "
	input:		.space	31	# 30 chars for name + 1 NULL 

# --------------- Code Segement / Instructions ---------------- #

.text
	# ----------------> Input Prompt
	
	la $a0, in_pmpt
	li $v0, 4
	syscall
	
	# ----------------> Read Name and store in input (mem)
	
	la	$a0, input		# the read input will be stored here in mem
	li	$a1, 31			# length of input of mem location
	li	$v0, 8			# readStr syscall
	syscall
	
	# ----------------> Conversion
	# Load address of first char in $t0 ($t0 will act as a pointer to move in string)
	la	$t0, input			# name of array has address of first mem location
	
	loop:
		lb 	$t1, ($t0)		# load value stored at $t0 in $t1 temporarily for conversion
		
		# -------> Check Valid Range
		beqz 	$t1, terminate		# if $t1 = 0 (NULL) goto label "terminate"
		blt	$t1, 'a', update		# if $t1 < 97 ('a') -> already in upper case or invalid
		bgt	$t1, 'z', update		# if $t1 > 122 ('z') -> invalid
		
		# -------> Actual Conversion
		# Note: 'a' in ASCII is 97 and 'A' is 65, so 'a' - 32 = 'A'
		
		addiu 	$t1, $t1, -32		# 'a' - 32 = 'A' (by ASCII values)
		sb	$t1, ($t0)
#		j	update				# optional
	update:
		addiu, $t0, $t0, 1		# increment pointer
		j	loop				# jump to label "loop"
		
		
	
	# ----------------> Display Output and Exit
	terminate:
	
		# -------> Display Output msg
		la $a0, out_pmpt
		li $v0, 4
		syscall
	
		# -------> Input is now update so print it
		la $a0, input
		li $v0, 4
		syscall

		# -------> Exit
		li $v0, 10
		syscall