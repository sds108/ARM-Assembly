@ Write an ARM Assembly Language program that will
@ determine whether a NULL-terminated ASCII string stored
@ stored in memory location test is a palindrome.
@ Your program should be case insensitive.
@ Your program should store the value 1 in R2 if the string is a
@ palindrome and should store 0 if it is not.

ldr r0, =test

@count the length of bytes to the end of the string
mov r5, #0 @ counter
ldrb r1, [r0]

counting:
	ldrb r1, [r0, r5]
	add r5, r5, #1
	cmp r1, #0
	bne counting

sub r5, r5, #2

mov r3, #0 @ second counter
mov r4, r5 @ third counter

@ initially set r2 to true
mov r2, #1

comparisonloop:
	cmp r3, r5
	bhi end

	ldrb r1, [r0, r3]
	cmp r1, #0x60
	subhi r1, #0x20
	sub r4, r5, r3
	ldrb r6, [r0, r4]
	cmp r6, #0x60
	subhi r6, #0x20

	cmp r1, r6
	bne not

	add r3, #1
	b comparisonloop
	
not:
	mov r2, #0
	b end

end:
	B end

test: .asciz "Able was I ere I saw Elba"