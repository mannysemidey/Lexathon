.include "macros.asm"
.include "importing.asm"
.include "tempsetup.asm"
.include "wordtest.asm"
#.include "libmanip.asm"
.include "testlib.asm"

.data
dictionary:
	.space 500000
dictionaryArray:
	.align	2
	.space 368000
gameDict:
	.space 50000
gameArray:
	.align  2
	.space 2000
lengthOfList:
	.word 0
wordInBox:
	.align	0
	.space 10
correctWordsPointerArray:
	.align	2
	.space 10000
totalPossibleWords:
	.word 0
filename:
	.asciiz "wordbank(4-9).txt"
letterArray:
	.align 0
	.space 9
dummyString:	#holds 9 random letters
	.asciiz "babyhappy"
compare:
	.space 26
library:
	.space 26
.text
main:

j importFile		#fills the string dictionary with the word file.
importReturn:

j fillDictionaryArray	#fills the pointers in this array
arrayReturn:

j testLibManip
testManipReturn:
	
	
exit:
	li $v0, 10
	syscall
