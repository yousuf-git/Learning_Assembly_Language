.data
prompt: .asciiz "Result: "   # Message to display the result
newline: .asciiz "\n"        # Newline character

.text
.globl main

# Function Used:
# int rt_1(int i)
# int rt_2(int i)

# Main function

main:

    # Call rt_1 with argument i = 69

    li $a0, 69                  # Load i = 69 into $a0
    jal rt_1                   # Call rt_1
    move $t0, $v0              # Store the return value from rt_1 into $t0

    # Display result
    li $v0, 4                  # syscall to print string
    la $a0, prompt             # Load the address of "Result: "
    syscall

    li $v0, 1                  # syscall to print integer
    move $a0, $t0              # Load result into $a0
    syscall
    
	# Exit
    li $v0, 10
    syscall

# Function rt_1: int rt_1(int i)

rt_1:
    addi $sp, $sp, -4          # Allocate stack space for two arguments
    sw $ra, 0($sp)             # Save return address

    # Base case: if (i == 0) return 0
    beq $a0, $zero, rt_1_base  # If i == 0, jump to base case

    # Nested Call: return rt_2(i - 1)
    addi $a0, $a0, -1          # i = i - 1
    jal rt_2                   # Call rt_2 with i - 1
    j rt_1_end                 # Jump to the end of the function

rt_1_base:
    move $v0, $zero            # Return 0 if base case is true

rt_1_end:
    lw $ra, 0($sp)             # Restore argument i
    addi $sp, $sp, 4           # Deallocate stack space
    jr $ra                     # Return to the caller (main)

# Function rt_2: int rt_2(int i)
rt_2:

    # Compute i * i * 2
    move $t0, $a0			   # For Optimization
    mul $t1, $a0, $t0          # i * i
    
    sll $v0, $t1, 1            # (i * i) * 2 (shift left by 1)
    #move $v0, $t1              # Store the result in $v0

    jr $ra                     # Return to the caller
