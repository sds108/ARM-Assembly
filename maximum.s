@ Write a program that will determine the maximum
@ of a set of 10 unsigned half word values stored in memory location test.
@ Store the result as a word in R7.

mov r0, #0 		@counter
ldr r1, =test 	@pointer
mov r2, #0 		@comparator
ldrh r7, [r1] 	@maximum

while:
	add r0, r0, #2
	cmp r0, #20	@20bytes
	bhs stop

	ldrh r2, [r1, r0]
	cmp r7, r2
	bhs while
	mov r7, r2

	b while

stop: B stop
test: .2byte 1366, 1027, 951, 2173, 1717, 417, 1457, 705, 126, 1410