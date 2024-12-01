# x power n

.data
	numMsg:		.asciiz		"Enter number: "
	powMsg:		.asciiz		"Enter power: "
	resMsg:		.asciiz		"Result: "	
	invalidStr:	.asciiz		"Invalid Input! \n"

.text
main:

input_number:
	la	$a0, numMsg
	li	$v0, 4
	syscall
	
	li	$v0 , 5
	syscall
	
	# validation	number must be +ve
	blt	$v0, $zero, invalid_number
	
	move	$s0, $v0
	
input_power:	
	la	$a0, powMsg
	li	$v0, 4
	syscall
	
	li	$v0 , 5
	syscall
	
	# validation	number must be +ve
	blt	$v0, $zero, invalid_power
	
	move	$s1, $v0
	
	# calculate 	$s0 ^ $s1
	li	$t0, 1		# result
	li	$t1, 0		# iterator
	
loop:
	# while (itr != power)
	beq	$t1, $s1, loop_end
	mul	$t0, $t0, $s0		# res = res * n
	addi	$t1, $t1, 1		# itr = itr + 1
	j	loop
	
loop_end:
	# result msg
	la	$a0, resMsg
	li	$v0, 4
	syscall
	
	# result value
	move	$a0, $t0
	li	$v0, 1
	syscall
	
exit:
	li	$v0, 10
	syscall
	

# validation handlers
invalid_number:
	la	$a0, invalidStr
	li	$v0, 4
	syscall
	j	input_number

invalid_power:
	la	$a0, invalidStr
	li	$v0, 4
	syscall
	j	input_power
	
	
	
	
	
	
	
	
	
	
