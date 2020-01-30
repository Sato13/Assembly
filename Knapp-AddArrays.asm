# Filename: Lastname-AddArray.s
# Target:  MIPS ISA Simulator
# Author: Andrew Knapp
# Description:  Take numbers from Array and add them
#               Output each element and the total sum of array A[]


# store preloaded data here
.data

A:       #Base address of array A[]
.word 2,4,6,8,10
B:
.word 2,3,5,7,11

result_text:  .asciiz "The final sum of array elements is: "
cur_ele_text: .asciiz "The current element is: "
newline:	.byte '\n'


# Program body
.text
.globl	main

main:
	la $s0, A # load both arrays into registers
	la $s1, B
	li $s2, 5 # size of arrays
	la $s3, 0 # counter
	

	# Add the array elements
loop:	
	slt $t3, $0, $s2 # end loop when all 5 pairs are added
	beq $t3, $0, end
	
	lw $t1, 0($s0) # loads int that is pointed to in A
	lw $t2, 0($s1) #  ^  for B
	
	add $t0, $t1, $t2 # sums the A[i[ & B[i]
	add $s3, $s3, 1 # increments counter for current function
	
	jal print_current # branches to functions to print current index
	jal print_result # branches to functions to print results
	
	add $s0, $s0, 4 # increments array to next word
	add $s1, $s1, 4# ^
	sub $s2, $s2, 1 # decrements loop counter
	j loop


print_result:
	# Print the result
	li $v0, 4
	la $a0, result_text
	syscall
	
	li $v0, 1
	la $a0, ($t0)
	syscall # print the sum of A[i] & B[i]
	
	li $v0, 4
	la $a0, newline
	syscall # print new line
	jr $ra # return to loop
	

print_current:
	#Print Current Element
	li $v0, 4
	la $a0, cur_ele_text
	syscall
	
	li $v0, 1
	la $a0, ($s3)
	syscall # print the current index stored in $s3
	
	li $v0, 4
	la $a0, newline
	syscall # prints new line
	jr $ra # return to loop
	
end: # ends program
	li $v0, 10
	syscall