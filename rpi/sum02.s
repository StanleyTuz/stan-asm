/* -- sum01.s -- */
.global main

main:
	mov r0, #3
	mov r1, #4
	add r0, r0, r1 /* r0 <- r1 + r2 */
	bx lr 
