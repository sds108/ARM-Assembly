@ This is a grossly simple question
@ Write a program that will calculate an even parity bit
@ for bits 25 21 8 in register R6 and store it in bit 3

ldr	r6, =0b01000010010101000000011011110001
mov r0, r6, lsr #25
and r0, r0, #1

mov r1, r6, lsr #21
and r1, r1, #1

mov r2, r6, lsr #8
and r2, r2, #1

@ Xor r0 and r1, store in r0
eor r0, r0, r1

@ Xor r0 and r2, store in r0
eor r0, r0, r2

@ shift r0 by 3 to bit 3, and store in bit 3 of r6
bic r6, #8
lsl r0, r0, #3
orr r6, r6, r0
	
stop:   B	stop