  MOV TMOD, #01H ;16-bit timer mode 1
LOOP:
  MOV TH0, #0FEH ;-500 (high byte)
  MOV TL0, #0CH ;-500 (low byte)
  SETB TR0 ;Start timer
WAIT:
  JNB TF0, WAIT ;Wait for overflow
  CLR TR0 ;Stop timer
  CLR TF0 ;Clear timer overflow flag
  CPL P1.0 ;Toggle port bit
  SJMP LOOP ;Repeat
END