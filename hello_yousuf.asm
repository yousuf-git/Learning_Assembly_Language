# --------------- Program Intro ---------------- #

# Title: To print "Hello Yousuf" on the console
# Author: Muhammad Yousuf 
# Description: Displays "Hello Yousuf" on the console
# Date: Aug 2024
# INPUT: No input
# OUTPUT: "Hello Yousuf" on the console

# --------------- Data Segement / Variables ---------------- #

.data
    hello_msg:	.asciiz "Hello Yousuf\n"	# string to be printed

.global		main 					# optional

# --------------- Code Segement / Instructions ---------------- #

.text
main:
    li $v0, 4					# syscall code for print_string
    la $a0, hello_msg			# load address of the string to print
    syscall						# call the print_string syscall

    li $v0, 10					# syscall code for exit
    syscall						# call the exit syscall