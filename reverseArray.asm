.data
	array:	.word	5, 7, 3, 8, 2, 9, 0, 1, 6, 1
	space:	.asciiz	" "
	
.text
# Variables we need, $s0 for A[], $s1 for i, $s2 for ending point of loop
	la	$s0, array	# Base Address
	li	$s1, 9		# i = 9
	li	$s2, -1
	
	loop:
		# Step 1: i*4
		sll	$t0, $s1, 2	# $t0 = i*4
		
		# Step 2: A[] + i*4
		add	$t0, $t0, $s0	# $t0 = $t0 + $s0
		
		lw	$t1, 0($t0)
		
		li	$t3, 2
		mul	$a0, $t1, $t3
		li	$v0, 1
		syscall 
		
		la	$a0, space
		li	$v0, 4
		syscall
	
	# update i
	# li $t0, -1
	# add $s1, $s1, $t0 	# i = i -1
	subi	$s1, $s1, 1	
	
	
	# check if we have to goto loop again
	
	# if i != -1 goto loop again
	bne	$s2, $s1, loop
	
	# exit code
	li $v0, 10
	syscall
	
	
	
	
	
	
		
		
