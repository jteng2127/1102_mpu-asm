; 5. 在你的程式之中, 是否需要清除溢位旗標? NO
  ORG  0H           ;系統開機的執行位址為0
  JMP  MAIN
  ORG  000BH
; Timer0 ISR
  MOV A, R2
  JNZ ISREND
  MOV R2, AR7
SHOW:
  CPL P1.1
ISREND:
  DEC R2
  RETI

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
  MOV IE, #10000010B ; enable timer 0
  CLR P0.2
LOOP:
  CALL COLSCAN
  JMP LOOP

; column-scan subroutine
COLSCAN:
  JB F0, CHECKRELEASE
  JNB P0.4, PRESS6
  JNB P0.5, PRESS5
  JNB P0.6, PRESS4
  RET

; check if keys is release
CHECKRELEASE:
  JNB P0.4, NOTRELEASE
  JNB P0.5, NOTRELEASE
  JNB P0.6, NOTRELEASE
  CLR F0
NOTRELEASE:
  RET

; pause/continue timer 0
PRESS5:
  CPL TR0
  JMP GOTKEY

; increase 10 ms
PRESS4:
  MOV A, R7
  CLR C
  SUBB A, #15
  JNC INCHITBOUND
  INC R7
INCHITBOUND:
  JMP GOTKEY

; decrease 10 ms
PRESS6:
  MOV A, R7
  CLR C
  SUBB A, #6
  JC DECHITBOUND
  DEC R7
DECHITBOUND:
  JMP GOTKEY

GOTKEY:
  SETB F0
  RET