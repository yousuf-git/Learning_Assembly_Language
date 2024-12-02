.data
	array:	.word	5, 7, 3, 8, 2, 9, 0, 1, 6, 1
	str:	.asciiz	"2*"
	sep: 	.asciiz " | "
	
.text
	la		$s0, array		# base address
	li		$s1, 9			# length
	mul		$s1, $s1, 4		# offset		36
	add		$s1, $s1, $s0
	
	loop:
		blt		$s1, $s0, end
		lw		$t0, 0($s1)
		
		la		$a0, str
		li		$v0, 4
		syscall
		
		move	$a0, $t0
		li		$v0, 1
		syscall
		
		la		$a0, sep
		li		$v0, 4
		syscall
		
		subi	$s1, $s1, 4
		
		j 	loop
		
	end:
		li		$v0, 10
		syscall
		
		
		
	
	
