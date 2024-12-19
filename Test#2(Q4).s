#############################################################
# Program Name: Test #2 (Q4)
# Programmer: Matthew Yeung
# Date made: 12/3/2024
#####################data segment################################ 
.data			 
str: .asciiz "SaMpLe StRiNg\n"
#####################text segment################################ 
.text			 
main:
	
	li $v0, 4
	la $a0, str
	syscall

	jal toLower

	li $v0, 4
	la $a0, str
	syscall

	li $v0, 10
	syscall

#arg a0 = address of string
toLower:

	