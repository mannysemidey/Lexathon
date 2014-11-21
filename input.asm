.data

user_entered_word:
	.space 10	#make space for the 9 word or less entry
	
Ask_Input:
	.asciiz "\Please Enter a String to Print\n" #in unused memory store this string with address Ask_Input
	
Tell_Output:
	.asciiz "\You typed in: " #in unused memory store this string with address Tell_Output
stored_string:
	.asciiz "abcd"
stringcopy_buffer: .space 10	#allocate space for string copy
	
msg_Match: .asciiz "\nMatch"
msg_NotMatch: .asciiz "\nNot a Match"


.text
.globl main

main:
	#Code in $v0 for syscall, read string: 8
	#$a0 = memory address of string input buffer
	#$a1 = length of string buffer (n)
	
	#li $v0, 8
	#syscall
	
	la $a0, Ask_Input
	li $v0, 4
	syscall
	
	li $v0, 8 #load op code for getting a string from the user into register $v0
	la $a0, user_entered_word #sets $a0 to point to the space allocated for writing a word
	la $a1, 10 #gets the length of the space in $a1 so we can't go over the memory limit
	syscall #reads register $v0 for op code, sees 8 and asks user to input a string, places string in reference to $a0
	
	move $s0, $a0 #saves string (address in memory?) to $s0
	
	#Compare strings
	la $a1, stored_string	#store address of string in memory for comparison
	move $s1, $a1
	
	#Need to compare string regardless of upper or lower case. So let's convert it to all lower case
	
	jal compareStr
	
	beq $v0,$zero, match    #check result  
	li $v0, 4
	la $a0, msg_NotMatch
	syscall
	j exit
	
############################################################################################
#Compare Functions
############################################################################################
compareStr:
	#clear contents of t0, t1, t2
	
	#INSERT CODE

	add $t0, $zero, $zero
	add $t1, $zero, $s0	#moving addresses to the temporary registers
	add $t2, $zero, $s1
	addi $t9, $zero, 10	#put 10 in $t9 for future comparison
	
compareLoop:
	lb $t3($t1) #load a byte from each string
	lb $t4($t2)
	#beqz $t3, checkRegt2 #str1 end
	beq $t9, $t3, checkRegt2	#checks if t3 has 10, which in ACII is a value of new line
	beqz $t4, missMatch
	slt $t5, $t3, $t4 #compare two bytes
	bnez $t5, missMatch
	addi $t1, $t1, 1 #t1 points to the next byte of str1
	addi $t2, $t2, 1
	j compareLoop
	
missMatch:
	addi $v0, $zero, 1
	j endLoop
	
match:
	li $v0,4
	la $a0, msg_Match
	syscall
	
	j exit
	
checkRegt2:
	bnez $t4, missMatch
	add $v0, $zero, $zero
endLoop:
	jr $ra

############################################################################################
#Lower Case Conversion
############################################################################################

makeCaps:
	add $t0, $a0, $zero
makeCapsLoop:
	lb $t2, ($t0)
	beq $t2, 0, makeCapsReturn
	ble $t2, 'Z', makeCapsIsCap
	sub $t2, $t2, 'a'
	add $t2, $t2, 'A'
	sb $t2, ($t0)
makeCapsIsCap:
	add $t0, $t0, 1 #advance scanner
	j makeCapsLoop
makeCapsReturn:
	jr $ra	

############################################################################################

exit:
	li $v0, 10 #loads op code into $v0 to exit program
	syscall #reads $v0 and exits program
