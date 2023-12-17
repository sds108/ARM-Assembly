@ Design and write an assembly language program that will detect and correct single 
@ bit errors in a 12-bit Hamming Code in R0. Your program should begin by clearing 
@ and then re-calculating the check bits using the same assembly language program 
@ that was used to generate the original Hamming Code. Your program should then 
@ compare the original and re-calculated values and should finally correct any 
@ single bit error and store the correct 8 bit number in R0.

ldr r0, =0xb6b

@ remove parity bits
ldr r1, =0b111101110100
and r1, r0, r1

@ Find c0
eor r3, r1, r1, lsr #2
eor r3, r3, r3, lsr #4
eor r3, r3, r3, lsr #8

@ save c0 to r1
and r3, r3, #0b1
orr r1, r3

@ Find c1
eor r3, r1, r1, lsr #1
eor r3, r3, r3, lsr #4
eor r3, r3, r3, lsr #8

@ save c1 to r1
and r3, r3, #0b10
orr r1, r3

@ Find c2
eor r3, r1, r1, lsr #1
eor r3, r3, r3, lsr #2
eor r3, r3, r3, lsr #8

@ save c2 to r1
and r3, r3, #0b1000
orr r1, r3

@ Find c3
eor r3, r1, r1, lsr #1
eor r3, r3, r3, lsr #2
eor r3, r3, r3, lsr #4

@ save c3 to r1
and r3, r3, #0b10000000
orr r1, r3


@ find differences in r1 and r0
eor r1, r1, r0

@ place parity bits in r3
and r4, r1, #0b1			@ Get c0
mov r3, r4
and r4, r1, #0b10			@ get c1
orr r3, r3, r4
and r4, r1, #0b1000			@ get c2
orr r3, r3, r4, lsr #1
and r4, r1, #0b10000000		@ get c3
orr r3, r3, r4, lsr #4

@ r3 - 1 to find the location of the error, this is crazy
sub r3, r3, #1

@ use r5 as the surgery bit
mov r5, #1
lsl r5, r5, r3

eor r0, r0, r5				@ correct error


@ now remove parity bits from r0
lsr r0, r0, #2				@ remove c0 and c1
and r2, r0, #1				@ save d0
and r3, r0, #0b11100		@ save d1, d2, d3
and r4, r0, #0b1111000000	@ save the rest

mov r0, #0					@ clear r0
orr r0, r0, r2				@ add d0
orr r0, r0, r3, lsr #1		@ add d1, d2, d3
orr r0, r0, r4, lsr #2		@ add the rest

stop: b stop