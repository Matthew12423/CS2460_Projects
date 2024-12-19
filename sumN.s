#############################################################
# Program Name: sumN Conversion
# Programmer: Matthew Yeung
# Date made: 11/20/2024
#####################data segment################################ 
.data
Prompt:	.asciiz	"What number is n?\n"
Numbers: .asciiz "\n"
#####################text segment################################ 
.text			 
main:	
	la $a0, Prompt		# load prompt into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print the prompt message

	li $v0, 5		# system call code for Read Integer
	syscall			# reads the value of n into $v0

	move $a0, $v0
	jal SumN

	move $a0, $v0
	li $v0, 1
	syscall


End:	
	li $v0, 10		# terminate program run and
	syscall			# return control to system

SumN:

	beq $a0, $0, Zero
	j Java

Zero:
	li $v0, 0
	jr $ra

Java:
	addi $sp, $sp, -8
	sw $a0, ($sp)
	sw $ra, 4($sp)
	
	addi $a0, $a0, -1
	jal SumN

	move $t0, $v0
	
	lw $a0, ($sp)
	lw $ra, 4($sp)

	addi $sp, $sp, 8
	
	add $v0, $a0, $t0
	jr $ra