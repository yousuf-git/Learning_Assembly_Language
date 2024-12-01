# 					Selection sort
# ----------------------------------------------------------------------------------------
# Steps
# 1. Set pointers (left and right)
# 2. Find maximum number in the range 
# 3. Swap maximum with right pointer
# 4. Move right pointer backward
# 5. Repeat from step 2 untill right pointer = left pointer
# ----------------------------------------------------------------------------------------

# Approach:
# 1. I'll be using a function that takes left and right ptr and returns address of max and its value
# 2. $a0, and $a1 will be arguments for it and $v0 and $v1 will be ptr and value of max value respectively
# 3. Inside main, I'll be iterating over the array and calling this method untill array is sorted


# ----------------------------------------------------------------------------------------
.data
	array:		.word		29, 91, 64, 72, -16, 0, 40, 33			# length = 8
	spaceStr:	.asciiz		" "
	
.text
main:
	la	$a0, array		# left ptr
	addi	$a1, $a0, 28		# right ptr
	sort_loop:
		beq	$a0, $a1, print_array
		jal	find_max
		lw	$t0, 0($a1)		# load value from right ptr
		
		sw	$t0, 0($v0)		# store right ptr value at max address
		sw	$v1, 0($a1)		# store max value at right ptr address
		
		# update right ptr
		subi	$a1, $a1, 4
		j	sort_loop
		
	print_array:
	
	la	$t0, array		# left ptr
	addi 	$t1, $t0, 28		# reset right ptr
	
	print_loop:
		bgt	$t0, $t1, exit
		lw	$a0, 0($t0)
		li	$v0, 1			# print integer
		syscall
		
		la	$a0, spaceStr		# print " " 
		li	$v0, 4
		syscall
		
		addi	$t0, $t0, 4		# update left ptr
		
		j	print_loop
		
exit:
	li	$v0, 10
	syscall
	
		
	
find_max:
	move	$s0, $a0	# left ptr
	move	$s1, $a1	# right ptr
	li	$v1, -2147483648	# max value
	li	$v0, -1			# address of max
	
	max_loop:
		bgt	$s0, $s1, max_loop_end		# if left > right then end
		lw	$t0, 0($s0)
		ble	$t0, $v1, update_ptr
		
		move	$v1, $t0			# Updating value of max
		move	$v0, $s0			# Updating address of max
		
		update_ptr:
			addi	$s0, $s0, 4		# update left ptr
			j	max_loop
	
	max_loop_end:
		jr	$ra
		
		
				
		




















 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	  	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 
