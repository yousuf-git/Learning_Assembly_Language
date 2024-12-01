# linear search ( integer )

.data
	array:	.word	2, 3, -1, 5, 0, -2		# array of length 6
	
.text
	li	$t0, 0		# index
	la	$s0, array
	li	$s1, -2		# value
	li	$t2, 6		# length
	
loop:
	beq	$t0, $t2, loop_end
	lw	$t1, 0($s0)
	beq	$t1, $s1, found 
	
	# update address and index
	addi	$s0, $s0, 4
	addi	$t0, $t0, 1
	j	loop

loop_end:
	li	$a0, -1
	li	$v0, 1
	syscall
	j	exit

found:
	move	$a0, $t0
	li	$v0, 1
	syscall

exit:
	li	$v0, 10
	syscall 

