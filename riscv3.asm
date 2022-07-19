.globl main

.data
BETA: .word 0xF1E1D1C1, 0xB1A19181

.text
#The main label should match the global main
main:	
	ADDI x11, x0, 0xFFFFF888

	JAL x0, L2

	L1: ADDI x11, x0, 0x00000001

	L2: ADDI x11, x0, 0x00000002
	
	#print using ecall
	li a7, 34 #(li means load immediate)
	mv a0, x11 #To print, the answer should be stored in a0
	ecall
	
	li a7, 10 #li -> load immediate (a pseudo instruction)
	ecall




