# Filename: Knapp-2-26.asm
# Target:  MIPS ISA Simulator
# Author: Andrew Knapp
# Description: return counter count

# Program body
.text
.globl	main

main:
	# beginning values as stated in 2.26.1
	li $t1, 10
	li $s2, 0

LOOP: 
	slt $t2, $0, $t1 # $t2 = 1 if(0 < 10) -- else $t2 = 1
	beq $t2, $0, DONE # when $t2 == 0 goto DONE
	subi $t1, $t1, 1 # subtracts $t1 by 1
	addi $s2, $s2, 2 # add 2 to $s2
	j LOOP
	
DONE:
	li $v0, 1
	la $a0, ($s2) # prints value of $s2
	syscall
	li $v0, 10
	syscall

