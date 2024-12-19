#############################################################
# Program Name: Collatz conjecture
# Programmer: Matthew Yeung
# Date made: 10/1/2024
#####################data segment################################ 
.data			 
Prompt:	.asciiz	"\n What is the starting number? "
NewLine: .asciiz "\n"
EvenSteps: .asciiz " is even, so divide by 2. \n"
EvenString:.asciiz "\t  = "
OddSteps: .asciiz " is odd, so multiply by 3 add 1. \n"
OddString:.asciiz "\t = "
Result:	.asciiz	"\n We have reached one. Ending program.\n Steps taken:"
#####################text segment################################ 
.text			 
main:	
	la $a0, Prompt			# load prompt into $a0
	li $v0, 4
	syscall				# print the prompt message
	li $t0, 2			# n/2
	li $t1, 3			# n*3

	li $v0, 5			# system call code for Read Integer
	syscall				# reads the value of N into $v0
	move $t3, $v0			# moves $t2

	
Loop:	
	addi $t6, $t6, 1
	andi $t8, $t3, 1
	bnez $t8, Odd

Even:

	li $v0, 1		# system call code for Print String
	move $a0, $t3		# load address of message into $a0
	syscall			# print items	

	la $a0, EvenSteps	# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print items

	div $t4, $t3, $t0 	# divides $t2 by 2 and stores into $t4
	move $t3, $t4		# Quotient = n

	la $a0, EvenString	# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print items

	li $v0, 1		# system call code for Print String
	move $a0, $t3		# load address of message into $a0
	syscall			# print items

	la $a0, NewLine 	# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print items

	beq $t3, 1, End		# branch to end.
	b Loop			# loops branch

Odd:

	li $v0, 1		# system call code for Print String
	move $a0, $t3		# load address of message into $a0
	syscall			# print items

	la $a0, OddSteps	# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print items

	mult $t1, $t3		# Multiply $t1 and $t3
	mflo $t4		# Stores product in $t4
	addi $t4, $t4, 1	# Add 1 to $t4
	move $t3, $t4		# $t3 = t$4

	la $a0, OddString	# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print items

	li $v0, 1		# system call code for Print String
	move $a0, $t3		# load address of message into $a0
	syscall			# print items

	la $a0, NewLine		# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print items

	beq $t3, 1, End		# branch to end.
	b Loop			# loops branch

	syscall			# print sum of integers
End:

	li	$v0, 4		# system call code for Print String
	la	$a0, Result	# load address of msg. into $a0
	syscall			# print the string

	move	$a0, $t6
	li 	$v0, 1
	syscall
	
	li	$v0, 10		# terminate program run
	syscall			# return control to system 
			        # print the string