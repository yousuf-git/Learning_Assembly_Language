# adding two variables and printing sum on cosole

.data
	n1 : .word	60
	n2 : .word	9
	
.text

.main:
	# loading values of n1 and n2 in 2 registers
	lw $t0, n1	
	lw $t1, n2
	
	# Add values in 2 registers and store in any of them or third one
	add $t0, $t0, $t1
	
	# Now $t0 holds the result
	
	li $v0, 1	# Load system call to print integer
	move $a0, $t0   # Store value of result in $a0
	syscall
	
	li $v0, 10		# Loading exit system call
	syscall			# make call