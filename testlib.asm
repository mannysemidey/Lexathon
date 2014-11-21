#temp game lib builder

testLibManip:
	la $s0, dummyString
	la $s7, compare
	la $s6, dictionaryArray
	
	compareWordLoop:
		lb $s1, ($s0)
		beq $s1, 'a', increasea
		beq $s1, 'b', increaseb
		beq $s1, 'c', increasec
		beq $s1, 'd', increased
		beq $s1, 'e', increasee
		beq $s1, 'f', increasef
		beq $s1, 'g', increaseg
		beq $s1, 'h', increaseh
		beq $s1, 'i', increasei
		beq $s1, 'j', increasej
		beq $s1, 'k', increasek
		beq $s1, 'l', increasel
		beq $s1, 'm', increasem
		beq $s1, 'n', increasen
		beq $s1, 'o', increaseo
		beq $s1, 'p', increasep
		beq $s1, 'q', increaseq
		beq $s1, 'r', increaser
		beq $s1, 's', increases
		beq $s1, 't', increaset
		beq $s1, 'u', increaseu
		beq $s1, 'v', increasev
		beq $s1, 'w', increasew
		beq $s1, 'x', increasex
		beq $s1, 'y', increasey
		beq $s1, 'z', increasez
		blt $s1, 'a', next
		bgt $s1, 'z', next
	j compareWordLoop
		
	next:
		la $s7, dictionaryArray
		lw $s6, ($s7)
	libLoop:
		lb $s1, ($s6)
		beq $s1, 'a', increasea
		beq $s1, 'b', increaseb
		beq $s1, 'c', increasec
		beq $s1, 'd', increased
		beq $s1, 'e', increasee
		beq $s1, 'f', increasef
		beq $s1, 'g', increaseg
		beq $s1, 'h', increaseh
		beq $s1, 'i', increasei
		beq $s1, 'j', increasej
		beq $s1, 'k', increasek
		beq $s1, 'l', increasel
		beq $s1, 'm', increasem
		beq $s1, 'n', increasen
		beq $s1, 'o', increaseo
		beq $s1, 'p', increasep
		beq $s1, 'q', increaseq
		beq $s1, 'r', increaser
		beq $s1, 's', increases
		beq $s1, 't', increaset
		beq $s1, 'u', increaseu
		beq $s1, 'v', increasev
		beq $s1, 'w', increasew
		beq $s1, 'x', increasex
		beq $s1, 'y', increasey
		beq $s1, 'z', increasez
		blt $s1, 'a', nextW
		bgt $s1, 'z', nextW
	j libLoop

increasea:
	lb $s6, 0($s7)
	addi $s6, $s6, 1
	sb $s7, 0($s7)
	addi $s0, $s0, 1
j compareWordLoop

increaseb:
	lb $s6, 1($s7)
	addi $s6, $s6, 1
	sb $s7, 1($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasec:
	lb $s6, 2($s7)
	addi $s6, $s6, 1
	sb $s7, 2($s7)
	addi $s0, $s0, 1
j compareWordLoop

increased:
	lb $s6, 3($s7)
	addi $s6, $s6, 1
	sb $s7, 3($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasee:
	lb $s6, 4($s7)
	addi $s6, $s6, 1
	sb $s7, 4($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasef:
	lb $s6, 5($s7)
	addi $s6, $s6, 1
	sb $s7, 5($s7)
	addi $s0, $s0, 1
j compareWordLoop

increaseg:
	lb $s6, 6($s7)
	addi $s6, $s6, 1
	sb $s7, 6($s7)
	addi $s0, $s0, 1
j compareWordLoop

increaseh:
	lb $s6, 7($s7)
	addi $s6, $s6, 1
	sb $s7, 7($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasei:
	lb $s6, 8($s7)
	addi $s6, $s6, 1
	sb $s7, 8($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasej:
	lb $s6, 9($s7)
	addi $s6, $s6, 1
	sb $s7, 9($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasek:
	lb $s6, 10($s7)
	addi $s6, $s6, 1
	sb $s7, 10($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasel:
	lb $s6, 11($s7)
	addi $s6, $s6, 1
	sb $s7, 11($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasem:
	lb $s6, 12($s7)
	addi $s6, $s6, 1
	sb $s7, 12($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasen:
	lb $s6, 13($s7)
	addi $s6, $s6, 1
	sb $s7, 13($s7)
	addi $s0, $s0, 1
j compareWordLoop

increaseo:
	lb $s6, 14($s7)
	addi $s6, $s6, 1
	sb $s7, 14($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasep:
	lb $s6, 15($s7)
	addi $s6, $s6, 1
	sb $s7, 15($s7)
	addi $s0, $s0, 1
j compareWordLoop

increaseq:
	lb $s6, 16($s7)
	addi $s6, $s6, 1
	sb $s7, 16($s7)
	addi $s0, $s0, 1
j compareWordLoop

increaser:
	lb $s6, 17($s7)
	addi $s6, $s6, 1
	sb $s7, 17($s7)
	addi $s0, $s0, 1
j compareWordLoop

increases:
	lb $s6, 18($s7)
	addi $s6, $s6, 1
	sb $s7, 18($s7)
j compareWordLoop

increaset:
	lb $s6, 19($s7)
	addi $s6, $s6, 1
	sb $s7, 19($s7)
	addi $s0, $s0, 1
j compareWordLoop

increaseu:
	lb $s6, 20($s7)
	addi $s6, $s6, 1
	sb $s7, 20($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasev:
	lb $s6, 21($s7)
	addi $s6, $s6, 1
	sb $s7, 21($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasew:
	lb $s6, 22($s7)
	addi $s6, $s6, 1
	sb $s7, 22($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasex:
	lb $s6, 23($s7)
	addi $s6, $s6, 1
	sb $s7, 23($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasey:
	lb $s6, 24($s7)
	addi $s6, $s6, 1
	sb $s7, 24($s7)
	addi $s0, $s0, 1
j compareWordLoop

increasez:
	lb $s6, 25($s7)
	addi $s6, $s6, 1
	sb $s7, 25($s7)
	addi $s0, $s0, 1
j compareWordLoop

compareW:
	la $s0, compare
	la $s1, library
compareLoop:
	lb $t0, ($s0)
	lb $t1, ($s1)
	bge $t0, $t1, nextL
j nextW
	
nextW:
	beq $s6, 0, testManipReturn
	addi $s7, $s7, 4
j libLoop

nextL:
	addi $s1, $s1, 1
	addi $s0, $s0, 1
j compareLoop

correct:
	
