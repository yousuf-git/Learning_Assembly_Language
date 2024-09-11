# Simple program to print "Hello Yousuf" on the console

.data           # Data segment

hello_msg: .asciiz "Hello Yousuf\n"

.text           # Text segment

main:           # Main function
    li $v0, 4                   # Load the print_string syscall code
    la $a0, hello_msg           # Load the address of the string to print
    syscall                     # Call the print_string syscall

    li $v0, 10                  # Load the exit syscall code
    syscall                     # Call the exit syscall