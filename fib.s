# calculate a factorial

addi	$a0, $zero, 3 # start with a positive value

jal fact # jump into the function (so we have somewhere to return to later)
jal end  # jump to the end (past all the stuff)

fact:
  # push current stuff to the stack: return address, arg
  addi	$sp, $sp, -8  # adjust stack for two items/8 bytes
  sw    $ra, 4($sp)   # save the return address to stack
  sw    $a0, 0($sp)   # save the argument to stack

  slti  $t0, $a0, 1  # test for n < 1
  beq   $t0, $zero, L1  # if n >= 1, jump

  # if we're here, n = 0
  # set return value
  addi  $v0, $zero, 1 # return 1
  # we move stack pointer up since we are popping now
  addi  $sp, $sp, 8   # pop 2 items off stack
  jr    $ra           # return to caller

L1:
  addi  $a0, $a0, -1   # n>=1
  jal   fact           # call fact with n-1


  # where fact returns since jal right above sets the
  # $ra. Restore old args
  lw	$a0, 0($sp)  # return from jal: restore n arg
  lw	$ra, 4($sp)  # restore the return address
  addi	$sp, $sp, 8  # adjust stack pointer to pop 2 items

  # multiply old arg with current val reg v0
  mul 	$v0, $a0, $v0  # return n * fact(n-1)
  jr	$ra  # return to caller
  
end:
