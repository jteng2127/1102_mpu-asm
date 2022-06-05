; 5. 在你的程式之中, 是否需要清除溢位旗標? NO
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
  MOV IE, #82H
  SJMP $

T0ISR:  ;Timer0 ISR
  MOV TL0, #0B0H ; |
  MOV TH0, #03CH ; | set timer to 65536 - 50000
  DEC R3
  CJNE R3, #0, ISREND
SHOW:
  MOV R3, #2
  MOV A, R1
  MOVC A, @A+DPTR
  MOV P1, A
  INC R1
  CJNE R1, #10, ISREND
  MOV R1, #0
ISREND:
  RETI

TABLE:
  DB 0C0H, 0F9H, 0A4H, 0B0H
  DB 99H, 92H, 82H, 0F8H
  DB 80H, 98H
  END
