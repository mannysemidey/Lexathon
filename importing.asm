importFile:
	li $v0, 13		#open connection to file
	la $a0, filename
	li $a1, 0
	li $a2, 0
	syscall
	
	move $s0, $v0		#save file descripter
	
	li $v0, 14		#read from file
	move $a0, $s0
	la $a1, dictionary
	li $a2, 50000
	syscall
	
	li $v0, 16		#close file connection
	move $a0, $s0
	syscall
	
j importReturn

###########################################################################################

fillDictionaryArray:
	la $a0, dictionary	#scanner
	la $a1, dictionaryArray	#loading array
	sw $a0, ($a1)		#loading first word
	xor $v0, $v0, $v0	#reset register just in case
	addi $v0, $v0, 1	#setting array length to 1
	addi $a1, $a1, 4	#moving pointer to first word
fillDictionaryArrayLoop:
	lb $t0, ($a0)		#loads byte from dictionary
	beq $t0, 0, fillDictionaryArrayReturn #return if it hits a null character (0)
	bne $t0, 10, fillSkipped #go other way if failed.
	sb $zero, ($a0)		#replaces the new line with null
	add $a0, $a0, 1		#Advances the scanner
	sw $a0, ($a1)		#Store scanner pos as pointer in dictionaryArray
	addi $a1, $a1, 4		#Move the dictionaryArray point over to next storing location
	addi $v1, $v1, 1		#add 1 to the number of words.
j fillDictionaryArrayLoop

fillSkipped:
	add $a0, $a0, 1		#Advances the scanner
j fillDictionaryArrayLoop

fillDictionaryArrayReturn:
	sw $v1, lengthOfList
j arrayReturn
#array filled


#############################################################################################################################################################
#use first word to get 9 letters
getNineLetter:				#first word in library contains all 9 letters, prep to manipulate that to fill box
	subi $sp, $sp, 4
	sw $ra, ($sp)
	la $s1, dictionaryArray
getNineLetterLoop:			#rip individual letters out and storing them
	lw $a0, lengthOfList
	jal randNumber
	move $s2, $v0
	get_WordArray ($a0, $s1, $s2)
jal getLength
getLengthBack:
	beq $v1, 10, getNineLetterFinish
j getNineLetterLoop
getNineLetterFinish:
	la $s3, wordInBox
	move $s4, $s2
	get_WordArray ($s2, $s1, $s2)
	li $t0, 0
getNineLetterFinishLoop:
	beq $t0, 11, fillDictionaryArrayCorrect
	lb $t1, ($s2)
	sb $t1, ($s3)
	add $s3, $s3, 1
	add $s2, $s2, 1
	add $t0, $t0, 1
j getNineLetterFinishLoop
fillDictionaryArrayCorrect:
fillDictionaryArrayCorrectFindTopLoop:	
	addi $s4, $s4, -1
	get_WordArray ($a0, $s1, $s4)
	lb $t0 ($a0)
	beq $t0, '*', fillDictionaryArrayCorrectTopFound
j fillDictionaryArrayCorrectFindTopLoop

fillDictionaryArrayCorrectTopFound:
	li $t0, 0
	addi $s4, $s4, 2
	la $s5, correctWordsPointerArray
fillDictionaryArrayCorrectLoop:
	get_WordArray ($a0, $s1, $s4)  #<--------------------
	lb $t0 ($a0)
	beq $t0, '*', fillDictionaryArrayCorrectReturn
	get_WordArray ($a0, $s1, $s4)
	
	sw $a0, ($s5)


	lw	$t4, totalPossibleWords
	addi	$t4, $t4, 1
	sw	$t4, totalPossibleWords
	
	addi $s4, $s4, 1
	addi $t0, $t0, 1
	addi $s5, $s5, 4
	
j fillDictionaryArrayCorrectLoop
	

	
fillDictionaryArrayCorrectReturn:
	sw $t0, lengthOfList

getNineLetterReturn:
	lw $ra, ($sp) 
	addi $sp, $sp, 4
jr $ra
