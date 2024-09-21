# --------------- Program Intro ---------------- #

# Title:  			Sum of Three Integers Input by User
# Author: 			Muhammad Yousuf
# Description: 		To calculate the sum of three integers
# Date: 			Sep 2024
# INPUT: 			Three integers
# OUTPUT: 			Sum of the three integers

# --------------- Data Segement / Variables ---------------- #

.data
	msg1:	.asciiz		"Enter 1st Number: "
	msg2:	.asciiz		"Enter 2nd Number: "
	msg3:	.asciiz		"Enter 3rd Number: "
	msg4:	.asciiz		"Sum: "

.global		main 					# optional

# --------------- Code Segement / Instructions ---------------- #

.text
main:
	li	$v0, 4 				# Load print string system call - 4
	la	$a0, msg1			# Load address of the string to print
	syscall

	li	$v0, 5 				# Load read integer system call - 5
	syscall	
	move	$t0, $v0		# move value from $v0 to $t0

	li	$v0, 4 				# Load print string call 4
	la	$a0, msg2			# Load address of the string to print
	syscall
	
	li	$v0, 5 				# Load read integer system call - 5
	syscall	
	move	$t1, $v0		# move value from $v0 to $t1
	
	li	$v0, 4 				# Load print string system call - 4
	la	$a0, msg3
	syscall

	li	$v0, 5 				# Load read integer system call - 5
	syscall	
	move $t3, $v0
	
	add	$t0, $t1, $t0		# Add the values of $t0 and $t1 and store in $t0
	
	li	$v0, 4 				# Load print string call 4
	la	$a0, msg3
	syscall
	
	li	$v0, 1 				# Load print string call 4
	add	$a0, $t0, $t3		# Add the values of $t0 and $t1 and store in $a0
	syscall
	
	li	$v0, 10				# Exit
	syscall