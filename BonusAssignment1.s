#############################################################
# Program Name: Bonus Assignment # 1
# Programmer: Matthew Yeung
# Date made: 10/1/2024
#####################data segment################################ 
.data			 
NewLine: .asciiz "\n"
EvenSteps: .asciiz "\nAn even number: "
Divide: .asciiz " is divisible by 4.\n"
OddSteps: .asciiz "\n\nAn odd number: "
#####################text segment################################ 
.text			 
main:	

	li $t0, 1			# sets $t0 to 1

Loop:	

	andi $t1, $t0, 1		# add 1 to $t0
	beq $t1, 1, Odd			# if number is odd branch to odd

	la $a0, NewLine			# loads items into $a0
	li $v0, 4			# system call code for Print String
	syscall				# print

Even:
	
	la $a0, EvenSteps		# load address of numbers into $a0
	li $v0, 4			# system call code for Print String
	syscall				# print even message
	
	li $v0, 1			# system call code for Print String
	move $a0, $t0			# load address of message into $a0
	syscall				# print items	

	andi $t2, $t0, 3		# add 3 to $t0
	bgt $t2, 0, DonePrinting	# if number is odd branch to odd

	la $a0, NewLine			# load address of numbers into $a0
	li $v0, 4			# system call code for Print String
	syscall				# print even message

	li $v0, 1			# system call code for Print String
	move $a0, $t0			# load address of message into $a0
	syscall				# print items	

	la $a0, Divide			# load address of numbers into $a0
	li $v0, 4			# system call code for Print String
	syscall				# print even message	
	
	j DonePrinting

Odd:	

	la $a0, OddSteps	# load address of numbers into $a0
	li $v0, 4		# system call code for Print String
	syscall 		# print odd message

	li $v0, 1		# system call code for Print String
	move $a0, $t0		# load address of message into $a0
	syscall			# print items	

DonePrinting:

	addi $t0, $t0, 1	# adds 1 to $t0
	beq $t0, 26, End	# loops until $t0 reaches 25
	j Loop

End:		
	li $v0, 10		# terminate program run
	syscall			# ends program