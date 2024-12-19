#############################################################
# Program Name: Fibonacci function
# Programmer: Matthew Yeung
# Date made: 10/1/2024
#####################data segment################################ 
.data			 
Prompt:	.asciiz	"\n   How many numbers should I print?  "
Numbers: .asciiz "\n "
Result:	.asciiz	"\n   All requested numbers are printed. Ending program."
#####################text segment################################ 
.text			 
main:	
	la $a0, Prompt		# load prompt into $a0
	li $v0, 4		# system call code for Print String
	syscall			# print the prompt message
	li $t0, 1		# a = 1
	li $t1, 1		# b = 1

	li $v0, 5		# system call code for Read Integer
	syscall			# reads the value of N into $v0'
	move $t3, $v0		# moves $t2

	
Loop:	
	add $t2, $t0, $t1 	# store t1 + t0, and put into t2, our running total
	move $t0, $t1		# a = b
	move $t1, $t2		# b = c

	li $v0, 1		# system call code for Print String
	move $a0, $t2		# load address of message into $a0
	syscall			# print the integer

	la $a0, Numbers		# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall

	addi $t3, $t3, -1	# add -1 to t$2
	blez $t3, End		# branch to end.
	b Loop			# loops branch

syscall				# print sum of integers
End:	li	$v0, 4		# system call code for Print String
	la	$a0, Result	# load address of msg. into $a0
	syscall			# print the string	
	li	$v0, 10		# terminate program run and
	syscall			# return control to system 