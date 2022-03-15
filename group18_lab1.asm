init:
  mov R1, #0xFF
  mov R3, #0x7F
  mov A, #0xFE

main:
  mov R4, #0xFE
  cjne A, #0x00, solve
  mov A, R1
  anl A, R3
  mov R1, A
  mov A, R3
  rr A
  mov R3, A
  mov A, #0xFE
  cjne R3, #0xFE, main
  jmp exit

solve:
  call print
  rl A
  mov R2, A
  mov A, R4
  jz main
  mov A, R2
  subb A, R3
  mov R4, A
  mov A, R2
  jmp solve

print:
  mov R2, A
  anl A, R1
  mov P1, A
  mov A, R2
  ret

exit:
  mov P1, #0x00
  mov P1, #0xFF
  mov P1, #0x00
  mov P1, #0xFF
  mov P1, #0x00
  mov P1, #0xFF
  jmp init
