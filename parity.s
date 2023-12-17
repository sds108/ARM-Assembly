@ Design and write an assembly language program that 
@ will calculate the parity bit for a 7 bit value stored in r0. 
@ 
@ The program should then store the computed parity bit 
@ in bit 7 of r0. Assume even parity.
@ 
@ Using even parity, the parity bit of a value is set such that the 
@ number of set bits (1's) in a value is always even.

ldr r0, =0x16

mov r1, r0					@ copy r0
mov r2, #0x8				@ counter
movs r3, #0x1				@ 2 to the n

while:
	BEQ endwh 				@ while (y != 0) {
	eor r1, r1, r1, lsr r3	@ XOR by itself shifted by r3 bits
	lsl r3, r3, #1			@ 2 to the previous plus 1
	subs r2, r2, #1 		@ y = y - 1
	B while 				@ }
endwh:

and r1, r1, #0x1
orr r0, r0, r1, lsl #7

stop: b stop