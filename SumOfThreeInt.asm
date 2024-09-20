.data
	msg1:	.asciiz		"Enter 1st Number: "
	msg2:	.asciiz		"Enter 2nd Number: "
	msg3:	.asciiz		"Enter 3rd Number: "
	msg4:	.asciiz		"Sum: "

.text
	li	$v0, 4 				# Load print string system call - 4
	la	$a0, msg1
	syscall

	li	$v0, 5 				# Load read integer system call - 5
	syscall	
	move	$t0, $v0			# move value from $v0 to $t0

	li	$v0, 4 				# Load print string call 4
	la	$a0, msg2
	syscall
	
	li	$v0, 5 				# Load read integer system call - 5
	syscall	
	move	$t1, $v0			# move value from $v0 to $t1
	
	li	$v0, 4 				# Load print string system call - 4
	la	$a0, msg3
	syscall

	li	$v0, 5 				# Load read integer system call - 5
	syscall	
	move	$t3, $v0
	
	add	$t0, $t1, $t0
	
	li	$v0, 4 				# Load print string call 4
	la	$a0, msg3
	syscall
	
	li	$v0, 1 				# Load print string call 4
	add	$a0, $t0, $t3
	syscall
	
	li	$v0, 10	# Exit
	syscall
	
	

