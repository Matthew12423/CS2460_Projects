.text
main:
	li $t0, 15
	li $t1, 3
	li $t2, 1
	
	move $a0, $t0
	move $a1, $t1
	move $a2, $t2 
	
	
	addi $sp, $sp, -12
	sw $t0, 0($sp)
	sw $t1, 4($sp)
	sw $t2, 8($sp)
	
	jal minOfThree
	
	
	lw $t0, 0($sp)
	lw $t1, 4($sp)
	lw $t2, 8($sp)
	addi $sp, $sp, 12
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0 10
	syscall 
	
	
minOfThree:	




	slt $t0, $a0, $a1 	
	bne $t0, $0, First	#case first number is less than second 	
	j Second	
First:					#first < second 

	slt $t1, $a0, $a2	
	beq $t1, $0, Third	#case first > 3rd 	
	#otherwise return a0 
	move $v0, $a0 
	j Return	
Second:					#second < first	
	slt $t2, $a1, $a2	
	beq $t2, $0, Third	#case second > 3rd 	
	#otherwise return a1 
	move $v0, $a1
	j Return	
Third: 					#third is smallest regardless if we reach this line
	move $v0, $a2
Return:





	jr $ra
