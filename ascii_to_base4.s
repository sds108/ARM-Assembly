@ A sequence of 4 ASCII symbols, each in the range '0' . . . '3'
@ can represent a number in base 4
@ Values will be stored in R2 to R5,
@ with the most significant digit stored in R5.
@ Design and write an ARM assembly language program that will convert such
@ a sequence to the value represented by the symbols in base 4.
@ 
@ Store the result of the conversion in R1.

ldr r2, ='1'
ldr r3, ='2'
ldr r4, ='1'
ldr r5, ='0'

@ this is simple ascii to hex conversion, then some multiplication and addition

mov r1, #0	@ result
mov r0, #0	@ temp holder
mov r6, #1	@ multiplier

mov r0, r2
bl convert

mov r0, r3
bl convert

mov r0, r4
bl convert

mov r0, r5
bl convert

b endprocess



convert:
	sub r0, r0, #0x30
	mul r0, r0, r6
	add r1, r1, r0
	add r7, r7, #2

	lsl r6, r6, #2

	bx lr

endprocess: b endproces