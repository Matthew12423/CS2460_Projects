#############################################################
# Program Name: PlusOneCipher #1
# Programmer: Matthew Yeung
# Date made: 11/19/2024
#####################data segment################################ 
.data
prompt: .asciiz "Enter a string (max 100 characters): "
question: .asciiz "Would you like to encode or decode? Enter 0 for encode or 1 for decode. "
result: .asciiz "Here is the result: \n"
buffer: .space 100
#####################text segment################################
.text
main:

	la $a0, prompt 
	li $v0, 4
	syscall

	#read string input 
	la $a0, buffer	#address to read string into  
	li $a1, 100		#max size 
	li $v0, 8 		#code for read string 
	syscall 
	
	#print prompt to enter 0 for encode and 1 for decode 
	la $a0, question
	li $v0, 4
	syscall
	
	#read integer from user 
	li $v0, 5
	syscall 
	
	#if user enetered 0, branch to encode string and call function
	beq $v0, $0, EncodeString
	
	#otherwise call decode function and jump to print 
	la $a0, buffer
	jal Decode	
	j Print 
	
	
EncodeString: #if we branched here, user selected encode 

	la $a0, buffer
	jal Encode	
	
	
Print:	
	
	#print result message
	li $v0, 4
	la $a0, result 
	syscall 
	
	#print whatever is in buffer (whether it is an encoded or decoded string)
	la $a0, buffer 
	syscall
	
	#end program
	li $v0, 10
	syscall
	
	
	
Encode: 

	li $t0, 0

EncodeStringLoop:
	
	#lb is load byte. sb is store byte.
	add $t1, $a0, $t0
	lb $t2, ($t1)
	beq $t2, $0, DoneEncoding
	addi $t2, $t2, 1
	sb $t2,($t1)
	addi $t0, $t0, 1
	j EncodeStringLoop 

DoneEncoding:

	jr $ra

Decode: 
	
	li $t0, 0

DecodeStringLoop:	

	add $t1, $a0, $t0
	lb $t2, ($t1)
	beq $t2, $0, DoneDecoding
	addi $t2, $t2, -1
	sb $t2,($t1)
	addi $t0, $t0, 1
	j DecodeStringLoop

DoneDecoding:

	jr $ra