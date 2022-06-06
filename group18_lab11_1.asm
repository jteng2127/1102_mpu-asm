; 5. 在你的程式之中, 是否需要清除溢位旗標? NO
  ORG  0H           ;系統開機的執行位址為0
  JMP  MAIN
  ORG  000BH
  LJMP T0ISR

  ORG  30H
MAIN:
  MOV R1, #0
  MOV R7, #10 ; 10 interrupts=100ms
  MOV R2, #0
  ; Timer Mode
  MOV TMOD,  #02H ; Timer 0, mode 2
  MOV TH0, #246 ; 256 - 100
  MOV TL0, #246 ; 256 - 100
  SETB TR0
  SETB TF0
  MOV IE, #82H ; enable timer 0
  SJMP $

T0ISR:  ;Timer0 ISR
  CJNE R2, #0, ISREND
  MOV A, R7
  MOV R2, A
SHOW:
  CPL P1.1
ISREND:
  DEC R2
  RETI