.section entry, "ax"
.global _start
.type _start, @function

_start:
  mv s0, zero
  la sp, _stack_pointer
  la gp, __global_pointer$
  jal main
 
 halt:
    j halt 