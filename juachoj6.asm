#JEAN PHILIP L. JUACHON | G01
.globl main

.data
RADIUS: .float 0
pi_numerator: .float 22.0
pi_denum: .float 7.0
pi: .float 0.0
radius: .float 3.0
four: .float 4.0
three: .float 3.0
radius_message: .asciz "RADIUS IS: "

.macro exit
	li a7, 10
	ecall
.end_macro

.macro PRINT_FLOAT(%x)
	li a7, 2
	fmv.s fa0, %x
	ecall
.end_macro


.text
main:
	la t1, pi_numerator
	la t2, pi_denum
	
	la t3, three
	la t4, four
	la t6, radius
	flw f1, (t1)
	flw f2, (t2)
	flw f3, (t3)
	flw f4, (t4)
	fdiv.s f5, f1, f2
	#f5 contains the pi
	fdiv.s f6, f4, f3
	#f6 contains 4/3
	
	flw f7, (t6)
	
	fmul.s f8, f7, f7
	fmul.s f9, f8, f7
	
	
	
	fmul.s f10, f6, f5 #this contains 4/3 * pi
	fmul.s f11, f10, f9 #this contains f10 * r^3
	#PRINT_FLOAT(f11)
	
	la a0, radius_message
	fmv.s fa1, f11
	li a7, 60
	ecall
	
	exit
	
	
