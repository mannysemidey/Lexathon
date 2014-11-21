# random number generator
randNumber:
	move $t1, $a0
	li   $v0, 41       # random int
	syscall
	divu $t0, $a0, $t1   #mod the length        
	mfhi $v0
jr $ra

####################################################################
#random letter generator
randAlpha:
	move $t1, $a0
	li   $v0, 41       # random int
	syscall
	divu $t0, $a0, $t1   #mod the length
	addi $t0, $t0, 97
	mfhi $v0
jr $ra

####################################################################
#get length of library
getLength:
	add $t0, $a0, $zero
	li $t1, 0
getLengthLoop:	
	lb $t2, ($t0) #crashes here
	beq $t2, 0, getLengthReturn
	add $t1, $t1, 1 #advance counter
	add $t0, $t0, 1 #advance scanner
j getLengthLoop
getLengthReturn:
	move $v1, $t1
j getLengthBack

####################################################################