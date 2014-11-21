#condence library into a game library

libManip:
	xor $s0, $s0, $s0	#resetting file descriptor, replacing with compare string
	la $s0, dummyString	#holding compare string
	la $t0, dictionaryArray	#holding library for comparison
	
libManipLoop:
	lw $t1, ($t0)		#loads word from dictionary
	lb $t2, ($t1)		#loads first letter
	innerLoop:
		lb $s1, ($s0)			#loads letter from compare string
		beq $t2, 0, libManipReturn	#if end of library array, return to main
		beq $t2, $s1, increaseL		#if letter in library word matches letter in 9 letter string, get next letter from library
		
		
		
	j innerLoop

increaseL:			#increases dictionary word pointer
	addi $t1, $t1, 1
	lb $t2, ($t1)
j innerLoop

increaseW:			#next word from library
	addi $t0, $t0, 4
	la $s0, dummyString
j libManipLoop

libManipReturn:			#return to main
j manipReturn
