.data
	array:	.word		20, 40, 10, 30, 50, 0
	msg1:	.asciiz		"Array: "	
	msg2:	.asciiz		"\nMax: "
	space:  .asciiz		" "
	
.text

	la 	$a2, array
	li 	$a1, 6
	
	# print array
	la	$a0, msg1
	li	$v0, 4
	syscall
	
	li	$t0, 0
	
	print_loop:
	
		beq	$t0, $a1, continue
		
		lw	$t2, 0($a2)
		li	$v0, 1
		move	$a0, $t2
		syscall
		
		li	$v0, 4			
		la	$a0, space			# print blank space
		syscall
		
		addi	$t0, $t0, 1
		addi	$a2, $a2, 4
		j	print_loop
		
	continue: 
		la	$a2, array
		li	$t0, 0	# index
		li	$t1, 0	# max
	
	loop:
		beq	$t0, $a1, exit		# if index = length of array -> exit
		lw	$t2, 0($a2)
		
		slt	$t3, $t2, $t1		# if t2 < t1 => t3 = 1, 	else t3 = 0
		bne	$t3, $zero, update	# if t3 <> 0 => jump and update index otherwise update $t1(max)  
		
		move 	$t1, $t2	# update max
		
	update:
		addi	$t0, $t0, 1
		addi	$a2, $a2, 4
		j	loop
		
	exit:
	
		la	$a0, msg2
		li	$v0, 4
		syscall
		
		move	$a0, $t1
		li	$v0, 1
		syscall
		
		li	$v0, 10
		syscall
		
		
	
	
	
	
	
	
		
