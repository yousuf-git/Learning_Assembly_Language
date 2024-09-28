# --------------- Program Intro ---------------- #

# Title: 			To check overflow error while performing add on integers
# Author: 			Muhammad Yousuf
# Description: 		Storing maximum value that can be stored in integer, then trying to add 1 more in it
# Date: 			Sep, 2024
# INPUT: 			Nothing
# OUTPUT: 			Overflow Error

# --------------- Data Segement / Variables ---------------- #

.data
	x:	.word	2147483647	# Max value that can be processed by add / addi => (2^31) - 1 = 0x7fffffff
	y:	.word	4294967295	# Max value that can be processed by addu => (2^32) - 1 = 0xffffffff

# --------------- Code Segement / Instructions ---------------- #

.text
	# ----------------------- Case 1 (addu)-------------------------

#	la	$t0, x				# load value stored at location x in memory
#	li	$t1, 1
#	addu	$t0, $t0, $t1	# trying to add value so that result exceeds the limit

	# ----------------- Error will occure and program will terminate here ---------------

	# ----------------------- Case 2 (add) -------------------------
		
	lw	$t0, y			# load value stored at location y in memory
	li	$t1, 2			# load value 2 in $t1
	add	$t0, $t0, $t1	# trying to add value so that result exceeds the limit
	
	# Interesting thing, no error but unexpected output, the output will be 1 because
	# max value + 1 in this case = 0  and then again adding 1 will result finally: 1
	
	# ----------------------- Case 3 (addi) -------------------------
	
	li	$t0, 2147483648		# (Max value that can be processed by addi) + 1
	addi	$t0, $t0, 1		# adding 1 in already exceeded value 
	
	# Output: -2147483647 
	# Because 2147483648 is already exceeded so it will be trated as -2147483648
	# And when we add 1 more in it -2147483648 + 1 = 2147483647
	
	# --------------------- Printing Integer and exiting ------------------------

	li		$v0, 1		# print integer
	move	$a0, $t0
	syscall
	
	li	$v0, 10			# exit
	syscall
