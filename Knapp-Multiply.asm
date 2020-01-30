# Filename: Knapp-2-26.asm
# Target:  MIPS ISA Simulator
# Author: Andrew Knapp
# Description: multiply any number by 26 using shifts

.data
get_n	:	.asciiz "Enter n for: (n * 26)\n"

# Program body
.text
.globl	main

main:
	# ask the user for n
	li $v0, 4
	la $a0, get_n
	syscall 
	
	li $v0, 5 # code to get  user input
	syscall
	
	move $t0, $v0  # store user input into $t0
	
	# by adding powers of 2 we can multiply by any number 
	# 16 + 8 + 2 = 26
	sll $t1, $t0, 4 # shifts n by 4 = n*16
	sll $t2, $t0, 3# shifts n by 4 = n*8
	add $t4, $t1, $t2 # adds first 2 powers
	sll $t3, $t0, 1# shifts n by 4 = n*2
	add $t4, $t4, $t3 # adds last power to total
	
	# print total
	li $v0, 1
	la $a0, ($t4)
	syscall
	