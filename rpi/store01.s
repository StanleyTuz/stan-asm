/* -- load01.s -- */
/* load two values from myvar1 and myvar2 into registers and add them */

.data

.balign 4
myvar1:
	/* contents is 4 bytes containing integer value 3 */
	.word 0

.balign 4
myvar2:
	.word 0


.text /* code section */

.balign 4
.global main
main:
	ldr r1, addr_of_myvar1 /* r1 <- &myvar1 */
	mov r3, #3
	str r3, [r1] 	      /* r1 <- *r1 */
	
	ldr r2, addr_of_myvar2 /* load the relo value of the address of myvar2 */ 
	mov r3, #4
	str r3, [r2]	/* use the value inside of r2 as the address */

	ldr r1, addr_of_myvar1 /* r1 <- &myvar1 */
	ldr r1, [r1] 	      /* r1 <- *r1 */
	
	ldr r2, addr_of_myvar2 /* load the relo value of the address of myvar2 */ 
	ldr r2, [r2]	/* use the value inside of r2 as the address */

	add r0, r1, r2
	bx lr

/* need to refer to the variables from the .data section */
/* this is a relocation, and is resolved by the linker */
addr_of_myvar1: .word myvar1
addr_of_myvar2: .word myvar2
