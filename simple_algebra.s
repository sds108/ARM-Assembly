@ Write an arm program to evaluate
@ -6  * x  * x  * x  * x -9  * x  * x -7  * x +1 
@ * has precedence over + and -
@ assume x is in r1 and store result in r4

mov r1, #0x8

mov r0, #-6
mul r0, r0, r1
mul r0, r0, r1
mul r0, r0, r1
mul r0, r0, r1

mov r2, #-9
mul r2, r2, r1
mul r2, r2, r1

mov r3, #-7
mul r3, r3, r1

mov r4, #1
add r4, r4, r0
add r4, r4, r2
add r4, r4, r3

stop:   B	stop