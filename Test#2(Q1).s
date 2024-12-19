#############################################################
# Program Name: Test #2 (Q1)
# Programmer: Matthew Yeung
# Date made: 12/3/2024
#####################data segment################################ 
.data			 
arr: .word 1, 2, 5, 7, 8, 9, 0, 3
#####################text segment################################ 
.text			 
main:
	
	li $t0, 0
	li $t1, 0

	la $a0, arr
	jal evenIndices

	move $a0, $v0
	jal printArr

	li $v0, 10
	syscall

#arg a0 = address of input array
#return v0 = address of new array with only even indices
evenIndices:
	
	beq $t1, 100, printArr
	addi $t1, $t1, 1
	andi $t4, $t1, 1
	bne $t4, 0, Odd

	jr $ra#(Something is not right with my jr $ra. It acts if I'm using an $sp in my code but I am 		not.)
Odd:

	j Loop

#a0 is adress of array to print
printArr:

	move $t0, $a0

	li $t1, 0

printLoop:

	beq $t1, 16, donePrinting

	add $t2, $t1, $t0

	lb $t3, ($t2)

	li $v0, 1
	move $a0, $t3
	syscall

	addi $t1, $t1, 4

	j printLoop

donePrinting:

	jr $ra