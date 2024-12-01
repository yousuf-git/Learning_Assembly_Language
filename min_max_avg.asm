# min max and avg of input integers

.data
	msg:		.asciiz		"Input +ve number (-ve to exit): "
	newLine:	.asciiz		"\n"
	minStr:		.asciiz		"Min: "
	maxStr:		.asciiz		"Max: " 
	avgStr:		.asciiz		"Average: "

.text
	li	$s0, 429467295	# min
	li	$s1, 0		# max
	li	$s2, 0		# sum
	li	$s3, 0		# count	
	li	$s4, 0		# avg

input_loop:
	la	$a0, msg
	li	$v0, 4
	syscall	
	
	li	$v0, 5
	syscall
	move 	$a0, $v0		# moving input into $a0
	
	blt	$a0, $zero, input_end		# if $a0 < 0 end input
	
	# if $a0 > max	--> update max otherwise check min
	ble	$a0, $s1, check_min
	move	$s1, $a0		# update max
	
	check_min:
		# if $a0 < min
		blt	$a0, $s0, update_min
		j	update_sum
	update_min:
		move	$s0, $a0	# update min
		
	update_sum:
		add	$s2, $s2, $a0		# update sum
		addi	$s3, $s3, 1		# update count
	j	input_loop
	
input_end:
	# if count = 0 just exit
	beqz	$s3, exit
	
	# calculate average
	div	$s4, $s2, $s3		# for integers division 
	
	# for float division
#	div	$s2, $s3		# quotient ->  lo, reminader -> hi
#	mflo	$s4	
	
	# print min
	la	$a0, minStr
	li	$v0, 4
	syscall
	
	move	$a0, $s0
	li	$v0, 1
	syscall
	
	la	$a0, newLine
	li	$v0, 4
	syscall
	
	# print max
	la	$a0, maxStr
	li	$v0, 4
	syscall
	
	move	$a0, $s1
	li	$v0, 1
	syscall
		
	la	$a0, newLine
	li	$v0, 4
	syscall
		
	# print average
	la	$a0, avgStr
	li	$v0, 4
	syscall
	
	move	$a0, $s4
	li	$v0, 1
	syscall
	
	la	$a0, newLine
	li	$v0, 4
	syscall	
		
exit:
	li	$v0, 10
	syscall		
		
		
		
		
		
		
	
