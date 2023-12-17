@ Design and write an assembly language program that 
@ generates a 12-bit Hamming Code in R0 from an 8-bit value in R1.

ldr r1, =0xAC

@ put r1 in r0 as a 12 bit num
and r2, r1, #0b1
orr r0, r0, r2, lsl #2
and r2, r1, #0b1110
orr r0, r0, r2, lsl #3
and r2, r1, #0b11111110000
orr r0, r0, r2, lsl #4

@ Find c0
eor r3, r0, r0, lsr #2
eor r3, r3, r3, lsr #4
eor r3, r3, r3, lsr #8

@ save c0 to r0
and r3, r3, #0b1
orr r0, r3

@ Find c1
eor r3, r0, r0, lsr #1
eor r3, r3, r3, lsr #4
eor r3, r3, r3, lsr #8

@ save c1 to r0
and r3, r3, #0b10
orr r0, r3

@ Find c2
eor r3, r0, r0, lsr #1
eor r3, r3, r3, lsr #2
eor r3, r3, r3, lsr #8

@ save c2 to r0
and r3, r3, #0b1000
orr r0, r3

@ Find c3
eor r3, r0, r0, lsr #1
eor r3, r3, r3, lsr #2
eor r3, r3, r3, lsr #4

@ save c3 to r0
and r3, r3, #0b10000000
orr r0, r3

stop: b stop