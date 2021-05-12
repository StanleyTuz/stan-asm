.text
.global main
main:
	mov r1, #2
	mov r2, #2
	cmp r1, r2 /* update cpsr codes */

	beq case_equal /* branch based on Z */

case_different:
	mov r0, #2
	b end
case_equal:
	mov r0, #1

end:
	bx lr
