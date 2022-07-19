#Program to add a series 
.globl main

#You can define your own macro! Like defining your own function in python
.macro exit
	li a7, 10
	ecall
.end_macro

.macro PRINT_DEC(%x)
	li a7, 1
	mv a0, %x
	ecall
.end_macro

.data
var1: .byte 10, 20, 30, 40, 50, -1
ans: .byte 0

.text
main:
	li x8, 0
	li x9, -1 #sentinel value
	la x10, var1
	la x11, ans
	
	again:
	lb x20, (x10) #(lb means load byte, why byte? because we declared var1 as a byte)
	beq x20, x9, tapos #if x20 is negative 1, then go to tapos
	#else
	add x8, x8, x20 #add x8 and x20, then store it to x8, this way, you are adding cumulatively
	addi x10, x10, 1 #add i is an instruction involving immediate
	j again
	
	
	tapos:
	sb x8, (x11) #store byte pointed by x8 to x11
	PRINT_DEC(x8)
		
	exit
	