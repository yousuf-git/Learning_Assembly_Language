.data
    prompt:     .asciiz "\nEnter a character: "
    vowel_msg:  .asciiz "\nThe character is a vowel.\n"
    not_vowel_msg: .asciiz "\nThe character is not a vowel.\n"
    vowels:     .asciiz "aeiou"

.text
.globl main
main:
    # Print the prompt
    li $v0, 4             # syscall code for print string
    la $a0, prompt
    syscall

    # Read a character from the user
    li $v0, 12            # syscall code for read character
    syscall
    move $t0, $v0         # Store the character in $t0

    # Convert uppercase to lowercase
    li $t1, 'A'
    li $t2, 'Z'
    blt $t0, $t1, check_vowel  # If less than 'A', skip conversion
    bgt $t0, $t2, check_vowel  # If greater than 'Z', skip conversion
    addi $t0, $t0, 32          # Convert to lowercase by adding 32

check_vowel:
    la $t1, vowels         # Load address of "aeiou"
   # li $t2, 5              # Number of vowels to check (length of "aeiou")
    
check_loop:
    lb $t3, 0($t1)         # Load current vowel
    beq $t3, $0, not_vowel # If null terminator, not a vowel
    beq $t0, $t3, is_vowel # If match, it's a vowel
    addi $t1, $t1, 1       # Move to the next vowel
    subi $t2, $t2, 1       # Decrement counter
    j 	check_loop # Continue loop

not_vowel:
    # Print "not a vowel" message
    li $v0, 4
    la $a0, not_vowel_msg
    syscall
    j exit

is_vowel:
    # Print "vowel" message
    li $v0, 4
    la $a0, vowel_msg
    syscall

exit:
    li $v0, 10            # syscall code for exit
    syscall
