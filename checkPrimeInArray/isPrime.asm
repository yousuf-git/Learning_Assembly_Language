# Iterate over the pre-defined array and check if each integer is prime or not using a function isPrime()
# isPrime() returns 1 if $a0 is prime, 0 otherwise

.data
	array:		.word		2, 3, 5, 6, 7, 9		# length = 6
	primeStr:	.asciiz		" -> Prime"
	notPrimeStr:	.asciiz		" -> Not Prime"	
	newLine:		.asciiz		"\n"
	
.text
	la	$s0, array
	li	$t1, 0		# st idx
	li	$t2, 6		# end idx
	
	
outer_loop:
	beq	$t1, $t2, exit 
	sll	$t3, $t1, 2		# offset
	add	$t3, $t3, $s0		# address
	
	lw	$a0, 0($t3)
	jal	isPrime
	
	bne	$v0, $0, print_prime		# if returned value is not 0, $a0 is prime
	
	# else print not prime
	li	$v0, 1				# print value
	syscall
	
	la	$a0, notPrimeStr		# print not prime
	li	$v0, 4
	syscall
	
	la	$a0, newLine			# new line
	li	$v0, 4
	syscall
	
	addi	$t1, $t1, 1			# itr increment
	j	outer_loop
	
	print_prime:
		li	$v0, 1			# print value
		syscall
		
		la	$a0, primeStr		# print prime
		li	$v0, 4
		syscall
		
		la	$a0, newLine		# new line
		li	$v0, 4
		syscall	
		
		addi	$t1, $t1, 1		# itr increment
		j	outer_loop				

exit:
	li	$v0, 10
	syscall

isPrime:
	li	$s1, 2		# start divisor
	div	$s2, $a0, 2	# end divisor -> n/2
	
	prime_loop:
		bgt	$s1, $s2, prime_loop_end		# checked in whole range, prime
		div	$a0, $s1
		mfhi	$t0		# move remainder to $t0
		beq	$t0, $0, not_prime
		addi	$s1, $s1, 1
		j	prime_loop
	
	prime_loop_end:
		li	$v0, 1
		jr	$ra		# return 1 ($a0 is prime)
	
	not_prime:
		li	$v0, 0
		jr	$ra
		
	

	
	
	
	
	
	
	
	
	
	
		
	
	
	
