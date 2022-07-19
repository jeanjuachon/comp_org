.globl main
#JUACHON, JEAN PHILIP L. SECTION: CSC512C-G01
.data
SIG: .float 1.25, -1.5, -3.0, 0.0, 6.7, 4.8, 2.5, 1e38
ans_multi_add: .float 0.0
terminator: .float 1e38
h0_string: .asciz "Enter coef of h0"
h1_string: .asciz "Enter coef of h1: "
h2_string: .asciz "Enter coef of h2: "
total_signal: .asciz "Total number of signals: "
h0: .float 0.0
h1: .float 0.0
h2: .float 0.0
signal_count: .word 0
try_again_string: .asciz "Do you want to try again? (1)/(0): "
yes: .byte 1
.macro NEWLINE
	li a0, 10
	li a7, 11
	ecall
.end_macro

.macro exit
	li a7, 10
	ecall
.end_macro

.macro PRINT_FLOAT(%x)
	li a7, 2
	fmv.s fa0, %x
	ecall
.end_macro

.macro PRINT_DEC(%x)
	li a7, 1
	mv a0, %x
	ecall
.end_macro

.text
main:
	la x10, signal_count
	lw x11, (x10)
	la t1, SIG #1.25, -1.5, -3.0, 0.0, 6.7
	la t2, ans_multi_add #0.0
	la t3, terminator #1e38
	
	flw f2, (t2) #0 initially
	flw f3, (t3) #f3 contains the terminator

count_signal:
	flw f1, (t1) #1.25, -1.5, -3.0, 0.0, 6.7
	feq.s t4, f1, f3
	bnez t4, signal_counted
	addi t1, t1, 4
	addi x11, x11, 1
	j count_signal

signal_counted:
	la a0, total_signal
	mv a1, x11
	li a7, 56
	ecall

	addi x11, x11, -3
	addi x12, x11, 1 #x12 is holding the number of times it should loop (len of SIG - 3) + 1

input:
	la a0, h0_string #start h0
	li a1, 2
	li a7, 55
	ecall
	
	li a7, 6
	ecall
	fmv.s f11, fa0 #end h0

	la a0, h1_string #start h1
	li a1, 2
	li a7, 55
	ecall
	
	li a7, 6
	ecall
	fmv.s f12, fa0 #end h1
	
	la a0, h2_string #start h2
	li a1, 2
	li a7, 55
	ecall
	
	li a7, 6
	ecall
	fmv.s f13, fa0 #end h2
	
la t1, SIG
li x5, 0
get_array_vals:
	flw f5, (t1) #1.25, -1.5, -3.0, 0.0, 6.7
	fmv.s f15, f5 #4, 8, 12
	
	li x30, 4 
	add t1, t1, x30 #8, 12, 16
	flw f5, (t1)
	fmv.s f16, f5
	
	#addi x30, x30, 4 #12, 16, 20
	add t1, t1, x30
	flw f5, (t1)
	fmv.s f17, f5
	
	#PRINT_FLOAT(f15)
	#PRINT_FLOAT(f16)
	#PRINT_FLOAT(f17)
	
multi_add:
	#h2 * MSB
	fmul.s f22, f13, f15
	fmul.s f23, f12, f16
	fmul.s f24, f11, f17
	
	fadd.s f2, f22, f23
	fadd.s f2, f2, f24
	PRINT_FLOAT(f2)
	NEWLINE
	addi t1, t1, -4
	addi x12, x12, -1
	bgtz x12, get_array_vals

try_again:
	la a0, try_again_string
	li a1, 4
	li a7, 55
	ecall
	
	li a7, 5
	ecall
	
	la x23, yes
	lb x24, (x23)
	beq x24, a0, main

tapos:
	exit
