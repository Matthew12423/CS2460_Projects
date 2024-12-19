#################################################################
# Program Name: Expression Evaluator
# Programmer: Matthew Yeung
# Date made: 12/03/2024
#####################data segment################################ 
.data			 
Prompt:	.asciiz	"\n Expression: "
Result:	.asciiz	"\n This is the answer. Ending program."
buffer: .space 100
#####################text segment################################ 
.text			 
main:	

	la $a0, Prompt			# load prompt into address
	li $v0, 4			# system call code for print string
	syscall				# print the prompt

	li $v0, 8 			# code for read string 
	la $a0, buffer			# address to read string
	li $a1, 100			# max size of input
	syscall 			# read string input

	li $t0, 0			# answer accumulator and final answer
	li $t1, 0			# current number
	move $t2, $a0			# index for buffer
	li $t3, 0			# temporary storage for character
	li $t4, 0			# storage for operators
	
Loop:
	
	lb $t3, ($t2)			# load byte from buffer
	blt $t3, 48, FirstValue		# if $t3 is less than 0, branch to FirstValue
	bgt $t3, 57, FirstValue		# if $t3 is greater than 9, branch to FirstValue

	sub $t3, 48			# subtract Asscii value of 0
	mul $t0, $t0, 10		# multiply $t0 by 10
	add $t0, $t0, $t3		# add $t3 into $t0
	addi $t2, $t2, 1		# moves to next value
	
	j Loop
	
FirstValue:

CheckIntOp:

	lb $t3, ($t2)			# load byte from buffer
	addi $t2, $t2, 1		# move to the next character
	beq $t3, 10, end		# if new line is found, go to end.
	
	li $t6, '*'			# set $t6 to *
	beq $t3, $t6, multiply		# move to multiply if $t3 and $t6 are *

#Jump:(idea is that if no multiplications are found, then jump down to add and subtract. Otherwise, multiplcation will
#be done immediately. This part is not complete but has been commented out to not affect the code)

	li $t6, '+'			# set $t6 to +
	beq $t3, $t6, addition		# move to addition if $t3 and $t6 are +

	li $t6, '-'			# set $t6 to -
	beq $t3, $t6, subtraction	# move to subtraction if $t3 and $t6 are -
	
	sub $t3, 48			# subtract Asscii value of 0
	mul $t1, $t1, 10		# multiplies $t1 by 10
	add $t1, $t1, $t3		# moves $t3 into $t1
	
	j CheckIntOp			# jump to CheckIntOp
	
multiply:
	
	move $t5, $t4			# move value of $t4 into $t5
	li $t4, '*'			# set $t4 to *
	j DoOp				# jump to DoOp

addition:

	move $t5, $t4			# move value of $t4 into $t5
	li $t4, '+'			# set $t4 to +
	j DoOp				# jump to DoOp

subtraction:

	move $t5, $t4			# move value of $t4 into $t5
	li $t4, '-'			# set $t4 to -
	j DoOp				# jump to DoOp

DoOp:

	beq $t5, 42, multfunc		# if * is detected, jump to multfunc

#DoOp2:(Same idea as Jump.)

	beq $t5, 43, addfunc		# if + is detected, jump to addfunc
	beq $t5, 45, subfunc		# if - is detected, jump to subfunc
	
	j CheckIntOp			# jump to CheckIntOP

multfunc:

	mul $t0, $t0, $t1		# multiply $t0, $t1 and store in $t0
	li $t1, 0			# reset current number
	j CheckIntOp			# jump to CheckIntOP

addfunc:

	add $t0, $t0, $t1		# add $t0, $t1 and store in $t0
	li $t1, 0			# reset current number
	j CheckIntOp			# jump to CheckIntOP

subfunc:

	sub $t0, $t0, $t1		# subtract $t0, $t1 and store in $t0
	li $t1, 0			# reset current number
	j CheckIntOp			# jump to CheckIntOP

end:
	
	move $t5, $t4			# move value of $t4 into $t5
	beq $t5, 42, finalmult		# if * is detected, jump to finalmult
	beq $t5, 43, finaladd		# if + is detected, jump to finaladd
	beq $t5, 45, finalsub		# if - is detected, jump to finalsub

finaladd:

	add $t0, $t0, $t1		# add final result
	j PrintResults			# jump to print

finalsub:

	sub $t0, $t0, $t1		# subtract final result
	j PrintResults			# jump to print
	
finalmult:

	mul $t0, $t0, $t1		# multiply final result
	j PrintResults			# jump to print
	
PrintResults:

	li $v0, 4			# system call code for Print String
	la $a0, Result			# load address of msg. into $a0
	syscall				# print the string

	move $a0, $t0			# move answer to adress
	li $v0, 1			# system call code for read integer
	syscall				# print the string

	li $v0, 10			# terminate program run
	syscall				# return control to system