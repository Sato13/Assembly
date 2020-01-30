# Filename: MENU.asm
# Target:  MIPS ISA Simulator
# Author: Andrew Knapp
# Description: Display menu to manipulate binary # until quit is selected


.data
ask_menu: .asciiz "\nMenu Options | a, d, q, r, s, t |: "
ask_int: 	.asciiz "\nYour integer: "
opt: 		.asciiz "\nOption: "
cur: 		.asciiz "\nCurrent integer: "
bit: 		.asciiz "\nbit: "
bye: 		.asciiz "\nbye"
newline: 	.asciiz "\n"


# Program body
.text
.globl	main

main:
	j a

menu: # displat menu 
	li $v0, 4
	la $a0, ask_menu
	syscall
	# load user selection, jump to picked function
	li $v0, 12
	syscall
	move $t1, $v0
	
	beq $t1, 'a', a # if input == 'a', jump to a function
	beq $t1, 'd', d # etc...
	beq $t1, 'q', q
	beq $t1, 'r', r
	beq $t1, 's', s
	beq $t1, 't', t
	j q # if none are picked, quit


a:  # asks for user int
	li $v0, 4
	la $a0, ask_int
	syscall		
	# store user int
	li $v0, 5
	syscall
	move $t0, $v0
	j menu

d: # display current int	
	li $v0, 1
	la $a0, ($t0)
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j menu
	
r: # set x bit to zero
	
	j menu

s: # set x bit to one
	
	j menu
	
t: # toggles bit to flip state

	j menu
	
q: # say bye! and quit
	li $v0, 4
	la $a0, bye
	syscall
	li $v0, 10
	syscall


