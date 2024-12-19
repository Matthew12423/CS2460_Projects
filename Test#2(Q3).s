#############################################################
# Program Name: Test #2 (Q3)
# Programmer: Matthew Yeung
# Date made: 12/3/2024
#####################data segment################################ 
.data			 
msg1: .asciiz "in function F\n"
msg2: .asciiz "in function G\n"
#####################text segment################################ 
.text			 
main:
	
	jal F

	li $v0, 10
	syscall

F: 

	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	li $a0, 2

	jal G

	lw $ra, 4($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 8

	li $v0, 4
	la $a0, msg1
	syscall
	jr$ra

G:
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	li $a0, 2
	
	lw $ra, 4($sp)
	lw $a0, 0($sp)
	add $sp, $sp, 8

	li $v0, 4
	la $a0, msg2
	syscall
	jr$ra
