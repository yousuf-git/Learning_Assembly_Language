# get nth fibonacci term
.data  
	prompt: 	.asciiz 	"Enter a non-negative integer (max 46): "  
	result: 	.asciiz 	"\nThe Fibonacci number is: "  
#	error: 		.asciiz 	"\nInvalid input. Please try again.\n"

.text


main:
	la	$a0, prompt
	li	$v0, 4
	syscall
	
	li	$v0, 5
	syscall
	
	move	$a0, $v0
	#li	$a0, 9		# 9th term
	jal	fib
	
	move	$s0, $v0	# store result
	
	la	$a0, result
	li	$v0, 4
	syscall
	
	move	$a0, $s0
	li	$v0, 1
	syscall
	
	li	$v0, 10
	syscall

fib:
	li	$t0, 1
	bgt	$a0, $t0, next_calls
	move	$v0, $a0
	jr 	$ra
	
	
next_calls:
	subi	$sp, $sp, 12
	sw	$ra, 0($sp)
	sw	$a0, 4($sp)
	
	# first call
	subi	$a0, $a0, 1
	jal	fib
	
	sw	$v0, 8($sp)		# storing result of first call onto stack
	
	#second call	
	lw	$a0, 4($sp)			
	subi	$a0, $a0, 2
	jal	fib
	
	# calculate result
	lw	$s0, 8($sp)		# loading result of previous call from stack
	add	$v0, $v0, $s0		# v0 holds the sum [f(n-1) + f(n-2)] that is to return
	
	#return
	lw	$ra, 0($sp)		# load return address
	addi	$sp, $sp, 12		# reset stack
	
	jr	$ra
	
