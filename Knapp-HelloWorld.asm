# Filename: Knapp-HelloWorld.asm
# Target:  MIPS ISA Simulator
# Author: Andrew Knapp
# Description: Print out each character of message on its own line


# store preloaded data here
.data
message:	.asciiz "Hello World!"
new_line:   .asciiz "\n"

# Program body
.text
.globl	main

main:
	# set up call to print string
	li $v0, 4			# code for print_string
	la $a0, message	# point to message (note this is a pseudo instruction)
	syscall
	li $v0, 4
	la $a0, new_line
	syscall


	la $t0, message	
loop:
	lb $a0, ($t0)		# loads byte that is pointed to by $t0
	# checks if end of string
	beqz $a0, end		
	# prints out char
	li $v0, 11
	syscall
	# increment str counter & goes to next line
	addi $t0, $t0, 1
	li $v0, 4
	la $a0, new_line
	syscall
	j loop
	
	
end:
	li $v0, 10	# code for exit
	syscall
