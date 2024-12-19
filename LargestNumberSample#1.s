.text
main:
	li $s0, 15
	li $s1, 39
	li $s2, 1
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2 
	
	
	
	
	
	jal maxOfThree
	
	
	
	
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0 10
	syscall 
	
	
maxOfThree:	

	addi $sp, $sp, -16
	sw $s0, 0($sp)
	sw $s1, 4($sp)
	sw $s2, 8($sp)
	sw $ra, 12($sp)

	sgt $s0, $a0, $a1 	
	bne $s0, $0, First	#case first number is less than second 	
	j Second	
First:					#first < second 

	sgt $s1, $a0, $a2	
	beq $s1, $0, Third	#case first > 3rd 	
	#otherwise return a0 
	move $v0, $a0 
	j Return	
Second:					#second < first	
	sgt $s2, $a1, $a2	
	beq $s2, $0, Third	#case second > 3rd 	
	#otherwise return a1 
	move $v0, $a1
	j Return	
Third: 					#third is smallest regardless if we reach this line
	move $v0, $a2
Return:

	lw $s0, 0($sp)
	lw $s1, 4($sp)
	lw $s2, 8($sp)
	lw $ra, 12($sp)
	addi $sp, $sp, 16

	jr $ra
