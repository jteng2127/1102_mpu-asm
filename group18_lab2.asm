init:
  mov @R1, #0
loop:

  ; 0~F
  cjne @R1, #0, n0
  jmp set0
  n0:
  cjne @R1, #1, n1
  jmp set1
  n1:
  cjne @R1, #2, n2
  jmp set2
  n2:
  cjne @R1, #3, n3
  jmp set3
  n3:
  cjne @R1, #4, n4
  jmp set4
  n4:
  cjne @R1, #5, n5
  jmp set5
  n5:
  cjne @R1, #6, n6
  jmp set6
  n6:
  cjne @R1, #7, n7
  jmp set7
  n7:
  cjne @R1, #8, n8
  jmp set8
  n8:
  cjne @R1, #9, n9
  jmp set9
  n9:
  cjne @R1, #10, n10
  jmp set10
  n10:
  cjne @R1, #11, n11
  jmp set11
  n11:
  cjne @R1, #12, n12
  jmp set12
  n12:
  cjne @R1, #13, n13
  jmp set13
  n13:
  cjne @R1, #14, n14
  jmp set14
  n14:
  cjne @R1, #15, n15
  jmp set15
  n15:

  nxt:
    inc @R1
    cjne @R1, #0x10, loop
    jmp init

set0:
  mov P1, #0xC0
  jmp nxt
set1:
  mov P1, #0xF9
  jmp nxt
set2:
  mov P1, #0xA4
  jmp nxt
set3:
  mov P1, #0xB0
  jmp nxt
set4:
  mov P1, #0x99
  jmp nxt
set5:
  mov P1, #0x92
  jmp nxt
set6:
  mov P1, #0x82
  jmp nxt
set7:
  mov P1, #0xF8
  jmp nxt
set8:
  mov P1, #0x80
  jmp nxt
set9:
  mov P1, #0x90
  jmp nxt
set10:
  mov P1, #0x88
  jmp nxt
set11:
  mov P1, #0x83
  jmp nxt
set12:
  mov P1, #0xC6
  jmp nxt
set13:
  mov P1, #0xA1
  jmp nxt
set14:
  mov P1, #0x86
  jmp nxt
set15:
  mov P1, #0x8E
  jmp nxt