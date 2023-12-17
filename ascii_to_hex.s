@ Design and write an ARM assembly language program that
@ will convert an ASCII representation of a hexadecimal
@ value to a value. TestStr is a NULL-terminated string 
@ in memory and the converted value should be stored in 
@ register r0. TestStr will contain a maximum of 8
@ characters and may use both upper and lower case
@ charaters.

ldr r1, =TestStr	@ pointer to front
mov r0, #0		@ result clear
mov r2, #0		@ byte counter
mov r3, #0		@ byte holder

load: 
	ldrb r3, [r1, r2]
	
	cmp r3, #0x0
	beq endwh
	
	lsl r0, #4

	cmp r3, #0x60
	bhi lower

	cmp r3, #0x40
	bhi upper

	cmp r3, #0x30
	bhs number

lower:
	sub r3, #0x57
	b wh

upper:
	sub r3, #0x37
	b wh

number:
	sub r3, #0x30
	b wh

wh:
	orr r0, r3
	add r2, #1
	b load

endwh:

stop: b stop
TestStr:	.asciz	"123aBc12"