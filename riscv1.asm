.globl main

.data
var1: .byte 0xFF #8bit
var2: .half 0xFFFF #16bit
var3: .word 0xFFFFFFFF #32bit
str1: .asciz "Hello world"
fvar1: .float 4.0


num1: .word 5
num2: .word 6
ans: .word 0
message: .asciz "The answer is: "
.text
#The main label should match the global main
main:
	#need to transfer the value of the num to the register
	la x10, num1 #point to the value of num1 (la means load address)
	la x11, num2
	la x12, ans
	lw x20, (x10) #load the contents of x10 to x13
	lw x21, (x11)
	add x22, x20, x21 #add the value stored in x13 and 14 then store in x20
	sw x22, (x12) #Store the value of x22 to ans which is pointed by x12 (right to left)
	
	#print using ecall
	li a7, 1 #(li means load immediate)
	mv a0, x22 #To print, the answer should be stored in a0
	ecall
	
	#print using message dialogue box
	la a0, message
	mv a1, x22
	li a7, 56
	ecall
	
	li a7, 10 #li -> load immediate (a pseudo instruction)
	ecall




