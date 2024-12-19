#############################################################
# Program Name: Test #1
# Programmer: Matthew Yeung
# Date made: 10/1/2024
#####################data segment################################ 
.data			 
newline: .asciiz "\n "
#####################text segment################################ 
.text			 
main:	
	li $t0, 5

Loop:
	
	li $v0, 1
	move $a0, $t0
	syscall

	addi $t0, $t0, 1

	la $a0, newline
	li $v0, 4
	syscall
	
	beq $t0, 10, End
	j Loop


End:	
	li $v0, 10
	syscall

