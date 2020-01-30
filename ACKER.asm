# Filename: ACKER.asm
# Target:  MIPS ISA Simulator
# Author: Andrew Knapp
# Description: program the ackerman function

.data
ask_int: 	.asciiz "Your integer: "
menu: 	.asciiz "Menu Options: "
opt: 		.asciiz "Option: "
cur: 		.asciiz "Current integer: "
bit: 		.asciiz "bit"
bye: 		.asciiz "bye"
newline: 	.asciiz "\n"


# Program body
.text
.globl	main

main:



ask:  # asks for user int
	li $v0, 4
	la $a0, ask_int
	syscall		
	# store user int
	li $v0, 5
	syscall
	move $t0, $v0

	
	li $v0, 1
	la $a0, ($t0)
	syscall


