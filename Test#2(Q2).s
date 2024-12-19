#############################################################
# Program Name: Test #2 (Q2)
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

	li $t0, 0		#used as counter 
	move $t1, $a0	#index of string start 
	
	#counters for vowels 
	li $t5, 0	#a
	li $t6, 0	#e
	li $t7, 0	#i
	li $t8, 0	#o
	li $t9, 0	#u


#arg a0 = address of string
toLower:
	
	add $t2, $t0, $t1 	#calculate current index
	
	lb $t3, ($t2)		#load byte (char) into t3
	
	beq $t3, $0, return	#null termination character detected
	
	addi $t0, $t0, 1	#increment index early so we don't have to write after each branch 
	
	#branch to increment appropriate counter
	beq $t3, 97, A 	
	beq $t3, 101, E 	
	beq	$t3, 105, I
	beq $t3, 111, O
	beq $t3, 117, U
	
	j Loop
	
	jr$ra