@ A sequence of seven ASCII symbols, each in the range '0' . . . '9', can 
@ represent an unsigned value in the range 0 . . . 9,999,999 in text form. 
@ 
@ Design and write an ARM assembly language program that will convert such 
@ a sequence to the value represented by the symbols. 
@ 
@ Assume that the seven byte-size ASCII symbols will be stored in R1 to R7, 
@ with the most significant digit stored in R7. 
@ 
@ Store the result of the conversion in R0.
@ 
@ For example, given the following sequence of ASCII symbols
@         '1', '0', '3', '4', '2', '7', '9'
@ your program should store the value 1,034,279 (0x000FC827) in R0.

ldr r7, ='1'
ldr r6, ='0'
ldr r5, ='3'
ldr r4, ='4'
ldr r3, ='2'
ldr r2, ='7'
ldr r1, ='9'

mov r8, #1

sub r1, r1, #0x30
mul r1, r1, r8
add r0, r0, r1
mul r8, r8, #10

sub r2, r2, #0x30
mul r2, r2, r8
add r0, r0, r2
mul r8, r8, #10

sub r3, r3, #0x30
mul r3, r3, r8
add r0, r0, r3
mul r8, r8, #10

sub r4, r4, #0x30
mul r4, r4, r8
add r0, r0, r4
mul r8, r8, #10

sub r5, r5, #0x30
mul r5, r5, r8
add r0, r0, r5
mul r8, r8, #10

sub r6, r6, #0x30
mul r6, r6, r8
add r0, r0, r6
mul r8, r8, #10

sub r7, r7, #0x30
mul r7, r7, r8
add r0, r0, r7
mul r8, r8, #10

stop: b stop