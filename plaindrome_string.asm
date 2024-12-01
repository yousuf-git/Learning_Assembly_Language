.data

	input_prompt:		.asciiz		"Enter String(max 30 chars): "
	input_str:		.space		31
	newline:		.asciiz		"\n"

	valid_palin_str:	.asciiz		"String is Palindrome."
	not_palin_str:		.asciiz		"String is not Palindrome."
	invalid_input_prompt:	.asciiz		"Invalid Input !"

.text

# print input prompt
	li		$v0, 4
	la		$a0, input_prompt
	syscall

# take string input from user
	li 		$v0, 8			# syscall for input
	la		$a0, input_str		# address of input
	li		$a1, 31 		# length of input
	syscall
	
# count number of input characters 
	
	# address of input in $s0, counter will be $s1
	la		$s0, input_str		# it will act as pointer now
	li		$s1, 0			# counter = 0
	li	$t4, 10			# code of enter	
	counter_loop:
		# check if loaded byte is enter
		beq	$t1, $t4, counter_exit

		lb	$t1, 0($s0)

		addi	$s1, $s1, 1		# increment counter	
		addi	$s0, $s0, 1		# increment pointer
		j	counter_loop

	counter_exit:
		# $s1 holds total bytes that are in input_str
		la	$s0, input_str		# load address of input again

		li	$t0, 0			# t0 as left pointer
		subi	$s1, $s1, 1		# last pointer is at => lenght - 1
		move	$t1, $s1		# t1 = total count (right pointer)
		
		# Calculate address
		add 	$t0, $t0, $s0			# address of byte for left pointer
		add 	$t1, $t1, $s0			# address of byte for right pointer
	
	
	check_loop:
	
		ble	$t1, $t0, print_palin	# if pointers are gone out of range

		lb	$t2, 0($t0)				# load byte from left pointer
		lb	$t3, 0($t1)				# load byte from right pointer
		
		# compare value from left and right pointer
		
		bne	$t2, $t3, print_not_palin
		
		# update pointers
		addi	$t0, $t0, 1
		subi	$t1, $t1, 1
		
		j	check_loop
		
		
	print_not_palin:
		li		$v0, 4
		la		$a0, not_palin_str
		syscall
		j		exit
	
	print_palin:
		li		$v0, 4
		la		$a0, valid_palin_str
		syscall
		
	exit:
		li	$v0, 10
		syscall