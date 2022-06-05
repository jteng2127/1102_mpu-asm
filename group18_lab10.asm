  ORG  0H           ;系統開機的執行位址為0
  JMP  MAIN
  ORG  000BH
  LJMP T0ISR

  ORG  30H
MAIN:
  MOV DPTR, #TABLE ;DPTR points to TABLE
  MOV R1, #0
  MOV R3, #2 ;2 interrupts=100ms
  ;Timer Mode
  MOV TMOD,  #01H ;Timer 0, mode 1
  SETB TR0
  SETB TF0
  MOV IE,  #82H
  CJNE R1, #10,  $
  MOV R1, #0
  JMP MAIN

T0ISR:  ;Timer0 ISR
  MOV A, R1
  MOVC A, @A+DPTR
  MOV P1, A
  INC R1
  RETI

TABLE:
  DB 0C0H, 0F9H, 0A4H, 0B0H
  DB 99H, 92H, 82H, 0F8H
  DB 80H, 98H
  END



