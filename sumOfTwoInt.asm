# --------------- Program Intro ---------------- #

# Title: 				Sum of Two Integers
# Author: 				Muhammad Yousuf
# Description: 			To calculate the sum of two integers
# Date: 				Sep 2024
# INPUT: 				Two integers
# OUTPUT: 				Sum of the two integers

# --------------- Data Segement / Variables ---------------- #

.data
	n1 : .word	60				# First Integer containing 4 bytes
	n2 : .word	9				# Second Integer

.global		main 					# optional
# --------------- Code Segement / Instructions ---------------- #

.text

main:
	# loading values of n1 and n2 in two temporary registers
	lw $t0, n1	
	lw $t1, n2
	
	# Add values in 2 registers and store in any of them or third one
	add $t0, $t0, $t1			# Adding values of $t0 and $t1 and storing in $t0
	
	# Now $t0 holds the result
	
	li $v0, 1					# Load system call to print integer
	move $a0, $t0   			# Store value of result in $a0
	syscall
	
	li $v0, 10					# Loading exit system call
	syscall						# make system call

