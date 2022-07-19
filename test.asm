.globl main

.data
var1: .float 4.0
var2: .float 5.0
ans: .byte 0

.macro PRINT_FLOAT(%x)
	li a7, 2
	fmv.s fa0, %x
	ecall
.end_macro

.text
main:
	la t1, var1
	la t2, var2
	la t3, ans
	flw f1, (t1)
	flw f2, (t2)
	fadd.s f3, f1, f2
	fsub.s f4, f1, f2
	PRINT_FLOAT(f3)
	PRINT_FLOAT(f4)
#print using ecall
	
	
	li a7, 10 #li -> load immediate (a pseudo instruction)
	ecall
