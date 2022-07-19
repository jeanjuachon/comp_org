#JUACHON, JEAN PHILIP L. | G01
.globl main


.data
length: .word 0
width: .word 0
length_message: .asciz "Please input length: "
width_message: .asciz "Please input width: "

L: .asciz "Length is: "
W: .asciz "Width is: "

area_answer: .asciz "The area is: "
perimeter_answer: .asciz "The perimeter is: "
.macro PRINT_DEC(%x)
	li a7, 1
	mv a0, %x
	ecall
.end_macro


.macro exit
	li a7, 10
	ecall
.end_macro


.text
main:

	la x10, length
	la x11, width
	lw x12, (x10)
	lw x13, (x11)
	
length_zero:
	la a0, length_message
	li a7, 51
	ecall
	
	mv x14, a0
	blt x14, x0, length_zero

width_zero:
	la a0, width_message
	li a7, 51
	ecall
	
	mv x15, a0
	blt x15, x0, width_zero
	
	mul x16, x14, x15
	
	li x22, 2
	mul x23, x14, x22
	mul x24, x15, x22
	add x25, x23, x24

	#print using message dialogue box
	la a0, perimeter_answer
	mv a1, x25
	li a7, 56
	ecall
	
	#print using message dialogue box
	la a0, area_answer
	mv a1, x16
	li a7, 56
	ecall

	exit
