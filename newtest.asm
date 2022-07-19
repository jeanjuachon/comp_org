.globl main

.data
var1: .float NaN
var2: .float Inf

.macro PRINT_FLOAT(%x)
	li a7, 2
	fmv.s fa0, %x
	ecall
.end_macro

.macro PRINT_DEC(%x)
	li a7, 34
	mv a0, %x
	ecall
.end_macro

.text
main:
la t1, var1
la t2, var2
flw f1, (t1)
flw f2, (t2)
fadd.s f10, f1, f2

 
	PRINT_FLOAT(f10)
	#PRINT_DEC(x10)
	
	
	
	li a7, 10 #li -> load immediate (a pseudo instruction)
	ecall